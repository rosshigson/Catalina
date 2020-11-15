#ifndef CATALINA_RTC__H
#define CATALINA_RTC__H

#include <catalina_plugin.h>

/*
 * RTC calls :
 */
extern unsigned long rtc_debug(unsigned long debug);
extern unsigned long rtc_getclock(void);
extern unsigned long rtc_gettime(void);
extern unsigned long rtc_setfreq(unsigned long freq);
extern unsigned long rtc_settime(unsigned long time);

#endif
