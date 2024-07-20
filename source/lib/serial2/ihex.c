#include <serial2.h>

void s2_ihex(unsigned port, unsigned value, int digits) {
   s2_tx(port, '$');
   s2_hex(port, value, digits);
}
