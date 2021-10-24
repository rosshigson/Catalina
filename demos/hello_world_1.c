#include <stdio.h>

void main(void) {
   printf("Hello, world!\n");
   while (1); // Propeller may reboot on exit from main, so don't exit
}
