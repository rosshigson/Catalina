#ifndef PROPELLER__H
#define PROPELLER__H

#include <catalina_cog.h>

/*
 * Special Register definitions - you can either use these variable names,
 * or use the special register access functions. For example:
 *    
 *    x = _ina()        is equivalent to    x = INA
 *    x = _get_dira()   is equivalent to    x = DIRA
 *    _dira(m,d)        is equivalent to    DIRA = ((DIRA & m) | d)
 *    _dira(0,d)        is equivalent to    DIRA |= d
 *    _dira(m,0)        is equivalent to    DIRA &= ~m
 *
 * NOTE: INB, DIRB, OUTB (or _inb, _dirb and _outb) are not implemented on 
 *       the propeller v1. However, they can still be used as storage.
 */
extern volatile const unsigned PAR;
extern volatile const unsigned CNT;
extern volatile const unsigned INA;
extern volatile const unsigned INB;
extern volatile unsigned OUTA;
extern volatile unsigned OUTB;
extern volatile unsigned DIRA;
extern volatile unsigned DIRB;
extern volatile unsigned CTRA;
extern volatile unsigned CTRB;
extern volatile unsigned FRQA;
extern volatile unsigned FRQB;
extern volatile unsigned PHSA;
extern volatile unsigned PHSB;
extern volatile unsigned VCFG;
extern volatile unsigned VSCL;

/*
 * include Catalina cog function definitions
 */
#include <catalina_cog.h>

/*
 * declare PASM as external function
 */
extern int PASM(const char *code);

//
// COGID : get the current cog id
//
#define COGID _cogid()

//
// COGSTOP(cog) : stop a cog
//
#define COGSTOP(cog) _cogstop(cog)

//
// COGINIT(val) : start a program in a cog (val is the PASM coginit val)
//
#define COGINIT(val) _coginit(((val) & 0xFFFC0000)>>18, ((val) & 0x3FFF0)>>4, (val) & 0xF)

//
// LOCKNEW : get a lock
//
#define LOCKNEW _locknew(lock)


//
// LOCKCLR(lock) : clear a lock
//
#define LOCKCLR(lock) _lockclr(lock)

//
// LOCKSET(lock) : set a lock
//
#define LOCKSET(lock) _lockset(lock)

//
// LOCKRET(lock) : return a lock
//
#define LOCKRET(lock) _lockret(lock)

//
// WAITCNT(count, ticks) : wait for cnt to equal count, then add ticks to count
//
#define WAITCNT(count,ticks) { _waitcnt(count); count += (ticks); }

//
// WAITVID(colors, pixels) : wait for video generator
//
#define WAITVID(colors, pixels) _waitvid(colors, pixels)

//
// WAITPNE(mask, pins) : wait for pins not equal
//
#define WAITPNE(mask, pins) _waitpne(mask, pins, 0)

//
// WAITPEQ(mask, pins) : wait for pins equal
//
#define WAITPEQ(mask, pins) _waitpeq(mask, pins, 0)

//
// CLKFREQ : fetch the clock frequency
//
#define CLKFREQ _clockfreq()

//
// CLKMODE : fetch the clock mode
//
#define CLKMODE _clockmode()

//
// CLKSET(mode, frequency) : set the clock mode and frequency
//
#define CLKSET(mode, frequency) _clockinit(mode, frequency)

//
// WAIT(ticks) : wait for the specified number of ticks
//
#define WAIT(ticks) _waitcnt((ticks) + _cnt())

//
// msleep(ticks) : wait for the specified number of milliseconds
//
#define msleep(millisecs) WAIT((millisecs)*(_clockfreq()/1000))

//
// sleep(ticks) : wait for the specified number of seconds
//
#define sleep(seconds) WAIT((seconds)*_clockfreq())



#endif
