#include <stdio.h>
#include <stddef.h>

#ifdef __CATALINA_libtiny
#error format specifiers 'z' and 't' are not supported by the tiny I/O library
#endif

void main (void) {
   int i = 95;
   unsigned u = 0xF00DFACE;
   float f = 9.5;
   char *s = "A String!";
   char ss[20] = "Another String!";
   size_t z = 20;
   ptrdiff_t t = &ss[20] - &ss[0];

   printf("hello, world (from Catalina!)\n");

   printf("str = %s\nint = %d\nflt = %f\nhex = %X\n", s, i, f, u);
   printf("size_t = %zu\nprtdiff_t = %td\n", z, t);

   while (1) ; // Prop reboots on exit from main!

}
