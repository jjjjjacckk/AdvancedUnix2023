#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ptrace.h>
#include <sys/user.h>


void errquit(const char *msg) {
	perror(msg);
	exit(-1);
}


void guess2ll(unsigned long long *magicLast2, unsigned long long *magicFirst8, unsigned int *guess) {
    unsigned int curGuess = *guess;
    unsigned long long oneLL = '1', zeroLL = '0';
    // char str[10] = "";

    // magic = 10bytes
    // -> need two 64int to represent the magic
    *magicFirst8 = 0x0000303030303030;
    *magicLast2 = 0;
    
    for (int index = 9, shiftIndex = 1; index >= 8; --index, ++shiftIndex) {
        unsigned int shift = 64 - 8 * shiftIndex;
        if (curGuess & 1) 
            *magicLast2 |= (oneLL << shift);
        else 
            *magicLast2 |= (zeroLL << shift);
        curGuess >>= 1;
    }

    for (int index = 7, shiftIndex = 1; index >= 0; --index, ++shiftIndex) {
        unsigned int shift = 64 - 8 * shiftIndex;
        if (curGuess & 1) 
            *magicFirst8 |= (oneLL << shift);
        else 
            *magicFirst8 |= (zeroLL << shift);
        curGuess >>= 1;
    }

    ++(*guess);
}


int main(int argc, char *argv[]) {
    pid_t child;
    int parent_write[2], child_write[2];
    pipe(parent_write);
    pipe(child_write);
    // argv
	if(argc < 2) {
		fprintf(stderr, "usage: %s program [args ...]\n", argv[0]);
		return -1;
	}

    // fork 
	if((child = fork()) < 0) errquit("fork");
	if(child == 0) {
        // swap stdin & stdout
        close(child_write[0]);      // close read end of child_write    (b.c.: useless)
        close(parent_write[1]);     // close write end of parent_write  (b.c.: useless)

        // dup2(parent_write[0], 0);   // overwrite stdin as the read end of parent_write
        //                             // -> make child process read from parent
        dup2(child_write[1], 1);    // overwrite stdout as the write end of child_write
                                    // -> make parent process get info from child 

        // start to trace
		if(ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) errquit("ptrace@child");
		execvp(argv[1], argv+1);
		errquit("execvp");
	} else {
        // swap stdin & stdout
        close(parent_write[0]);     // close read end of parent_write  (b.c.: useless)
        close(child_write[1]);      // close write end of child_write  (b.c.: useless)

        dup2(child_write[0], 0);    // overwrite stdin as the read end of child_write
                                    // -> make parent process read from child
        // dup2(parent_write[1], 1);   // overwrite stdout as the write end of parent_write
        //                             // -> make child process get info from parent

        unsigned long long magicAddress = 0LL;
        struct user_regs_struct beforeJudge;
        unsigned int isBingo = 0, isGuess = 0;
		long long counter = 0LL;
        unsigned long long magicLast2 = 0x0000303030303030, magicFirst8 = 0;
        unsigned int guess = 1;

		int wait_status;
		if(waitpid(child, &wait_status, 0) < 0) errquit("waitpid");
		ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_EXITKILL);
		while (WIFSTOPPED(wait_status)) {
			long ret;
			unsigned long long rip;
			struct user_regs_struct regs;
			unsigned char *ptr = (unsigned char *) &ret;
			counter++;
            // fprintf(stderr, "## counter = %4lld | ", counter++);

            if((rip = ptrace(PTRACE_PEEKUSER, child, ((unsigned char *) &regs.rip) - ((unsigned char *) &regs), 0)) != 0) {
                ret = ptrace(PTRACE_PEEKTEXT, child, rip, 0);
                // print 8*3 bytes
                // fprintf(stderr, "0x%llx: %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x\n",
                //     rip,
                //     ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7]);
                
                // ret = ptrace(PTRACE_PEEKTEXT, child, rip+8, 0);
                // fprintf(stderr, "%17c0x%llx: %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x\n",
                //     ' ', rip+8,
                //     ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7]);
                
                // ret = ptrace(PTRACE_PEEKTEXT, child, rip+16, 0);
                // fprintf(stderr, "%17c0x%llx: %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x\n",
                //     ' ', rip+16,
                //     ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7]);

                if (counter-1LL == 2) {
                    // memset: get the address of Magic
                    magicAddress = ptrace(PTRACE_PEEKUSER, child, ((unsigned char *) &regs.rax) - ((unsigned char *) &regs), 0);
                    // fprintf(stderr, "====== rax = 0x%llx ====== \n", magicAddress);
                    // fprintf(stderr, "====== rip = 0x%llx ====== \n", rip); 
                } else if (counter-1LL == 4) {
                    // before judging
                    // fprintf(stderr, "====== val = 0x%lx ====== \n", ptrace(PTRACE_PEEKTEXT, child, magicAddress, 0));
                    // fprintf(stderr, "====== empty rip = 0x%llx ====== \n", beforeJudge.rip);
                    ptrace(PTRACE_GETREGS, child, 0, &beforeJudge);
                    // fprintf(stderr, "====== keeped rip = 0x%llx ====== \n", beforeJudge.rip);
                } 
                else if (counter-1LL >= 5) {
                    // after judging
                    // fprintf(stderr, "counter-1 == 5\n");
                    char buf[8] = {0};
                    read(0, buf, 1);

                    if (buf[0] != 'B' && !isBingo) {
                        // output != 'Bingo!\n'
                        fprintf(stderr, "%c", buf[0]);
                        ptrace(PTRACE_SETREGS, child, 0, &beforeJudge);
                        // fprintf(stderr, "toggle = %i %llx\n", isFirst, beforeJudge.rip);
                        // fscanf(stdout, )
                        
                        guess2ll(&magicLast2, &magicFirst8, &guess);
                        ptrace(PTRACE_POKETEXT, child, magicAddress+2, magicLast2);
                        ptrace(PTRACE_POKETEXT, child, magicAddress, magicFirst8);
                    } else if (!isBingo) {
                        // output == 'Bingo!\n'
                        isBingo = 1;
                        char flag[100] = {0};
                        read(0, buf+1, 6);
                        read(0, flag, 99);

                        fprintf(stderr, "\n%s", flag);
                    } else if (buf[0] == 'M') {
                        // output the "Magic"
                        char b[28] = {0};
                        read(0, b, 27);
                        fprintf(stderr, "%c%s", buf[0], b);
                    }
                } 
            }

            if(ptrace(PTRACE_CONT, child, 0, 0) < 0) errquit("ptrace@parent");
            if(waitpid(child, &wait_status, 0) < 0) errquit("waitpid");
		}
		fprintf(stderr, "## %lld instruction(s) executed\n", counter);
	}
	return 0;
}