#include <serial8.h>

void s8_padchar(unsigned port, unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      s8_tx(port, txbyte);
   }
}
