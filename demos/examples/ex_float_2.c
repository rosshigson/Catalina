#include <hmi.h>

void print_unsigned_as_float(int curs, char *str, unsigned u)  {
   float *f;
   f = (float *) &u;
   t_string(curs, str);
   t_hex(curs, u);
   t_string(curs, " (");
   t_float(curs, *f, 6);
   t_string(curs, ")\n");
}

void test_float (unsigned u) {
   unsigned a;

   print_unsigned_as_float(1,"u=",u);

   a = 0x7FC00000;
   print_unsigned_as_float(1,"nan=",a);
   a = 0x7F800000;
   print_unsigned_as_float(1,"inf=",a);

   t_string(1, "Press any key to continue...\n");
   k_wait();

}

int main(void) {
   unsigned u;

   u = 0x12345678;

   test_float(u);

   return 0;
}
