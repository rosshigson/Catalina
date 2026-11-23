/*
 * An implementation of get_fattime() for FatFs. 
 *
 * If the program using this code is compiled with -C CLOCK or -C RTC, a
 * real-time clock will be used. Otherwise a dummy time will be returned.
 *
 * Note that this implementation will attempt to use the Real-Time Clock 
 * hardware if compiled with either RTC or CLOCK defined, and will return 
 * whatever time has been programmed into the RTC hardware, which is usually 
 * UTC time (rather than local time (which would be more usual for FAT file 
 * systems). However, Catalyst (like Unix) generally expects to use UTC time.
 * To make Catalyst use local time, first use the "set" command to remove any
 * TZ setting (e.g. set TZ=""), and then use the "time" command to set the 
 * local time in the RTC. 
 *
 * If -C RTC is defined, the the program will use the CLOCK plugin with RTC
 * hardware support enabled. Doing this currently means the clock plugin will
 * run on a separate cog.
 *
 * If -C CLOCK is defined, the program will use the CLOCK plugin without
 * RTC hardware support, but when compiled as a stand-alone test program
 * with rt_driver.c and i2c_driver.c) it will try to set the clock using 
 * those C drivers, as a demo of how this can be done without requiring 
 * the use of an extra cog (but it makes the code larger since it requires
 * the i2c and rtc driver functions to be included).
 *
 * Compile it as a stand-alone test program by also defining the C symbol
 * TEST_GETTIME (note: C symbols are defined using -D, not -C). For example:
 *
 *   catalina -p2 -lc -lm -C RTC -D TEST_GETTIME fftime.c
 *
 * or
 *
 *   catalina -p2 -lc -lm -C CLOCK -D TEST_GETTIME fftime.c rtc_driver.c i2c_driver.c
 *
 * Note that FatFs automatically calls set_CLOCK_from_RTC() on startup if the 
 * RTC is enabled (vi setting FF_FS_NORTC to 0 in ffconfig.h), but other 
 * programs using get_fattime() must do so themselves (as this program does 
 * when it is compiled as a stand-alone test program).
 *
 */

#include "ff.h"
#include <propeller.h>
#include <stdio.h>

#define DEBUG 0 // set to 1 to print RTC and fattime on each call

#if FF_FS_NORTC == 1 

// No RTC hardware - use dummy clock functions

void set_CLOCK_from_RTC() {
}

DWORD get_fattime() {
#if DEBUG
   printf("Using dummy get_fattime()\n");
   printf("Time %d/%d/%d %02d:%02d:%02d\n", 
      FF_NORTC_MDAY, 
      FF_NORTC_MON, 
      FF_NORTC_YEAR, 
      0, 
      0, 
      0
   );
#endif  
   return	(DWORD)((FF_NORTC_YEAR - 1980) << 25)
      |   (DWORD)(FF_NORTC_MON << 21)
      |   (DWORD)(FF_NORTC_MDAY << 16);
}

#else

// use RTC hardware if available

#include <time.h>

#if defined(__CATALINA_RTC)

// use clock functions provided by the RTC plugin

void set_CLOCK_from_RTC() {
   // not required - done by the driver itself!
}

DWORD get_fattime() {
   struct tm *t;
   time_t now;

#if DEBUG
  printf("Using RTC get_fattime()\n");
#endif

   time(&now);
   //t = localtime(&now); // return GMT (i.e. UTC) time.
   t = gmtime(&now);

#if DEBUG      
      printf("Time %ld/%ld/%ld %02ld:%02ld:%02ld\n", 
          t->tm_mday, 
          t->tm_mon+1, 
          t->tm_year, 
          t->tm_hour, 
          t->tm_min, 
          t->tm_sec);
#endif      

   return (DWORD)((t->tm_year - 80) << 25)
      |   (DWORD)((t->tm_mon + 1) << 21)
      |   (DWORD)(t->tm_mday << 16)
      |   (DWORD)(t->tm_hour << 11)
      |   (DWORD)(t->tm_min << 5)
      |   (DWORD)(t->tm_sec >> 1);
}


#else

// use clock functions provided by the CLOCK plugin, but set the 
// time by using the i2c and rtc drivers on startup (if possible!)

#include <rtc.h>
#include "rtc_driver.h"

#define RTCBASE PASM( "mov r0, #_RTC_BASE") // base pin

void set_CLOCK_from_RTC() {
   uint32_t sc, mn, hr;
   uint32_t dt, mo, yr;
   struct   tm rtc_time;
   time_t   time_now;
   int      i = 0;
   int      rtc_ok = 1;

   if (!rtc_start(RTCBASE, 0)) {
      printf("RTC Failed to start\n");
      rtc_ok = 0;
   }

   while (rtc_ok && !rtc_oscillator_ready()) {
      _waitms(100);
      if (i++ > 8) {
         // timeout, rtc module didn't start
         printf("RTC Oscillator not detected!\n");
         rtc_ok = 0;
         break;
      }
   }

   if (rtc_ok) {
      rtc_get_time(&sc, &mn, &hr);
      rtc_get_calendar(&dt, &mo, &yr);

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
}

DWORD get_fattime() {
   struct tm *t;
   time_t now;

#if DEBUG
  printf("Using CLOCK get_fattime()\n");
#endif

   time(&now);
   t = localtime(&now);

#if DEBUG      
      printf("Time %ld/%ld/%ld %02ld:%02ld:%02ld\n", 
         t->tm_mday, 
         t->tm_mon, 
         t->tm_year, 
         t->tm_hour, 
         t->tm_min, 
         t->tm_sec
      );
#endif      
 
   return (DWORD)((t->tm_year - 80) << 25)
      |   (DWORD)((t->tm_mon + 1) << 21)
      |   (DWORD)(t->tm_mday << 16)
      |   (DWORD)(t->tm_hour << 11)
      |   (DWORD)(t->tm_min << 5)
      |   (DWORD)(t->tm_sec >> 1);
}

#endif

#endif

#if defined(TEST_GETTIME)

void main(void) {

   set_CLOCK_from_RTC();

   while(1) {
      _waitsec(2);
      printf("TIME=%8lX\n", get_fattime());
   }
}

#endif

