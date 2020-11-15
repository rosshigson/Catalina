#include <stdio.h>
#define MY_NULL ((int *)0)
int i = 55;
main() {
   int *a = &i;
   printf("&i = %08X\n", (int)a);
   printf("i = %d\n", *a);
   printf("_sbrk = %08X\n", _sbrk(0));
   while (1);
}
