#include <catalina_rtc.h>

/*
 * RTC calls : set clock frequency value
 */

unsigned long rtc_settime(unsigned long time) {
   return _long_service(SVC_RTC_SETTIME, time);
}
