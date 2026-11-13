/*
 * An implementration of get_fattime() for FatFs.a
 *
 * If the program using this code is compiled with -C CLOCK, the
 * hardware real-time clock will be used. Otherwise a dummy time
 * will be returned.
 *
 * The program using get_fattime() must set the time in the CLOCK 
 * plugin on startup by calling set_CLOCK_from_RTC().
 *
 * Can be compiled as a stand-alone test program by defining the 
 * Catalina symbol CLOCK and the C symbol TEST_GETTIME. For example:
 *
 *   catalina -p2 -lcx -lmc -C CLOCK -D TEST_GETTIME fftime.c rtc_driver.c i2c_driver.c
 *
 */

#include "ff.h"
#include <propeller.h>

#if defined(TEST_GETTIME) || (defined(__CATALINA_CLOCK) && (FF_FS_NORTC == 0))

#include <rtc.h>
#include <time.h>
#include "rtc_driver.h"

#define RTCBASE PASM( "mov r0, #_RTC_BASE") // base pin

void set_CLOCK_from_RTC() {
   uint32_t sc, mn, hr;
   uint32_t dt, mo, yr;
   struct   tm rtc_time;
   time_t   time_now;
   int      i;

    if (!rtc_start(RTCBASE, 0)) {
      //t_printf("RTC Failed to start\n");
    }

   i = 0;
   while (!rtc_oscillator_ready()) {
     _waitms(100);
     if (i++ > 8) {
       // timeout, rtc module didn't start
       //t_printf("RTC Oscillator not detected!\n");
       break;
     }
   }

   rtc_get_time(&sc, &mn, &hr);
   rtc_get_calendar(&dt, &mo, &yr);
   //printf("RTC time %d/%d/%d %02d:%02d:%02d\n", dt, mo, yr, hr, mn, sc);
 
   rtc_time.tm_mday = dt;
   rtc_time.tm_mon  = mo - 1;
   rtc_time.tm_year = yr - 1900;
   rtc_time.tm_hour = hr;
   rtc_time.tm_min  = mn;
   rtc_time.tm_sec  = sc;
   rtc_time.tm_isdst = 0;
   time_now = mktime(&rtc_time);
   rtc_settime(time_now);
}

DWORD get_fattime() {
   struct tm *t;
   time_t now;

   time(&now);
   t = localtime(&now);

   return (DWORD)((t->tm_year - 80) << 25)
      |   (DWORD)((t->tm_mon + 1) << 21)
      |   (DWORD)(t->tm_mday << 16)
      |   (DWORD)(t->tm_hour << 11)
      |   (DWORD)(t->tm_min << 5)
      |   (DWORD)(t->tm_sec >> 1);
}

#else

void set_CLOCK_from_RTC() {
}

DWORD get_fattime() {
   return	(DWORD)((FF_NORTC_YEAR - 1980) << 25)
      |   (DWORD)(FF_NORTC_MON << 21)
      |   (DWORD)(FF_NORTC_MDAY << 16);
}

#endif

#if defined(TEST_GETTIME)

void main(void) {

   set_CLOCK_from_RTC();

   while(1) {
      _waitsec(2);
      printf("TIME=%8X\n", get_fattime());
   }
}

#endif

