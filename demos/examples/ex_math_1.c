#include <hmi.h>

#include <math.h>

#define PI 3.1414926

void test_1(char *str) {
   t_string(1,str);
}

void print_float(int curs, char *str, float f)  {
   t_string(curs, str);
   t_float(curs, f, 5);
   t_string(curs, "\n");
}

void print_int(int curs, char *str, int i)  {
   t_string(curs, str);
   t_integer(curs, i);
   t_string(curs, "\n");
}

void test_2 (float a, float b) {
   float c;

   print_float(1,"a=",a);
   print_float(1,"b=",b);

   c = a + b;
   print_float(1,"a+b=",c);
}

void test_3 (float a, float b) {
   float c;

   print_float(1,"a=",a);
   print_float(1,"b=",b);

   c = a - b;
   print_float(1,"a-b=",c);
}

void test_4 (float a, float b) {
   float c;

   print_float(1,"a=",a);
   print_float(1,"b=",b);

   c = a * b;
   print_float(1,"a*b=",c);
}

void test_5 (float a, float b) {

   float c;

   print_float(1,"a=",a);
   print_float(1,"b=",b);

   c = a / b;
   print_float(1,"a/b=",c);
}

void test_6 (float a, float b) {
   float c;

   print_float(1,"a=",a);
   print_float(1,"b=",b);

   if (a != b) {
      t_string (1, "a != b\n");
   }
   if (a <= b) {
      t_string (1, "a <= b\n");
   }
   if (a < b) {
      t_string (1, "a < b\n");
   }
   if (a == b) {
      t_string (1, "a == b\n");
   }
   if (a > b) {
      t_string (1, "a > b\n");
   }
   if (a >= b) {
      t_string (1, "a >= b\n");
   }
}

void test_7 (float a) {
   float b;

   print_float(1,"a=",a);
   b = sqrt(a);
   print_float(1,"sqrt(a)=",b);

}

void test_8 (float a) {
   float b;

   print_float(1,"a=",a);
   b = cos(a);
   print_float(1,"cos(a)=",b);
   b = sin(a);
   print_float(1,"sin(a)=",b);
   b = tan(a);
   print_float(1,"tan(a)=",b);

}

void test_9 (float a) {
   float b;

   print_float(1, "a=",a);
   b = pow(a, 2.34);
   print_float(1, "pow(a,2.34)=",b);
   b = log10(a);
   print_float(1, "log10(a)=",b);

}

void test_10 (float a) {
   int i;
   float b;

   print_float(1, "a=",a);
   i = (int)a;
   print_int(1, "int(a)=",i);
   b = (float)(i);
   print_float(1, "float((int(a))=",b);

}

void press_key_to_continue() {
   t_string(1, "\nPress any key to continue ...");
   k_wait();
   t_char(1,'\n');
   t_char(1,'\n');
}

int main(void) {
   int i;
   int j;
   float f;

   test_1("Test 1 : Hello, World! (from Catalina)\n");

   press_key_to_continue();

   test_2(345.678, 987.654);
   press_key_to_continue();
   test_3(-345.678, -987.654);
   press_key_to_continue();
    test_4(345.678, 876.543);
   press_key_to_continue();
   test_5(-345.678, 765.432);
   press_key_to_continue();
   test_6(345.678, 765.432);
   press_key_to_continue();
   test_6(765.432, 345.678);
   press_key_to_continue();
   test_6(345.678, 345.678);
   press_key_to_continue();
   test_6(345.678, -345.678);
   press_key_to_continue();
   test_6(-345.678, 345.678);
   press_key_to_continue();
   test_7(81.23);
   press_key_to_continue();
   test_7(1.234);
   press_key_to_continue();
   test_8(PI/2);
   press_key_to_continue();
   test_9(4.56);
   press_key_to_continue();
   test_10(123.456);
   press_key_to_continue();
   test_10(-987.654);
   press_key_to_continue();
   test_10(1.23456e8);
   press_key_to_continue();
   test_10(-9.87654e8);
   press_key_to_continue();
   test_10(1.0e37);
   press_key_to_continue();
   test_10(-1.0e-37);
   press_key_to_continue();
   test_10(0.0);
   press_key_to_continue();

   return 0;
}

