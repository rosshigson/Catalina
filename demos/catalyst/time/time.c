/*
 * time - a program to display and/or set the time and date and 
 *        various associated RTC options.
 *
 * Compile it with a command like:
 *
 *   catalina -p2 -lcx -lm time.c rtc_driver.c i2c.c
 *
 * NOTES:
 *
 *  1.  This program uses sscanf, so it MUST BE COMPILED with either
 *      -lc, lcx or -lcix - it will NOT WORK if compiled with -lci
 *
 *  2.  This program uses its own I2C driver, so it MUST NOT BE COMPILED
 *      with the RTC plugin, or the two will interfere with each other.
 *
 *  3.  To use the TZ environment variable to display local time, the RTC 
 *      time must be set to UTC time. To include corrections for daylight 
 *      savings, the TZ environment variable must include the daylight 
 *      savings start and stop specifiers. For example:
 *
 *        set TZ=AEST-10AEDT,M10.1.0/2,M4.1.0/2 
 *
 *      Environment variables are only supported on Propeller 2 platforms 
 *      with an SD card and when the program is compiled to use the extended 
 *      C library (i.e. -lcx or -lcix), so Time Zones are only supported in 
 *      such situations. On the Propeller 1, or the Propeller 2 without 
 *      an SD card, or compiled with a non-extended version of the C library
 *      (i.e. -lc or -lci) the the timezone is always hardcoded as "GMT", 
 *      which means there is no adjustment for time zones or daylight savings.
 *      To display local time in such cases, set the RTC to local time rather
 *      than UTC time (in which case the time will be the same whether or not
 *      the -u option is specified).
 *
 *  4.  Note that the time is by default displayed in the unix "asctime" 
 *      format, but if the -u is specified, it is instead displayed using 
 *      the formats adopted by the Parallax RTC driver, which are slightly 
 *      different. Also, note that if time zones are in use, one is local 
 *      time and the other is UTC time. For example, on my machine the time
 *      zone is set to Australian time, so I might see:
 *
 *      time    : Tue Nov  7 11:55:40 2023          -- local time, unix format
 *      time -u : Tuesday 07 NOV 2023 12:55:40 AM   -- UTC time, RTC format
 *
 *  5.  Note that SETTING the time and date can be done independently when
 *      setting UTC time (i.e. -u or -w is specified). But to set local time, 
 *      BOTH a new time AND a new date must be specified (to avoid the date
 *      being changed unintentionally if the time when converted to UTC is 
 *      a different date to the currently set date). So the following
 *      are all acceptable:
 *
 *      time -u 11:11:12 PM              -- set UTC time only (12 hour) 
 *      time -w 23:11:12                 -- set UTC time only (24 hour)
 *      time -u 01/01/2000               -- set UTC date only
 *      time 01/01/2000 11:11:12 PM      -- set both LOCAL date and time
 *      time 01/01/2000 23:11:12         -- set both LOCAL date and time
 *
 *      But the following will generate errors:
 *
 *      time 11:11:12 PM                 -- cannot set local time without date
 *      time 23:11:12                    -- cannot set local time without date
 *      time 01/01/2000                  -- cannot set local date without time
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <prop.h>
#include <hmi.h>

#include "rtc_driver.h"

#define RTCBASE 24 // base pin

#if defined(__CATALINA_PC)||defined(__CATALINA_TTY)||defined(__CATALINA_TTY256)||defined(__CATALINA_SIMPLE)
#define SERIAL_HMI
#endif

static int reset       = 0; // default is NO reset
static int calibrate   = 0; // default is NO calibration on RTC start
static int batt_mode   = 1; // default is battery ON
static int batt_set    = 0; // default is do NOT set battery mode
static int verbose     = 0; // default is NOT verbose
static int prompt_date = 0; // default is do NOT prompt for date
static int prompt_time = 0; // default is do NOT prompt for time
static int valid_date  = 0; // valid date given as argument
static int valid_time  = 0; // valid time given as argument
static int utc         = 0; // set UTC time instead of local time
static int utc_12      = 0; // display UTC time instead of local time (12 hour)
static int utc_24      = 0; // display UTC time instead of local time (24 hour)

static uint32_t sc, mn, hr, dt, mo, yr, wd;

void help(char *my_name) {
   t_printf("\nusage: %s [options] [ DD/MM/YY ] [ HH:MM:SS [ AM | PM ] ]\n", my_name);
   t_printf("With no options, prints local time in unix format.\n");
   t_printf("To use time zones and daylight savings, set the RTC to UTC\n");
   t_printf("time, and use the 'set' command to set a fully specified\n");
   t_printf("time zone in the TZ environment variable, such as:\n");
   t_printf("  set TZ=AEST-10AEDT,M10.1.0/2,M4.1.0/2\n");
   t_printf("\n");
   t_printf("options:  -? or -h  print this helpful message and exit\n");
   t_printf("          -b mode   set battery mode (0 or 1) and report\n");
   t_printf("          -c        calibrate on RTC start\n");
   t_printf("          -r        software reset the RTC\n");
   t_printf("          -d        prompt for new date\n");
   t_printf("          -t        prompt for new time\n");
   t_printf("          -u        print or set UTC time in 12 hour format\n");
   t_printf("          -w        print or set UTC time in 24 hour format\n");
   t_printf("          -v        verbose mode\n");
}

/*
 * return a pointer to the value of the argument to the command-line option,
 * with the specified index, or NULL if there is no value, incrementing the 
 * index, and also decrementing argc if we consume a second command-line 
 * argument.
 */
char *get_option_argument(int *index, int *argc, char *argv[]) {
   if (strlen(argv[*index]) == 2) {
      if ((*argc) > 0) {
         (*index)++;
         // use next arg
         (*argc)--;
         return argv[*index];
      }
      else {
         return NULL;
      }
   }
   else {
      // use remainder of this arg
      return &argv[*index][2];
   }
}

/*
 * decode arguments  - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int  i = 0;
   int count;
   int code = 0;
   char *arg;

   while ((code >= 0) && (argc--)) {
      if (verbose) {
         t_printf("arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("time");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'b':
                  batt_set = 1;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     t_printf("option -b requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &batt_mode);
                  }
                  if ((batt_mode < 0) || (batt_mode > 1)) {
                     t_printf("Error: battery mode must be 0 (off) or 1 (on)\n");
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        t_printf("battery mode = %d\n", batt_mode);
                     }
                  }
                  break;

               case 'c':
                  calibrate = 1;
                  if (verbose) {
                     t_printf("RTC will be calibrated on start\n");
                  }
                  break;

               case 'r':
                  reset = 1;
                  if (verbose) {
                     t_printf("RTC will be reset\n");
                  }
                  break;

               case 't':
                  prompt_time = 1;
                  if (verbose) {
                     t_printf("will prompt for new time\n");
                  }
                  break;

               case 'd':
                  prompt_date = 1;
                  if (verbose) {
                     t_printf("will prompt for new date\n");
                  }
                  break;

               case 'u':
                  utc = 1;
                  utc_12 = 1;
                  utc_24 = 0;
                  if (verbose) {
                     t_printf("display/set UTC time (12 hour format)\n");
                  }
                  break;

               case 'w':
                  utc = 1;
                  utc_12 = 0;
                  utc_24 = 1;
                  if (verbose) {
                     t_printf("display/set UTC time (24 hour format)\n");
                  }
                  break;

               case 'v':
                  verbose = 1;
                  t_printf("verbose mode\n");
                  break;

               default:
                  t_printf("\nError: unrecognized switch: %s\n", argv[i]);
                  code = -1; // force exit without further processing
                  break;
            }
         }
         else {
            // check for valid time or date
            int am_pm = 0;
            count = sscanf(argv[i], "%u:%u:%u", &hr, &mn, &sc);
            //printf("sscanf for returned %d\n", count);
            if (count == 3) {
               // this is a time - check if there is another argument,
               // and if so whether it is AM or PM
               if (argc > 0) {
                  if (strlen(argv[i+1]) == 1) {
                     if (toupper(argv[i+1][0]) == 'P') {
                        am_pm = 1;
                        if (hr < 12) {
                           hr += 12;
                        }
                        if (verbose) {
                           t_printf("Time is PM\n");
                        }
                     }
                     else if (toupper(argv[i+1][0]) == 'A') {
                        am_pm = 1;
                        if (verbose) {
                           t_printf("Time is AM\n");
                        }
                     }
                  }
                  if (strlen(argv[i+1]) == 2) {
                     if (toupper(argv[i+1][1]) == 'M') {
                        if (toupper(argv[i+1][0]) == 'P') {
                           am_pm = 1;
                           if (hr < 12) {
                              hr += 12;
                           }
                           if (verbose) {
                              t_printf("Time is PM\n");
                           }
                        }
                        else if (toupper(argv[i+1][0]) == 'A') {
                           am_pm = 1;
                           if (verbose) {
                              t_printf("Time is AM\n");
                           }
                        }
                     }
                  }
               }
               if ((hr >= 24) || (mn >= 60) || (sc >= 60)) {
                  t_printf("\nError: invalid time: %s\n", argv[i]);
                  code = -1;
               }
               else {
                  valid_time = 1;
               }
               if (am_pm) {
                  // ignore the next argument
                  i++;
                  argc--;
               }
            }
            else {
               count = sscanf(argv[i], "%d/%d/%d", &dt, &mo, &yr);
               //printf("sscanf for date returned %d\n", count);
               if (count == 3) {
                  if (yr <99) {
                     yr += 2000;
                  }
                  if ((dt > 31) || (mo > 12) || (yr < 1970) || (yr > 2099)) {
                     t_printf("\nError: invalid date: %s\n", argv[i]);
                     code = -1;
                  }
                  else {
                     valid_date = 1;
                  }
               }
               else {
                  t_printf("\nError: unrecognized argument: %s\n", argv[i]);
               }
            }
         }
      }
      i++; // next argument
   }
   if (code == -1) {
      return code;
   }
   if (verbose) {
      t_printf("executable name = %s\n", argv[0]);
   }
   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("time");
      }
      else {
         help(argv[0]);
      }
      code = -1;
   }
   return code;

}

int get_value(char *prompt) {
   int value = -1;
   char ch;
   t_printf(prompt);
   do {
      ch = getchar();
      if (isdigit(ch)) {
         if (value == -1) {
            value = 0;
         }
         value = 10 * value + (ch - '0');
      }
   } while (isdigit(ch));
   if (ch == EOF) {
      return -1;
   }
   return value;
}

void terminate() {
#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   _waitms(250);
#else
   // Prompt for a key before terminating
   t_printf("Press any key to exit ...");
   k_wait();
#endif
   exit(0);
}

time_t portable_timegm(struct tm *tm) {
  extern long _timezone;
	tm->tm_isdst = 0;
	/*
	 * If another thread modifies the timezone during the
	 * execution of the line below, it will produce undefined
	 * behavior.
	 */
	return mktime(tm) - _timezone;
}

void main(int argc, char *argv[]) {
   int i;
  
   if (decode_arguments(argc, argv) < 0) {
      terminate();
   }

   if (!rtc_start(RTCBASE, calibrate)) {
     t_printf("RTC Failed to start\n");
     terminate();
   }

  i = 0;
  while (!rtc_oscillator_ready()) {
    _waitms(100);
    if (i++ > 8) {
      // timeout, rtc module didn't start
      t_printf("RTC Oscillator not detected!\n");
      terminate();
    }
  }

  // Optional - Reset the RTC settings to default
  if (reset) {
    rtc_sw_reset();
  }

  // Optional - set and report on battery
  if (batt_set) {
     if (rtc_battery_low()) {
        t_printf("RTC Battery low!\n");
     }
     else {
        t_printf("RTC Battery OK!\n");
     }
     if (batt_mode) {
        rtc_set_battery_mode(BATT_ENABLE);
        t_printf("RTC Battery enabled\n");
     }
     else {
        rtc_set_battery_mode(BATT_DISABLE);
        t_printf("RTC Battery disabled\n");
     }

  }

  if (prompt_date) {
     t_printf("Enter date:\n");
     if (valid_date) {
        t_printf("Note: this will override the date specified\n");
     }
     if (((dt = get_value("DD > ")) > 0)
     &&  ((mo = get_value("MM > ")) > 0)
     &&  ((yr = get_value("YY > ")) >= 0)) {
        if ((dt <= 31) 
        &&  (mo <= 12) 
        &&  ((yr <= 99) || ((yr >= 2000) && (yr <= 2099)))) {
           if (yr <= 99) {
              yr += 2000;
           }
           valid_date = 1;
        }
        else {
           t_printf("\nError: invalid date: %d/%d/%d\n", dt, mo, yr);
           valid_date = 0;
        }
     }
  }
  if (prompt_time) {
     t_printf("Enter time (in 24 hour format):\n");
     if (valid_time) {
        t_printf("Note: this will override the time specified\n");
     }
     if (((hr = get_value("HH > ")) >= 0)
     &&  ((mn = get_value("MM > ")) >= 0)
     &&  ((sc = get_value("SS > ")) >= 0)) {
        if ((hr < 24) && (mn < 60) && (sc < 60)) {
           valid_time = 1;
        }
        else {
           t_printf("\nError: invalid time: %d:%d:%d\n", hr, mn, sc);
           valid_time = 0;
        }
     }
  }
  if (utc) {
     // if using UTC, we just set the clock with the given values, 
     // and we can set time and date independently
     if (valid_date) {
        rtc_set_calendar(dt, mo, yr);
     }

     if (valid_time) {
        rtc_set_time(sc, mn, hr);
     }
  }
  else if (valid_time || valid_date) {
     // if not using UTC, we need BOTH the date and the time, and must
     // convert the local time to UTC and then set BOTH time and date
     if (valid_date && valid_time) {
        struct tm time_local;
        struct tm *gmt;
        time_t t;

        time_local.tm_sec  = (int)sc;
        time_local.tm_min  = (int)mn;
        time_local.tm_hour = (int)hr;
        time_local.tm_mday = (int)dt;
        time_local.tm_mon  = (int)mo - 1;
        time_local.tm_year = (int)yr - 1900;
        time_local.tm_isdst = -1;
        t = mktime(&time_local);
        gmt = gmtime(&t);
        sc = gmt->tm_sec;
        mn = gmt->tm_min;
        hr = gmt->tm_hour;
        dt = gmt->tm_mday;
        mo = gmt->tm_mon + 1;
        yr = gmt->tm_year + 1900;
        rtc_set_calendar(dt, mo, yr);
        rtc_set_time(sc, mn, hr);
     }
     else {
        t_printf("Error: setting local time requires both date and time\n");
     }
  }

  rtc_get_time(&sc, &mn, &hr);

  rtc_get_calendar(&dt, &mo, &yr);

  wd = rtc_get_weekday();

  if (utc_12) {
     t_printf(
         "%s %s %s\n",
         rtc_day_name_long(wd), 
         rtc_calendar(dt, mo, yr), 
         rtc_time_12(hr, mn, sc)
     );
  }
  else if (utc_24) {
     t_printf(
         "%s %s %s\n",
         rtc_day_name_long(wd), 
         rtc_calendar(dt, mo, yr), 
         rtc_time_24(hr, mn, sc)
     );
  }
  else {
     struct tm time_now;
     time_t t;

     time_now.tm_sec  = (int)sc;
     time_now.tm_min  = (int)mn;
     time_now.tm_hour = (int)hr;
     time_now.tm_mday = (int)dt;
     time_now.tm_mon  = (int)mo - 1;
     time_now.tm_year = (int)yr - 1900;
     t = portable_timegm(&time_now);
     t_printf(ctime(&t));
  }

  terminate();
}
