 #!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pow as pw
import struct
import base64
from pwn import *

r = remote('up23.zoolab.org', 10363)
pw.solve_pow(r)

statement = r.recvuntil("complete the ")
number = int(r.recvuntil(" ")[:-1])
print('question = ', number)

for i in range(1, number+1):
    statement = r.recvuntil(f"{i}: ")[:-1]
    # print("statement =", statement)
    
    arithmeticRAW = r.recvuntil(" = ")[:-3].decode()
    # print("arithmetic =", arithmeticRAW)
    
    firstNum, symbol, secondNum = arithmeticRAW.split(" ")
    # secondNum = arithmeticRAW.split(" ")[1].split(" ")[1]
    # print(f"1 = {firstNum}, 2 = {symbol}, 3 = {secondNum}")
    ans = 0
    if symbol == "+":
        ans = int(firstNum) + int(secondNum)
    elif symbol == "-":
        ans = int(firstNum) - int(secondNum)
    elif symbol == "*":
        ans = int(firstNum) * int(secondNum)
    elif symbol == "/":
        ans = int(firstNum) / int(secondNum)
    elif symbol == "//":
        ans = int(firstNum) // int(secondNum)
    elif symbol == "**":
        ans = int(firstNum) ** int(secondNum)
    elif symbol == "%":
        ans = int(firstNum) % int(secondNum)
    else:
        print("Don't know")
    
    # print(f"ans = {ans}")
    littleEndian = ans.to_bytes((ans.bit_length() + 7) // 8, 'little') or b'\0'
    # print(f'little = {littleEndian}')
    base = base64.b64encode(littleEndian)
    print(f'i = {i}, base64 = {base}')
    
    r.sendlineafter(b'? ', base)
    # print(f'base64 = {ans}')
    
    
    # ans = struct.pack('<Q', ans)
    # print(f'little = {ans}')
    # ans = base64.b64encode(ans)
    

r.interactive()
r.close()
    
# r.sendlineafter(b'string S: ', base64.b64encode(solved))
