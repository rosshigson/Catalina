#include <float.h>
#include <math.h>
#include <stdio.h>

/* 
 * Simple floating point test_suite. Tests all the maths.h floating point
 * functions. Tests only a representative sample of values (i.e. not all
 * possible values, or even the whole possible range of values), and does 
 * not test any pathological cases (i.e. INF, NAN etc).
 *
 * Intended to be verified by the Lua script "test_float.lua" to provide
 * confidence that floating point maths basically works ok. The results 
 * are compared against the same results calculated by Lua, and pass if
 * the values are within a specified precision (see the Lua script for
 * more details on this).
 *
 */

#define PI 3.1415926

#define TRIG_STEP PI/16.0

#define ATRIG_STEP 0.1

#define ATRIG_GUARD 0.01

#define ATAN2_STEP 11.0

#define FMOD_STEP 11.0

#define MODF_STEP 9.7

#define POW_STEP 13.0

void test_sin(void) {
   float f;

   for (f = -PI; f < PI; f += TRIG_STEP) {
      printf("f = %.6g, sin(f) = %.6g\n", f, sin(f)); 
   }
   printf("\n\n");
}

void test_cos(void) {
   float f;

   for (f = -PI; f < PI; f += TRIG_STEP) {
      printf("f = %.6g, cos(f) = %.6g\n", f, cos(f)); 
   }
   printf("\n\n");
}

void test_asin(void) {
   float f;

   for (f = -1.0 + ATRIG_GUARD; f < 1.0 - ATRIG_GUARD; f += ATRIG_STEP) {
      printf("f = %.6g, asin(f) = %.6g\n", f, asin(f)); 
   }
   printf("\n\n");
}

void test_acos(void) {
   float f;

   for (f = -1.0 + ATRIG_GUARD; f < 1.0 - ATRIG_GUARD; f += ATRIG_STEP) {
      printf("f = %.6g, acos(f) = %.6g\n", f, acos(f)); 
   }
   printf("\n\n");
}

void test_atan(void) {
   float f;

   for (f = -PI; f < PI; f += TRIG_STEP) {
      printf("f = %.6g, atan(f) = %.6g\n", f, atan(f)); 
   }
   printf("\n\n");
}

void test_atan2(void) {
   float x, y;

   for (x = -50.0; x < 50.0; x += ATAN2_STEP) {
      for (y = -50.0; y < 50.0; y += ATAN2_STEP) {
         printf("x = %.6g, y = %.6g, atan2(x, y) = %.6g\n", x, y, atan2(x,y)); 
      }
   }
   printf("\n\n");
}

void test_sinh(void) {
   float f;

   for (f = -PI; f < PI; f += TRIG_STEP) {
       printf("f = %.6g, sinh(f) = %.6g\n", f, sinh(f)); 
   }
   printf("\n\n");
}

void test_cosh(void) {
   float f;

   for (f = -PI; f < PI; f += TRIG_STEP) {
       printf("f = %.6g, cosh(f) = %.6g\n", f, cosh(f)); 
   }
   printf("\n\n");
}

void test_tanh(void) {
   float f;

   for (f = -PI/2.0; f < PI/2.0; f += TRIG_STEP) {
       printf("f = %.6g, tanh(f) = %.6g\n", f, tanh(f)); 
   }
   printf("\n\n");
}

void test_ceil(void) {
   float f;

   for (f = -100.0; f < 100.0; f += 11.4) {
       printf("f = %.6g, ceil(f) = %.6g\n", f, ceil(f)); 
   }
   printf("\n\n");
}

void test_floor(void) {
   float f;

   for (f = -100.0; f < 100.0; f += 11.4) {
       printf("f = %.6g, floor(f) = %.6g\n", f, floor(f)); 
   }
   printf("\n\n");
}

void test_fabs(void) {
   float f;

   for (f = -100.0; f < 100.0; f += 11.4) {
       printf("f = %.6g, fabs(f) = %.6g\n", f, fabs(f)); 
   }
   printf("\n\n");
}

void test_sqrt(void) {
   float f;

   for (f = 1.0e11; f > 1.0e-5; f /= 3.0) {
       printf("f = %.6g, sqrt(f) = %.6g\n", f, sqrt(f)); 
   }
   printf("\n\n");
}

void test_log(void) {
   float f;

   for (f = 1.0e11; f > 1.0e-5; f /= 3.0) {
       printf("f = %.6g, log(f) = %.6g\n", f, log(f)); 
   }
   printf("\n\n");
}

void test_log10(void) {
   float f;

   for (f = 1.0e11; f > 1.0e-5; f /= 3.0) {
       printf("f = %.6g, log10(f) = %.6g\n", f, log10(f)); 
   }
   printf("\n\n");
}

void test_fmod(void) {
   float x, y;

   for (x = -50.0; x < 50.0; x += FMOD_STEP) {
      for (y = -50.0; y < 50.0; y += FMOD_STEP) {
         printf("x = %.6g, y = %.6g, fmod(x, y) = %.6g\n", x, y, fmod(x,y)); 
      }
   }
   printf("\n\n");
}

void test_modf(void) {
   float f;
   double x, y;

   for (f = -50.0; f < 50.0; f += MODF_STEP) {
      x = modf(f, &y);
      printf("f = %.6g, modf(f, &y) = %.6g, y = %.6g\n", f, x, y); 
   }
   printf("\n\n");
}

void test_exp(void) {
   float f;

   for (f = 50.0; f > 1.0e-5; f /= 3.0) {
       printf("f = %.6g, exp(f) = %.6g\n", f, exp(f)); 
   }
   printf("\n\n");
}

void test_pow(void) {
   float x, y;

   for (x = -25.0; x < 25.0; x += POW_STEP) {
      for (y = -25.0; y < 25.0; y += POW_STEP) {
         printf("x = %.6g, y = %.6g, pow(x, y) = %.6g\n", x, y, pow(x,y)); 
      }
   }
   printf("\n\n");
}

void test_frexp_ldexp(void) {
   float f;
   double x, y;
   int i;

   for (f = 1.0e11; f > 1.0e-5; f /= 3.0) {
       x = frexp(f, &i);
       y = ldexp(x, i);
       printf("f = %.6g, frexp(f, &i) = %.6g, i = %d, ldexp() = %.6g\n", f, x, i, y); 
   }
   printf("\n\n");
}

void press_to_continue() {
   printf("Press any key to continue ...\n\n");
   k_wait();
}

void main(void) {

   printf("Floating point test\n\n");
   press_to_continue();
   test_sin();
   press_to_continue();
   test_cos();
   press_to_continue();
   test_asin();
   press_to_continue();
   test_acos();
   press_to_continue();
   test_atan();
   press_to_continue();
   test_atan2();
   press_to_continue();
   test_sinh();
   press_to_continue();
   test_cosh();
   press_to_continue();
   test_tanh();
   press_to_continue();
   test_log();
   press_to_continue();
   test_log10();
   press_to_continue();
   test_sqrt();
   press_to_continue();
   test_ceil();
   press_to_continue();
   test_floor();
   press_to_continue();
   test_fabs();
   press_to_continue();
   test_modf();
   press_to_continue();
   test_fmod();
   press_to_continue();
   test_exp();
   press_to_continue();
   test_pow();
   press_to_continue();
   test_frexp_ldexp();

   printf("All tests completed\n\n");
   while(1) { };
}
