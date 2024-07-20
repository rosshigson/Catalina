#include <serial4.h>

void s4_ihex(unsigned port, unsigned value, int digits) {
   s4_tx(port, '$');
   s4_hex(port, value, digits);
}
