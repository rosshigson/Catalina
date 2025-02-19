#include <tty.h>

void s_padchar(unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      s_tx(txbyte);
   }
}
