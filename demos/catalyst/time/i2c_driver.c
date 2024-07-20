/*
 * Translated from Spin2 to C by Ross Higson. The Spin2 code has been left 
 * intact to demonstrate how inline Spin2 PASM can be translated into inline
 * C PASM, mostly line for line.
 *
 * The main thing to note is that Spin2 inline PASM is best converted to 
 * C inline PASM using a C function, because this makes it very easy to 
 * access up to four C variables using the _PASM() macro to identify the
 * register they are stored in - if the inline PASM needs to access more 
 * than four C variables, then they will be passed on the stack, and the 
 * RI and BC registers can be used to perform any necessary calculations.
 *
 * The "i2c_" prefix is added because the rtc driver which uses these 
 * functions also uses some of the same names.
 */

#include <stdint.h>
#include <propeller2.h>
#include <smartpins.h>

#include "i2c_driver.h"

#define I2C_DEBUG 0 // set ITC_DEBUG to 1 to display debug messages

/*
 * '' =================================================================================================
 * ''
 * ''   File....... jm_i2c.spin2
 * ''   Purpose.... Low-level I2C routines for the P2
 * ''   Author..... Jon "JonnyMac" McPhalen
 * ''               Copyright (c) 2020 Jon McPhalen
 * ''               -- see below for terms of use
 * ''   E-mail..... jon.mcphalen@gmail.com
 * ''   Started....
 * ''   Updated.... 28 SEP 2020
 * ''
 * '' =================================================================================================
 * 
 * ' Note: The pin modes drive the high output through a resistor; this simulates the use of a pull-up
 * '       on the pin.
 * '
 * ' Note: Support for clock-stretching removed due to lack of use in nearly all devices
 * 
 */

// we use P2 NATIVE inline PASM, so make sure this is compiled a P2 NATIVE program!
#if !defined(__CATALINA_NATIVE) || !defined(__CATALINA_P2) 
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 IN NATIVE MODE
#endif

static void debug (char *str) {
#if I2C_DEBUG
  printf("%s\n", str);
#endif
}


/*
 * con { fixed io pins }
 * 
 * RX1      = 63  { I }                                          ' programming / debug
 * TX1      = 62  { O }
 * 
 * SF_CS    = 61  { O }                                          ' serial flash
 * SF_SCK   = 60  { O }
 * SF_SDO   = 59  { O }
 * SF_SDI   = 58  { I }
 * 
 *
 */

// the above constants are not used, so no C equivalent required

/*
 * con
 *
 *  #0, PU_NONE, PU_1K5, PU_3K3, PU_15K                           ' pull-up options
 *  #0, ACK, NAK
 */

// see i2c.h

/* var
 *
 *  long  sclpin                                                  ' i2c bus pins
 *  long  sdapin
 *  long  clktix                                                  ' system ticks in 1/4 period
 *
 */

static uint32_t sclpin;                                           // i2c bus pins
static uint32_t sdapin;
static uint32_t clktix;                                           // system ticks in 1/4 period

/*
 * pub null()
 *
 * '' This is not a top-level object
 */

 // there is no need for the null function in C

/*
 * pub setup(scl, sda, khz, pullup) | tix
 * 
 * '' Define I2C SCL (clock) and SDA (data) pins
 * '' -- khz is bus frequency: 100 (standard), 400 (full), 1000 (fast)
 * ''    * circuit/connections will affect maximum bus speed
 * '' -- pullup controls high level drive configuration of SCL and SDA
 * 
 *   longmove(@sclpin, @scl, 2)                                    ' copy pins
 *   clktix := tix := (clkfreq / (khz * 1_000)) >> 2               ' calculate ticks in 1/4 period
 * 
 *   case pullup
 *     PU_NONE : pullup := P_HIGH_FLOAT                            ' use external pull-up
 *     PU_1K5  : pullup := P_HIGH_1K5                              ' 1.5k
 *     PU_3K3  : pullup := P_HIGH_1MA                              ' acts like ~3.3k
 *     other   : pullup := P_HIGH_15K                              ' 15K
 * 
 *   org
 *                 fltl      scl                                   ' clear old smart pin setup
 *                 fltl      sda
 *                 wrpin     pullup, scl                           ' configure high drive
 *                 wrpin     pullup, sda
 *                 drvh      scl                                   ' both high
 *                 drvh      sda
 *                 waitx     tix
 *                 waitx     tix
 *
 *                 rep       #8, #9                                ' bus clear (if SDA stuck low)
 *                  testp    sda                           wc      ' sample sda
 *     if_c         jmp      #.done                                ' abort loop if sda == 1
 *                  drvl     scl                                   ' scl low
 *                  waitx    tix
 *                  waitx    tix
 *                  drvh     scl                                   ' scl high
 *                  waitx    tix
 *                  waitx    tix
 *.done
 *  end
 */

static void setup_PASM(uint32_t scl, uint32_t sda, uint32_t tix, uint32_t pullup) {
  PASM(
    "              fltl      _PASM(scl)                            ' clear old smart pin setup \n"
    "              fltl      _PASM(sda) \n"
    "              wrpin     _PASM(pullup), _PASM(scl)             ' configure high drive \n" 
    "              wrpin     _PASM(pullup), _PASM(sda) \n"
    "              drvh      _PASM(scl)                            ' both high \n"
    "              drvh      _PASM(sda) \n"
    "              waitx     _PASM(tix) \n"
    "              waitx     _PASM(tix) \n"

    "              rep       #8, #9                                ' bus clear (if SDA stuck low) \n"
    "               testp    _PASM(sda)                    wc      ' sample sda \n"
    "    if_c       jmp      #.done                                ' abort loop if sda == 1 \n"
    "               drvl     _PASM(scl)                            ' scl low \n"
    "               waitx    _PASM(tix) \n"
    "               waitx    _PASM(tix) \n"
    "               drvh     _PASM(scl)                            ' scl high \n"
    "               waitx    _PASM(tix) \n"
    "               waitx    _PASM(tix) \n"
    ".done \n"
  );
}

void i2c_setup(uint32_t scl, uint32_t sda, uint32_t khz, uint32_t pullup) {
  // Define I2C SCL (clock) and SDA (data) pins
  // -- khz is bus frequency: 100 (standard), 400 (full), 1000 (fast)
  //    * circuit/connections will affect maximum bus speed
  // -- pullup controls high level drive configuration of SCL and SDA

  uint32_t tix;

  sclpin = scl; // copy pins
  sdapin = sda; // copy pins
  clktix = tix = (_clockfreq() / (khz * 1000)) >> 2; // calculate ticks in 1/4 period

  switch (pullup) {
    case PU_NONE : pullup = P_HIGH_FLOAT; break; // use external pull-up
    case PU_1K5  : pullup = P_HIGH_1K5; break;   // 1.5k
    case PU_3K3  : pullup = P_HIGH_1MA; break;   // acts like ~3.3k
    default      : pullup = P_HIGH_15K; break;   // 15K
  }

  setup_PASM(scl, sda, tix, pullup);
}

/*
 * pub present(devid) : result
 *
 *'' Pings device, returns true if device on bus.
 *
 *  start()
 *
 *  result := (write(devid) == ACK)
 */

uint32_t i2c_present(uint32_t devid) {
  // Pings device, returns true if device on bus.
  i2c_start();
  return (i2c_write(devid) == ACK);
}

/*
 * pub wait(devid) | ackbit
 * 
 * '' Waits for device to be ready for new command.
 * '' -- Note: Use present() to detect device before using wait()
 * 
 *   repeat
 *     start()
 *     ackbit := write(devid)
 *   until (ackbit == ACK)
 */

void i2c_wait(uint32_t devid) {
  uint32_t ackbit;

  do {
    i2c_start();
    ackbit = i2c_write(devid);
  } while (ackbit != ACK);
}

/*
 * pub start() | scl, sda, tix
 *
 *'' Create I2C start sequence
 *'' -- will wait if I2C bus SCL pin is held low
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *                drvh      sda                                   ' both high
 *                drvh      scl
 *                waitx     tix
 *
 *                drvl      sda                                   ' start sequence
 *                waitx     tix
 *
 *                drvl      scl
 *                waitx     tix
 *  end
 *
 */

static void start_PASM(uint32_t scl, uint32_t sda, uint32_t tix) {
  PASM(
    "             drvh      _PASM(sda)                            ' both high\n"
    "             drvh      _PASM(scl) \n"
    "             waitx     _PASM(tix) \n"

    "             drvl      _PASM(sda)                            ' start sequence\n"
    "             waitx     _PASM(tix) \n"

    "             drvl      _PASM(scl) \n"
    "             waitx     _PASM(tix) \n"
  );
}

void i2c_start() {
  // Create I2C start sequence
  // -- will wait if I2C bus SCL pin is held low
  start_PASM(sclpin, sdapin, clktix);
}

/*
 *pub write(i2cbyte) : ackbit | scl, sda, tix
 *
 *'' Write byte to I2C bus
 *'' -- leaves SCL low
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *                shl       i2cbyte, #24                          ' align i2cbyte.[7] to i2cbyte.[31]
 *
 *.wr_byte        rep       #8, #8                                ' output 8 bits, msbfirst
 *                 shl      i2cbyte, #1                   wc      ' msb --> c
 *                 drvc     sda                                   ' c -- sda
 *                 waitx    tix                                   ' let sda settle
 *                 drvh     scl                                   ' scl high
 *                 waitx    tix
 *                 waitx    tix
 *                 drvl     scl                                   ' scl low
 *                 waitx    tix
 *
 *.get_ack        drvh      sda                                   ' pull-up sda
 *                waitx     tix
 *                drvh      scl                                   ' scl high
 *                waitx     tix
 *                testp     sda                           wc      ' sample sda (ack bit)
 *                muxc      ackbit, #1                            ' update return value
 *                waitx     tix
 *                drvl      scl                                   ' scl low
 *                waitx     tix
 *                waitx     tix
 *  end
 *
 */

static uint32_t write_PASM(uint32_t scl, uint32_t sda, uint32_t tix, uint8_t i2cbyte) {
  // note use of r0 to return a value, so we initialize it
  return PASM(
    "            mov       r0, #0                                ' explicitly initialize r0 \n"
    "            shl       _PASM(i2cbyte), #24                   ' align i2cbyte.[7] to i2cbyte.[31] \n"
 
    " .wr_byte   rep       #8, #8                                ' output 8 bits, msbfirst \n"
    "             shl      _PASM(i2cbyte), #1            wc      ' msb --> c \n"
    "             drvc     _PASM(sda)                            ' c -- sda \n"
    "             waitx    _PASM(tix)                            ' let sda settle \n"
    "             drvh     _PASM(scl)                            ' scl high \n"
    "             waitx    _PASM(tix) \n"
    "             waitx    _PASM(tix) \n"
    "             drvl     _PASM(scl)                            ' scl low \n"
    "             waitx    _PASM(tix) \n"
 
    " .get_ack   drvh      _PASM(sda)                            ' pull-up sda \n"
    "            waitx     _PASM(tix) \n"
    "            drvh      _PASM(scl)                            ' scl high \n"
    "            waitx     _PASM(tix) \n"
    "            testp     _PASM(sda)                    wc      ' sample sda (ack bit) \n"
    "            muxc      r0, #1                            ' update return value \n"
    "            waitx     _PASM(tix) \n"
    "            drvl      _PASM(scl)                            ' scl low \n"
    "            waitx     _PASM(tix) \n"
    "            waitx     _PASM(tix) \n"
  );
}

uint32_t i2c_write(uint8_t i2cbyte) {
  // Write byte to I2C bus
  // -- leaves SCL low
  return write_PASM(sclpin, sdapin, clktix, i2cbyte);
}

/*
 *pub wr_block(p_block, count) : ackbit | scl, sda, tix, i2cbyte
 *
 *'' Write count bytes from p_block to I2C bus
 *'' -- p_block is pointer to bytes
 *'' -- leaves SCL low
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *.get_byte       rdbyte    i2cbyte, p_block                      ' read byte from block
 *                add       p_block, #1                           ' increment block pointer
 *                shl       i2cbyte, #24                          ' align i2cbyte.[7] to i2cbyte.[31]
 *
 *.wr_byte        rep       #8, #8                                ' output 8 bits, msbfirst
 *                 shl      i2cbyte, #1                   wc      ' msb --> c
 *                 drvc     sda                                   ' c -- sda
 *                 waitx    tix                                   ' let sda settle
 *                 drvh     scl                                   ' scl high
 *                 waitx    tix
 *                 waitx    tix
 *                 drvl     scl                                   ' scl low
 *                 waitx    tix
 *
 *.get_ack        drvh      sda                                   ' pull-up sda
 *                waitx     tix
 *                drvh      scl                                   ' scl high
 *                waitx     tix
 *                testp     sda                           wc      ' sample sda (ack bit)
 *    if_c        or        ackbit, #1                            ' update return value
 *                waitx     tix
 *                drvl      scl                                   ' scl low
 *                waitx     tix
 *                waitx     tix
 *
 *                djnz      count, #.get_byte
 *  end
 *
 */

static uint32_t wr_block_PASM(uint8_t *p_block, uint32_t scl, uint32_t sda, uint32_t tix, uint32_t count) {
  // note that we can only pass 4 parameters in registers, so we make 
  // p_block the first parameter - it will be passed on the stack, and 
  // the value returned by _PASM() will be the offset from the frame 
  // pointer (FP) - we modify the code to use it appropriately. We can 
  // use BC and RI for the calculations.
  //
  // note the use of r1 as i2cbyte, which we initialize
  // note the use of r0 as ackbit, which we initialize
  //
  return PASM(
    "             mov       r0, #0                                ' initialize r0\n"                            
    "             mov       r1, #0                                ' initialize r0\n"                            
    ".get_byte    mov       RI, FP                                ' calculate ... \n"
    "             add       RI, #_PASM(p_block)                   ' ... address of block pointer \n"
    "             rdlong    BC, RI                                ' read block pointer \n"
    ".            rdbyte    r1, BC                                ' read byte from block \n"
    "             add       BC, #1                                ' increment block pointer \n"
    "             wrlong    BC, RI                                ' save block pointer \n"
    "             shl       r1, #24                               ' align i2cbyte.[7] to i2cbyte.[31] \n"

    ".wr_byte     rep       #8, #8                                ' output 8 bits, msbfirst \n"
    "              shl      r1, #1                        wc      ' msb --> c \n"
    "              drvc     _PASM(sda)                            ' c -- sda \n"
    "              waitx    _PASM(tix)                            ' let sda settle \n"
    "              drvh     _PASM(scl)                            ' scl high \n"
    "              waitx    _PASM(tix) \n"
    "              waitx    _PASM(tix) \n"
    "              drvl     _PASM(scl)                            ' scl low \n"
    "              waitx    _PASM(tix) \n"

    ".get_ack     drvh      _PASM(sda)                            ' pull-up sda \n"
    "             waitx     _PASM(tix) \n"
    "             drvh      _PASM(scl)                            ' scl high \n"
    "             waitx     _PASM(tix) \n"
    "             testp     _PASM(sda)                    wc      ' sample sda (ack bit) \n"
    "    if_c     or        r0, #1                                ' update return value \n"
    "             waitx     _PASM(tix) \n"
    "             drvl      _PASM(scl)                            ' scl low \n"
    "             waitx     _PASM(tix) \n"
    "             waitx     _PASM(tix) \n"

    "             djnz      _PASM(count), #.get_byte \n"
  );
}

uint32_t i2c_wr_block(uint8_t *p_block, uint32_t count) {
  // Write count bytes from p_block to I2C bus
  // -- p_block is pointer to bytes
  // -- leaves SCL low
  return wr_block_PASM( p_block, sclpin, sdapin, clktix, count);
}

/*
 *pub read(ackbit) : i2cbyte | scl, sda, tix
 *
 *'' Read byte from I2C bus
 *'' -- ackbit is state of ack bit
 *''    * usually NAK for last byte read
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *                drvh      sda                                   ' pull-up sda
 *
 *.rd_byte        rep       #9, #8                                ' read 8 bits, msb first
 *                 waitx    tix
 *                 drvh     scl                                   ' scl high
 *                 waitx    tix
 *                 testp    sda                           wc      ' sample sda
 *                 shl      i2cbyte, #1                           ' make room for new bit
 *                 muxc     i2cbyte, #1                           ' sda --> i2cbyte.[0]
 *                 waitx    tix
 *                 drvl     scl                                   ' scl low
 *                 waitx    tix
 *
 *.put_ack        testb     ackbit, #0                    wc      ' ackbit.[0] --> c
 *                drvc      sda                                   ' c --> sda
 *                waitx     tix                                   ' let sda settle
 *                drvh      scl                                   ' scl high
 *                waitx     tix
 *                waitx     tix
 *                drvl      scl                                   ' scl low
 *                waitx     tix
 *                waitx     tix
 *  end
 *
 */

static uint8_t read_PASM(uint32_t scl, uint32_t sda, uint32_t tix, uint32_t ackbit) {
  // note use of r0 to return a value, so we initialize it
  return PASM(
    "             mov       r0, #0                                ' initialize r0 \n"                            
    "             drvh      _PASM(sda)                            ' pull-up sda \n "
 
    ".rd_byte     rep       #9, #8                                ' read 8 bits, msb first \n "
    "              waitx    _PASM(tix) \n "
    "              drvh     _PASM(scl)                            ' scl high \n "
    "              waitx    _PASM(tix) \n "
    "              testp    _PASM(sda)                    wc      ' sample sda \n "
    "              shl      r0, #1                                ' make room for new bit \n "
    "              muxc     r0, #1                                ' sda --> i2cbyte.[0] \n "
    "              waitx    _PASM(tix) \n "
    "              drvl     _PASM(scl)                            ' scl low \n "
    "              waitx    _PASM(tix) \n "

    ".put_ack     testb     _PASM(ackbit), #0             wc      ' ackbit.[0] --> c \n "
    "             drvc      _PASM(sda)                            ' c --> sda \n "
    "             waitx     _PASM(tix)                            ' let sda settle \n "
    "             drvh      _PASM(scl)                            ' scl high \n "
    "             waitx     _PASM(tix) \n "
    "             waitx     _PASM(tix) \n "
    "             drvl      _PASM(scl)                            ' scl low \n "
    "             waitx     _PASM(tix) \n "
    "             waitx     _PASM(tix) \n "
  );
}

uint8_t i2c_read(uint32_t ackbit) {
  // Read byte from I2C bus
  // -- ackbit is state of ack bit
  //    * usually NAK for last byte read
  return read_PASM(sclpin, sdapin, clktix, ackbit); 
}

/*
 *pub rd_block(p_block, count, ackbit) | i2cbyte, scl, sda, tix
 *
 *'' Read count bytes from I2C bus
 *'' -- p_block is pointer to storage location for bytes
 *'' -- ackbit is state of ack for final byte read
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *.rd_block       drvh      sda                                   ' pull-up sda
 *                mov       i2cbyte, #0                           ' clear workspace
 *
 *.rd_byte        rep       #9, #8                                ' read 8 bits, msb first
 *                 waitx    tix
 *                 drvh     scl                                   ' scl high
 *                 waitx    tix
 *                 testp    sda                           wc      ' sample sda
 *                 shl      i2cbyte, #1                           ' make room for new bit
 *                 muxc     i2cbyte, #1                           ' sda --> i2cbyte.[0]
 *                 waitx    tix
 *                 drvl     scl                                   ' scl low
 *                 waitx    tix
 *
 *.put_ack        cmp       count, #1                     wz      ' last byte?
 *    if_nz       drvl      sda                                   ' 0 --> sda (ack) if not last byte
 *    if_z        testb     ackbit, #0                    wc      ' last byte, ackbit.[0] --> c
 *    if_z        drvc      sda                                   ' last byte, c --> sda
 *                waitx     tix                                   ' let sda settle
 *                drvh      scl                                   ' scl high
 *                waitx     tix
 *                waitx     tix
 *                drvl      scl                                   ' scl low
 *                waitx     tix
 *                waitx     tix
 *
 *.put_byte       wrbyte    i2cbyte, p_block                      ' write byte to block
 *                add       p_block, #1                           ' increment block pointer
 *
 *                djnz      count, #.rd_block
 *  end
 *
 */

static void rd_block_PASM(uint8_t *p_block, uint32_t count, uint32_t scl, uint32_t sda, uint32_t tix, uint32_t ackbit) {
  // note that we can only pass 4 parameters in registers, so we make 
  // p_block and count the first two parameters, which means they will 
  // be passed on the stack, and the value returned by _PASM() will be 
  // the offset from the frame pointer (FP) - we modify the code to use 
  // these appropriately. We can use BC and RI for the calculations.
  //
  // note the use of r1 as i2cbyte
  PASM(
    ".rd_block    drvh      _PASM(sda)                            ' pull-up sda \n"
    "             mov       r1, #0                                ' clear workspace \n"
 
    ".rd_byte     rep       #9, #8                                ' read 8 bits, msb first \n"
    "              waitx    _PASM(tix) \n"
    "              drvh     _PASM(scl)                            ' scl high \n"
    "              waitx    _PASM(tix) \n"
    "              testp    _PASM(sda)                    wc      ' sample sda \n"
    "              shl      r1, #1                                ' make room for new bit \n"
    "              muxc     r1, #1                                ' sda --> i2cbyte.[0] \n"
    "              waitx    _PASM(tix) \n"
    "              drvl     _PASM(scl)                            ' scl low \n"
    "              waitx    _PASM(tix) \n"
  
    ".put_ack     mov       RI, FP                                ' calculate address ... \n"
    "             add       RI, #_PASM(count)                     ' ... of count \n"
    "             rdlong    BC, RI                                ' get count\n"
    "             cmp       BC, #1                        wz      ' last byte? \n"
    "    if_nz    drvl      _PASM(sda)                            ' 0 --> sda (ack) if not last byte \n"
    "    if_z     testb     _PASM(ackbit), #0             wc      ' last byte, ackbit.[0] --> c \n"
    "    if_z     drvc      _PASM(sda)                            ' last byte, c --> sda \n"
    "             waitx     _PASM(tix)                            ' let sda settle \n"
    "             drvh      _PASM(scl)                            ' scl high \n"
    "             waitx     _PASM(tix) \n"
    "             waitx     _PASM(tix) \n"
    "             drvl      _PASM(scl)                            ' scl low \n"
    "             waitx     _PASM(tix) \n"
    "             waitx     _PASM(tix) \n"

    ".put_byte    mov       RI, FP                                ' calculate address ... \n"
    "             add       RI, #_PASM(p_block)                   ' ... of block pointer \n"
    "             rdlong    BC, RI                                ' get block pointer\n"
    "             wrbyte    r1, BC                                ' write byte to block \n"
    "             add       BC, #1                                ' increment block pointer \n"
    "             wrlong    BC, RI                                ' save block pointer\n"
 
    "             mov       RI, FP                                ' calculate address ... \n"
    "             add       RI, #_PASM(count)                     ' ... of count \n"
    "             rdlong    BC, RI                                ' get count\n"
    "             sub       BC, #1 wz                             ' decrement count \n"
    "             wrlong    BC, RI                                ' save count\n"
 
    "     if_nz  jmp #.rd_block                                   ' continue while count not zero\n"
  );
}

void i2c_rd_block(uint8_t *p_block, uint32_t count, uint32_t ackbit) {
  // Read count bytes from I2C bus
  // -- p_block is pointer to storage location for bytes
  // -- ackbit is state of ack for final byte read
  rd_block_PASM(p_block, count, sclpin, sdapin, clktix, ackbit);
}
/*
 *pub stop() | scl, sda, tix
 *
 *'' Create I2C stop sequence
 *'' -- allows for clock stretch
 *
 *  longmove(@scl, @sclpin, 3)                                    ' copy pins & timing
 *
 *  org
 *                drvl      sda                                   ' hold sda low
 *                drvh      scl                                   ' release scl
 *                waitx     tix
 *                drvh      sda                                   ' finish stop sequence
 *  end
 *
 */

static void stop_PASM(uint32_t sda, uint32_t scl, uint32_t tix) {
  // Create I2C stop sequence
  // -- allows for clock stretch
  PASM(
    "            drvl      _PASM(sda)                             ' hold sda low \n"
    "            drvh      _PASM(scl)                             ' release scl \n"
    "            waitx     _PASM(tix) \n"
    "            drvh      _PASM(sda)                             ' finish stop sequence \n"
  );
}

void i2c_stop() {
   stop_PASM(sdapin, sclpin, clktix);
}

/*
 * con { license }
 * 
 * {{
 * 
 *  Terms of Use: MIT License
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 *
 *}}
 */
