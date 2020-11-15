/*
 * time - return the current calendar time (seconds since jan 1, 1970)
 */

#include	<time.h>
#include <catalina_rtc.h>

time_t
time(time_t *timer)
{
   time_t tmp_time = (time_t) rtc_gettime();
   if (timer != NULL) {
      *timer = tmp_time;
   }
   return tmp_time;

}
