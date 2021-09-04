#include <catalina_serial8.h>
#include <catalina_cog.h>

int s8_rxtime(unsigned port, unsigned ms) {
   unsigned t = _cnt();
   int rxbyte;

   while (1) {
      rxbyte = s8_rxcheck(port);
      if ((rxbyte >= 0) || (((_cnt() - t) / (_clockfreq() / 1000)) > ms)) {
         break;
      }
   }
   return rxbyte;
}
