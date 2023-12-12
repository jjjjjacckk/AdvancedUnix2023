#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
    int *a = (int *)calloc(1, sizeof(int));

    printf("b = %d\n", *a);

    *a = 100;
    printf("b = %d\n", *a);


    return 0;
}