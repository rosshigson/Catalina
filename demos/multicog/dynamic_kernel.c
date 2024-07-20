 /***************************************************************************\
 *                                                                           *
 *                            Dynamic Kernel Demo                            *
 *                                                                           *
 * This program shows how to use the cog function coginit_C (or cogstart_C)  *
 * to start a dynamic kernel to run a C function.                            *
 *                                                                           *
 \***************************************************************************/

/*
 * include the definitions of some useful multi-cog utility functions:
 */
#include "cogutil.h"

/*
 * set USE_COGSTART to 1 to test _cogstart_C, rather than _coginit_C
 */
#define USE_COGSTART 1

/*
 * define the pin to use for output (pin 1 is a LED on the Hybrid or Hydra)
 */
#if defined (__CATALINA_C3)
#define OUTPUT_MASK 0x00008000 // use VGA pin (and dira, outa) on C3
#define _dir _dira
#define _out _outa
#elif defined (__CATALINA_P2_EVAL)
#define OUTPUT_MASK 0x02000000 // use pin 57 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#elif defined (__CATALINA_P2_EDGE)
#define OUTPUT_MASK 0x00000040 // use pin 38 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define OUTPUT_MASK 0x00000001 // use pin 0 (and dira, outa) on other platforms
#define _dir _dira
#define _out _outa
#endif

/*
 * define a C function to be executed by the dynamic kernel 
 * (cycles the output pin at a frequency of 1Hz).
 *
 */
#if USE_COGSTART
void function(void *not_used) {
#else
void function(void) {
#endif
   unsigned mask   = OUTPUT_MASK;
   unsigned on_off = OUTPUT_MASK;

   _dir(mask, mask);
   _out(mask, on_off);

   while (1) {
      _out(mask, on_off);
      _waitcnt(_cnt() + _clockfreq()/2);
      on_off ^= mask;
   }
}

/*
 * The main C program - loops forever, starting and stopping 
 * C function running in a dynamic kernel 
 */
int main(void) {
   int cog;
   unsigned long stack[STACK_SIZE];

   wait(1000);
   while (1) {
      t_string(1, "starting ...\n");
#if USE_COGSTART
      cog = _cogstart_C(&function, 0, &stack, STACK_SIZE);
#else
      cog = _coginit_C(&function, &stack[STACK_SIZE]);
#endif
      if (cog < 0) {
          t_string(1, "... failed\n");
      }
      else {
         wait(5000);
         t_string(1, "stopping ...\n");
         _cogstop(cog);
      }
      wait(5000);
   }

   return 0;
}
