#ifndef CATALINA_COG__H
#define CATALINA_COG__H

#include <stdint.h>

/*
 * clock control constants and functions
 */

#ifdef __CATALINA_P2

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

#else

/*
 * P1 clock modes
 */
#define RCFAST 0x00
#define RCSLOW 0x01
#define XINPUT 0x02
#define XTAL_1 0x2A
#define XTAL_2 0x32
#define XTAL_3 0x3A
#define PLL1X  0x41
#define PLL2X  0x42
#define PLL4X  0x43
#define PLL8X  0x44
#define PLL16X 0x45

#endif


extern unsigned _clockfreq();  // return current frequency - e.g. 80000000
extern unsigned _clockmode();  // return current mode - e.g. XTAL_1 + PLL16X
extern _clockinit(unsigned mode, unsigned freq); // set mode and freq


/*
 * Cog control constants and functions
 */
#ifdef __CATALINA_P2
#define ANY_COG 0x10 /* may be used in _coginit instead of a cog number */
#else
#define ANY_COG 0x8  /* may be used in _coginit instead of a cog number */
#endif

extern int _cogid();

extern int _coginit(int par, int addr, int cogid);

extern int _cogstop(int cogid);

extern int _coginit_C(void func(void), unsigned long *stack);

extern int _coginit_C_cog(void func(void), unsigned long *stack, unsigned int cog);

/*
 * NOTE: The differences between _coginit_XXX and _cogstart_XXX are:
 *    In _cogstart_XXX, function 'func' accepts a parameter (i.e. 'arg').
 *    In _cogstart_XXX, 'stack' specifies the BASE of the stack, not the TOP.
 */
extern int _cogstart_C(void func(void *), void *arg, void *stack, uint32_t size);

extern int _cogstart_C_cog(void func(void *), void *arg, void *stack, uint32_t size, unsigned int cog);

extern int _cogstart_CMM(uint32_t PC, uint32_t SP, void *arg);

extern int _cogstart_CMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

extern int _cogstart_LMM(uint32_t PC, uint32_t SP, void *arg);

extern int _cogstart_LMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

extern int _threaded_cogstart_CMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

extern int _threaded_cogstart_LMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

#ifdef __CATALINA_P2
extern int _cogstart_NMM(uint32_t PC, uint32_t SP, void *arg);

extern int _cogstart_NMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

extern int _threaded_cogstart_NMM_cog(uint32_t PC, uint32_t SP, void *arg, unsigned int cog);

#endif

extern int _coginit_Spin(void *code, void *data, void *stack, int start, int offs);

extern int _coginit_Spin_cog(void *code, void *data, void *stack, int start, int offs, unsigned int cog);

/*
 * define some macros useful for retrieving Spin long or word values from 
 * a byte array, specifying the array name and the byte offset in the array:
 */
#define SPIN_LONG(var, off) (*((long *)(&var[off])))
#define SPIN_WORD(var, off) (*((short *)(&var[off])))

/*
 * Lock management constants and functions
 */
extern int _locknew();

extern int _lockret(int lockid);

extern int _lockset(int lockid);

extern int _lockclr(int lockid);

/*
 * P1-style locking functions (they can be used on either the P1 or the P2, 
 * but are mainly designed for simulating P1 style locks on the P2, which has 
 * significantly different lock semantics to the P1). 
 */

extern void _acquire_lock(int lock);

extern void _release_lock(int lock);

/*
 *  Macros to acquire and release locks
 */

#ifdef __CATALINA_P2
#define ACQUIRE(lock) if (lock >= 0) { _acquire_lock(lock); }
#define RELEASE(lock) if (lock >= 0) { _release_lock(lock); }
#else
#define ACQUIRE(lock) if (lock >= 0) { do {} while (!_lockset(lock)); }
#define RELEASE(lock) if (lock >= 0) { _lockclr(lock); }
#endif

/*
 * Wait constants and functions
 * NOTE: _waitpeqb and _waitpneb are not implemented on the current propeller
 */

#define _INA 0 /* use in _waitpeq, _waitpne */
#define _INB 1 /* use in _waitpeq, _waitpne */

extern int _waitcnt(unsigned count);

extern int _waitcnt2(unsigned count, unsigned increment);

extern int _waitvid(unsigned colors, unsigned pixels);

extern int _waitpeq(unsigned mask, unsigned result, int a_or_b);

extern int _waitpne(unsigned mask, unsigned result, int a_or_b);

/*
 * Special Register access functions - you can either use these functions,
 * or use the Special Register definitions directly (note that you also 
 * need to include <propeller.h> to do that). For example:
 *    
 *    x = _ina()        is equivalent to    x = INA
 *    x = _get_dira()   is equivalent to    x = DIRA
 *    _dira(m,d)        is equivalent to    DIRA = ((DIRA & m) | d)
 *    _dira(0,d)        is equivalent to    DIRA |= d
 *    _dira(m,0)        is equivalent to    DIRA &= ~m
 *
 * NOTE: _inb, _dirb and _outb (or INB, DIRB, OUTB) are not implemented on 
 *       the propeller v1
 */
extern unsigned _cnt();

extern unsigned _ina();
extern unsigned _inb();

extern unsigned _get_dira();
extern unsigned _get_dirb();

extern unsigned _dira(unsigned mask, unsigned direction);
extern unsigned _dirb(unsigned mask, unsigned direction);

extern unsigned _outa(unsigned mask, unsigned output);
extern unsigned _outb(unsigned mask, unsigned output);

extern unsigned _ctra(unsigned mask, unsigned control);
extern unsigned _ctrb(unsigned mask, unsigned control);

extern unsigned _frqa(unsigned mask, unsigned frequency);
extern unsigned _frqb(unsigned mask, unsigned frequency);

extern unsigned _phsa(unsigned mask, unsigned phase);
extern unsigned _phsb(unsigned mask, unsigned phase);

extern unsigned _vcfg(unsigned mask, unsigned config);
extern unsigned _vscl(unsigned mask, unsigned scale);

/*
 * counter control constants
 */
#define COUNTER_OFF 0x00

/* video mode */
#define COUNTER_PLL_INTERNAL 0x01

#define COUNTER_PLL  0x02
#define COUNTER_NCO  0x04
#define COUNTER_DUTY 0x06

/* bit-wise OR one of these to COUNTER_{PLL,NCO,DUTY} */
#define COUNTER_SINGLE_ENDED 0x00
#define COUNTER_DIFFERENTIAL 0x01

#define COUNTER_POS      0x08
#define COUNTER_POS_EDGE 0x0A
#define COUNTER_NEG      0x0C
#define COUNTER_NEG_EDGE 0x0E

/* bit-wise OR one of these to COUNTER_{POS,NEG}{,_EDGE} */
#define COUNTER_NO_FEEDBACK 0x00
#define COUNTER_FEEDBACK    0x01

#define COUNTER_LOGIC_NEVER         0x10
#define COUNTER_LOGIC_NOTA_AND_NOTB 0x11
#define COUNTER_LOGIC_A_AND_NOTB    0x12
#define COUNTER_LOGIC_NOTB          0x13
#define COUNTER_LOGIC_NOTA_AND_B    0x14
#define COUNTER_LOGIC_NOTA          0x15
#define COUNTER_LOGIC_A_NEQ_B       0x16
#define COUNTER_LOGIC_NOTA_OR_NOTB  0x17
#define COUNTER_LOGIC_A_AND_B       0x18
#define COUNTER_LOGIC_A_EQ_B        0x19
#define COUNTER_LOGIC_A             0x1A
#define COUNTER_LOGIC_A_OR_NOTB     0x1B
#define COUNTER_LOGIC_B             0x1C
#define COUNTER_LOGIC_NOTA_OR_B     0x1D
#define COUNTER_LOGIC_A_OR_B        0x1E
#define COUNTER_LOGIC_ALWAYS        0x1F

#define COUNTER_CONTROL_REGISTER(mode, plldiv, bpin, apin) (((mode) << 26) | ((plldiv) << 23) | ((bpin) << 9) | (apin))

#endif
