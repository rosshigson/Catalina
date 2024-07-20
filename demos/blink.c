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
 * in the 64006-ES kit when used with the P2_EVAL or P2_EDGE board. Set 
 * the BASE_PIN to be the base pin on which you have the board installed 
 * if it is not on the expansion header on pins 56 - 63.                                                                  *
 *                                                                           *
 * For best results, suppress the loading of any plugins using a command     *
 * like:                                                                     *
 *                                                                           *
 *    catalina -p2 -lc -C NO_PLUGINS blink.c 
 * 
 * Optionally, define the BASE_PIN by adding -D BASE_PIN=XX (or to the
 * Catalina Options in Geany). For example:                                *
 *                                                                           *
 *    catalina -p2 -lc -C NO_PLUGINS blink.c -D BASE_PIN=24
 *
 \***************************************************************************/

#include <prop.h>

#define STACK_SIZE 10

#define MAX_COGS 8

#ifndef BASE_PIN
#define BASE_PIN 56
#endif

#if (BASE_PIN < 32)
#define DIR DIRA
#define OUT OUTA
#define PIN BASE_PIN
#else
#define DIR DIRB
#define OUT OUTB
#define PIN (BASE_PIN - 32)
#endif

/*
 * blink_function : C function that can be executed in a cog.
 *                 (the only requirement for such a function is that it 
 *                 be a void function that requires no parameters - to 
 *                 share data with it, use commmon variables)
 */
void blink_function(void) {
   int me = _cogid();
   int pin = me + PIN;
   int on_off = 0;
   int i;

   DIR |= 1<<(pin - 32);
   while (1) {
      on_off ^= 1;
      OUT ^= on_off<<(pin-32);
      // each cog uses a different timeout, to make rippling patterns
      _waitcnt (_cnt() + (pin<<19)); 
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

   // now blink ourselves - if no plugins are loaded, this
   // means ALL cogs are now running the blink_function
   blink_function();
   return 0;
}
