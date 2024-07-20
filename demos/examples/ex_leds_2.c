/*
 * Flash LEDs using special register keywords directly 
 * (as defined in prop.h)
 */

#include <prop.h>

#if defined __CATALINA_C3   
#define BIT 15       // On the C3, use P15 (VGA LED)
#define DIR DIRA     // and DIRA
#define OUT OUTA     // and OUTA
#elif defined __CATALINA_QUICKSTART 
#define BIT 23       // On the QUICKSTART, use P23 (VGA LED)
#define DIR DIRA     // and DIRA
#define OUT OUTA     // and OUTA
#elif defined __CATALINA_P2_EVAL 
#define BIT (58-32)  // On the P2_EVAL, use P58
#define DIR DIRB     // and DIRB
#define OUT OUTB     // and OUTB
#elif defined __CATALINA_P2_EDGE 
#define BIT (38-32)  // On the P2_EDGE, use P38
#define DIR DIRB     // and DIRB
#define OUT OUTB     // and OUTB
#else
#define BIT 0        // Otherwise, use P0 (Debug LED on Hydra)
#define DIR DIRA     // and DIRA
#define OUT OUTA     // and OUTA
#endif

#define BITMASK (1<<BIT)

void main(void) {

   unsigned count  = _cnt() + CLKFREQ;

   DIR |= BITMASK;
   OUT &= BITMASK;

   while (1) {
      OUT ^= BITMASK;
      WAITCNT(count, CLKFREQ);
   }
}
