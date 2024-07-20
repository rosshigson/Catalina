#include <serial8.h>

void s8_ihex(unsigned port, unsigned value, int digits) {
   s8_tx(port, '$');
   s8_hex(port, value, digits);
}
