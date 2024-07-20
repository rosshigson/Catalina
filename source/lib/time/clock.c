/*
 * clock - determine the processor time used
 */

#include <prop.h>
#include <time.h>
#include <rtc.h>

clock_t
clock(void)
{
#if USE_GETTICKS
   unsigned long secs, ticks;
   rtc_getticks(&secs, &ticks);
   return (clock_t) secs*CLOCKS_PER_SEC+ticks;
#else
   return (clock_t) rtc_getclock();
#endif

}
