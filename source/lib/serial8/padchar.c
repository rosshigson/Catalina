#include <serial8.h>

void s_padchar(unsigned port, unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      s_tx(port, txbyte);
   }
}
