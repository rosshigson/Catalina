#include <stdio.h>

void main (void) {
   int i = 95;
   unsigned u = 0xF00DFACE;
   float f = 9.5;
   char *s = "A String!";

   printf("hello, world (from Catalina!)\n");

   printf("str = %s\nint = %d\nflt = %f\nhex = %X\n", s, i, f, u);

   while (1) ; // Prop reboots on exit from main!

}
