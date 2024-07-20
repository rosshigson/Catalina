#include <serial4.h>

void s4_ibin(unsigned port, unsigned value, int digits) {
   s4_tx(port, '%');
   s4_bin(port, value, digits);
}
