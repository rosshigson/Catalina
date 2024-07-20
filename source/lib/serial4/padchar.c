#include <serial4.h>

void s4_padchar(unsigned port, unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      s4_tx(port, txbyte);
   }
}
