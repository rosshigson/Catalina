#include <stdio.h>

void main(void)
{
    printf("sizeof long = %d\n", sizeof(long));
    printf("value=%ld\n", -2147483639L);
    printf("value=%ld\n", 2147483657L);
    printf("value=%ld\n", 2147483647L + 10);
    printf("done!\n");
}

