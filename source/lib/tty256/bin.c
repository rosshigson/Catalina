#include <tty.h>

void tty_bin(unsigned value, int digits) {
  //value <<= 32 - digits
  //repeat digits
  //  tx((value <-= 1) & 1 + "0")
  value <<= (32 - digits);
  while (digits-- > 0) {
     tty_tx(((value & 0x80000000) == 0) ? '0' : '1');
     value <<= 1;
  }
}
