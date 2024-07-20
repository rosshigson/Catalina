/*
 * Translated from Spin2 to C by Ross Higson. The Spin2 code has been left 
 * intact to demonstrate how Spin2 can be translated into C PASM, mostly 
 * line for line.
 *
 * The prefix "rtc_" is added to the functions exported by this module.
 */

#include <string.h>
#include <stdint.h>
#include <hmi.h>
#include <propeller2.h>
#include <smartpins.h>

#include "rtc_driver.h"

#define RTC_DEBUG 0   // set RTC_DEBUG to 1 to enable debug messages

/*
 * '' ====================================================
 * #include "propeller2.h"
 *=============================================
 * ''
 * ''   File....... 64013_RTC_Driver.spin2
 * ''   Purpose.... Low level driver object for Parallax RTC Add-on #64013
 * ''
 * ''   Author..... Michael Mulholland
 * ''               -- based on code shared by Jon "JonnyMac" McPhalen
 * ''
 * ''   E-mail..... support@parallax.com
 * ''   Started....
 * ''   Updated.... 30 NOV 2020
 * ''
 * '' =================================================================================================
 * 
 * 
 * con { click pin offsets }
 * 
 *   #00, P_SCL, P_SDA                               ' rtc module pin offsets
 * 
 */

// see rtc_driver.h

/* 
 * 
 * con { timing - ONLY FOR DEBUGGING - Will be overriden by calling code }
 * 
 *   _clkfreq      = 10_000_000
 * 
 * 
 * con { function parameters}
 * 
 */

/* 
 * ' CLKOUT frequency options (Hz)
 *   #0, Hz_32768, Hz_16384, Hz_8192, Hz_4096, Hz_1024, Hz_32, Hz_1, Hz_0
 * 
 */

// see rtc_driver.h

/* 
 *   ' Battery backup options (Note: If disabled the RTC memory will be lost when powered down. Enabled by default.)
 *   #0, BATT_ENABLE, BATT_DISABLE
 * 
 */

// see rtc_driver.h

/* 
 *   ' Power State options
 *   #0, STATE_OFF, STATE_ON
 * 
 */

// see rtc_driver.h

/* 
 * 
 * con { rtc registers }
 * 
 *   PCF8523_WR = %1101_000_0                                      ' i2c slave id
 *   PCF8523_RD = %1101_000_1
 *   PCF8523_DEVICE_ID = PCF8523_WR
 */

#define PCF8523_WR 0xD0 // %1101_0000                                i2c slave id
#define PCF8523_RD 0xD1 // %1101_0001
#define PCF8523_DEVICE_ID PCF8523_WR

/* 
 *   #$03, R_SC, R_MN, R_HR                                        ' time
 *   #$06, R_DATE, R_WKDAY, R_MON, R_YR                            ' date
 *   #$0A, R_A1MNS, R_A1HRS                                        ' alarm 1 time
 *   #$0C, R_A1DYDT                                                ' alarm 1 day / date
 *   #$0D, R_A1WKDY
 *   #$0E, R_OFFSET                                                ' aging offset
 * 
*/
enum {
     R_SC = 3, R_MN, R_HR,                                         // time
     R_DATE, R_WKDAY, R_MON, R_YR,                                 // date
     R_A1MNS, R_A1HRS,                                             // alarm 1 time
     R_A1DYDT,                                                     // alarm 1 day / date
     R_OFFSET                                                      // aging offset
};

/* 
 * con { PCF8523 Full Register Map }
 * 
 *   PCF8523_00_CONTROL_1          = $00
 *   PCF8523_01_CONTROL_2          = $01
 *   PCF8523_02_CONTROL_3          = $02
 *   PCF8523_03_SECONDS            = $03
 *   PCF8523_04_MINUTES            = $04
 *   PCF8523_05_HOURS              = $05
 *   PCF8523_06_DAYS               = $06
 *   PCF8523_07_WEEKDAYS           = $07
 *   PCF8523_08_MONTHS             = $08
 *   PCF8523_09_YEARS              = $09
 *   PCF8523_0A_MINUTE_ALARM       = $0A
 *   PCF8523_0B_HOUR_ALARM         = $0B
 *   PCF8523_0C_DAY_ALARM          = $0C
 *   PCF8523_0D_WEEKDAY_ALARM      = $0D
 *   PCF8523_0E_OFFSET             = $0E
 *   PCF8523_0F_TMR_CLKOUT_CTRL    = $0F
 *   PCF8523_10_TMR_A_FREQ_CTRL    = $10
 *   PCF8523_11_TMR_A_REG          = $11
 *   PCF8523_12_TMR_B_FREQ_CTRL    = $12
 *   PCF8523_13_TMR_B_REG          = $13
 * 
 */

// PCF8523 Full Register Map
enum {
   PCF8523_00_CONTROL_1,
   PCF8523_01_CONTROL_2,
   PCF8523_02_CONTROL_3,
   PCF8523_03_SECONDS,
   PCF8523_04_MINUTES,
   PCF8523_05_HOURS,
   PCF8523_06_DAYS,
   PCF8523_07_WEEKDAYS,
   PCF8523_08_MONTHS,
   PCF8523_09_YEARS,
   PCF8523_0A_MINUTE_ALARM,
   PCF8523_0B_HOUR_ALARM,
   PCF8523_0C_DAY_ALARM,
   PCF8523_0D_WEEKDAY_ALARM,
   PCF8523_0E_OFFSET,
   PCF8523_0F_TMR_CLKOUT_CTRL,
   PCF8523_10_TMR_A_FREQ_CTRL,
   PCF8523_11_TMR_A_REG,
   PCF8523_12_TMR_B_FREQ_CTRL,
   PCF8523_13_TMR_B_REG
};


 /* 
 * var
 * 
 *   long BASEPIN, SCL, SDA, ACTIVE
 * 
 */
static uint32_t BASEPIN, SCL, SDA, ACTIVE;

/* 
 * obj
 * 
 *   i2c : "jm_i2c"
 * 
 */

#include "i2c_driver.h"

static void debug (char *str) {
#if RTC_DEBUG
  printf("%s\n", str);
#endif
}

static void debug_bin (char *str, uint32_t bin) {
#if RTC_DEBUG
  printf("%s %02X\n", str, bin); // print bin as hex
#endif
}

static void debug_dec (char *str, uint32_t dec) {
#if RTC_DEBUG
  printf("%s %d\n", str, dec);
#endif
}

static void debug_hex_2 (char *str, uint32_t hex_1, uint32_t hex_2) {
#if RTC_DEBUG
  printf("%s %02X, %02X\n", str, hex_1, hex_2); // print bin as hex
#endif
}

static void debug_dec_3 (char *str, uint32_t dec1, uint32_t dec2, uint32_t dec3) {
#if RTC_DEBUG
  printf("%s %d, %d, %d\n", str, dec1, dec2, dec3);
#endif
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub null()
 * 
 *   '' This is not a top-level object
 *   debug(" ")
 *   debug("**************************************")
 *   debug("ERROR! This is not a top-level object!")
 *   debug("       Cannot run this code file. END.")
 *   debug("**************************************")
 * 
 */

// there is no need for the null function in C

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub start(_basepin, _calibrate) : result
 * 
 *   ACTIVE  :=  false
 *   BASEPIN := _basepin
 *   SCL     := _basepin + P_SCL
 *   SDA     := _basepin + P_SDA
 * 
 *   i2c.setup(SCL, SDA, 400, i2c.PU_3K3)     ' i2c for RTC @ 400kHz
 * 
 *   if !present()
 *     stop()
 *     return false
 * 
 *   else
 *     ACTIVE := true
 * 
 *     if (_calibrate)
 *       calibrate(true)
 * 
 *     return true
 * 
 */

uint32_t rtc_start(uint32_t _basepin, uint32_t _calibrate) {
  ACTIVE  = 0;
  BASEPIN = _basepin;
  SCL     = _basepin + P_SCL;
  SDA     = _basepin + P_SDA;
 
  i2c_setup(SCL, SDA, 400, PU_3K3);           // i2c for RTC @ 400kHz
 
  if (!rtc_present()) {
    debug("RTC not present");
    rtc_stop();
    return 0;
  }
  else {
    ACTIVE = 1;
    if (_calibrate) {
      rtc_calibrate(1);
    }
    return 1;
  }
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub stop() | i
 * 
 *   i2c.stop()
 * 
 *   '' Clear pins
 *   repeat i from 0 to 1
 *     pinclear(BASEPIN+i)
 * 
 *   ACTIVE := false
 * 
 */
void rtc_stop() {
  uint32_t  i;

  i2c_stop();

  // Clear pins
  for (i  = 0; i <= 1; i++) {
    _pinclear(BASEPIN+i);
  }
  ACTIVE = 0;
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub present() : result
 * 
 *   '' Verify RTC exists (ping it, and ensure no false positive by also checking for deviceID $01)
 *   return ( i2c.present(PCF8523_DEVICE_ID) AND  !i2c.present($01) )
 *
 */
uint32_t rtc_present() {

  // Verify RTC exists (ping it, and ensure no false positive by also checking for deviceID $01)
  return (i2c_present(PCF8523_DEVICE_ID) && !i2c_present(0x01));
}

/*
 * ''' ------------------------------------------------------------------------------------------------------
 * pub oscillator_ready() : result
 * 
 *   result := register_read(PCF8523_03_SECONDS) & %01111111           ' Read existing value, clearing the bit to override
 *   register_write(PCF8523_03_SECONDS, result)                        ' Write back to clear the OS interrupt flag at bit 7
 *   result := register_read(PCF8523_03_SECONDS) & %10000000           ' Read existing value, only bit 7
 *   result := (result == 0) ? true : false                            ' Convert result to true or false
 *   ' could do result-- instead, but keep verbose
 * 
 *   if (result)
 *     debug("oscillator_ready YES")
 *   else
 *     debug("oscillator_ready?...")
 * 
 */
uint32_t rtc_oscillator_ready() {
  uint32_t result;

  result = rtc_register_read(PCF8523_03_SECONDS) & 0x7F;           // Read existing value, clearing the bit to override
  rtc_register_write(PCF8523_03_SECONDS, result);                  // Write back to clear the OS interrupt flag at bit 7
  result = rtc_register_read(PCF8523_03_SECONDS) & 0x80;           // Read existing value, only bit 7
  result = ((result == 0) ? 1 : 0);                                // Convert result to true or false
  // could do result-- instead, but keep verbose

  if (result) {
    debug("oscillator_ready YES");
  }
  else {
    debug("oscillator_ready?...");
  }
  return result;
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub battery_low() : result | value
 * 
 *   value  := register_read(PCF8523_02_CONTROL_3)                     ' Read existing register value
 *   register_write(PCF8523_02_CONTROL_3, %00000000)                   ' Enable battery low detection
 * 
 *   result := ((register_read(PCF8523_02_CONTROL_3) & %00000100) == %00000100) ' Return value true if bit 2 is set
 *   register_write(PCF8523_02_CONTROL_3, value)                       ' Write existing register value back again
 * 
 *   if (result)
 *     debug("battery low!")
 *   else
 *     debug("battery charge OK!")
 */
uint32_t rtc_battery_low() {
  uint32_t value, result;

  value = rtc_register_read(PCF8523_02_CONTROL_3);                      // Read existing register value
  rtc_register_write(PCF8523_02_CONTROL_3, 0x00);                       // Enable battery low detection

  result = ((rtc_register_read(PCF8523_02_CONTROL_3) & 0x40) == 0x40);  // Return value true if bit 2 is set
  rtc_register_write(PCF8523_02_CONTROL_3, value);                      // Write existing register value back again

  if (result) {
    debug("battery low!");
  }
  else {
    debug("battery charge OK!");
  }
  return result;
}
/* 
 * 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub sw_reset()
 * 
 *   debug("software reset")
 *   register_write(PCF8523_00_CONTROL_1, %01011000)                   ' Software reset
 * 
 */
void rtc_sw_reset() {

  debug("software reset");
  rtc_register_write(PCF8523_00_CONTROL_1, 0x58);                          // Software reset
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub set_battery_mode(mode) : result | value
 * 
 *   mode   := (mode == BATT_ENABLE ? %100 : %111)
 *   debug("setBatteryMode ", ubin(mode))
 * 
 *   value  := register_read(PCF8523_02_CONTROL_3) & %00011111      ' Read existing value, clearing the bits to override
 *   value  := value | (mode << 5)                                  ' Merge in the new value after shifing left 5 bits
 *   result := register_write_verify(PCF8523_02_CONTROL_3, value)   ' Write and verify the data, return true if OK
 * 
 */
uint32_t rtc_set_battery_mode(uint32_t mode) {
  uint32_t value;

  mode = (mode == BATT_ENABLE ? 0x4 : 0x7);
  debug_bin("setBatteryMode ", mode);

  value = rtc_register_read(PCF8523_02_CONTROL_3) & 0x1F;        // Read existing value, clearing the bits to override
  value = value | (mode << 5);                                   // Merge in the new value after shifing left 5 bits
  return rtc_register_write_verify(PCF8523_02_CONTROL_3, value); // Write and verify the data, return true if OK
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub set_clkout_freq(Hz) : result | value
 * 
 *   debug("set_clkout_freq ", ubin(Hz))
 * 
 *   value  := register_read(PCF8523_0F_TMR_CLKOUT_CTRL) & %11000111    ' Read existing value, clearing the bits to override
 *   value  := value | (Hz << 3)                                        ' Merge in the new value after shifing left 3 bits
 *   result := register_write_verify(PCF8523_0F_TMR_CLKOUT_CTRL, value) ' Write and verify the data, return true if OK
 * 
 */
uint32_t rtc_set_clkout_freq(uint32_t Hz) {
  uint32_t value = 0;

  debug_dec("set_clkout_freq ", Hz);

  value = rtc_register_read(PCF8523_0F_TMR_CLKOUT_CTRL) & 0xC7;    // Read existing value, clearing the bits to override
  value = value | (Hz << 3);                                       // Merge in the new value after shifing left 3 bits
  return rtc_register_write_verify(PCF8523_0F_TMR_CLKOUT_CTRL, value); // Write and verify the data, return true if OK
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub set_offset(value)
 * 
 *   debug("set_offset ", udec(value), ubin(value))
 *   register_write(PCF8523_0E_OFFSET, value & %01111111)               ' Ensure mode bit set to 0
 * 
 */
void rtc_set_offset(uint32_t value) {

  debug_hex_2("set_offset ", value, value & 0x7F);
  rtc_register_write(PCF8523_0E_OFFSET, value & 0x7F);                  // Ensure mode bit set to 0
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub calibrate(store_the_result) : offset | ticks, freq', pin
 * 
 *   if (ACTIVE)
 *     debug("Calibration... ")
 *   else
 *     debug("Cannot calibrate before rtc.start()")
 *     return 0
 * 
 * 
 *   '' Setup calibration frequency,
 *   '' then temporarily stop the I2C bus to allow calibration, by reading the clkout pulses on SCL
 *   set_clkout_freq(Hz_32768)                                          ' Ensure known freq for calibration
 * 
 *   repeat until oscillator_ready()                                    ' Wait for oscillator to initalise (instant if no change, or up to 2seconds)
 *   stop()                                                             ' Stop I2C bus and clear the pins
 * 
 * 
 *   '' Use the SDA internal smartpin register to count the SCL clockout pulses
 *   '' - configure the pins for action!
 *   set_pullup(SCL, P_HIGH_150K)
 * 
 * 
 *   '' count 32768 edges (y=1).
 *   '' result should be close to current P2 clkfreq; the difference being the required calibration factor
 *   pinstart(SDA, P_EVENTS_TICKS | P_MINUS1_A, 32768, 1)               ' PINSTART(PinField, Mode, Xval, Yval)
 *   repeat while not pinr(SDA)
 *   akpin(SDA)
 * 
 * 
 *   '' wait until count gets to the target, then record the ticks value (which will equate to the P2 clock edges)
 *   repeat while not pinr(SDA)
 *   ticks := rdpin(SDA)
 * 
 * 
 *   '' Calculate the offset value to be written to the RTC, based on the
 *   '' - MODE0 Eppm conversion constant & algorithm shown in the RTC datasheet.
 *   offset := round(float(clkfreq - ticks) *. 1e6 /. float(ticks) /. 4.34)
 *   debug("Calibration data ", sdec(ticks, (clkfreq-ticks), offset))
 * 
 * 
 *   '' Clear pins, then re-start the I2C bus for communication with the RTC module
 *   pinclear(SCL)
 *   pinclear(SDA)
 * 
 *   start(BASEPIN, false) ' Re-start I2C comms
 * 
 * 
 *   '' ensure offset value in range, then apply
 *   if (offset < -63) || (offset > 63)
 *     debug("Invalid offset, cannot calibrate!")
 *   else
 *     if store_the_result
 *       set_offset(offset)
 *       debug("Calibration data saved.")
 *     else
 *       debug("Calibration data NOT saved.")
 * 
 * 
 */
uint32_t rtc_calibrate(uint32_t store_the_result) {
  int32_t offset = 0;
  uint32_t ticks = 0;

  if (ACTIVE) {
    debug("Calibration... ");
  }
  else {
    debug("Cannot calibrate before rtc_start()");
    return 0;
  }

  // Setup calibration frequency,
  // then temporarily stop the I2C bus to allow calibration, by reading the clkout pulses on SCL
  rtc_set_clkout_freq(Hz_32768);                                     // Ensure known freq for calibration

  do {
  } while (!rtc_oscillator_ready());                                 // Wait for oscillator to initalise (instant if no change, or up to 2seconds)
  rtc_stop();                                                        // Stop I2C bus and clear the pins

  // Use the SDA internal smartpin register to count the SCL clockout pulses
  // - configure the pins for action!
  rtc_set_pullup(SCL, P_HIGH_150K);

  // count 32768 edges (y=1).
  // result should be close to current P2 clkfreq; the difference being the required calibration factor
  _pinstart(SDA, P_EVENTS_TICKS | P_MINUS1_A, 32768, 1);               // PINSTART(PinField, Mode, Xval, Yval)
  while (!_pinr(SDA)) {
  }
  _akpin(SDA);

  // wait until count gets to the target, then record the ticks value (which will equate to the P2 clock edges)
  while (!_pinr(SDA)) {
  }
  ticks = _rdpin(SDA);

  // Calculate the offset value to be written to the RTC, based on the
  // - MODE0 Eppm conversion constant & algorithm shown in the RTC datasheet.
  offset = lround((float)(_clockfreq() - ticks) * 1.0e6 / (float)ticks / 4.34);
  debug_dec_3("Calibration data ", ticks, _clockfreq()-ticks, offset);

  // Clear pins, then re-start the I2C bus for communication with the RTC module
  _pinclear(SCL);
  _pinclear(SDA);

  rtc_start(BASEPIN, 0); // Re-start I2C comms

  // ensure offset value in range, then apply
  if ((offset < -63) || (offset > 63)) {
    debug_dec("Invalid offset, cannot calibrate! ", offset);
  }
  else {
    if (store_the_result) {
      rtc_set_offset(offset);
      debug("Calibration data saved.");
    }
    else {
      debug("Calibration data NOT saved.");
    }
  }
  return offset;
}
/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub set_pullup(pin, value)       ' value can be any smartpin Drive-High Strength constant, ie. P_HIGH_150K
 * 
 *   pinclear(pin)
 *   wrpin(pin, value)
 *   pinhigh(pin)
 * 
 */
void rtc_set_pullup(uint32_t pin, uint32_t value) {

  // value can be any smartpin Drive-High Strength constant, ie. P_HIGH_150K

  _pinclear(pin);
  _wrpin(pin, value);
  _pinh(pin);
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub set_pulldown(pin, value)     ' value can be any smartpin Drive-Low Strength constant, ie. P_LOW_150K
 * 
 *   pinclear(pin)
 *   wrpin(pin, value)
 *   pinlow(pin)
 * 
 */
void rtc_set_pulldown(uint32_t pin, uint32_t value) {

  // value can be any smartpin Drive-High Strength constant, ie. P_HIGH_150K

  _pinclear(pin);
  _wrpin(pin, value);
  _pinl(pin);
}
/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub register_write(r, value)
 * 
 *   generic_write(r, @value, 1)
 * 
 *   debug("register_write ", uhex_byte(r, value), ubin_byte(value))
 * 
 */
void rtc_register_write(uint32_t r, uint32_t value) {

  rtc_generic_write(r, (uint8_t *)&value, 1);
  debug_hex_2("register_write ", r, value);
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub register_write_verify(r, value) : result
 * 
 *   ' Write new value to r(egister address), then read back and reply true if write operation successful.
 *   ' - Note: Assumes value stored in the device was not equal to new value!
 * 
 *   register_write(r, value)
 *   return (value == register_read(r))
 * 
 */
uint32_t rtc_register_write_verify(uint32_t r, uint32_t value) {

  // Write new value to r(egister address), then read back and reply true if write operation successful.
  // - Note: Assumes value stored in the device was not equal to new value!

  rtc_register_write(r, value);
  return (value == rtc_register_read(r));
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub register_read(r) : value
 * 
 *   generic_read(r, @value, 1)
 * 
 *   debug("register_read  ", uhex_byte(r, value), ubin_byte(value))
 * 
 */

uint32_t rtc_register_read(uint32_t r) {
  uint32_t value = 0;

  rtc_generic_read(r, (uint8_t *)&value, 1);
  debug_hex_2("register_read  ", r, value);
  return value;
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * pub day_of_week_from_date(day, month, year) : weekday | c,r,s,t,c_anchor,doomsday,anchorday
 * 
 *     '' https://en.wikipedia.org/wiki/Doomsday_rule
 *     '' 0=Sun, 1=Mon, ... 6=Sat
 * 
 *     c := year / 100
 *     r := year // 100
 *     s := r / 12
 *     t := r // 12
 *     c_anchor  := (5 * (c // 4) + 2) // 7
 *     doomsday  := (s + t + (t / 4) + c_anchor) // 7
 *     anchorday := leap_year(year) ? dooms_leap[month - 1] : dooms_noleap[month - 1]
 * 
 *     weekday   := (doomsday + day - anchorday + 7) // 7
 *     return weekday
 * 
 * dat
 *     dooms_noleap byte 3, 7, 7, 4, 2, 6, 4, 1, 5, 3, 7, 5
 *     dooms_leap   byte 4, 1, 7, 4, 2, 6, 4, 1, 5, 3, 7, 5
 * 
 */
static int dooms_noleap[] = {3, 7, 7, 4, 2, 6, 4, 1, 5, 3, 7, 5};
static int dooms_leap[]    = {4, 1, 7, 4, 2, 6, 4, 1, 5, 3, 7, 5};

uint32_t rtc_day_of_week_from_date(uint32_t day, uint32_t month, uint32_t year) {

  // https://en.wikipedia.org/wiki/Doomsday_rule
  // 0=Sun, 1=Mon, ... 6=Sat

  uint32_t weekday;
  uint32_t c, r, s, t, c_anchor, doomsday, anchorday;

  c = year / 100;
  r = year % 100;
  s = r / 12;
  t = r % 12;
  c_anchor  = (5 * (c % 4) + 2) % 7;
  doomsday  = (s + t + (t / 4) + c_anchor) % 7;
  anchorday = rtc_leap_year(year) ? dooms_leap[month - 1] : dooms_noleap[month - 1];

  weekday   = (doomsday + day - anchorday + 7) % 7;
  return weekday;
}

/* 
 * ''' ------------------------------------------------------------------------------------------------------
 * ''' Following code almost identical to published samples from JonnyMac
 * ''' ------------------------------------------------------------------------------------------------------
 */
/* 
 * pub get_seconds() : sc
 * 
 * '' Read seconds register of RTC
 * '' -- returns seconds (0..59) in decimal format
 * 
 *   generic_read(R_SC, @sc, 1)
 * 
 *   return bcd2dec(sc & %01111111) ' Mask out the Oscillator health flag
 * 
 */

uint32_t rtc_get_seconds() {

  // Read seconds register of RTC
  // -- returns seconds (0..59) in decimal format

  uint32_t sc = 0;

  rtc_generic_read(R_SC, (uint8_t *)&sc, 1);

  return rtc_bcd2dec(sc & 0x7f); // Mask out the Oscillator health flag
}

/* 
 * pub set_seconds(sc)
 * 
 * '' Write seconds register of RTC
 * '' -- sc is seconds (0..59) in decimal format
 * 
 *   sc := dec2bcd(sc // 60)
 * 
 *   generic_write(R_SC, @sc, 1)
 * 
 */

void rtc_set_seconds(uint32_t sc) {

  // Write seconds register of RTC
  // -- sc is seconds (0..59) in decimal format

  sc = rtc_dec2bcd(sc % 60);

  rtc_generic_write(R_SC, (uint8_t *)&sc, 1);
}

/* 
 * pub get_minutes() : mn
 * 
 * '' Read minutes register of RTC
 * '' -- returns minutes (0..59) in decimal format
 * 
 *   generic_read(R_MN, @mn, 1)
 * 
 *   return bcd2dec(mn)
 * 
 */

uint32_t rtc_get_minutes() {

  // Read minutes register of RTC
  // -- returns minutes (0..59) in decimal format

  uint32_t mn = 0;

  rtc_generic_read(R_MN, (uint8_t *)&mn, 1);

  return rtc_bcd2dec(mn); 
}

/* 
 * pub set_minutes(mn)
 * 
 * '' Write minutes register of RTC
 * '' -- mn is minutes (0..59) in decimal format
 * 
 *   mn := dec2bcd(mn // 60)
 * 
 *   generic_write(R_MN, @mn, 1)
 * 
 */

void rtc_set_minutes(uint32_t mn) {

  // Write minutes register of RTC
  // -- mn is minutes (0..59) in decimal format

  mn = rtc_dec2bcd(mn % 60);

  rtc_generic_write(R_MN, (uint8_t *)&mn, 1);
}

/* 
 * pub get_hours() : hr
 * 
 * '' Read hours register of RTC
 * '' -- returns hours (0..23) in decimal format
 * 
 *   generic_read(R_HR, @hr, 1)
 * 
 *   return bcd2dec(hr)
 * 
 */

uint32_t rtc_get_hours() {

  // Read hours register of RTC
  // -- returns hours (0..59) in decimal format

  uint32_t hr = 0;

  rtc_generic_read(R_HR, (uint8_t *)&hr, 1);

  return rtc_bcd2dec(hr); 
}

/* 
 * pub set_hours(hr)
 * 
 * '' Write hours register of RTC
 * '' -- hr is hours (0..23) in decimal format
 * 
 *   hr := dec2bcd(hr // 24)
 * 
 *   generic_write(R_HR, @hr, 1)
 * 
 */

void rtc_set_hours(uint32_t hr) {

  // Write hours register of RTC
  // -- hr is hours (0..59) in decimal format

  hr = rtc_dec2bcd(hr % 24);

  rtc_generic_write(R_HR, (uint8_t *)&hr, 1);
}

/* 
 * pub get_time() : sc, mn, hr | now
 * 
 * '' Returns seconds, minutes, and hours of RTC
 * '' -- values returned as demimal
 * 
 *   generic_read(R_SC, @now, 3)
 * 
 *   sc := bcd2dec(now.byte[0] & %01111111)
 *   mn := bcd2dec(now.byte[1])
 *   hr := bcd2dec(now.byte[2])
 * 
 */
void rtc_get_time(uint32_t *sc, uint32_t *mn, uint32_t *hr) {

  // Returns seconds, minutes, and hours of RTC
  // -- values returned as demimal

  uint8_t now[3] = {0, 0, 0};

  rtc_generic_read(R_SC, (uint8_t *)&now, 3);

  *sc = rtc_bcd2dec(now[0] & 0x7f);
  *mn = rtc_bcd2dec(now[1]);
  *hr = rtc_bcd2dec(now[2]);
}

/* 
 * pub read_time(p_dest) | byte sc, byte mn, byte hr
 * 
 * '' Reads seconds..hours registers to byte array at p_dest
 * '' -- values returned as demimal
 * 
 *   generic_read(R_SC, @sc, 3)
 * 
 *   byte[p_dest+0] := bcd2dec(sc)
 *   byte[p_dest+1] := bcd2dec(mn)
 *   byte[p_dest+2] := bcd2dec(hr)
 * 
 */

void rtc_read_time(uint8_t *p_dest) {

  // Reads seconds..hours registers to byte array at p_dest
  // -- values returned as demimal

  uint8_t dest[3] = {0, 0, 0};

  rtc_generic_read(R_SC, dest, 3);

  p_dest[0] = rtc_bcd2dec(dest[0]);
  p_dest[1] = rtc_bcd2dec(dest[1]);
  p_dest[2] = rtc_bcd2dec(dest[2]);
}

/* 
 * pub set_time(sc, mn, hr) | now
 * 
 * '' Write time values to RTC
 * '' -- time elements in decimal
 * 
 *   now.byte[0] := dec2bcd(sc // 60)
 *   now.byte[1] := dec2bcd(mn // 60)
 *   now.byte[2] := dec2bcd(hr // 24)
 * 
 *   generic_write(R_SC, @now, 3)
 * 
 */
void rtc_set_time(uint32_t sc, uint32_t mn, uint32_t hr) {

  // Write time values to RTC
  // -- time elements in decimal

  uint8_t now[3] = { 0, 0, 0};

  now[0] = rtc_dec2bcd(sc % 60);
  now[1] = rtc_dec2bcd(mn % 60);
  now[2] = rtc_dec2bcd(hr % 24);

  rtc_generic_write(R_SC, &now[0], 3);
}

/* 
 * pub get_weekday() : wkday
 * 
 * '' Read day of week register of RTC
 * 
 *   generic_read(R_WKDAY, @wkday, 1)
 * 
 */

uint32_t rtc_get_weekday() {

  // Read day of week register of RTC

  uint8_t wkday = 0;

  rtc_generic_read(R_WKDAY, &wkday, 1);
  return wkday;
}

/* 
 * pub set_weekday(wkday)
 * 
 * '' Write day of week register of RTC
 * '' -- wkday is 0..6 representing Sun, Mon, Tue, Wed, Thu, Fri, Sat
 * 
 *   generic_write(R_WKDAY, @wkday, 1)
 * 
 */

void rtc_set_weekday(uint32_t wkday) {

  // Write day of week register of RTC
  // -- wkday is 0..6 representing Sun, Mon, Tue, Wed, Thu, Fri, Sat

  rtc_generic_write(R_WKDAY, (uint8_t *)&wkday, 1);
}

/* 
 * pub get_date() : date
 * 
 * '' Read date (day of month) register of RTC
 * 
 *   generic_read(R_DATE, @date, 1)
 * 
 *   return bcd2dec(date)
 * 
 */

uint32_t rtc_get_date() {

  // Read day of week register of RTC

  uint8_t date = 0;

  rtc_generic_read(R_DATE, &date, 1);

  return rtc_bcd2dec(date);
}

/* 
 * pub set_date(date)
 * 
 * '' Write day of month register of RTC
 * '' -- date is 1..31 (based on month)
 * 
 *   date := dec2bcd(date)
 * 
 *   generic_write(R_DATE, @date, 1)
 * 
 */

void rtc_set_date(uint32_t date) {

  //  Write day of month register of RTC
  // -- date is 1..31 (based on month)

  date = rtc_dec2bcd(date);

  rtc_generic_write(R_DATE, (uint8_t *)&date, 1);
}

/* 
 * pub get_month() : mon
 * 
 * '' Read month register of RTC
 * 
 *   generic_read(R_MON, @mon, 1)
 * 
 *   return bcd2dec(mon)
 * 
 */

uint32_t rtc_get_month() {

  // Read month register of RTC

  uint8_t mon = 0;

  rtc_generic_read(R_MON, &mon, 1);

  return rtc_bcd2dec(mon);
}


/* 
 * pub set_month(mon)
 * 
 * '' Write day of week register of RTC
 * '' -- mon is 1..12
 * 
 *   mon := dec2bcd(mon)
 * 
 *   generic_write(R_MON, @mon, 1)
 * 
 */

void rtc_set_month(uint32_t mon) {

  // Write day of week register of RTC
  // -- mon is 1..12

  mon = rtc_dec2bcd(mon);

  rtc_generic_write(R_MON, (uint8_t *)&mon, 1);
}

/* 
 * pub get_year() : yr
 * 
 * '' Read year register of RTC
 * '' -- return 2000..2099
 * 
 *   generic_read(R_YR, @yr, 1)
 * 
 *   yr := 2000 + bcd2dec(yr)
 * 
 */

uint32_t rtc_get_year() {

  // Read year register of RTC
  // -- return 2000..2099

  uint32_t yr = 0;

  rtc_generic_read(R_YR, (uint8_t *)&yr, 1);

  yr = 2000 + rtc_bcd2dec(yr);

  return yr;
}

/* 
 * pub set_year(yr)
 * 
 * '' Write year register of RTC
 * '' -- yr is 0..99 or 2000..2099
 * 
 *   yr := dec2bcd(yr // 100)
 * 
 *   generic_write(R_YR, @yr, 1)
 * 
 */

void rtc_set_year(uint32_t yr) {

  // Write year register of RTC
  // -- yr is 0..99 or 2000..2099

  yr = rtc_dec2bcd(yr % 100);

  rtc_generic_write(R_YR, (uint8_t *)&yr, 1);
}

/* 
 * pub get_calendar() : date, mon, yr | today
 * 
 * '' Returns day of month, month, and year RTC
 * '' -- values returned as demimal
 * 
 *   generic_read(R_DATE, @today, 4)
 * 
 *   date := bcd2dec(today.byte[0])
 *   mon  := bcd2dec(today.byte[2])
 *   yr   := bcd2dec(today.byte[3]) + 2000
 * 
 */

void rtc_get_calendar(uint32_t *date, uint32_t *mon, uint32_t *yr) {

  // Returns day of month, month, and year RTC
  // -- values returned as demimal

  uint8_t today[4] = {0, 0, 0, 0};

  rtc_generic_read(R_DATE, today, 4);

  *date = rtc_bcd2dec(today[0]);
  *mon  = rtc_bcd2dec(today[2]);
  *yr   = rtc_bcd2dec(today[3]) + 2000;
}

/* 
 * pub set_calendar(date, mon, yr) | today
 * 
 * '' Write time values to RTC
 * '' -- date elements in decimal
 * 
 *   set_year(yr)
 *   set_month(mon)
 *   set_date(date)
 * 
 *   set_weekday(day_of_week_from_date(date, mon, yr))
 * 
 */

void rtc_set_calendar(uint32_t date, uint32_t mon, uint32_t yr) {

  // Write time values to RTC
  // -- date elements in decimal

  rtc_set_year(yr);
  rtc_set_month(mon);
  rtc_set_date(date);

  rtc_set_weekday(rtc_day_of_week_from_date(date, mon, yr));
}

/* 
 * dat { time a string }
 * 
 *   TimeHHMM      byte    "hh:mm",       0
 *   TimeShort     byte    "hh:mm:ss",    0
 *   TimeLong      byte    "hh:mm:ss xM", 0
 * 
 */

static char TimeHHMM[]  = "hh:mm";
static char TimeShort[] = "hh:mm:ss";
static char TimeLong[]  = "hh:mm:ss xM";

static void time2str(char *p_str, uint32_t hr, uint32_t mn, int32_t sc);

/* 
 * pub time_hhmm(hr, mn) : p_str
 * 
 * '' Returns pointer to time string in HH:MM format
 * '' -- time elements in decimal
 * 
 *   time2str(@TimeHHMM, hr, mn, -1)
 * 
 *   return @TimeHHMM
 * 
 */
char *rtc_time_hhmm(uint32_t hr, uint32_t mn) {

  // Returns pointer to time string in HH:MM format
  // -- time elements in decimal

  time2str(TimeHHMM, hr, mn, -1);

  return TimeHHMM;
}

/* 
 * pub time_24(hr, mn, sc) : p_str | now
 * 
 * '' Returns pointer to time string in 24-hr format
 * '' -- time elements in decimal
 * 
 *   time2str(@TimeShort, hr, mn, sc)
 * 
 *   return @TimeShort
 * 
 */
char *rtc_time_24(uint32_t hr, uint32_t mn, uint32_t sc) {

  // Returns pointer to time string in HH:MM format
  // -- time elements in decimal

  time2str(TimeShort, hr, mn, sc);

  return TimeShort;
}

/* 
 * pub time_12(hr, mn, sc) : p_str | now
 * 
 * '' Returns pointer to time string in 12-hr format
 * '' -- time elements in decimal
 * '' -- set sc to -1 to remove seconds from string
 * 
 *   if (hr < 12)                                                  ' set AM/PM
 *     TimeLong[9] := "A"
 *   else
 *     TimeLong[9] := "P"
 * 
 *   if (hr == 0)                                                  ' 12am?
 *     hr := 12
 *   elseif (hr > 12)                                              ' convert PM times to 12-hr
 *     hr -= 12
 * 
 *   time2str(@TimeLong, hr, mn, sc)
 * 
 *   return @TimeLong
 * 
 */
char *rtc_time_12(uint32_t hr, uint32_t mn, uint32_t sc) {

  // Returns pointer to time string in 12-hr format
  // -- time elements in decimal
  // -- set sc to -1 to remove seconds from string

  if (hr < 12) {                                                // set AM/PM
    TimeLong[9] = 'A';
  }
  else {
    TimeLong[9] = 'P';
  }
  if (hr == 0) {                                                // 12am?
    hr = 12;
  }
  else if (hr > 12) {                                           // convert PM times to 12-hr
    hr -= 12;
  }

  time2str(TimeLong, hr, mn, sc);

  return TimeLong;
}

/* 
 * pri time2str(p_str, hr, mn, sc)
 * 
 * '' Converts time elements to string
 * '' -- p_str is [pre-formatted] output string address
 * 
 *   byte[p_str+0] := "0" + (hr  / 10)
 *   byte[p_str+1] := "0" + (hr // 10)
 * 
 *   byte[p_str+3] := "0" + (mn  / 10)
 *   byte[p_str+4] := "0" + (mn // 10)
 * 
 *   if (sc < 0)
 *     return
 * 
 *   byte[p_str+6] := "0" + (sc  / 10)
 *   byte[p_str+7] := "0" + (sc // 10)
 * 
 */

static void time2str(char *p_str, uint32_t hr, uint32_t mn, int32_t sc) {

  // Converts time elements to string
  // -- p_str is [pre-formatted] output string address

  p_str[0] = '0' + (hr / 10);
  p_str[1] = '0' + (hr % 10);

  p_str[3] = '0' + (mn / 10);
  p_str[4] = '0' + (mn % 10);

  if (sc < 0) {
    return;
  }

  p_str[6] = '0' + (sc / 10);
  p_str[7] = '0' + (sc % 10);
}

/* 
 * dat { days as strings }
 * 
 *   Unknown       byte    "???", 0
 * 
 *   DayShort      byte    "SUN", 0
 *                 byte    "MON", 0
 *                 byte    "TUE", 0
 *                 byte    "WED", 0
 *                 byte    "THU", 0
 *                 byte    "FRI", 0
 *                 byte    "SAT", 0
 * 
 *   DayLong       byte    "Sunday",    0
 *                 byte    "Monday",    0
 *                 byte    "Tuesday",   0
 *                 byte    "Wednesday", 0
 *                 byte    "Thursday",  0
 *                 byte    "Friday",    0
 *                 byte    "Saturday",  0
 * 
 */
static char Unknown[]  = "???";

static char *DayShort[] = {
  "SUN",
  "MON",
  "TUE",
  "WED",
  "THU",
  "FRI",
  "SAT"
};

static char *DayLong[] = {
  "Sunday",   
  "Monday",   
  "Tuesday",  
  "Wednesday",
  "Thursday", 
  "Friday",   
  "Saturday"
};

/* 
 * pub day_name_short(dow) : p_str
 * 
 * '' Return pointer to short name of day
 * 
 *   if (dow < 0) || (dow > 6)
 *     return @Unknown
 * 
 *   return @DayShort + ((dow) << 2)
 * 
 */

char *rtc_day_name_short(uint32_t dow) {

  // Return pointer to short name of day

  if (dow > 6) {
    return Unknown;
  }
  return DayShort[dow];
}

/* 
 * pub day_name_long(dow) : p_str
 * 
 * '' Return pointer to long name of day
 * 
 *   if (dow < 0) || (dow > 6)
 *     return @Unknown
 * 
 *   p_str := @DayLong                                             ' point to names list
 * 
 *   repeat while (dow > 0)
 *     p_str += strsize(p_str)+1                                   ' skip ahead to next
 *     dow -= 1
 * 
 */

char *rtc_day_name_long(uint32_t dow) {

  // Return pointer to long name of day

  if (dow > 6) {
    return Unknown;
  }
  return DayLong[dow];
}

/* 
 * dat { month as string }
 * 
 *   MonthShort    byte    "JAN", 0
 *                 byte    "FEB", 0
 *                 byte    "MAR", 0
 *                 byte    "APR", 0
 *                 byte    "MAY", 0
 *                 byte    "JUN", 0
 *                 byte    "JUL", 0
 *                 byte    "AUG", 0
 *                 byte    "SEP", 0
 *                 byte    "OCT", 0
 *                 byte    "NOV", 0
 *                 byte    "DEC", 0
 * 
 *   MonthLong     byte    "January",   0
 *                 byte    "February",  0
 *                 byte    "March",     0
 *                 byte    "April",     0
 *                 byte    "May",       0
 *                 byte    "June",      0
 *                 byte    "July",      0
 *                 byte    "August",    0
 *                 byte    "September", 0
 *                 byte    "October",   0
 *                 byte    "November",  0
 *                 byte    "December",  0
 * 
 */
static char *MonthShort[] = {
  "JAN", 
  "FEB",
  "MAR",
  "APR",
  "MAY",
  "JUN",
  "JUL",
  "AUG",
  "SEP",
  "OCT",
  "NOV",
  "DEC"
};

static char *MonthLong[] = {
  "January", 
  "February",
  "March",   
  "April",   
  "May",     
  "June",    
  "July",    
  "August",  
  "September"
  "October", 
  "November",
  "December"
};

/* 
 * pub month_name_short(mon) : p_str
 * 
 * '' Return pointer to short name of month
 * 
 *   if (mon < 1) || (mon > 12)
 *     return @Unknown
 * 
 *   return @MonthShort + ((mon-1) << 2)
 * 
 */

char *rtc_month_name_short(uint32_t mon) {

  // Return pointer to short name of month

  if ((mon < 1) || (mon > 12)) {
    return Unknown;
  }

  return MonthShort[mon-1];
}

/* 
 * pub month_name_long(mon) : p_str
 * 
 * '' Return pointer to long name of month
 * 
 *   if (mon < 1) || (mon > 12)
 *     return @Unknown
 * 
 *   p_str := @MonthLong                                           ' point to names list
 *   mon -= 1                                                      ' correct 0 index
 * 
 *   repeat while (mon > 0)
 *     p_str += strsize(p_str)+1                                   ' skip ahead to next
 *     mon -= 1
 */
char *rtc_month_name_long(uint32_t mon) {

  // Return pointer to long name of month

  if ((mon < 1) || (mon > 12)) {
    return Unknown;
  }

  return MonthLong[mon-1];
}

/* dat { calendar as string }
 * 
 *   CalShort      byte    "dd mmm 20yy", 0
 * 
 */

static char CalShort[] = "dd mmm 20yy";

/* 
 * pub calendar(date, mon, yr) : p_str
 * 
 * '' Convert date elements to formatted string
 * '' -- caution: does not qualify values
 * 
 *   CalShort[00] := "0" + (date  / 10)
 *   CalShort[01] := "0" + (date // 10)
 * 
 *   bytemove(@CalShort[3], @MonthShort[(mon-1)<<2], 3)
 * 
 *   yr //= 100                                                    ' remove century
 *   CalShort[09] := "0" + (yr  / 10)
 *   CalShort[10] := "0" + (yr // 10)
 * 
 *   return @CalShort
 * 
 */

char *rtc_calendar(uint32_t date, uint32_t mon, uint32_t yr) {

  // Convert date elements to formatted string
  // -- caution: does not qualify values

  CalShort[00] = '0' + (date / 10);
  CalShort[01] = '0' + (date % 10);

  
  memmove(&CalShort[3], MonthShort[mon-1], 3);

  yr %= 100;                                                       // remove century
  CalShort[ 9] = '0' + (yr / 10);
  CalShort[10] = '0' + (yr % 10);

  return CalShort;
}

/* 
 * con { utilities }
 * 
 * dat { days in month }
 * 
 *   DaysInMonth   byte    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
 * 
 */

static DaysInMonth[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

/* 
 * pub days_in_month(mon, yr) : days
 * 
 * '' Returns days in month for given year
 * '' -- set year to -1 to ignore leap year
 * 
 *   if (mon < 1) || (mon > 12)
 *     return 0
 *   elseif (mon == 2)
 *     return leap_year(yr) ? 29 : 28
 *   else
 *     return DaysInMonth[mon-1]
 * 
 */

uint32_t rtc_days_in_month(mon, yr) {

  // Returns days in month for given year
  // -- set year to -1 to ignore leap year

  if ((mon < 1) || (mon > 12)) {
    return 0;
  }
  else if (mon == 2) {
    return (rtc_leap_year(yr) ? 29 : 28);
  }
  else {
    return DaysInMonth[mon-1];
  }
}

/* 
 * pub day_number(date, mon, yr) : n | idx
 * 
 * '' Returns calendar date as a number 1..365 (366 in leap years)
 * 
 *   if (mon == 1)
 *     return date
 *   elseif (mon == 2)
 *     return 31 + date
 *   else
 *     DaysInMonth[1] := leap_year(yr) ? 29 : 28                  ' update Feb for leap year
 *     repeat idx from 0 to mon-2                                 ' accumulate preceding months
 *       n += DaysInMonth[idx]
 *     n += date                                                  ' days in this month
 * 
 */

uint32_t rtc_day_number(uint32_t date, uint32_t mon, uint32_t yr) {

  // Returns calendar date as a number 1..365 (366 in leap years)

  uint32_t n = 0;
  uint32_t idx;

  if (mon == 1) {
    return date;
  }
  else if (mon == 2) {
    return 31 + date;
  }
  else {
    DaysInMonth[1] = (rtc_leap_year(yr) ? 29 : 28);            // update Feb for leap year
    for (idx = 0; idx <= mon-2; idx++) {                       // accumulate preceding months
      n += DaysInMonth[idx];
    }
    n += date;                                                 // days in this month
  }
  return n;
}

/* 
 * pub calendar_from_day_number(n, yr) : date, mon | check
 * 
 * '' Returns date (1..31) and month for day number in year
 * 
 *   DaysInMonth[1] := leap_year(yr) ? 29 : 28                     ' update Feb for leap year
 * 
 *   repeat while (n > DaysInMonth[mon])
 *     n -= DaysInMonth[mon++]
 * 
 *   ++mon                                                         ' fix month from z-index
 *   date := n
 * 
 */
void rtc_calendar_from_day_number(uint32_t n, uint32_t yr, uint32_t *date, uint32_t *mon) {

  // Returns date (1..31) and month for day number in year

  mon = 0;
  DaysInMonth[1] = (rtc_leap_year(yr) ? 29 : 28);                  // update Feb for leap year

  while (n > DaysInMonth[*mon]) {
    n -= DaysInMonth[(*mon)++];
  }

  ++(*mon);                                                        // fix month from z-index
  *date = n;
}

/* 
 * pub leap_year(yr) : result
 * 
 * '' Returns true if yr is a leap year
 * 
 *   if (yr // 400 == 0)
 *     return true
 * 
 *   if (yr // 100 == 0)
 *     return false
 * 
 *   if (yr // 4 == 0)
 *     return true
 * 
 */

uint32_t rtc_leap_year(uint32_t yr) {

  // Returns true if yr is a leap year

  if (yr % 400 == 0) {
    return 1;
   }

  if (yr % 100 == 0) {
    return 0;
  }

  if (yr % 4 == 0) {
    return 1;
  }
  return 0;
}

/* 
 * pub bcd2dec(bcd) : result
 * 
 *   return ((bcd >> 4) * 10) + (bcd & $0F)
 * 
 */

uint32_t rtc_bcd2dec(uint32_t bcd) {

  return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

/* 
 * pub dec2bcd(dec) : result
 * 
 *   return ((dec / 10) << 4) | (dec // 10)
 * 
 */

uint32_t rtc_dec2bcd(uint32_t dec) {

  return ((dec / 10) << 4) | (dec % 10);
}

/* 
 * pub generic_write(r, p_buf, len)
 * 
 * '' Write block of registers from p_buf to RTC
 * '' -- r is first register
 * '' -- p_buf is pointer to source bytes
 * '' -- len is number of registers to write
 * 
 *   i2c.start()
 *   i2c.write(PCF8523_WR)
 *   i2c.write(r)
 *   i2c.wr_block(p_buf, len)
 *   i2c.stop()
 * 
 */

void rtc_generic_write(uint32_t r, uint8_t *p_buf, uint32_t len) {

  // Write block of registers from p_buf to RTC
  // -- r is first register
  // -- p_buf is pointer to source bytes
  // -- len is number of registers to write

  i2c_start();
  i2c_write(PCF8523_WR);
  i2c_write(r);
  i2c_wr_block(p_buf, len);
  i2c_stop();
}

/* 
 * pub generic_read(r, p_buf, len)
 * 
 * '' Read block of registers from RTC to p_buf
 * '' -- r is first register
 * '' -- p_buf is pointer to destination bytes
 * '' -- len is number of registers to read
 * 
 *   i2c.start()
 *   i2c.write(PCF8523_WR)
 *   i2c.write(r)
 *   i2c.start()
 *   i2c.write(PCF8523_RD)
 *   i2c.rd_block(p_buf, len, i2c.NAK)
 *   i2c.stop()
 * 
 */

void rtc_generic_read(uint32_t r, uint8_t *p_buf, uint32_t len) {

  // Read block of registers from RTC to p_buf
  // -- r is first register
  // -- p_buf is pointer to destination bytes
  // -- len is number of registers to read

  i2c_start();
  i2c_write(PCF8523_WR);
  i2c_write(r);
  i2c_start();
  i2c_write(PCF8523_RD);
  i2c_rd_block(p_buf, len, NAK);
  i2c_stop();
}

/* 
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
