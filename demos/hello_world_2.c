#include <hmi.h>

void main(void) {
   t_printf("Hello, world!\n");
   while (1); // Propeller may reboot on exit from main, so don't exit
}
