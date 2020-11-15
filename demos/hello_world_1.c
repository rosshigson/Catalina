#include <catalina_hmi.h>

int main (void) {
	t_printf("Hello, world (from Catalina!)\n");

   while (1); // Prop reboots on exit from main!

   return 0;
}
