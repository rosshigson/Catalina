#include <serial4.h>

void s_ibin(unsigned port, unsigned value, int digits) {
   s_tx(port, '%');
   s_bin(port, value, digits);
}
