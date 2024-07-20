#include <serial2.h>

void s2_ibin(unsigned port, unsigned value, int digits) {
   s2_tx(port, '%');
   s2_bin(port, value, digits);
}
