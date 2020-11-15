 /***************************************************************************\
 *                                                                           *
 *                        Multiple Cogs Blink Demo                           *
 *                                                                           *
 * This program shows how to use the cog function _coginit_C to start        *
 * many cogs running C functions. It is intended for the P2_EVAL platform,   *
 * which has 8 LEDs available to blink, but it could be adapted to other     *
 * platforms.                                                                *
 *                                                                           *
 * This program also makes a nice test program for the LED MATRIX accessory  *
 * in the 64006-ES kit. Set the BASE_PIN to be the base pin on which you     *
 * have the board installed if it is not on the expansion header on pins     *
 * 56 - 63.                                                                  *
 *                                                                           *
 * For best results, suppress the loading of any plugins using a command     *
 * like:                                                                     *
 *                                                                           *
 *    catalina -p2 -lc -C NO_PLUGINS blink.c                                 *
 *                                                                           *
 \***************************************************************************/

#include <propeller.h>

#define STACK_SIZE 10

#define MAX_COGS 8

#define BASE_PIN 56

/*
 * blink_function : C function that can be executed in a cog.
 *                 (the only requirement for such a function is that it 
 *                 be a void function that requires no parameters - to 
 *                 share data with it, use commmon variables)
 */
void blink_function(void) {
   int me = _cogid();
   int pin = me + BASE_PIN;
   int on_off = 0;
   int i;

   DIRB |= 1<<(pin - 32);
   while (1) {
      on_off ^= 1;
      OUTB ^= on_off<<(pin-32);
      // each cog uses a different timeout, to make rippling patterns
      _waitcnt (_cnt() + (pin<<17)); 
   }
}

/*
 * main : start a blink function in all free cogs
 */
int main(void) {
   int cog = 0;
   unsigned long stacks[STACK_SIZE * MAX_COGS];

   // start up to MAX_COGS instances of blink_function 
   // (i.e. until there are no cogs left)
   for (cog = 0; cog < MAX_COGS; cog++) {
      _coginit_C(&blink_function, &stacks[STACK_SIZE*(cog+1)]);
   }

   // now blink ourselves
   blink_function();
   return 0;
}
