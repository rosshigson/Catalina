/*
 * This program is intended to blink the LED on TRIBLADEPROP CPU_3. It
 * is a test program for the multicpu demos.
 */
#include <cog.h>

void main(void) {
   unsigned count;
   unsigned mask   = 0x01000000; // bit 24
   unsigned on_off = 0x01000000;

   _dira(mask, mask);
   _outa(mask, on_off);
   count = _cnt();

   while (1) {
      _outa(mask, on_off);
      count += 100000000;
      _waitcnt(count);
      on_off ^= mask;
   }
}
