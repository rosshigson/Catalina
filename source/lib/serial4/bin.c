#include <serial4.h>

void s4_bin(unsigned port, unsigned value, int digits) {
  //value <<= 32 - digits
  //repeat digits
  //  tx(port,(value <-= 1) & 1 + "0")
  value <<= (32 - digits);
  while (digits-- > 0) {
     s4_tx(port, ((value & 0x80000000) == 0) ? '0' : '1');
     value <<= 1;
  }
}
