from pwn import *
elf = ELF('./chals')
print("main =", hex(elf.symbols['main']))
print("{:<12s} {:<8s} {:<8s}".format("Func", "GOT Offset", "Symbol Offset"))


# print(len(elf.got()))
# counter = 0
for g in elf.got:
   if "code_" in g:
        print("{:<12s} {:<8x} {:<8x}".format(g, elf.got[g], elf.symbols[g]))
        # print("{:<12s} {:<8x} {:<8x}".format(g, elf.got[g], elf.symbols[g]))
    #    counter += 1
# print(counter)

