#include <rtc.h>

/*
 * RTC calls : set debug
 */

unsigned long rtc_debug(unsigned long debug) {
   return _long_service(SVC_RTC_DEBUG, debug);
}
