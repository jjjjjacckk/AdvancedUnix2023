#include <cstdio>
#include <cstring>
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <elf.h>
#include <capstone/capstone.h>
#include <thread> 		// int3
#include <sys/uio.h> 	// process_vm_readv
#include <errno.h>		// errno

#include <string>
#include <map>
using namespace std;

#define	PEEKSIZE	8

class instruction1 {
public:
	unsigned char bytes[16];
	int size;
	string opr, opnd;
};

class breakpointInfo {
public:
	unsigned char originalInstr[8];
	unsigned long long address;
	bool isHit;
};

class anchorInfo {
public:
	char *memory, *start, *end;
	unsigned long long size;
	struct user_regs_struct regs;
	string type;
};

static csh cshandle = 0;
static unsigned long long entryAddr = 0, executionSize = 0;
static map<long long, instruction1> instructions;
static map<long long, breakpointInfo> breakpoints2OriInstr; // size_t = the type of instruction
vector<anchorInfo> anchors;

void errquit(const char *msg) {
	perror(msg);
	exit(-1);
}

void getExecuteInfo(pid_t childProcess) {
	char procPath[20] = {0};
	sprintf(procPath, "/proc/%d/exe", childProcess);
    FILE *elfPtr = fopen(procPath, "rb");
	// fprintf(stderr, "procPath = %s %p\n", procPath, elfPtr);

    Elf64_Ehdr elfHdr;
    Elf64_Shdr elfSecHdr, elfStrTable;
    char *SectNameTable = NULL;

	// read the header
    fread(&elfHdr, sizeof(elfHdr), 1, elfPtr);
    // loop elf section header string table (find .shstrtab)
    // section header table's offset + string table index of symbol table link * sections header's size
    fseek(elfPtr, elfHdr.e_shoff + elfHdr.e_shstrndx * elfHdr.e_shentsize, SEEK_SET); 
    fread(&elfStrTable, sizeof(elfStrTable), 1, elfPtr);        // read the header of .shstrtab
    SectNameTable = (char*)malloc(elfStrTable.sh_size);
    fseek(elfPtr, elfStrTable.sh_offset, SEEK_SET);
    fread(SectNameTable, elfStrTable.sh_size, 1, elfPtr);       // read full .shstrtab (containing the name: .rela.plt, .plt, .dynsym, ..., etc.)
    for(int i = 0; i < elfHdr.e_shnum; ++ i) {
        fseek(elfPtr, elfHdr.e_shoff + i * sizeof(elfSecHdr), SEEK_SET); // section header table's offset + index * sections header's size
        fread(&elfSecHdr, sizeof(elfSecHdr), 1, elfPtr);      // read the header of 
        // print section name(section name string table + string table id)
        char* name = SectNameTable + elfSecHdr.sh_name;
		// printf("name = %s\n", name);
        if(!strcmp(name, ".text")) {
            // printf("name = %s, addr = 0x%lx, offset =  0x%lx, size = 0x%lx\n", name, elfSecHdr.sh_addr, elfSecHdr.sh_offset, elfSecHdr.sh_size);
			entryAddr = elfSecHdr.sh_addr;
			executionSize = elfSecHdr.sh_size;
        }
    }

	fclose(elfPtr);
}

void printOneInstruction(long long addr, instruction1 *in) {
	int i;
	char bytes[128] = "";
	if(in == NULL) {
		fprintf(stderr, "%12llx:\t<cannot disassemble>\n", addr);
	} else {
		for(i = 0; i < in->size; i++) {
			snprintf(&bytes[i*3], 4, "%2.2x ", in->bytes[i]);
		}
		fprintf(stderr, "%12llx: %-32s\t%-10s%s\n", addr, bytes, in->opr.c_str(), in->opnd.c_str());
	}
}

void printFiveInstruction(long long addr) {
	int i;
	char bytes[128] = "";

	for (int a = 0; a < 5; ++a) {
		if (addr >= entryAddr+executionSize) {
			fprintf(stderr, "** the address is out of the range of the text section.\n");
			break;
		}

		instruction1 in = instructions[addr];
		for(i = 0; i < in.size; i++) 
			snprintf(&bytes[i*3], 4, "%2.2x ", in.bytes[i]);

		fprintf(stderr, "%12llx: %-32s\t%-10s%s\n", addr, bytes, in.opr.c_str(), in.opnd.c_str());
		addr += in.size;
	}
}

void disassemble(pid_t proc, unsigned long long entry, unsigned long long exeSize) {
	int count;
	// char buf[64] = { 0 };
	char buf[exeSize] = { 0 };
	unsigned long long ptr = entry, idx = 0;
	cs_insn *insn;
	map<long long, instruction1>::iterator mi; // from memory addr to instruction

	// get byte code of the PEEKTEXT
	for(ptr = entry; ptr < entry + sizeof(buf); ptr += PEEKSIZE) {
		long long peek;
		errno = 0;
		peek = ptrace(PTRACE_PEEKTEXT, proc, ptr, NULL);
		if(errno != 0) break;
		memcpy(&buf[ptr-entry], &peek, PEEKSIZE);
		// fprintf(stderr, "%lld: byte str = %20s | peek = 0x%016llx | 0x%llx\n", idx++, buf, peek, ptr);
	}

	// when there's nothing to peek
	if(ptr == entry)  {
		printOneInstruction(entry, NULL);
		return;
	}

	// 2nd, 3rd = binary code to dis. / length
	// 		4th = the addr. of the first instruction 
	//		5th = indicate the handle to keep disassembling until there no further instr.
	//		6th = get the result
	//   return = the number of instr. succesfully disassembled
	if((count = cs_disasm(cshandle, (uint8_t*) buf, entry-ptr, entry, 0, &insn)) > 0) {
		for(int i = 0; i < count; i++) {
			if (insn[i].address >= entry+exeSize) break;

			instruction1 in;
			in.size = insn[i].size;
			in.opr  = insn[i].mnemonic;
			in.opnd = insn[i].op_str;
			memcpy(in.bytes, insn[i].bytes, insn[i].size);
			instructions[insn[i].address] = in;
		}
		cs_free(insn, count);
	}


	return;
}

int main(int argc, char *argv[]) {
	pid_t child;
	if(argc < 2) {
		fprintf(stderr, "usage: %s program [args ...]\n", argv[0]);
		return -1;
	}
	if((child = fork()) < 0) errquit("fork");
	if(child == 0) {
		if(ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) errquit("ptrace@child");
		execvp(argv[1], argv+1);
		errquit("execvp");
	} else {
		int wait_status;

		// register for the disassemble handle
		if(cs_open(CS_ARCH_X86, CS_MODE_64, &cshandle) != CS_ERR_OK)
			return -1;

		if(waitpid(child, &wait_status, 0) < 0) errquit("waitpid");
		ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_EXITKILL);

		// get child process information
		getExecuteInfo(child);
		// fprintf(stderr, "entry addr = 0x%llx, size = %llx\n", entryAddr, executionSize);
		disassemble(child, entryAddr, executionSize);
		cs_close(&cshandle);


		// greeting msg
		struct user_regs_struct regs;
		if(ptrace(PTRACE_GETREGS, child, 0, &regs) == 0) {
			entryAddr = regs.rip;	// the real entry start should be regs.rip

			printf("** program \'%s\' loaded. entry point 0x%llx\n", argv[1], entryAddr);
			// fprintf(stderr, "b rip = 0x%llx\n", entryAddr);
			printFiveInstruction(entryAddr);
		}

		// cout << child << '\n';
		// command 
		string command(30, 0);
		fprintf(stderr, "(sdb) ");
		while(getline(cin, command, '\n')) {
			// fprintf(stderr, "%s\n", command.c_str());
			if (command == "si") {
				// resume the breakpoint 
				unsigned char code[8];
				unsigned long long bpAddr = 0LL;
				bool isHitBP = false; 

				// check if the breakpoint is hit
				for (pair<long long, breakpointInfo> bp : breakpoints2OriInstr) {
					if (bp.second.isHit) {
						// resume the code 
						memcpy(code, bp.second.originalInstr, PEEKSIZE);

						// check subsequent CC
						unsigned long long peek = ptrace(PTRACE_PEEKDATA, child, bp.second.address, NULL);
						peek >>= 8LL;
						for (int idx = 8; idx < 64; idx += 8, peek >>= 8LL) {
							if (peek & 0xFF == 0xCC) {
								code[idx / 8] = 0xCC;
							}
						}
						// fprintf(stderr, "peek = %llx\n", peek);

						int ret = ptrace(PTRACE_POKEDATA, child, bp.second.address, *(unsigned long *)code);
						if (ret == -1) errquit("POKEDATA@cont-resume-code");
						
						isHitBP = true;
						bpAddr = bp.second.address;
					}
				}

				// execute the substituted code & resume the break point
				// use signel step to execute the original instruction
				if(ptrace(PTRACE_SINGLESTEP, child, 0, 0) < 0) {
					perror("ptrace");
					return -2;
				}
				if (waitpid(child, &wait_status, 0) < 0) errquit("singleStep@cont");
				if(WIFEXITED(wait_status)) break;


				// resume procedure
				if (WIFSTOPPED(wait_status)) { 
					struct user_regs_struct regs;
					if(ptrace(PTRACE_GETREGS, child, 0, &regs) == 0) {
						fprintf(stderr, "b rip = 0x%llx\n", regs.rip);
						// check if the breakpoint hit 
						if (breakpoints2OriInstr.count(regs.rip) == 1) {
							breakpoints2OriInstr[regs.rip].isHit = true;
							fprintf(stderr, "** hit a breakpoint at 0x%llx.\n", regs.rip);
							printFiveInstruction(regs.rip);

							// resume the original code

							// RIP-- (to prevent stuck in INT3 again)
							// --regs.rip;
							// int ret = ptrace(PTRACE_SETREGS, child, 0, &regs);
							// if (ret == -1) errquit("POKEDATA@cont-rip");
						} else 
							printFiveInstruction(regs.rip);
					}
				}
			
				if (isHitBP) {
					// resume the breakpoint
					code[0] = 0xCC;
					int ret = ptrace(PTRACE_POKEDATA, child, bpAddr, *(unsigned long *)code);
					if (ret == -1) errquit("POKEDATA@cont-resume-bp");

					isHitBP = false;
					breakpoints2OriInstr[bpAddr].isHit = false;
				} 

				fprintf(stderr, "(sdb) ");
			} else if (command == "cont") {
				// resume the breakpoint 
				unsigned char code[8];
				unsigned long long bpAddr = 0LL;
				bool isHitBP = false; 

				// check if the breakpoint is hit
				for (pair<long long, breakpointInfo> bp : breakpoints2OriInstr) {
					if (bp.second.isHit) {
						// resume the code 
						memcpy(code, bp.second.originalInstr, PEEKSIZE);

						// check subsequent CC
						unsigned long long peek = ptrace(PTRACE_PEEKDATA, child, bp.second.address, NULL);
						peek >>= 8LL;
						for (int idx = 8; idx < 64; idx += 8, peek >>= 8LL) {
							if (peek & 0xFF == 0xCC) {
								code[idx / 8] = 0xCC;
							}
						}
						// fprintf(stderr, "peek = %llx\n", peek);

						int ret = ptrace(PTRACE_POKEDATA, child, bp.second.address, *(unsigned long *)code);
						if (ret == -1) errquit("POKEDATA@cont-resume-code");

						isHitBP = true;
						bpAddr = bp.second.address;
					}
				}

				// execute the substituted code & resume the break point
				if (isHitBP) {
					// use signel step to execute the original instruction
					if(ptrace(PTRACE_SINGLESTEP, child, 0, 0) < 0) {
						perror("ptrace");
						return -2;
					}
					if (waitpid(child, &wait_status, 0) < 0) errquit("singleStep@cont");
					if(WIFEXITED(wait_status)) break;

					// resume the breakpoint
					code[0] = 0xCC;
					int ret = ptrace(PTRACE_POKEDATA, child, bpAddr, *(unsigned long *)code);
					if (ret == -1) errquit("POKEDATA@cont-resume-bp");
					
					isHitBP = false;
					breakpoints2OriInstr[bpAddr].isHit = false;
				}


				if(ptrace(PTRACE_CONT, child, 0, 0) < 0) {
					perror("ptrace");
					return -2;
				}

				if(WIFEXITED(wait_status)) break;
				if (waitpid(child, &wait_status, 0)) { 
					struct user_regs_struct regs;
					if(ptrace(PTRACE_GETREGS, child, 0, &regs) == 0) {
						// fprintf(stderr, "b rip = 0x%llx\n", regs.rip-1);
						if (breakpoints2OriInstr.count(regs.rip-1) == 1) {
							// check if the breakpoint hit 
							breakpoints2OriInstr[regs.rip-1].isHit = true;
							fprintf(stderr, "** hit a breakpoint at 0x%llx.\n", regs.rip-1);
							printFiveInstruction(regs.rip-1);

							// RIP-- (to prevent stuck in INT3 again)
							--regs.rip;
							int ret = ptrace(PTRACE_SETREGS, child, 0, &regs);
							if (ret == -1) errquit("POKEDATA@cont-rip");
						}
					}
				} else 
					errquit("waitpid");

				
				if (WIFEXITED(wait_status)) break;
				fprintf(stderr, "(sdb) ");
			} else if (command.find("break") != string::npos) {
				unsigned long long breakAddr = 0LL;
				sscanf(command.c_str(), "break 0x%llx", &breakAddr);
				// fprintf(stderr, "%llx %lld\n", breakAddr, breakAddr);
				
				// get original instruction 
				unsigned char code[8];
				long long originInstrLL = ptrace(PTRACE_PEEKDATA, child, breakAddr, NULL);
				memcpy(code, &originInstrLL, PEEKSIZE);

				// preserve the data
				breakpointInfo bpinfo;
				bpinfo.address = breakAddr;
				bpinfo.isHit = false;
				memcpy(bpinfo.originalInstr, code, PEEKSIZE);
				breakpoints2OriInstr[bpinfo.address] = bpinfo;

				// write INT3 to target address
				code[0] = 0xCC;
				int ret = ptrace(PTRACE_POKETEXT, child, breakAddr, *(unsigned long *)code);
				if (ret == -1) errquit("POKEDATA@int3");

				// debug
				// originInstrLL = ptrace(PTRACE_PEEKDATA, child, breakAddr, NULL);
				// fprintf(stdout, "after set origin  = %016llx %x %x\n", originInstrLL, breakpoints2OriInstr[breakAddr].originalInstr[0], code[0]);

				fprintf(stderr, "** set a breakpoint at 0x%llx.\n", breakAddr);
				fprintf(stderr, "(sdb) ");
			} else if (command == "timetravel") {
				for (anchorInfo anchor : anchors) {
					// reset memory
					unsigned long long tmp = 0LL;
					for (long long a = 0LL; a < anchor.size; a += 8LL) {
						// memcpy(&tmp, anchor.memory+a, PEEKSIZE);
						// fprintf(stderr, "tmp = 0x%llx\n", tmp);
						int ret = ptrace(PTRACE_POKEDATA, child, anchor.start+a, *(unsigned long *)(anchor.memory+a));
						if (ret == -1) errquit("POKEDATA@cont-resume-code1");
					}
					
					// reset registers 
					int ret = ptrace(PTRACE_SETREGS, child, 0, &anchor.regs);
					if (ret == -1) errquit("POKEDATA@timetravel");
				}

				// reset breakpoint
				struct user_regs_struct regs;
				ptrace(PTRACE_GETREGS, child, 0, &regs);

				for (pair<long long, breakpointInfo> entry : breakpoints2OriInstr) {
					// get original instruction 
					unsigned char code[8];
					long long originInstrLL = ptrace(PTRACE_PEEKDATA, child, entry.first, NULL);
					memcpy(code, &originInstrLL, PEEKSIZE);
					
					// set INT3
					code[0] = 0xCC;
					int ret = ptrace(PTRACE_POKETEXT, child, entry.first, *(unsigned long *)code);
					if (ret == -1) errquit("POKEDATA@int3");

					// set breakpoint as not hit
					// fprintf(stderr, "%llx %d\n", entry.first, breakpoints2OriInstr[entry.first].isHit);
					// if (entry.first > regs.rip)
						// breakpoints2OriInstr[entry.first].isHit = false;
				}


				// print message & 5 instructions
				fprintf(stderr, "** go back to the anchor point\n");
				printFiveInstruction(regs.rip);
				
				fprintf(stderr, "(sdb) ");
			} else if (command == "anchor") {
				// clear first 
				if (!anchors.empty())
					anchors.clear();

				// if (waitpid(child, &wait_status, 0) < 0) errquit("waitpid");
				if (WIFSTOPPED(wait_status)) {

					fstream procMaps("/proc/" + to_string(child) + "/maps", ios::in);
					string line = "";
					while(getline(procMaps, line, '\n')) {
						// fprintf(stderr, "%s\n", line.c_str());
						stringstream ss(line);
						vector<string> segs(6, "");
						ss >> segs[0] >> segs[1] >> segs[2] >> segs[3] >> segs[4] >> segs[5];
						// fprintf(stderr, "%d|%s|%s|%s|%s|%s|%s|\n", ss.eof(), segs[0].c_str(), segs[1].c_str(), segs[2].c_str(), segs[3].c_str(), segs[4].c_str(), segs[5].c_str());
						
						// to avoid "maps" entry with no name
						if (segs[5].empty()) continue;

						// user space + [stack] + [heap]
						// permission with "w" & name != shared library
						if (segs[1].find("w") != string::npos && segs[5].find(".so") == string::npos) {
							// parse memory start & end
							unsigned long long start = 0, end = 0;
							sscanf(line.c_str(), "%llx-%llx", &start, &end);
							// fprintf(stderr, "start = %llx, end = %llx\n", start, end);
							
							char *memState = (char*)calloc(end-start, sizeof(char));
							// fprintf(stderr, "%llx %llx %llx\n", end, start, end-start);

							// store memory state 
							for (unsigned long long index = start, peek = 0LL; index < end; index += 8LL) {
								peek = ptrace(PTRACE_PEEKDATA, child, index, NULL);
								memcpy(memState+(index-start), &peek, PEEKSIZE);
								// fprintf(stderr, "0x%016llx\n", peek);
							}
							
							// fprintf(stderr, "memstate = %s\n", memState);

							// save to anchor Info
							anchorInfo ainfo;
							ainfo.start = (char *)start;
							ainfo.end = (char *)end;
							ainfo.size = end-start;
							ainfo.memory = memState;
							ainfo.type = segs[5];
							if(ptrace(PTRACE_GETREGS, child, 0, &ainfo.regs) < 0)
								errquit("anchor@GETREG");

							anchors.push_back(ainfo);

							// fprintf(stderr, "vector size = %lx\n", anchors.size());
						}
					}

					procMaps.close();
				} 

				fprintf(stderr, "** dropped an anchor\n");
				fprintf(stderr, "(sdb) ");
			}
		}

		fprintf(stderr, "** the target program terminated.\n");
	}
	return 0;
}

