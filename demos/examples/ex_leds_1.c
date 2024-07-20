/*
 * Flash LEDs using built-in functions to access special registers
 * (as defined in cog.h)
 */

#include <cog.h>

#if defined __CATALINA_C3   
#define BIT 15       // On the C3, use P15 (VGA LED)
#define _dir _dira   // and DIRA
#define _out _outa   // and OUTA
#elif defined __CATALINA_QUICKSTART 
#define BIT 23       // On the QUICKSTART, use P23 (VGA LED)
#define _dir _dira   // and DIRA
#define _out _outa   // and OUTA
#elif defined __CATALINA_P2_EVAL 
#define BIT (58-32)   // On the P2_EVAL, use P58
#define _dir _dirb    // and DIRB
#define _out _outb    // and OUTB
#elif defined __CATALINA_P2_EDGE 
#define BIT (38-32)   // On the P2_EDGE, use P38
#define _dir _dirb    // and DIRB
#define _out _outb    // and OUTB
#else
#define BIT 0         // Otherwise, use P0 (Debug LED on Hydra)
#define _dir _dira    // and DIRA
#define _out _outa    // and OUTA
#endif

#define BITMASK (1<<BIT)

int main(void) {
   unsigned count;
   unsigned on_off = BITMASK;

   _dir(BITMASK, BITMASK);
   _out(BITMASK, on_off);
   count = _cnt();

   while (1) {
      _out(BITMASK, on_off);
      count += _clockfreq();
      _waitcnt(count);
      on_off ^= BITMASK;
   }

   return 0;
}
