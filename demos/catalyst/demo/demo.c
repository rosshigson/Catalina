#include <stdio.h>

int main(int argc, char *argv[]) {
   int i;
   printf("Catalyst C Test Program\n");
   printf("argc = %d\n", argc);
   for (i = 0; i < argc; i++) {
     printf("argv[%d] = %s\n", i, argv[i]);
   }

   printf("Press any key to continue ...");
   getchar();

   return 0;
}
