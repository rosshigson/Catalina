#ifndef _CATICC__H
#define _CATICC__H

// +==========+
// | caticc.h |
// +==========+
//
// This file contains set of macros to allow C programs to be compiled to  
// run under either Catalina or ICC. 
// 
// This include file configures itself automatically by detecting whether
// the symbol __CATALINA__ (defined by the catalina compiler) is defined.
//

#ifdef __CATALINA__
#include <cog.h>
#else
#include <prop.h>
#endif

//
// set_dira(bits) : set bits in DIRA
//
#ifdef __CATALINA__
#define set_dira(bits) _dira((bits), (bits))
#else
#define set_dira(bits) DIRA |= (bits)
#endif

//
// set_dirb(bits) : set bits in DIRB
//
#ifdef __CATALINA__
#define set_dirb(bits) _dirb((bits), (bits))
#else
#define set_dirb(bits) DIRB |= (bits)
#endif

//
// clr_dira(bits) : clear bits in DIRA
//
#ifdef __CATALINA__
#define clr_dira(bits) _dira((bits), 0)
#else
#define clr_dira(bits) DIRA &= ~(bits)
#endif

//
// clr_dirb(bits) : clear bits in DIRB
//
#ifdef __CATALINA__
#define clr_dirb(bits) _dirb((bits), 0)
#else
#define clr_dirb(bits) DIRB &= ~(bits)
#endif

//
// set_outa(bits) : set bits in OUTA
//
#ifdef __CATALINA__
#define set_outa(bits) _outa((bits), (bits))
#else
#define set_outa(bits) OUTA |= (bits)
#endif

//
// set_outb(bits) : set bits in OUTB
//
#ifdef __CATALINA__
#define set_outb(bits) _outb((bits), (bits))
#else
#define set_outb(bits) OUTB |= (bits)
#endif

//
// clr_outa(bits) : clear bits in OUTA
//
#ifdef __CATALINA__
#define clr_outa(bits) _outa((bits), 0)
#else
#define clr_outa(bits) OUTA &= ~(bits)
#endif

//
// clr_outb(bits) : clear bits in OUTB
//
#ifdef __CATALINA__
#define clr_outb(bits) _outb((bits), 0)
#else
#define clr_outb(bits) OUTB &= ~(bits)
#endif

//
// get_ina() : get the value of INA
//
#ifdef __CATALINA__
#define get_ina() _ina()
#else
#define get_ina() INA
#endif

//
// get_inb() : get the value of INB
//
#ifdef __CATALINA__
#define get_inb() _inb()
#else
#define get_inb() INB
#endif

//
// set_ctra(bits) : set bits in CTRA
//
#ifdef __CATALINA__
#define set_ctra(bits) _ctra((bits), (bits))
#else
#define set_ctra(bits) CTRA |= (bits)
#endif

//
// set_ctrb(bits) : set bits in CTRB
//
#ifdef __CATALINA__
#define set_ctrb(bits) _ctrb((bits), (bits))
#else
#define set_ctrb(bits) CTRB |= (bits)
#endif

//
// clr_ctra(bits) : clear bits in CTRA
//
#ifdef __CATALINA__
#define clr_ctra(bits) _ctra((bits), 0)
#else
#define clr_ctra(bits) CTRA &= ~(bits)
#endif

//
// clr_ctrb(bits) : clear bits in CTRB
//
#ifdef __CATALINA__
#define clr_ctrb(bits) _ctrb((bits), 0)
#else
#define clr_ctrb(bits) CTRB &= ~(bits)
#endif

//
// set_frqa(bits) : set bits in FRQA
//
#ifdef __CATALINA__
#define set_frqa(bits) _frqa((bits), (bits))
#else
#define set_frqa(bits) FRQA |= (bits)
#endif

//
// set_frqb(bits) : set bits in FRQB
//
#ifdef __CATALINA__
#define set_frqb(bits) _frqb((bits), (bits))
#else
#define set_frqb(bits) FRQB |= (bits)
#endif

//
// clr_frqa(bits) : clear bits in FRQA
//
#ifdef __CATALINA__
#define clr_frqa(bits) _frqa((bits), 0)
#else
#define clr_frqa(bits) FRQA &= ~(bits)
#endif

//
// clr_frqb(bits) : clear bits in FRQB
//
#ifdef __CATALINA__
#define clr_frqb(bits) _frqb((bits), 0)
#else
#define clr_frqb(bits) FRQB &= ~(bits)
#endif

//
// set_phsa(bits) : set bits in PHSA
//
#ifdef __CATALINA__
#define set_phsa(bits) _phsa((bits), (bits))
#else
#define set_phsa(bits) PHSA |= (bits)
#endif

//
// set_phsb(bits) : set bits in PHSB
//
#ifdef __CATALINA__
#define set_phsb(bits) _phsb((bits), (bits))
#else
#define set_phsb(bits) PHSB |= (bits)
#endif

//
// clr_phsa(bits) : clear bits in PHSA
//
#ifdef __CATALINA__
#define clr_phsa(bits) _phsa((bits), 0)
#else
#define clr_phsa(bits) PHSA &= ~(bits)
#endif

//
// clr_phsb(bits) : clear bits in PHSB
//
#ifdef __CATALINA__
#define clr_phsb(bits) _phsb((bits), 0)
#else
#define clr_phsb(bits) PHSB &= ~(bits)
#endif

//
// set_vcfg(bits) : set bits in VCFG
//
#ifdef __CATALINA__
#define set_vcfg(bits) _vcfg((bits), (bits))
#else
#define set_vcfg(bits) VCFG |= (bits)
#endif

//
// set_vscl(bits) : set bits in VSCL
//
#ifdef __CATALINA__
#define set_vscl(bits) _vscl((bits), (bits))
#else
#define set_vscl(bits) VSCL |= (bits)
#endif

//
// clr_vcfg(bits) : clear bits in VCFG
//
#ifdef __CATALINA__
#define clr_vcfg(bits) _vcfg((bits), 0)
#else
#define clr_vcfg(bits) VCFG &= ~(bits)
#endif

//
// clr_vscl(bits) : clear bits in VSCL
//
#ifdef __CATALINA__
#define clr_vscl(bits) _vscl((bits), 0)
#else
#define clr_vscl(bits) VSCL &= ~(bits)
#endif

//
// get_cnt() : get the value of CNT
//
#ifdef __CATALINA__
#define get_cnt(bits) _cnt()
#else
#define get_cnt(bits) CNT
#endif


//
// cogid() : get the current cog id
//
#ifdef __CATALINA__
#define cogid() _cogid()
#else
#define cogid() COGID()
#endif

//
// cogstop(cog) : stop a cog
//
#ifdef __CATALINA__
#define cogstop(cog) _cogstop(cog)
#else
#define cogstop(cog) COGSTOP(cog)
#endif

//
// coginit(val) : start a program in a cog (val is the PASM coginit val)
//
#ifdef __CATALINA__
#define coginit(val) _coginit(((val) & 0xFFFC0000)>>18, ((val) & 0x3FFF0)>>4, (val) & 0xF)
#else
#define coginit(val) COGINIT(val)
#endif

//
// locknew(lock) : clear a lock
//
#ifdef __CATALINA__
#define locknew(lock) _locknew(lock)
#else
#define locknew(lock) LOCKNEW(lock)
#endif


//
// lockclr(lock) : clear a lock
//
#ifdef __CATALINA__
#define lockclr(lock) _lockclr(lock)
#else
#define lockclr(lock) LOCKCLR(lock)
#endif

//
// lockset(lock) : set a lock
//
#ifdef __CATALINA__
#define lockset(lock) _lockset(lock)
#else
#define lockset(lock) LOCKSET(lock)
#endif

//
// lockret(lock) : return a lock
//
#ifdef __CATALINA__
#define lockret(lock) _lockret(lock)
#else
#define lockret(lock) LOCKRET(lock)
#endif

//
// waitcnt(count, ticks) : wait for cnt to equal count, then add ticks to count
//
#ifdef __CATALINA__
#define waitcnt(count,ticks) { _waitcnt(count); count += (ticks); }
#else
#define waitcnt(count,ticks) WAITCNT(count,ticks)
#endif

//
// waitvid(colors, pixels) : wait for video generator
//
#ifdef __CATALINA__
#define waitvid(colors, pixels) _waitvid(colors, pixels)
#else
#define waitvid(colors, pixels) WAITVID(colors, pixels)
#endif

//
// waitpne(mask, pins) : wait for pins not equal
//
#ifdef __CATALINA__
#define waitpne(mask, pins) _waitpne(mask, pins, 0)
#else
#define waitpne(mask, pins) WAITPNE(mask, pins)
#endif

//
// waitpeq(mask, pins) : wait for pins equal
//
#ifdef __CATALINA__
#define waitpeq(mask, pins) _waitpeq(mask, pins, 0)
#else
#define waitpeq(mask, pins) WAITPEQ(mask, pins)
#endif

//
// clockfreq() : fetch the clock frequency
//
#ifdef __CATALINA__
#define clockfreq() _clockfreq()
#else
#define clockfreq() CLKFREQ
#endif

//
// clockmode() : fetch the clock mode
//
#ifdef __CATALINA__
#define clockmode() _clockmode()
#else
#define clockmode() CLKMODE
#endif

//
// clkset(mode, frequency) : set the clock mode and frequency
//
#ifdef __CATALINA__
#define clkset(mode, frequency) _clockinit(mode, frequency)
#endif

//
// wait(ticks) : wait for the specified number of ticks
//
#ifdef __CATALINA__
#define wait(ticks) _waitcnt(_cnt() + (ticks))
#endif

//
// msleep(ticks) : wait for the specified number of milliseconds
//
#if __CATALINA__
#define msleep(ticks) wait((ticks)*(clockfreq()/1000))
#endif

//
// sleep(ticks) : wait for the specified number of seconds
//
#ifdef __CATALINA__
#define sleep(ticks) wait((ticks)*clockfreq())
#endif

#endif
