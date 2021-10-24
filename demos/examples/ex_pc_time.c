
/* Traditional first C program */

#include <stdio.h>

int main (void) {
   int i;
   for (i = 0; i < 10000; i++) {
   }
   i = 10;
   while (i > 0) {
      printf("Hello, World! %d\n",i--);
   }

   printf("Press any key to exit ...\n");
   getchar();

   return 0;
}
