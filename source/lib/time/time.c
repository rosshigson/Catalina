/*
 * time - return the current calendar time (seconds since jan 1, 1970)
 */

#include <time.h>
#include <rtc.h>

time_t
time(time_t *timer)
{
#if USE_GETTICKS
   time_t tmp_time;
   unsigned long seconds, ticks;
   rtc_getticks(&seconds, &ticks);
   tmp_time = (time_t) seconds;
#else
   time_t tmp_time = (time_t) rtc_gettime();
#endif
   if (timer != NULL) {
      *timer = tmp_time;
   }
   return tmp_time;
}
