#ifndef _PROPELLER2__H
#define _PROPELLER2__H

#include <stdint.h>

/*
 * special register names
 */

extern volatile uint32_t _IJMP3; 
extern volatile uint32_t _IRET3;
extern volatile uint32_t _IJMP2;
extern volatile uint32_t _IRET2;
extern volatile uint32_t _IJMP1;
extern volatile uint32_t _IRET1;
extern volatile uint32_t _PA;
extern volatile uint32_t _PB;
extern volatile uint32_t _PTRA;
extern volatile uint32_t _PTRB;
extern volatile uint32_t _DIRA;
extern volatile uint32_t _DIRB;
extern volatile uint32_t _OUTA;
extern volatile uint32_t _OUTB;
extern volatile uint32_t _INA;
extern volatile uint32_t _INB;

/*
 * common definitions
 */

#ifndef ANY_COG
#define ANY_COG 0x10
#endif

/*
 * common types
 */

// cartesian coordinates
typedef struct _cartesian {
   int32_t x, y;
} cartesian_t;

// polar coordinates
typedef struct _polar {
   uint32_t r, t;
} polar_t;

// 64 bit counter
typedef struct _counter64 {
    uint32_t low, high;
} counter64_t;

/*
 * P2 32 Bit Clock Mode (see macros below to construct)
 *
 *      0000_000e_dddddd_mmmmmmmmmm_pppp_cc_ss
 *
 *   e          = XPLL (0 = PLL Off, 1 = PLL On)
 *   dddddd     = XDIV (0 .. 63, crystal divider => 1 .. 64)
 *   mmmmmmmmmm = XMUL (0 .. 1023, crystal multiplier => 1 .. 1024)
 *   pppp       = XPPP (0 .. 15, see macro below)
 *   cc         = XOSC (0 = OFF, 1 = OSC, 2 = 15pF, 3 = 30pF)
 *   ss         = XSEL (0 = rcfast, 1 = rcslow, 2 = XI, 3 = PLL)
 */

// macro to calculate XPPP (1->15, 2->0, 4->1, 6->2 ... 30->14) ...
#define XPPP(XDIVP) ((((XDIVP)>>1)+15)&0xF)  

// macro to combine XPLL, XDIV, XDIVP, XOSC & XSEL into a 32 bit CLOCKMODE ...
#define CLOCKMODE(XPLL,XDIV,XMUL,XDIVP,XOSC,XSEL) ((XPLL<<24)+((XDIV-1)<<18)+((XMUL-1)<<8)+(XPPP(XDIVP)<<4)+(XOSC<<2)+XSEL) 

// macro to calculate final clock frequency ...
#define CLOCKFREQ(XTALFREQ, XDIV, XMUL, XDIVP) ((XTALFREQ)/(XDIV)*(XMUL)/(XDIVP))

/*
 * pre-defined functions
 */

void      _hubset(uint32_t val);

//void    _clkset(uint32_t clkmode, uint32_t clkfreq);
#define   _clkset(clkmode, clkfreq) _clockinit(clkmode, clkfreq)

/* start PASM code in another COG */
// int    _cogstart_PASM(int cog, void *pgm, void *ptr);
#define   _cogstart_PASM(cog, pgm, ptr) _coginit(((unsigned)ptr)>>2, ((unsigned)pgm)>>2, cog)
#define   _cognew(pgm, ptr) _cogstart_PASM(ANY_COG, pgm, ptr)

/*
 * Start C code in another COG
 *
 * NOTE: The differences between _coginit_XXX and _cogstart_XXX are:
 *    In _cogstart_XXX, function 'func' accepts a parameter (i.e. 'arg').
 *    In _cogstart_XXX, 'stack' specifies the BASE of the stack, not the TOP.
 */
_cogstart_C(void (*func)(void *), void *arg, void *stack_base, uint32_t stack_size);

/* stop/check status of COGs */
void      _cogstop(int cog);

int       _cogchk(int cog);

int       _cogid(void);

int       _locknew(void);
void      _lockret(int lock);

int       _locktry(int lock);
void      _lockrel(int lock);
int       _lockchk(int lock);

void      _cogatn(uint32_t mask);
int       _pollatn(void);
int       _waitatn(void);

/* CORDIC instructions */
cartesian_t _rotxy(cartesian_t coord, uint32_t t);
cartesian_t _polxy(polar_t coord);
polar_t     _xypol(cartesian_t coord);

/* miscellaneous operations */
uint32_t  _rnd(void);
uint32_t  _rev(uint32_t val);   /* like Spin reverse operator */
int       _encod(uint32_t val); /* Spin encode operator */
uint32_t  _isqrt(uint32_t val); /* Spin integer square root */

/* Divide the 64-bit product of 'mult1' and 'mult2' by 'divisor', 
 * return quotient (unsigned operation) */
uint32_t  _muldiv64(uint32_t mult1, uint32_t mult2, uint32_t divisor); 

/* counter related functions */
uint32_t  _cnt(void);
uint32_t  _cnth(void); /* high 32 bits of CNT, on processors that support it */
counter64_t _cnthl();  /* fetch both together */

void      _waitcnt(uint32_t tick);

#if !defined(_waitx) && !defined(__CATALINA_P2)
/* the Propeller 1 has no _waitx function - prop.h defines a macro */
void      _waitx(uint32_t delay);
#endif

void      _waitus(uint32_t usecs);
void      _waitms(uint32_t msecs);
void      _waitsec(uint32_t secs);

/* regular pin I/O */
void      _dirl(int pin);
void      _dirh(int pin);
void      _pinw(int pin, int val);
void      _pinl(int pin);
void      _pinh(int pin);
void      _pinnot(int pin);
void      _pinrnd(int pin);
void      _pinf(int pin);
int       _pinr(int pin);

/* smart pin controls */
void      _wrpin(int pin, uint32_t val);
void      _wxpin(int pin, uint32_t val);
void      _wypin(int pin, uint32_t val);
void      _akpin(int pin);
uint32_t  _rdpin(int pin);
uint32_t  _rqpin(int pin);
void      _pinstart(int pin, uint32_t mode, uint32_t xval, uint32_t yval);
void      _pinclear(int pin);

/* access to previously set clock mode and frequency */
extern uint32_t _clockfreq(void);
extern uint32_t _clockmode(void);

/* include definitions required by spin2cpp (if requested) */
#ifdef __SPIN2CPP__
#include <spin2cpp.h>
#endif


#endif

