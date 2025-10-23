/*
 * A simple program to test time functions.
 *
 * On the Propeller 2 you can compile this program with -C RTC to use the
 * hardware Real-Time Clock, or -C CLOCK to use a software clock.
 *
 * If you define CLOCK, this program will set the software clock from the
 * hartware RTC using the RTC stand-alone drivers, which means the RTC must
 * be present - so this version cannot be compiled for the Propeller 1.
 *
 * Add -C VT100 if you have a VT100 terminal.
 *
 * Optionally add -D DISPLAY_REGISTRY to display the registry.
 */

#if !defined(__CATALINA_P2) 
#error THIS PROGRAM REQUIRES A PROPELLER 2
#endif

#if !defined(__CATALINA_CLOCK) && !defined(__CATALINA_RTC)
#error THIS PROGRAM REQUIRES A CLOCK - COMPILE WITH -C CLOCK or -C RTC
#endif

#include <hmi.h>
#include <rtc.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <prop2.h>

#if !defined(__CATALINA_RTC)

// if we are not using the RTC plugin, we must set the time in the
// CLOCK plugin on startup using the stand-alone I2C/RTC drivers.

#include "rtc_driver.h"

#define RTCBASE 24 // base pin

void set_CLOCK_from_RTC() {
   uint32_t sc, mn, hr;
   uint32_t dt, mo, yr;
   struct   tm rtc_time;
   time_t   time_now;
   int      i;

    if (!rtc_start(RTCBASE, 0)) {
      t_printf("RTC Failed to start\n");
    }

   i = 0;
   while (!rtc_oscillator_ready()) {
     _waitms(100);
     if (i++ > 8) {
       // timeout, rtc module didn't start
       t_printf("RTC Oscillator not detected!\n");
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

#endif

#ifdef DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < 8) { // only display 8 registry entries, even on a P2!
      t_printf("Registry Entry %2d: ", i);
      // display plugin type
      t_printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      t_printf("%-20.20s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      t_printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      t_printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      t_printf("$%08x ", *(a_ptr +1));     
      t_printf("\n");
      i++;
   };
   t_printf("\n");
}
#endif

void t_getint(char *str, int *result) {
   int val = 0;
   char c;

   t_string(1, str);
   while (1) {
      c = k_wait() & 0xff;
      t_char(1, c);
      if ((c < '0') || (c > '9')) {
         *result = val;
         t_char (1, '\n');
         return;
      }
      val = val * 10 + c - '0';
   }
}

int main(void) {
   clock_t  clock_now;
   time_t   time_now;
   time_t   time_then;
   struct   tm *component_time;
   struct   tm my_time;
   char     ascii_time[30];
   char     ch;
   int      tmp;
   int      year_ok;

#ifdef DISPLAY_REGISTRY
   t_printf("\nDisplaying plugin registry ...\n\n");
   display_registry();
#endif

#if !defined(__CATALINA_RTC)
   set_CLOCK_from_RTC();
#endif

   t_string(1, "Test time functions\n");
   t_string(1, "time zone is set to ");
   t_string(1, getenv("TZ"));
   t_string(1, "\n");
   clock_now = clock();
   t_string(1, "\nclock() = ");
   t_hex(1, clock_now);
   time_now = time(&time_then);
   t_string(1, "\ntime()  = ");
   t_hex(1, time_now);
   while (1) {
      t_string(1, "\n\nPress 't' to set time\n");
      t_string(1, "Press 'a' to display ascii times\n");
      t_string(1, "Press 'c' to display time continuously\n");
      t_string(1, "Press any other key for binary time\n");
      ch = k_wait() & 0xff;
      if (ch == 't') {
         t_getint("Enter day (dd):", &my_time.tm_mday);
         t_getint("Enter month (mm):", &tmp);
         my_time.tm_mon = tmp - 1;
         t_getint("Enter year (yyyy):", &tmp);
         year_ok = 1;
         if (tmp < 100) {
            tmp = 2000 + tmp;
            t_string(1, "Year will be interpreted as ");
            t_integer(1, tmp);
            t_string(1, "\n");
         }
         else if ((tmp < 1970) || (tmp > 2037)) {
            t_string(1, "\nError: Only years 1970 .. 2037 supported!\n");
            year_ok = 0;
         }
         if (year_ok) {
            my_time.tm_year = tmp - 1900;
            t_getint("Enter hour (hh):", &my_time.tm_hour);
            t_getint("Enter min (mm):", &my_time.tm_min);
            t_getint("Enter sec (ss):", &my_time.tm_sec);
            t_char(1, '\n');
            my_time.tm_isdst = 0;
            time_now = mktime(&my_time);
            component_time = localtime(&time_now);
            t_string(1, asctime(component_time));
            rtc_settime(time_now);
         }
      }
      else if (ch == 'a') {
         time_now = time(&time_then);
         component_time = gmtime(&time_then);
         t_string(1,"\nascii time = ");
         t_string(1, asctime(component_time));
         component_time = gmtime(&time_then);
         t_string(1,"local time = ");
         t_string(1, asctime(component_time));
         t_string(1,"ctime time = ");
         t_string(1, ctime(&time_then));
      }
      else if (ch == 'c') {
#ifdef __CATALINA_VT100
            t_printf("%c[2J", 0x01b);
            t_string(1,"\nPress any key to exit ...\n");
#else
            t_char(1, '\f');
#endif
         while (!k_ready()) {

#ifdef __CATALINA_VT100
            t_printf("%c[%d;%dH", 0x01b, 6, 7);
#else
            t_setpos(1, 7, 6);
#endif
            time_now = time(&time_then);
            component_time = gmtime(&time_then);
            t_string(1, asctime(component_time));
         }
         k_wait(); // consume key
      }
      else {
         clock_now = clock();
         t_string(1, "\nclock() = ");
         t_hex(1, clock_now);
         time_now = time(&time_then);
         t_string(1, "\ntime()  = ");
         t_hex(1, time_now);
      }

   }

   return 0;
}

