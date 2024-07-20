#include <rtc.h>

/*
 * RTC calls : get time value
 */

unsigned long rtc_gettime(void) {
   return _long_service(SVC_RTC_GETTIME, 0);
}
