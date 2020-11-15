
/* Test program just prints argv and argc */

#include <ctype.h>
#include <stdio.h>
#include <catalina_hmi.h>

void press_key_to_continue() {
	printf("press any key to continue");
   k_wait();
   printf("\n");
}

int main (int argc, char *argv[]) {
   int i;
   char *cp;

   k_clear();

   printf("Argument tester\n");
 	printf("argc = %d\n", argc);
 	printf("argv = %08x\n", argv);

   for (i = 0; i < argc; i++) {
      printf("argv[%d]=%s\n", i, argv[i]);
   }
   printf("done\n");

   press_key_to_continue();

   return 0;
}
