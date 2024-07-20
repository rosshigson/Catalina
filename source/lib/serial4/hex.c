#include <serial4.h>

void s4_hex(unsigned port, unsigned value, int digits) {
   int i;
   int j;

   // value <<= (8 - digits) << 2
   // repeat digits
   //   tx(port,lookupz((value <-= 4) & $F : "0".."9", "A".."F"))
   if (digits < 1) {
      digits = 1;
   }
   if (digits > 8) {
      digits = 8;
   }
   value <<= ((8 - digits) << 2);
   for (j = 0; j < digits; j++) {
      i = ((value >> 28) & 0xF);
      if (i > 9) {
         i += 'A' - 10 - '0';
      }
      s4_tx(port, i + '0');
      value <<= 4;
   }
}
