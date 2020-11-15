/*
 * clock - determine the processor time used
 */

#include	<time.h>
#include <catalina_rtc.h>

clock_t
clock(void)
{
   return (clock_t) rtc_getclock();

}
