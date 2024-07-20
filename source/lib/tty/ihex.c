#include <tty.h>

void tty_ihex(unsigned value, int digits) {
   tty_tx('$');
   tty_hex(value, digits);
}
