#include <tty.h>

void s_ihex(unsigned value, int digits) {
   s_tx('$');
   s_hex(value, digits);
}
