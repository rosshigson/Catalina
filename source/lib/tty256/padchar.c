#include <tty.h>

void tty_padchar(unsigned count, char txbyte) {
   int i;

   for (i = 0; i < count; i++) {
      tty_tx(txbyte);
   }
}
