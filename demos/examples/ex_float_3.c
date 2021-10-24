#include <stdio.h>

void print_unsigned_as_float(int curs, char *str, unsigned u)  {
   float *f;
   f = (float *) &u;
   printf("%s%8x (%6g)\n", str, u, *f);
}

void test_float (unsigned u) {
   unsigned a;

   print_unsigned_as_float(1,"u=",u);

   a = 0x7FC00000;
   print_unsigned_as_float(1,"nan=",a);
   a = 0x7F800000;
   print_unsigned_as_float(1,"inf=",a);

}

int main(void) {
   unsigned u;

   u = 0x12345678;

   test_float(u);

   printf("Press any key to exit...\n");
   getchar();

   return 0;
}
