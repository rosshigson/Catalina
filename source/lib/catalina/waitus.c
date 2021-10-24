#include <stdint.h>

#ifndef __CATALINA_P2__
// Propeller 1 does not have _waitx() - use _waitcnt()
#define _waitx(ticks) _waitcnt((ticks) + _cnt())
#endif

void _waitus(uint32_t usecs) {
   int delay_sec  = _clockfreq();      // delay for 1 second
   int delay_usec = delay_sec/1000000; // delay for 1 microsecond
   while (usecs > 1000000) {
      _waitx(delay_sec);
      usecs -= 1000000;
   }
   _waitx(usecs*delay_usec);
}
