#include <serial2.h>

void s2_padchar(unsigned port, unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      s2_tx(port, txbyte);
   }
}
