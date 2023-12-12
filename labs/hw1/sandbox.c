#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> // pid_t ..., etc.
#include <sys/mman.h>
#include <string.h>
#include <dlfcn.h> // dlopen, dlsym
#include <fcntl.h> // O_RDWR
#include <sys/stat.h> // S_IRUSR: Read permission bit for the owner of the file
#include <assert.h>
#include <unistd.h> // _SC_PAGE_SIZE
#include <stdarg.h> // va_list
#include <errno.h>  // errno
#include <limits.h> // realpath
#include <sys/socket.h> // connect
#include <netdb.h>  
#include <arpa/inet.h> // inet_ntop
#include <elf.h>

char openBlackList[100][100], readBlackList[100][100], writeBlackList[100][100],
     connectBlackList[100][100], getaddrinfoBlackList[100][100], systemBlackList[100][100];
int openIdx = 0, readIdx = 0, writeIdx = 0, connectIdx = 0, getaddrinfoIdx = 0, systemIdx = 0;
int loggerFD = 0;

long long getBaseAddr() {
    FILE *f = fopen("/proc/self/maps", "r");
	char *line = NULL;
    size_t len = 0;

    getline(&line, &len, f);
    // printf("%s", line);

    char buf[16] = "";
    strncpy(buf, line, 12); 
    // printf("%s %ld\n", buf, strtol(buf, NULL, 16));

    fclose(f);

    return strtoll(buf, NULL, 16);
}

void configArrayInit() {
    for (int a = 0; a < 100; ++a) {
        memset(openBlackList[a], 0, 100);
        memset(readBlackList[a], 0, 100);
        memset(writeBlackList[a], 0, 100);
        memset(connectBlackList[a], 0, 100);
        memset(getaddrinfoBlackList[a], 0, 100);
        memset(systemBlackList[a], 0, 100);
    }

    return;
}

void parseAddr(struct sockaddr *SADDR, char *realAddr, int *realPort) {
    // char trimmed[INET_ADDRSTRLEN] = "";
    // sockaddr = abstract class type, convert to sockaddr_in to get real Address
    struct sockaddr_in *addr_in = (struct sockaddr_in *)SADDR;

    // transform binary to text form (IPv4)
    inet_ntop(AF_INET, &(addr_in->sin_addr), realAddr, INET_ADDRSTRLEN); 


    // sin_port = byte order, ntohs() = net to short int (16bits)
    // printf("addr = %s, port = %d\n", realAddr, ntohs(addr_in->sin_port)); 
    *realPort = ntohs(addr_in->sin_port);
    
    return;
}

void parseConfig() {
    configArrayInit();
    // printf("========= parse config =========\n");
    FILE *configFile = fopen(getenv("SANDBOX_CONFIG"), "r");
    
    char *line = NULL;
    char mode[13] = "";
    size_t lineLen = 0;
    ssize_t read;
    while( (read = getline(&line, &lineLen, configFile)) != -1) {
        // printf("%s", line);
        if (strcmp(line, "\n") == 0) continue;

        if (strcmp(mode, "") == 0) {
            if (strcmp(line, "BEGIN open-blacklist\n") == 0) {
                // printf("====== open ======\n");
                strncpy(mode, "open", strlen("open")+1);
            } else if (strcmp(line, "BEGIN read-blacklist\n") == 0) {
                // printf("====== read ======\n");
                strncpy(mode, "read", strlen("read")+1);
            } else if (strcmp(line, "BEGIN write-blacklist\n") == 0) {
                // printf("====== write ======\n");
                strncpy(mode, "write", strlen("write")+1);
            } else if (strcmp(line, "BEGIN connect-blacklist\n") == 0) {
                // printf("====== connect ======\n");
                strncpy(mode, "connect", strlen("connect")+1);
            } else if (strcmp(line, "BEGIN getaddrinfo-blacklist\n") == 0) {
                // printf("====== getaddrinfo ======\n");
                strncpy(mode, "getaddrinfo", strlen("getaddrinfo")+1);
            } else if (strcmp(line, "BEGIN system-blacklist\n") == 0) {
                // printf("====== system ======\n");
                strncpy(mode, "system", strlen("system")+1);
            } else {
                // printf("parse config error\n");
                exit(1);
            }
        } else {
            char endStr[4] = "";
            strncpy(endStr, line, 3);
            // printf("endStr = %s, mode = %s\n", endStr, mode);

            if (strcmp(endStr, "END") == 0) {
                memset(mode, 0, 13);
            } else if (strcmp(mode, "open") == 0) {
                char rawPath[strlen(line)], *fullPath = NULL;
                memset(rawPath, 0, strlen(line)); 
                strncpy(rawPath, line, strlen(line)-1);
                rawPath[strlen(line)] = '\0';
                // printf("rawPath = %s\n", rawPath);
                fullPath = realpath(rawPath, fullPath);
                // printf("fullPath = %s\n", fullPath);

                strncpy(openBlackList[openIdx], fullPath, strlen(fullPath));
                openBlackList[openIdx++][strlen(line)] = '\0';
                // printf("after path = %s\n", openBlackList[openIdx-1]);
                // strncpy(openBlackList[openIdx], line, strlen(line)-1);
                // openBlackList[openIdx++][strlen(line)] = '\0';
                // printf("====== open BL ======\n");
            } else if (strcmp(mode, "read") == 0) {
                strncpy(readBlackList[readIdx], line, strlen(line)-1);
                readBlackList[readIdx++][strlen(line)] = '\0';
                // printf("====== read BL ======\n");
            } else if (strcmp(mode, "write") == 0) {
                strncpy(writeBlackList[writeIdx], line, strlen(line)-1);
                writeBlackList[writeIdx++][strlen(line)] = '\0';
                // printf("====== write BL ======\n");
            } else if (strcmp(mode, "connect") == 0) {
                // get URL & port
                char host[1000] = "", *afterColon = strstr(line, ":");  // get ":<port>"
                afterColon[strlen(afterColon)-1] = '\0';                // to trim off "\n"
                strncpy(host, line, strlen(line)-strlen(afterColon));   // length(":443") = 4
                host[strlen(line)-strlen(afterColon)] = '\0';           // manually add '\0'
                // printf("host = %s\n", host);
                
                // get all the ip from hostname
                struct addrinfo hints = {0}, *addr = NULL;
                hints.ai_flags = 0;                     // request as a hostname
                hints.ai_family = AF_INET;
                hints.ai_socktype = SOCK_STREAM;
                hints.ai_protocol = IPPROTO_TCP;
                getaddrinfo(host, NULL, &hints, &addr);

                // iterate through addr (link-list)
                do {
                    char realAddr[INET_ADDRSTRLEN] = "", ipAndPort[INET_ADDRSTRLEN+6] = "";
                    int realPort = 0;
                    
                    parseAddr(addr->ai_addr, realAddr, &realPort);
                    strncat(ipAndPort, realAddr, INET_ADDRSTRLEN);
                    strncat(ipAndPort, afterColon, strlen(afterColon));
                    ipAndPort[INET_ADDRSTRLEN+strlen(afterColon)] = '\0';

                    // add "ipAndPort" to array
                    strncpy(connectBlackList[connectIdx], ipAndPort, strlen(ipAndPort));
                    connectBlackList[connectIdx++][strlen(ipAndPort)] = '\0';
                    
                    addr = addr->ai_next;
                }while(addr);


                // printf("====== connect BL ======\n");
            } else if (strcmp(mode, "getaddrinfo") == 0) {
                strncpy(getaddrinfoBlackList[getaddrinfoIdx], line, strlen(line)-1);
                getaddrinfoBlackList[getaddrinfoIdx++][strlen(line)] = '\0';
                // printf("====== getaddrinfo BL ======\n");
            } else if (strcmp(mode, "system") == 0) {
                strncpy(systemBlackList[systemIdx], line, strlen(line)-1);
                systemBlackList[systemIdx++][strlen(line)] = '\0';
                // printf("====== system BL ======\n");
            } 
            else {
                // printf("storing config error\n");
                exit(1);
            }
        }
    }


    return;
}

void printConfig() {
    printf("========= parse config =========\n");
    printf("========= open =========\n");
    for (int a = 0; a < openIdx; ++a) 
        printf("%d %s\n", a, openBlackList[a]);
    
    printf("========= read =========\n");
    for (int a = 0; a < readIdx; ++a) 
        printf("%d %s\n", a, readBlackList[a]);
    
    printf("========= write =========\n");
    for (int a = 0; a < writeIdx; ++a) 
        printf("%d %s\n", a, writeBlackList[a]);
    
    printf("========= connect =========\n");
    for (int a = 0; a < connectIdx; ++a) 
        printf("%d %s\n", a, connectBlackList[a]);
    
    printf("========= getaddrinfo =========\n");
    for (int a = 0; a < getaddrinfoIdx; ++a) 
        printf("%d %s\n", a, getaddrinfoBlackList[a]);
    
    printf("========= system =========\n");
    for (int a = 0; a < systemIdx; ++a) 
        printf("%d %s\n", a, systemBlackList[a]);

    return;
}

int checkExistInConfig(char *pathname, char *api) {
    // printf("========= checkExistInConfig =========\n");
    // printf("len = %d, pathname = %s, api = %s\n", strlen(pathname), pathname, api);
    if (strlen(pathname) == 0) return 0;

    if (strcmp(api, "open") == 0) {
        for (int a = 0; a < openIdx; ++a) {
            if (strcmp(pathname, openBlackList[a]) == 0)
                return 1;
        }

        return 0;
    } else if (strcmp(api, "read") == 0) {
        // printf("========= read check =========\n");
        for (int a = 0; a < readIdx; ++a) {
            if (strstr(pathname, readBlackList[a]) != 0) 
                return 1;
        }

        return 0;
    } else if (strcmp(api, "connect") == 0) {
        // printf("========= connect check =========\n");
        char realAddr[INET_ADDRSTRLEN] = "";
        // sockaddr = abstract class type, convert to sockaddr_in to get real Address
        struct sockaddr_in *addr_in = (struct sockaddr_in *)pathname;
        // transform binary to text form (IPv4)
        inet_ntop(AF_INET, &(addr_in->sin_addr), realAddr, INET_ADDRSTRLEN); 
        // sin_port = byte order, ntohs() = net to short int (16bits)
        char realPort[5] = "";
        sprintf(realPort, "%d", ntohs(addr_in->sin_port));
        
        char toCompared[strlen(realAddr)+strlen(realPort)+strlen(":")+1];
        memset(toCompared, 0, strlen(realAddr)+strlen(realPort)+strlen(":")+1);

        strncat(toCompared, realAddr, strlen(realAddr));
        strncat(toCompared, ":", strlen(":"));
        strncat(toCompared, realPort, strlen(realPort));
        // printf("toCompare = %s\n", toCompared);

        for (int a = 0; a < connectIdx; ++a) {
            if (strcmp(toCompared, connectBlackList[a]) == 0)
                return 1;
        }

        return 0;
    } else if (strcmp(api, "getaddrinfo") == 0) {
        // char trimmed[strlen(pathname)-7+1];
        // memset(trimmed, 0, strlen(pathname)-7+1);
        // strncpy(trimmed, pathname, strlen(pathname)-7+1);
        // trimmed[strlen(pathname)-7] = '\0';
        // printf("checkExistInConfig trimmed = %s\n", trimmed);
        for (int a = 0; a < getaddrinfoIdx; ++a) {
            if (strcmp(pathname, getaddrinfoBlackList[a]) == 0)
                return 1;
        }

        return 0;
    }
    return 0;
}

int myOpen(const char *pathname, int flags, ...) {
    // printf("========= my open =========\n");
    // printf("I'm in myOpen()\n");
    // printf("%x %x %x %x %x %x\n", O_CREAT, O_TMPFILE, O_CREAT | O_TMPFILE, 
    //                         O_TMPFILE & (O_CREAT | O_TMPFILE),
    //                         (O_TMPFILE | O_CLOEXEC) & (O_CREAT | O_TMPFILE), 
    //                         (O_APPEND | O_CLOEXEC) & (O_CREAT | O_TMPFILE));
    
    int realReturn = 0;
    char *realPath = NULL;
    realPath = realpath(pathname, realPath); // resolve the path

    // pathname check 
    if (checkExistInConfig(realPath, "open")) {
        errno = EACCES;
        realReturn = -1;
    }

    // continue 
    if ((flags & (O_CREAT | O_TMPFILE)) != 0) {
        // If the third parameter exist
        // printf("=== with mode ===\n");
        va_list args;
        va_start(args, flags);
        mode_t mode = va_arg(args, mode_t);
        
        if (realReturn != -1)
            realReturn = open(realPath, flags, mode);
        dprintf(loggerFD, "[logger] open(\"%s\", %d, %d) = %d\n", realPath, flags, mode, realReturn);

        return realReturn;
    } else {
        // If the third parameter does not exist
        // printf("=== without mode ===\n");

        if (realReturn != -1)
            realReturn = open(realPath, flags);
        dprintf(loggerFD, "[logger] open(\"%s\", %d, 0) = %d\n", realPath, flags, realReturn);

        return realReturn;
    }
    
    return -1;
}

ssize_t myRead(int fd, void *buf, size_t count) {
    // printf("========= my read =========\n");
    // printf("%d %s %d\n", fd, (char*)buf, count);
    char logFileName[100] = "";
    pid_t pid = getpid();
    sprintf(logFileName, "%d-%d-read.log", pid, fd);
    FILE *readLog = fopen(logFileName, "a+");
    
    // read from the old log file
    FILE *checkLog = fopen(logFileName, "r");
    fseek(checkLog, 0, SEEK_END);
    long logFileSize = ftell(checkLog);
    fseek(checkLog, 0, SEEK_SET); // rewind
    // printf("%p %p\n", readLog, checkLog);

    // printf("log size = |%d|\n", logFileSize);
    char *checkContent = malloc(logFileSize+1+count);
    // printf("log size = |%d|%p|\n", logFileSize, checkContent);
    memset(checkContent, 0, logFileSize+1+count);
    // printf("log size = |%d|%p|\n", logFileSize, checkContent);
    // if (logFileSize != 0)
    fread(checkContent, logFileSize, 1, checkLog);
    fclose(checkLog);
    // printf("old content = |%s|\n", checkContent);


    // check from black list
    int realReturn = read(fd, buf, count);
    // concate "buf" to the content from log file
    char *bufString = (char *)buf; // cast "buf" to string for "fwrite"
    strncat(checkContent, bufString, count);
    // printf("log content = |%d|%s|%s|%d\n", strlen(checkContent), checkContent, bufString, count);
    
    
    // printf("check = %d\n", checkExistInConfig(checkContent, "read"));
    if (checkExistInConfig(checkContent, "read") == 1) {
        fclose(readLog);
        close(fd);
        errno = EIO;
        realReturn = -1;
    } else 
        fwrite(bufString, sizeof(char), strlen(bufString), readLog);

    dprintf(loggerFD, "[logger] read(%d, %p, %ld) = %d\n", fd, buf, count, realReturn);

    return realReturn;
}

ssize_t myWrite(int fd, const void *buf, size_t count) {
    // printf("========= my write =========\n");
    char logFileName[100] = "";
    pid_t pid = getpid();
    sprintf(logFileName, "%d-%d-write.log", pid, fd);
    FILE *writeLog = fopen(logFileName, "a+");
    // fwrite((char *)buf, sizeof(char), count, writeLog);

    char *a = (char *)buf;
    fwrite(a, sizeof(char), strlen(a), writeLog);

    int realReturn = write(fd, buf, count);
    dprintf(loggerFD, "[logger] write(%d, %p, %ld) = %d\n", fd, buf, count, realReturn);
    // dprintf(loggerFD, "[logger] %s, pid = %d\n", (char *)buf, pid);

    return realReturn;
}

int myConnect(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
    // printf("========= my connect =========\n");

    int realReturn = 0;
    // printf("check = %d\n", checkExistInConfig(addr, "connect"));
    if (checkExistInConfig(addr, "connect")) {
        errno = ECONNREFUSED;
        realReturn = -1;
    } else 
        realReturn = connect(sockfd, addr, addrlen);


    // printf("%p %d %d\n", addr, addr->sa_family, (addr->sa_family == AF_INET));

    if (addr->sa_family == AF_INET) {
        char realAddr[INET_ADDRSTRLEN] = "";
        // sockaddr = abstract class type, convert to sockaddr_in to get real Address
        struct sockaddr_in *addr_in = (struct sockaddr_in *)addr;

        // transform binary to text form (IPv4)
        inet_ntop(AF_INET, &(addr_in->sin_addr), realAddr, INET_ADDRSTRLEN); 

        // sin_port = byte order, ntohs() = net to short int (16bits)
        // printf("addr = %s, port = %d\n", realAddr, ntohs(addr_in->sin_port)); 
        // printf("sockfd = %d, addrlen = %d, addr = %p\n", sockfd, addrlen, addr);
        // printf("gethostbyaddr = %d, addrlen = %d, addr = %p\n", sockfd, addrlen, addr);
        dprintf(loggerFD, "[logger] connect(%d, %s, %d) = %d\n", sockfd, realAddr, ntohs(addr_in->sin_port), realReturn);
    }

    // return realReturn;
    return realReturn;
}

int myGetaddrinfo(const char *restrict node, const char *restrict service, 
                  const struct addrinfo *restrict hints, struct addrinfo **restrict res) {
    // printf("========= my getaddrinfo =========\n");
    // printf("%s %s %p %p\n", node, service, hints, res);
    // printf("%d %d %d %d\n", hints->ai_family, hints->ai_family, hints->ai_socktype, hints->ai_protocol);

    int realReturn = 0;
    if (checkExistInConfig(node, "getaddrinfo")) {
        realReturn = EAI_NONAME;
    } else {
        realReturn = getaddrinfo(node, service, hints, res);
    }

    dprintf(loggerFD, "[logger] getaddrinfo(\"%s\", \"%s\", %p, %p) = %d\n", node, service, hints, res, realReturn);
    return realReturn;
}

int mySystem(const char *command){
    // printf("============== my system ==============\n");
    // printf("%s\n", command);

    dprintf(loggerFD, "[logger] system(\"%s\")\n", command);
    system(command);
}

int checkName(char *name) {
    if (strlen(name) == strlen("open") && strncmp(name, "open", strlen("open")) == 0)
        return 0;
    else if  (strlen(name) == strlen("read") && strncmp(name, "read", strlen("read")) == 0)
        return 1;
    else if (strlen(name) == strlen("write") && strncmp(name, "write", strlen("write")) == 0)
        return 2;
    else if (strlen(name) == strlen("connect") && strncmp(name, "connect", strlen("connect")) == 0)
        return 3;
    else if (strlen(name) == strlen("getaddrinfo") && strncmp(name, "getaddrinfo", strlen("getaddrinfo")) == 0)
        return 4;
    else if (strlen(name) == strlen("system") && strncmp(name, "system", strlen("system")) == 0)
        return 5;
    else 
        return -1;
}

/**
 * check if target in the array
 * 
 * @param array array to be iterated with
 * @param size size of target array
 * @param target target to be check
 * @return index of the target in array, otherwise -1
 */
int checkInArray(int *array, int size, int target) {
    //
    for (int a = 0; a < size; ++a) {
        if (array[a] == target) 
            return a;
    }

    return -1;
}

long long *getGOTAddress(long long gotOffSet) {
    long long baseAddr = getBaseAddr();
    // long long gotOffSet  = strtoll(gotOffSetStr, NULL, 16);
    // printf("gotOffSetStr = %s, gotOffset = %lx\n", gotOffSetStr, gotOffSet);
    long long *gotRealAddr = (long long *)(gotOffSet + baseAddr);
    // printf("gotRealAddr = %p\n", gotRealAddr);

    int pagesize = sysconf(_SC_PAGE_SIZE);
    void *nearBase = (void *)(gotOffSet / pagesize * pagesize + baseAddr);

    if (mprotect((void *)nearBase, pagesize, PROT_WRITE | PROT_READ) == -1) 
        perror("mprotect fail to change the privilege\n");

    return gotRealAddr;
}

void parseElfAndHijackGOT() {
    // typedef struct {
    //     uint32_t      st_name;   <- the index of "string table"
    //     unsigned char st_info;   <- same as "r_info" in Elf64_Rela 
    //     unsigned char st_other;
    //     uint16_t      st_shndx;
    //     Elf64_Addr    st_value;
    //     uint64_t      st_size;
    // } Elf64_Sym;
    //
    // typedef struct {
    //     Elf64_Addr r_offset;     <- GOT offset of our Share Library
    //     uint64_t   r_info;       <- same as "st_info" in Elf64_Sym
    //     int64_t    r_addend;
    // } Elf64_Rela;

    // elf file mapping: 
    // ----------------------
    // |     elf headers    |
    // ----------------------
    // |     elf tables     |
    // ----------------------

    // printf("========= parseElfAndHijackGOT =========\n");
    char *elfFile = NULL;
    elfFile = realpath("/proc/self/exe", elfFile);
    // printf("%s\n", elfFile);
    FILE *fptr = fopen(elfFile, "rb");
    if( fptr < 0) 
        perror("file error");

    Elf64_Ehdr elfHdr;
    Elf64_Shdr elfSecHdr, elfStrTable;
    Elf64_Sym elfSym;
    Elf64_Rela elfRela;
    char *SymNameTable = NULL, *SectNameTable = NULL;
    int targetFuncIndex[6] = {-1};

    // read the header
    fread(&elfHdr, sizeof(elfHdr), 1, fptr);
    // find the symbol table 
    for(int i = 0; i < elfHdr.e_shnum; ++ i) {
        fseek(fptr, elfHdr.e_shoff + i * sizeof(elfSecHdr), SEEK_SET); // section header table's offset + index * sections header's size
        fread(&elfSecHdr, sizeof(elfSecHdr), 1, fptr);
        if(elfSecHdr.sh_type == SHT_SYMTAB || elfSecHdr.sh_type == SHT_DYNSYM) {
            // find symbol string table (.dynstr)
            // section header table's offset + string table index of symbol table link * sections header's size
            fseek(fptr, elfHdr.e_shoff + elfSecHdr.sh_link * sizeof(elfSecHdr), SEEK_SET); 
            fread(&elfStrTable, sizeof(elfStrTable), 1, fptr);      // read one chunk of section header (prepare the info of SymNameTable)
            SymNameTable = malloc(elfStrTable.sh_size);
            fseek(fptr, elfStrTable.sh_offset, SEEK_SET);         // move the fptr to the beginning of symbol string table content
            fread(SymNameTable, elfStrTable.sh_size, 1, fptr);    // read full symbol string table (including funtion names)

            // find symbol table (.dynsym)
            fseek(fptr, elfSecHdr.sh_offset, SEEK_SET);         // move the fptr to the beginning of symbol table content
            for(int i = 0; i < elfSecHdr.sh_size/sizeof(elfSym); ++ i) {
                fread(&elfSym, sizeof(elfSym), 1, fptr); // read one symbol table
                //printf("%d value: %x type: %x bind: %x size: %x\n", i, elfSym.st_value, ELF64_ST_TYPE(elfSym.st_info), ELF64_ST_BIND(elfSym.st_info), elfSym.st_size);
                if(elfSym.st_name != 0) { // map the st_name (index) to the symbol string table 
                    char* name = SymNameTable + elfSym.st_name;
                    // printf("%d %s\n", i, name);

                    // check name
                    int nameIdx = checkName(name);
                    if (nameIdx != -1) {
                        // printf("%d %s %d \n", i, name, nameIdx);
                        targetFuncIndex[nameIdx] = i;
                    }
                }
            }
        }
    }

    // loop elf section header string table (find .shstrtab)
    // section header table's offset + string table index of symbol table link * sections header's size
    fseek(fptr, elfHdr.e_shoff + elfHdr.e_shstrndx * elfHdr.e_shentsize, SEEK_SET); 
    fread(&elfStrTable, sizeof(elfStrTable), 1, fptr);          // read the header of .shstrtab
    SectNameTable = malloc(elfStrTable.sh_size);
    fseek(fptr, elfStrTable.sh_offset, SEEK_SET);
    fread(SectNameTable, elfStrTable.sh_size, 1, fptr);       // read full .shstrtab (containing the name: .rela.plt, .plt, .dynsym, ..., etc.)
    for(int i = 0; i < elfHdr.e_shnum; ++ i) {
        fseek(fptr, elfHdr.e_shoff + i * sizeof(elfSecHdr), SEEK_SET); // section header table's offset + index * sections header's size
        fread(&elfSecHdr, sizeof(elfSecHdr), 1, fptr);      // read the header of 
        // print section name(section name string table + string table id)
        char* name = SectNameTable + elfSecHdr.sh_name;
        if(!strcmp(name, ".rela.plt")) {
            //printf("%s %lx %lx %lx\n", name, elfSecHdr.sh_addr, elfSecHdr.sh_offset, elfSecHdr.sh_size);
            fseek(fptr, elfSecHdr.sh_offset, SEEK_SET);     // move fptr to the beginning of the content of rela table
            for(int j = 0; j < elfSecHdr.sh_size/sizeof(elfRela); ++ j) {
                fread(&elfRela, sizeof(elfRela), 1, fptr);  // read the content
                // printf("%lx %d\n", elfRela.r_offset, ELF64_R_SYM(elfRela.r_info));

                int posInArray = checkInArray(targetFuncIndex, 6, ELF64_R_SYM(elfRela.r_info));
                if (posInArray != -1) {
                    // printf("posInArray = %d, elfRela.r_offset = 0x%x ", posInArray, elfRela.r_offset);
                    long long *GOT = getGOTAddress((long long) elfRela.r_offset);
                    if (posInArray == 0) {
                        // printf("---- myOpen ----\n");
                        *GOT = myOpen;
                    }
                    else if (posInArray == 1) {
                        // printf("---- myRead ----\n");
                        *GOT = myRead;
                    }
                    else if (posInArray == 2) {
                        // printf("---- myWrite ----\n");
                        *GOT = myWrite;
                    }
                    else if (posInArray == 3) {
                        // printf("---- myConnect ----\n");
                        *GOT = myConnect;
                    }
                    else if (posInArray == 4) {
                        // printf("---- myGetaddrinfo ----\n");
                        *GOT = myGetaddrinfo;
                    }
                    else if (posInArray == 5) {
                        // printf("---- mySystem ----\n");
                        *GOT = mySystem;
                    }
                }
            }
        }
    }
}

long long *getGOTAddressFromBinary(char *binary, char *api) {
    char cmd[256] = "";
    sprintf(cmd, "readelf -Wr /usr/bin/%s | grep %s", binary, api);
    FILE *fp = popen(cmd, "r");

    char output[200] = "", gotOffSetStr[16] = "";
    fgets(output, sizeof(output), fp);
    sscanf(output, "%s", gotOffSetStr);
    // printf("output = |%s|, gotoffset = |%s|\n", output, gotOffSetStr);

    long long baseAddr = getBaseAddr();
    long long gotOffSet  = strtoll(gotOffSetStr, NULL, 16);
    // printf("gotOffSetStr = %s, gotOffset = %lx\n", gotOffSetStr, gotOffSet);
    long long *gotRealAddr = (long long *)(gotOffSet + baseAddr);
    // printf("gotRealAddr = %p\n", gotRealAddr);

    int pagesize = sysconf(_SC_PAGE_SIZE);
    void *nearBase = (void *)(gotOffSet / pagesize * pagesize + baseAddr);

    if (mprotect((void *)nearBase, pagesize, PROT_WRITE | PROT_READ) == -1) 
        perror("mprotect fail to change the privilege\n");

    pclose(fp);
    return gotRealAddr;
}

int __libc_start_main(int (*main) (int, char **, char **), int argc, char ** ubp_av, 
                      void (*init) ( void), void (*fini) (void), void (*rtld_fini) (void), void (*stack_end)) {
    // setenv("LD_PRELOAD", " ", 1);
    loggerFD = atoi(getenv("LOGGER_FD"));
    // printf("loggerFD = %d\n", loggerFD);

    parseConfig();
    // printConfig();
    parseElfAndHijackGOT();

    // find & hijack __libc_start_main
    void *handle;
    handle = dlopen("/lib/x86_64-linux-gnu/libc.so.6", RTLD_LAZY);

    int (*realLibc)(int (*)(int, char **, char **), int, char **, 
                    void (*)(void), void (*)(void), void (*)(void), void (*));
    realLibc = dlsym(handle, "__libc_start_main");

    return realLibc(main, argc, ubp_av, init, fini, rtld_fini, stack_end);
}
