/*
 * Flash LEDs using special register keywords directly 
 * (as defined in propeller.h)
 */

#include <propeller.h>

#if defined __CATALINA_C3   
#define BIT 15   // On the C3, use P15 (VGA LED)
#elif defined __CATALINA_QUICKSTART 
#define BIT 23   // On the QUICKSTART, use P23 (VGA LED)
#else
#define BIT 0    // Otherwise, use P0 (Debug LED on Hydra)
#endif

#define BITMASK (1<<BIT)

void main(void) {

   unsigned count  = CNT+CLKFREQ;

   DIRA |= BITMASK;
   OUTA &= BITMASK;

   while (1) {
      OUTA ^= BITMASK;
      WAITCNT(count, CLKFREQ);
   }
}
