#ifndef __I2C_H
#define __I2C_H

/*
 * declare constants and functions exported from i2c.c
 *
 * The "i2c_" prefix is added because the rtc driver which uses
 * these functions also uses some of the same names.
 */

enum { PU_NONE, PU_1K5, PU_3K3, PU_15K };

enum { ACK, NAK };

void     i2c_setup(uint32_t scl, uint32_t sda, uint32_t khz, uint32_t pullup);

void     i2c_start();

void     i2c_stop();

uint32_t i2c_present(uint32_t devid);

void     i2c_wait(uint32_t devid);

uint32_t i2c_write(uint8_t i2cbyte);

uint32_t i2c_wr_block(uint8_t *p_block, uint32_t count);

uint8_t  i2c_read(uint32_t ackbit);

void     i2c_rd_block(uint8_t *p_block, uint32_t count, uint32_t ackbit);

#endif 
