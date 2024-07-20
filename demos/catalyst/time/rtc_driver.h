#ifndef __RTC_DRIVER_H
#define __RTC_DRIVER_H

#include "i2c_driver.h"

/*
 * declare constants and functions exported from rtc_driver.c
 *
 * The "rtc_" prefix is added because the i2c driver which this
 * rtc driver uses also uses some of the same names.
 */

// rtc module pin offsets
enum {  P_SCL, P_SDA };

// CLKOUT frequency options (Hz)
enum { Hz_32768, Hz_16384, Hz_8192, Hz_4096, Hz_1024, Hz_32, Hz_1, Hz_0 };


// Battery backup options (Note: If disabled the RTC memory will be lost 
// when powered down. Enabled by default.)
enum { BATT_ENABLE, BATT_DISABLE };

// Power State options
enum { STATE_OFF, STATE_ON };

uint32_t rtc_start(uint32_t _basepin, uint32_t _calibrate);

void     rtc_stop();

uint32_t rtc_present();

uint32_t rtc_oscillator_ready();

uint32_t rtc_battery_low();

void     rtc_sw_reset();

uint32_t rtc_set_battery_mode(uint32_t mode);

uint32_t rtc_set_clkout_freq(uint32_t Hz);

void     rtc_set_offset(uint32_t value);

uint32_t rtc_calibrate(uint32_t store_the_result);

void     rtc_set_pullup(uint32_t pin, uint32_t value);

void     rtc_set_pulldown(uint32_t pin, uint32_t value);

void     rtc_register_write(uint32_t r, uint32_t value);

uint32_t rtc_register_write_verify(uint32_t r, uint32_t value);

uint32_t rtc_register_read(uint32_t r);

uint32_t rtc_leap_year(uint32_t yr);

uint32_t rtc_get_seconds();

void     rtc_set_seconds(uint32_t sc);

uint32_t rtc_get_minutes();

void     rtc_set_minutes(uint32_t mn);

void     rtc_set_hours(uint32_t hr);

uint32_t rtc_get_hours();

void     rtc_read_time(uint8_t *p_dest);

void     rtc_set_time(uint32_t sc, uint32_t mn, uint32_t hr);

uint32_t rtc_get_weekday();

void     rtc_set_weekday(uint32_t wkday);

uint32_t rtc_get_date();

uint32_t rtc_get_month();

void rtc_set_month(uint32_t mon);

void     rtc_set_date(uint32_t date);

uint32_t rtc_dec2bcd(uint32_t dec);

uint32_t rtc_bcd2dec(uint32_t bcd);

uint32_t rtc_get_year();

void     rtc_set_year(uint32_t yr);

char *   rtc_day_name_short(uint32_t dow);

char *   rtc_day_name_long(uint32_t dow);

char *   rtc_time_hhmm(uint32_t hr, uint32_t mn);

char *   rtc_time_24(uint32_t hr, uint32_t mn, uint32_t sc);

char *   rtc_time_12(uint32_t hr, uint32_t mn, uint32_t sc);

void     rtc_generic_write(uint32_t r, uint8_t *p_buf, uint32_t len);

void     rtc_generic_read(uint32_t r, uint8_t *p_buf, uint32_t len);

#endif
