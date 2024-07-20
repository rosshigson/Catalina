#include <tty.h>
#include <cog.h>

int tty_rxtime(unsigned ms) {
   unsigned t = _cnt();
   int rxbyte;

   while (1) {
      rxbyte = tty_rxcheck();
      if ((rxbyte >= 0) || (((_cnt() - t) / (_clockfreq() / 1000)) > ms)) {
         break;
      }
   }
   return rxbyte;
}
