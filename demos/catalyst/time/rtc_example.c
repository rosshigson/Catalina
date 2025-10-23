/*
 * Translated from Spin2 to C by Ross Higson. The Spin2 code has been left 
 * intact to demonstrate how Spin2 can be translated into C PASM, mostly 
 * line for line.
 *
 * Compiile with a command like:
 *
 *   catalina rtc_example.c rtc_driver.c jm_i2c.c -p2 -lci -lm 
 *
 * Add -C VT100 if you are using a VT100 emulator.
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <prop.h>
#include <prop2.h>
#include <smartpin.h>
#include <floatext.h>

#include "rtc_driver.h"

/*
 * '' =================================================================================================
 * ''
 * ''   File....... 64013_RTC Example.spin2
 * ''   Purpose....
 * ''   Author..... Michael Mulholland
 * ''               -- based on code shared by Jon "JonnyMac" McPhalen
 * ''
 * ''   E-mail..... support@parallax.com
 * ''   Started....
 * ''   Updated.... 30 NOV 2020
 * ''
 * ''   IDE........ Compiled with PropellerTool (version 2.7.0)
 * ''               - Load to propeller with DEBUG output enabled (Click Run menu, then Enable DEBUG for P2)
 * ''
 * ''   {$P2}
 * ''
 * '' =================================================================================================
 * 
 * 
 * con { timing }
 * 
 *   _clkfreq = 180_000_000
 *   _xinfreq =  20_000_000         ' Optional, set the exact clock source frequency for your P2 board
 * 
 * 
 * con { base pin }
 * 
 *   RTCBASE  = 24
 */

#define RTCBASE 24  // base pin

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * obj
 * 
 *   rtc  : "64013_RTC_Driver"
 *   'term : "jm_fullduplexserial"  ' serial driver, used to set current time from host
 * 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub main() | lastsc, sc, mn, hr, lastwd, wd, dt, mo, yr, tc, x, daysinyear
 * 
 *   ' testcalibration()
 * 
 *   if !rtc.start(RTCBASE, true)                                  ' start rtc, or else quit. 2nd parameter forces calibration if true
 *     debug("Failed to start RTC")
 *     theEnd()
 * 
 * 
 *   x := 0
 *   repeat until rtc.oscillator_ready()                           ' ensure rtc clock running before proceeding
 *     waitms(500)
 *     if (x++ > 8)                                                ' timeout, rtc module didn't start
 *       debug("Oscillator not detected!")
 *       theEnd()
 * 
 * 
 *   '' Optional - Check battery
 *   if rtc.battery_low()
 *     'theEnd()
 * 
 * 
 *   '' Optional - Reset the RTC settings to default
 *   'rtc.sw_reset()
 * 
 * 
 *   '' Optional - Set battery mode
 *   '' -- Tip! Might be good to enable battery in-case it was previously disabled for shipping or storage
 *   rtc.set_battery_mode(rtc.BATT_ENABLE)                        ' BATT_ENABLE, BATT_DISABLE
 * 
 * 
 *   '' Calibration - call anytime if ambient temperature changes significantly
 *   '' - calling here for example only- change paramater to true to save the calibration result.
 *   rtc.calibrate(false)                                        ' true to store calibration, false to read (but not store).
 * 
 * 
 *   '' Manually set RTC registers to current time and date
 *   '' - When calling set_calendar, the weekday number (0-6) will automatically be calculated and saved.
 *   'rtc.set_time(30, 34, 17)                                      ' 12:48:30 pm
 *   'rtc.set_calendar(17, 10, 2023)                                 ' 4 OCT 2020
 * 
 * 
 * 
 *   '' Demo display section follows
 *   ''
 * 
 *   waitms(1000)                                                  ' Allow debug terminal to update before streaming calendar data
 * 
 * 
 *   '' Configure display windows
 *   debug(`term c title 'Date & Time' pos 400 200 size 26 1 textsize 20)
 *   debug(`term d title 'Day'         pos 400 300 size 30 1 textsize 20)
 * 
 *   '' Pre-load some variables
 *   sc, mn, hr := rtc.get_time()                                  ' sc = seconds, mn = minutes, hr = hours
 *   dt, mo, yr := rtc.get_calendar()                              ' dt = day (0..31), mo = month (1..12), yr = year (2001..2099)
 *   wd         := rtc.get_weekday()                               ' wd = weekday digit 0=Sun, 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri, 6=Sat
 *   lastsc     := lastwd := -1                                    ' helper variables for previous-seconds and previous-weekday values
 * 
 *   '' Repeat loop, update calendar display based on RTC values
 *   repeat
 *     sc, mn, hr := rtc.get_time()
 *     if (sc <> lastsc)
 *       debug(`c 0 ' `zstr_(rtc.calendar(dt, mo, yr))  `zstr_(rtc.time_12(hr, mn, sc))')
 *       lastsc := sc
 * 
 *     wd := rtc.get_weekday()
 *     if (wd <> lastwd)
 *       dt, mo, yr := rtc.get_calendar()
 *       daysinyear := rtc.leap_year(yr) ? 366 : 365
 *       debug(`d 0 ' `zstr_(rtc.day_name_long(wd)), Day # `udec_(rtc.day_number(dt, mo, yr)) of `udec_(daysinyear) ')
 * 
 *       lastwd := wd
 * 
 */

static void testcalibration();

void main() {
  uint32_t lastsc = 0, sc, mn, hr, lastwd = 0, wd, dt, mo, yr, tc, x, daysinyear = 0;
  
  lastsc = 0;
  lastwd = 0;
  daysinyear  =0;

  // testcalibration();

  if (!rtc_start(RTCBASE, 1)) {                                  // start rtc, or else quit. 2nd parameter forces calibration if true
    printf("Failed to start RTC\n");
    exit(0);
  }

  x = 0;
  while (!rtc_oscillator_ready()) {
    _waitms(100);
    if (x++ > 8) {                                              // timeout, rtc module didn't start
      printf("Oscillator not detected!\n");
      exit(0);
    }
  }

  // Optional - Check battery
  if (rtc_battery_low()) {
    //exit(0);
  }

  // Optional - Reset the RTC settings to default
  //rtc.sw_reset();

  // Optional - Set battery mode
  // -- Tip! Might be good to enable battery in-case it was previously disabled for shipping or storage
  rtc_set_battery_mode(BATT_ENABLE);                        // BATT_ENABLE, BATT_DISABLE

  // Calibration - call anytime if ambient temperature changes significantly
  // - calling here for example only- change paramater to true to save the calibration result.
  rtc_calibrate(0);                                             // 1 to store calibration, 0 to read (but not store).


  // Manually set RTC registers to current time and date
  // - When calling set_calendar, the weekday number (0-6) will automatically be calculated and saved.
  //rtc_set_time(00, 36, 16);                                    // 17:34:30
  //rtc_set_calendar(19, 10, 2023);                              // 17 OCT 2023

  // Demo display section follows

  //_waitms(1000);                                                // Allow debug terminal to update before streaming calendar data

  // Configure display windows
  // debug(`term c title 'Date & Time' pos 400 200 size 26 1 textsize 20);
  // debug(`term d title 'Day'         pos 400 300 size 30 1 textsize 20);

  // Pre-load some variables
  rtc_get_time(&sc, &mn, &hr);                                 // sc = seconds, mn = minutes, hr = hours
  rtc_get_calendar(&dt, &mo, &yr);                             // dt = day (0..31), mo = month (1..12), yr = year (2001..2099)
  wd         = rtc_get_weekday();                              // wd = weekday digit 0=Sun, 1=Mon, 2=Tue, 3=Wed, 4=Thu, 5=Fri, 6=Sat
  lastsc     = lastwd = -1;                                    // helper variables for previous-seconds and previous-weekday values

#ifdef __CATALINA_VT100
  // clear screen (to remove debug messages)
  printf("%c[2J", 0x01b);
#endif

  // Repeat loop, update calendar display based on RTC values
  while (1) {
    rtc_get_time(&sc, &mn, &hr);
    if (sc != lastsc) {
#ifdef __CATALINA_VT100
      printf("%c[%d;%dHDate & Time:", 0x01b, 4,8);
      printf("%c[%d;%dH", 0x01b, 5,10);
#endif
      printf("%s %s\n", rtc_calendar(dt, mo, yr), rtc_time_12(hr, mn, sc));
      lastsc = sc;
    }

    wd = rtc_get_weekday();
    if (wd != lastwd) {
      rtc_get_calendar(&dt, &mo, &yr);
      daysinyear = (rtc_leap_year(yr) ? 366 : 365);
#ifdef __CATALINA_VT100
      printf("%c[%d;%dHDay:", 0x01b, 7,8);
      printf("%c[%d;%dH", 0x01b, 8,12);
#endif
      printf("%s %d of %d\n", rtc_day_name_long(wd), rtc_day_number(dt, mo, yr), daysinyear);
      lastwd = wd;
    }
  }
}

/* 
 * pri testcalibration() | pin, ticks, offset
 * 
 *   ' Choose pins and clear them
 *   pin := RTCBASE+1
 *   pinclear(pin)
 *   pinclear(RTCBASE)
 * 
 *   ' Apply 150K pull-up to the clock pin
 *   rtc.set_pullup(RTCBASE, P_HIGH_150K)
 * 
 *   waitms(100)
 * 
 *   repeat
 * 
 *     '' count 32768 edges (y=1).
 *     '' result should be close to current P2 clkfreq; the difference being the required calibration factor
 *     pinstart(pin, P_EVENTS_TICKS | P_MINUS1_A, 32768, 1)               ' PINSTART(PinField, Mode, Xval, Yval)
 *     repeat while not pinr(pin)
 *     akpin(pin) ' re-trigger
 * 
 *     '' wait until count gets to the target, then record the ticks value (which will equate to the P2 clock edges)
 *     repeat while not pinr(pin)
 *     ticks := rdpin(pin)
 *     pinclear(pin)
 * 
 *     '' Calculate the offset value to be written to the RTC, based on the
 *     '' - MODE0 Eppm conversion constant & algorithm shown in the RTC datasheet.
 *     offset := round(float(clkfreq - ticks) *. 1e6 /. float(ticks) /. 4.34)
 *     debug("Calibration data ", udec(ticks, (clkfreq-ticks), offset))
 * 
 */
static void testcalibration() {
  uint32_t pin, ticks, offset;

  // Choose pins and clear them
  pin = RTCBASE+1;
  _pinclear(pin);
  _pinclear(RTCBASE);

  // Apply 150K pull-up to the clock pin
  rtc_set_pullup(RTCBASE, P_HIGH_150K);

  _waitms(100);

  while (1) {

    // count 32768 edges (y=1).
    // result should be close to current P2 clkfreq; the difference being the required calibration factor
    _pinstart(pin, P_EVENTS_TICKS | P_MINUS1_A, 32768, 1);               // PINSTART(PinField, Mode, Xval, Yval)
    do {
    } while (!_pinr(pin));
    _akpin(pin); // re-trigger

    // wait until count gets to the target, then record the ticks value (which will equate to the P2 clock edges)
    do {
    } while (!_pinr(pin));
    ticks = _rdpin(pin);
    _pinclear(pin);

    // Calculate the offset value to be written to the RTC, based on the
    // - MODE0 Eppm conversion constant & algorithm shown in the RTC datasheet.
    offset = lround((float)(_clockfreq() - ticks) * 1.0e6 / (float)(ticks) / 4.34);
    printf("Calibration data %d, %d, %d\n", ticks, (_clockfreq()-ticks), offset);
  }
}

/* ''' ------------------------------------------------------------------------------------------------------
 * pri theEnd()
 * 
 *   debug(" ")
 *   debug("The End.")
 * 
 *   repeat
 *     waitct(0)
 *
 * {
 * pri set_calendar() | b
 * 
 *   ' TODO: Not implemented fully, as compiler might provide timestamp to DAT section automatically
 * 
 *   ' Wait for serial input in this format:  [20221208-172500]
 * 
 *   rtc.start(RTCBASE, false)
 *   repeat until rtc.oscillator_ready()
 *   term.tstart(57_600)
 *   term.rxflush()
 * 
 *   repeat until term.available()
 *   waitms(1000)
 * 
 *   repeat
 * 
 *     b := term.rx()
 *     term.tx(b)
 * }
 */

/*
 * ''' ------------------------------------------------------------------------------------------------------
 * con { license }
 * 
 * {{
 * 
 *   Terms of Use: MIT License
 * 
 *   Permission is hereby granted, free of charge, to any person obtaining a copy of this
 *   software and associated documentation files (the "Software"), to deal in the Software
 *   without restriction, including without limitation the rights to use, copy, modify,
 *   merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 *   permit persons to whom the Software is furnished to do so, subject to the following
 *   conditions:
 * 
 *   The above copyright notice and this permission notice shall be included in all copies
 *   or substantial portions of the Software.
 * 
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 *   INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 *   PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 *   CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 *   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * }}
 */ 
