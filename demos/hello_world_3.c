#include <catalina_hmi.h>

int main (void) {
	t_string(1, "Hello, world (from Catalina!)\n");

   while (1); // Prop reboots on exit from main!
   return 0;
}
