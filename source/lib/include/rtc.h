#ifndef _RTC__H
#define _RTC__H

#include <plugin.h>

/*
 * RTC calls :
 */
extern unsigned long rtc_debug(unsigned long debug);
extern unsigned long rtc_getclock(void);
extern unsigned long rtc_gettime(void);
extern unsigned long rtc_setfreq(unsigned long freq);
extern unsigned long _settime(unsigned long time);
extern unsigned long _getticks(unsigned long * seconds, unsigned long * ticks);

#define rtc_settime _settime
#define rtc_getticks _getticks

#endif
