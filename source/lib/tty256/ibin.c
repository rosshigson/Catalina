#include <tty.h>

void s_ibin(unsigned value, int digits) {
   s_tx('%');
   s_bin(value, digits);
}
