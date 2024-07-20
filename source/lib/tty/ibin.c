#include <tty.h>

void tty_ibin(unsigned value, int digits) {
   tty_tx('%');
   tty_bin(value, digits);
}
