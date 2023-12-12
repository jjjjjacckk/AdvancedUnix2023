#include <stdio.h>
#include <linux/shm.h>

int main() {

    printf("%u %d", sizeof(char) * 10, SHM_RDONLY); 

    return 0;
}