#include <float.h>
#include <stdio.h>
#include <hmi.h>

void print_float_as_unsigned(int curs, char *str, float f)  {
   unsigned *u;
   u = (unsigned *) &f;
   t_string(curs, str);
   t_hex(curs, *u);
   t_string(curs, "\n");
}

void test_float (float a) {
   float b;

   t_printf("flt=%f\n",a);
   print_float_as_unsigned(1,"hex=",a);
   
}

int main(void) {
   float a = FLT_MIN;
   float b = 1.17549435e-38F;

   t_printf("Testing FLT_MIN:\n\n");
   test_float(a);
   test_float(b);

   a = FLT_MAX;
   b = 3.4028234e+38F;

   t_printf("\nTesting FLT_MAX:\n\n");
   test_float(a);
   test_float(b);

   t_string(1, "\nPress any key to exit ...\n");
   k_wait();

   return 0;   
}
