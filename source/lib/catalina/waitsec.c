#include <stdint.h>

#ifndef __CATALINA_P2__
// Propeller 1 does not have _waitx() - use _waitcnt()
#define _waitx(ticks) _waitcnt((ticks) + _cnt())
#endif

void _waitsec(uint32_t secs) {
   int delay = _clockfreq();
   while (secs > 0) {
      _waitx(delay);
      secs--;
   }
}
