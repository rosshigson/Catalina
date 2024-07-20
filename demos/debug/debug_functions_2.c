#include <stdio.h>

#include "debug_example.h"

int non_static_int;
static int static_int;

void test_11(int i, int j)
{
   print_i_and_j("Test 11 :", i, j);
   print_result("i+j", i+j);
   print_result("; i-j", i-j);
   print_result("; i*j", i*j);
   print_result("; i/j", i/j);
   print_result("; i%j", i%j);
   print_result("; i<<j", i<<j);
   print_result("; i>>j", i>>j);
   print_result("; ~i", ~i);
   print_result("; i|j", i|j);
   print_result("; i&j", i&j);
   print_result("; i^j", i^j);

   printf("\nTest 11 : Done\n");
}

void test_12(int dir, int *i, int **j) {
   int tmp;
   if (dir > 0) {
      // swap i and j one way
      tmp = *i;
      *i = **j;
      **j = tmp;
   }
   else {
      // swap i and j another way
      tmp = **j;
      **j = *i;
      *i = tmp;
   }
}

void test_13 (int numbers[]) {

   int i = 0;

   while (numbers[i] != -1) {
      printf("numbers[%d]=%d\n", i, numbers[i]);
      i++;
   }
}

void test_14 () {
   int i;
   int j;
   static char c = 'x';

   for (i = 0; i < 3; i++) {
      int j;
      char c;
      static_int = non_static_int;
      for (j = 1;j < 2; j++) {
         int k;
         char d;
         { int c; c = 1; };
      }
   }
   j = 0;
   while (j < 3) {
      int i;
      static char c = '0';
      struct aaa {int i; char c; union {short j; float k;} x; } d;
      
      c = c + j;
      d.i = j++;
      d.c = c;
   }
}

struct fields {
      /* field 4 bits wide */
      unsigned field1 :4;
      /*
       * unnamed 3 bit field
       * unnamed fields allow for padding
       */
      unsigned        :3;
      /*
       * one-bit field
       * can only be 0 or -1 in two's complement!
       */
      signed field2   :1;
      /* align next field on a storage unit */
      unsigned        :0;
      unsigned field3 :6;
};

void test_15() {
   struct fields bit_field;

   bit_field.field1 = 0;
   bit_field.field2 = 0;
   bit_field.field3 = 0;

   bit_field.field1 = 15;
   bit_field.field2 = -1;
   bit_field.field3 = 63;

   bit_field.field3 = 255;
}
