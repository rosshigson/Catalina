/*
 * test the floating point classification functions 
 * (in Catalins, these are all functions, not macros):
 *
 *    fpclassify(), isnan(), isinf(), isnormal() and isfinite().
 */

#include <stdio.h>
#include <stdint.h>
#include <math.h>

union float_int {
  float f;
  uint32_t i;
};

void main() {
  union float_int zero;
  union float_int one;
  union float_int plus_inf;
  union float_int minus_inf;
  union float_int nan;
  union float_int subn;

  zero.f      = 0.0;
  one.f       = 1.0; 
  plus_inf.i  = 0x7F800000;
  minus_inf.i = 0xFF800000;
  nan.i       = 0x7FFFFFFF;
  subn.i      = 0x00000001;

 printf("zero: %8.2f fpclassify = %4x\n", zero.f, fpclassify(zero.f));
 printf("subn: %8.2g fpclassify = %4x\n", subn.f, fpclassify(subn.f));
 printf(" one: %8.2f fpclassify = %4x\n", one.f, fpclassify(one.f));
 printf("+inf: %8.2f fpclassify = %4x\n", plus_inf.f, fpclassify(plus_inf.f));
 printf("-inf: %8.2f fpclassify = %4x\n", minus_inf.f, fpclassify(minus_inf.f));
 printf(" nan: %8.2f fpclassify = %4x\n", nan.f, fpclassify(nan.f));
 printf("\n");
 printf("isfinite(zero) = %d\n", isfinite(zero.f));
 printf("isfinite( one) = %d\n", isfinite(one.f));
 printf("isfinite(subn) = %d\n", isfinite(subn.f));
 printf("isfinite(+inf) = %d\n", isfinite(plus_inf.f));
 printf("isfinite(-inf) = %d\n", isfinite(minus_inf.f));
 printf("isfinite( nan) = %d\n", isfinite(nan.f));
 printf("\n");
 printf("isnormal(zero) = %d\n", isnormal(zero.f));
 printf("isnormal( one) = %d\n", isnormal(one.f));
 printf("isnormal(subn) = %d\n", isnormal(subn.f));
 printf("isnormal(+inf) = %d\n", isnormal(plus_inf.f));
 printf("isnormal(-inf) = %d\n", isnormal(minus_inf.f));
 printf("isnormal( nan) = %d\n", isnormal(nan.f));
}
