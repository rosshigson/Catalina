#include <rtc.h>

/*
 * RTC calls : get clock value
 */

unsigned long rtc_getclock(void) {
   return _long_service(SVC_RTC_GETCLOCK, 0);
}
