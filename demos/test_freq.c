#include <stdio.h>
#include <catalina_cog.h>

#define TEST_FREQ 40000000
#define TEST_MODE XTAL_1 + PLL8X

int main (void) {
	unsigned current_freq = 0;
   unsigned current_mode = 0;
	unsigned new_freq = 0;
   unsigned new_mode = 0;

	printf("Testing Catalina clock management\n");

   current_freq = _clockfreq();
   current_mode = _clockmode();

	printf("Current frequency = %u\n", current_freq);
	printf("Current mode      = 0x%2x\n", current_mode);

   printf("\nWaiting 5 seconds\n\n");
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());

/*
   printf("Resetting current mode\n");
   _clockinit(current_mode, current_freq);

	printf("Current frequency = %u\n", current_freq);
	printf("Current mode      = 0x%2x\n", current_mode);

   printf("\nWaiting 5 seconds\n\n");
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
*/

   printf("Setting test mode in 5 seconds - \n");
   printf("Screen will then blank for 5 seconds\n\n");
	printf("Test frequency = %u\n", TEST_FREQ);
	printf("Test mode      = 0x%2x\n\n", TEST_MODE);
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());

   _clockinit(TEST_MODE, TEST_FREQ);
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());
   _waitcnt(_cnt() + _clockfreq());

   printf("Restoring orignal mode\n\n");
   _clockinit(current_mode, current_freq);

   printf("Back again - test complete\n");

   printf("Press any key to exit ...\n");
   getchar();

   return 0;
}
