#include <rtc.h>

/*
 * RTC calls : set clock frequency value
 */

unsigned long rtc_setfreq(unsigned long freq) {
   return _long_service(SVC_RTC_SETFREQ, freq);
}
