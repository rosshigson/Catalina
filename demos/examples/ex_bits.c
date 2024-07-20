#include <stdio.h>

/*
 * This program does a simple test on bit fields and shows how they are
 * arranged in memory (which is implementation defined).
 */

struct my_bits {
   unsigned int P1: 1;
   unsigned int P2: 1;
   unsigned int P3: 1;
};

int main(void) {

   struct my_bits b1 = { 0, 0, 0 };
   int *bits = (int *)&b1;

   b1.P1 = 1;
   printf("bits { 1, 0, 0 }= 0x%x\n", *bits);

   b1.P1 = 0;
   b1.P2 = 1;
   printf("bits { 0, 1, 0 }= 0x%x\n", *bits);

   b1.P2 = 0;
   b1.P3 = 1;
   printf("bits { 0, 0, 1 }= 0x%x\n", *bits);

   printf("Press any key to exit ...\n");
   getchar();

   return 0;
}
