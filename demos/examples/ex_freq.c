#include <stdio.h>
#include <cog.h>

#ifdef __CATALINA_P2

#define _XTALFREQ 20000000  //  crystal frequency
#define _XDIV     2         // \ crystal divider             to give 10.0MHz
#define _XMUL     26        // | crystal / div * mul         to give 260MHz
#define _XDIVP    1         // / crystal / div * mul / divp  to give 260MHz
#define _XOSC     1         // 0=OFF, 1=OSC, 2=15pF, 3=30pF
#define _XSEL     3         // 0=rcfast, 1=rcslow, 2=XI, 3=PLL
#define _XPLL     1         // 0= PLL off, 1=PLL on

#define _XPPPP    ((_XDIVP>>1) + 15) & 0xF  // 1->15, 2->0, 4->1, 6->2...30->14
#define TEST_MODE ((_XPLL<<24) + ((_XDIV-1)<<18) + ((_XMUL-1)<<8) + (_XPPPP<<4) + (_XOSC<<2) +_XSEL) 
#define TEST_FREQ (((_XTALFREQ / _XDIV) * _XMUL) / _XDIVP)

#else

#define TEST_FREQ 40000000
#define TEST_MODE XTAL_1 + PLL8X

#endif

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
   printf("Screen will then blank for 5 seconds\n");
   printf("(or serial comms will be disrupted)\n\n");
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
