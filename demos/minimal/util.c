#include <cog.h>

/*
 * wait - wait a specified number of milliseconds
 */
void wait(unsigned ms) {
   unsigned count;
   count = _cnt();
   count +=_clockfreq() / 1000 * ms;
	_waitcnt(count);
} 
