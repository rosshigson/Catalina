/*
 * This program just prints argv and argc - it is intended to be used 
 * to test this functionality in Catalyst, so it has to be compiled
 * and then loaded onto an SD Card in a system with Catalyst programmed
 * into EEPROM (or FLASH) - see the Catalyst documentation for more
 * details.
 */

#include <ctype.h>
#include <stdio.h>
#include <hmi.h>

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
