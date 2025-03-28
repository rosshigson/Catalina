#include <serial4.h>

void s_ihex(unsigned port, unsigned value, int digits) {
   s_tx(port, '$');
   s_hex(port, value, digits);
}
