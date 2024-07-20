#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cog.h>

/*
#define XTAL_FREQUENCY  5000000
#define TIMER_ADDRESS   0x80000100
#define XTAL_FREQUENCY  (1024 * 64 * 100)
#define PLL16X          16
#define CLOCK_FREQUENCY (XTAL_FREQUENCY * PLL16X)
*/

#define CNT _cnt()
#define CLKFREQ _clockfreq()
#define iprintf printf

unsigned int fibo (unsigned int n) {
   if (n < 2) {
      return (n);
   }
   else {
      return fibo(n - 1) + fibo(n - 2);
   }
}

int main (int argc,  char* argv[]) {
   int n;
   int result;
   unsigned int startTime;
   unsigned int endTime;
   unsigned int executionTime;

   for (n = 0; n <= 26; n++) {
      iprintf("fibo(%02d) = ", n);
      startTime = CNT;
      result = fibo(n);
      endTime = CNT;
      executionTime = (endTime - startTime) / (CLKFREQ / 1000);
      iprintf ("%06d (%05ums)\n", result, executionTime);
   }
   while(1);

   return 0;
}
