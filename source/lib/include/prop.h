#ifndef _PROPELLER__H
#define _PROPELLER__H

#include <cog.h>

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
#include <cog.h>

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
// wait functions
//
#ifndef __CATALINA_P2
// on the Propeller 1, there is no _waitx() - define a macro to use WAIT
#define   _waitx(delay) WAIT(delay)
#endif
void      _waitus(uint32_t usecs);
void      _waitms(uint32_t msecs);
void      _waitsec(uint32_t secs);

//
// msleep(ticks) : wait for the specified number of milliseconds
//
#define msleep(millisecs) _waitms(millisecs)

//
// sleep(ticks) : wait for the specified number of seconds
//
#define sleep(seconds) _waitsec(seconds)

//
// getrand() : get a random number and (on the first call only) seed the 
//             pseudo random number generator.
//
//             On the P1, the first time this function is called it calls
//             srand() with the current CNT value and should therefore be 
//             called after some user input or other random delay. It then
//             returns the result of 3 combined calls to rand() to make up
//             32 random bits (rand itself only returns 15 bits).
//
//             On the P2, the first time this function is called it calls
//             srand() with the result of the GETRND opcode, and also 
//             returns that value. Thereafter it just returns the result
//             of the GETRND opcode.
//
//             This means you can either use just this function, or use
//             this function once to generate a seed for srand() and 
//             thereafter use rand(), which is what most C programs would 
//             typically do. 
//
//             Do not use getrand() if you need to seed the pseudo random
//             number generator with a specific value, because on the
//             first call getrand() will re-seed the pseudo random number
//             generator. However, you can safely use getrealrand(),
//             which does not (see below).
//
//             Note that rand() will only return a value between 0 and 
//             RAND_MAX (inclusive) (i.e. 0 .. 32727) whereas getrand() 
//             returns 32 bits. To simulate rand(), use an expression
//             like:
//                (getrand() % (MAX_RAND + 1))
//
int getrand();

//
// getrealrand() : get a real random number.
//
//             On the P1, call the RND plugin to get a true random number.
//             On the P1, this can take up to 100us @ 80Mhz (plus call 
//             overheads).
//
//             On the P2, this just calls the GETRND opcode to get a true
//             random number. On the P2, this takes just one clock cycle 
//             (plus call overheads).
//
//             The difference between getrand() and getrealrand() is that
//             getrand() seeds the random number generator on the first
//             call, whereas getrealrand() does not. This means that using 
//             getrealrand() will not disturb the sequence of pseodo random 
//             numbers returned by rand().
//             
//
int getrealrand();

//
// useful pin functions
//

//
// getpin - read the state of a pin
//    pin : Pin to get (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//    returns : State of the requested pin with range (0 or 1)
//
int getpin(int pin);

//
// setpin - write the state of a pin
//    pin : Pin to set (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//    value : The value to set to the pin (0 or 1)
//    returns : nothing
//
void setpin(int pin, int value);

//
// togglepin - toggle the state of a pin
//    pin : Pin to toggle (0 to 31 on Propeller 1, 0 to 63 on Propeller 2)
//   i returns : nothing
//
void togglepin(int pin);

//
// include definitions required by spin2cpp (if requested)
//
#ifdef __SPIN2CPP__
#include <spin2cpp.h>
#endif

#endif
