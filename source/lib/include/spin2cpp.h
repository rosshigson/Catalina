#ifndef _SPIN2CPP__H
#define _SPIN2CPP__H

/*
 * This file defines symbols that are assumed to exist by spin2cpp. 
 * Mostly, they are just name differences.
 */

#ifdef __CATALINA_P2 /* it is a Propeller 2 program */

#ifndef clkset
#define clkset(mode, freq) _clkset(mode, freq)
#endif

#else /* it is a Propeller 1 program */

#ifndef _CNT
#define _CNT CNT
#endif
#ifndef _PAR
#define _PAR PAR
#endif
#ifndef _INA
#define _INA INA
#endif
#ifndef _INB
#define _INB INB
#endif
#ifndef _OUTA
#define _OUTA OUTA
#endif
#ifndef _OUTB
#define _OUTB OUTB
#endif
#ifndef _DIRA
#define _DIRA DIRA
#endif
#ifndef _DIRB
#define _DIRB DIRB
#endif
#ifndef _CTRA
#define _CTRA CTRA
#endif
#ifndef _CTRB
#define _CTRB CTRB
#endif
#ifndef _FRQA
#define _FRQA FRQA
#endif
#ifndef _FRQB
#define _FRQB FRQB
#endif
#ifndef _PHSA 
#define _PHSA PHSA
#endif
#ifndef _PHSB
#define _PHSB PHSB
#endif
#ifndef _VCFG
#define _VCFG VCFG
#endif
#ifndef _VSCL
#define _VSCL VSCL
#endif

#ifndef cogid
#define cogid _cogid
#endif
#ifndef coginit
#define coginit(id, code, par) _coginit((unsigned)(par)>>2, (unsigned)(code)>>2, id)
#endif
#ifndef cognew
#define cognew(code, par) coginit(0x8, (code), (par))
#endif
#ifndef cogstop
#define cogstop(i) _cogstop(i)
#endif

#ifndef clkset
#define clkset(mode, freq) _clockinit(mode, freq)
#endif
#ifndef _clkset
#define _clkset(mode, freq) _clockinit(mode, freq)
#endif
#ifndef _clkfreq
#define _clkfreq _clockfreq()
#endif
#ifndef _clkmode
#define _clkmode _clockmode()
#endif

#ifndef lockret
#define lockret _lockret
#endif
#ifndef locknew
#define locknew _locknew
#endif
#ifndef lockset
#define lockset _lockset
#endif
#ifndef lockclr
#define lockclr _lockclr
#endif

#ifndef waitcnt
#define waitcnt(n) _waitcnt(n)
#endif
#ifndef waitpne
#define waitpne(mask, pins) _waitpne(mask, pins, 0)
#endif
#ifndef waitpeq
#define waitpeq(mask, pins) _waitpeq(mask, pins, 0)
#endif

#ifndef strsize
#define strsize(str) strlen(str)
#endif
#ifndef strcomp
#define strcomp(str1, str2) strcmp(str1, str2)
#endif

#ifndef longfill
#define longfill(addr, val, count) _memfill(addr, val, count, 4) 
#endif
#ifndef wordfill
#define wordfill(addr, val, count) _memfill(addr, val, count, 2) 
#endif
#ifndef bytefill
#define bytefill(addr, val, count) _memfill(addr, val, count, 1) 
#endif

#endif /* __CATALINA_P2 */

#endif /* SPIN2CPP__H */
