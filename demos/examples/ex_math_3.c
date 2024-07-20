/*
 * For the timing to work, you must compile this program with -C CLOCK
 */

#ifndef __CATALINA_CLOCK
#error THIS PROGRAM REQUIRES THE RTC PLUGIN - COMPILE WITH -C CLOCK
#endif

#include <hmi.h>
#include <time.h>
#include <math.h>

#define PI 3.1414926

#ifdef __CATALINA_P2
#define ITERATIONS 50000
#else
#define ITERATIONS 10000
#endif

void test_time (float a) {
   float b, c;
   int i;

   for (i = 0; i < ITERATIONS; i++) {
      b = cos(a + i*0.01);
      c = acos(b);
      b = sin(a + i*0.01);
      c = asin(b);
      b = tan(a + i*0.01);
      c = atan(b);
      b = pow(a + i*0.01, 2.34 + i*0.01);
   }

}

void press_key_to_continue() {
   t_string(1, "\nPress any key ...");
   k_wait();
   t_char(1,'\n');
   t_char(1,'\n');
}

int main(void) {
   int i;
   int j;
   float f;
   clock_t time1, time2;

   t_string(1, "Timing Test - To start,");

   press_key_to_continue();

   t_printf("Starting ...\n");
   time1 = clock();
   test_time(PI/100);
   time2 = clock();
   t_printf("...Completed, time was %g seconds\n", ((float)(time2-time1))/CLOCKS_PER_SEC);

   press_key_to_continue();

   return 0;
}
