#include <serial8.h>

void s8_ibin(unsigned port, unsigned value, int digits) {
   s8_tx(port, '%');
   s8_bin(port, value, digits);
}
