#include <hmi.h>
#include <floatext.h>

void print_float_as_unsigned(int curs, char *str, float f)  {
   unsigned *u;
   u = (unsigned *) &f;
   t_string(curs, str);
   t_hex(curs, *u);
   t_string(curs, "\n");
}

void test_float (float a) {
   float b;

   print_float_as_unsigned(1,"a=",a);
   b = sin(a);
   print_float_as_unsigned(1,"sin(a)=",b);
   b = cos(a);
   print_float_as_unsigned(1,"cos(a)=",b);
   b = tan(a);
   print_float_as_unsigned(1,"tan(a)=",b);
   b = sqrt(a);
   print_float_as_unsigned(1,"sqrt(a)=",b);
   b = atan2(a, 4.0);
   print_float_as_unsigned(1,"atan2(a, 4.0)=",b);

}

int main(void) {
   float a;
   float b;

   a = 2.0;
   b = 3.0;

   test_float(a);
   test_float(b);

   t_string(1, "Press any key to continue...\n");
   k_wait();

   return 0;
   
}
