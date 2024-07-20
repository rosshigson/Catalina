#include <hmi.h>

int main(void) {
   int i = 95;
   float f = 9.5;
   char *s = "A String!";

   t_string(1, "hello, world (from Catalina!)\n");

   t_string(1, "str ="); t_string(1, s);
   t_string(1, "\nint ="); t_integer(1, i);
   t_string(1, "\nflt ="); t_float(1, f, 6);

   while (1) ; // Prop reboots on exit from main!

   return 0;
}
