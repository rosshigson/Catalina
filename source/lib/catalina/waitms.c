#include <stdint.h>

#ifndef __CATALINA_P2__
// Propeller 1 does not have _waitx() - use _waitcnt()
#define _waitx(ticks) _waitcnt((ticks) + _cnt())
#endif

void _waitms(uint32_t msecs) {
   unsigned delay_sec  = _clockfreq();    // delay for 1 second
   unsigned delay_msec = delay_sec/1000;  // delay for 1 milliseond
   while (msecs > 1000) {
      _waitx(delay_sec);
      msecs -= 1000;
   }
   _waitx(msecs*delay_msec);
}
