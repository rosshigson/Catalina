#ifndef _COG__H
#define _COG__H

#include <stdint.h>

/*
 * Program loader sizes (for XMM loaders).
 * Must match Catalina_Common.spin, Catalina_constants.inc, 
 * payload.c, catbind.c
 */

#define P1_LOAD_SIZE  0x8000  // max size of P1 loader (32kb)
#define P2_LOAD_SIZE 0x10000  // max size of P2 loader (64kb)

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


extern uint32_t _clockfreq(void);  // return current frequency - e.g. 80000000
extern uint32_t _clockmode(void);  // return current mode - e.g. XTAL_1 + PLL16X

extern void _clockinit(unsigned mode, unsigned freq); // set mode and freq


/*
 * Cog control constants and functions
 */
#ifndef ANY_COG
#ifdef __CATALINA_P2
#define ANY_COG 0x10 /* may be used in _coginit instead of a cog number */
#else
#define ANY_COG 0x8  /* may be used in _coginit instead of a cog number */
#endif
#endif

extern int _cogid();

extern int _coginit(int par, int addr, int cogid);

extern void _cogstop(int cog);

extern int _coginit_Spin(void *code, void *data, void *stack, int start, int offs);

extern int _coginit_Spin_cog(void *code, void *data, void *stack, int start, int offs, unsigned int cog);

/*
 * NOTE: The differences between _coginit_C and _cogstart_C (or _coginit_C_cog and
 * _cogstart_C_cog) are:
 *
 * 1.  In _cogstart_C and _cogstart_C_cog, function 'func' accepts a parameter 
 *     (i.e. 'arg').
 *
 * 2.  In _cogstart_C and _cogstart_C_cog,'stack' specifies the BASE of the stack, 
 *     and so the size is required, whereas SP specifies the TOP.
 */
extern int _coginit_C(void func(void), unsigned long *SP);

extern int _coginit_C_cog(void func(void), unsigned long *SP, unsigned int cog);

extern int _cogstart_C(void func(void *), void *arg, void *stack, uint32_t size);

extern int _cogstart_C_cog(void func(void *), void *arg, void *stack, uint32_t size, unsigned int cog);

/*
 * In the _cogstart_XXX functions, the SP is always the TOP of the stack. 
 */
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

extern int _cogstart_XMM_SMALL(uint32_t PC, uint32_t CS, uint32_t SP, void *arg);

extern int _cogstart_XMM_SMALL_2(uint32_t PC, uint32_t CS, uint32_t SP, void *arg1, void *arg2);

extern int _cogstart_XMM_SMALL_cog(uint32_t PC, uint32_t CS, uint32_t SP, void *arg, unsigned int cog);

extern int _cogstart_XMM_SMALL_cog_2(uint32_t PC, uint32_t CS, uint32_t SP, void *arg1, void *arg2, unsigned int cog);

extern int _cogstart_XMM_LARGE(uint32_t PC, uint32_t CS, uint32_t SP, void *arg);

extern int _cogstart_XMM_LARGE_2(uint32_t PC, uint32_t CS, uint32_t SP, void *arg1, void *arg2);

extern int _cogstart_XMM_LARGE_cog(uint32_t PC, uint32_t CS, uint32_t SP, void *arg, unsigned int cog);

extern int _cogstart_XMM_LARGE_cog_2(uint32_t PC, uint32_t CS, uint32_t SP, void *arg1, void *arg2, unsigned int cog);

#endif

/*
 * define some macros useful for retrieving Spin long or word values from 
 * a byte array, specifying the array name and the byte offset in the array:
 */
#define SPIN_LONG(var, off) (*((long *)(&var[off])))
#define SPIN_WORD(var, off) (*((short *)(&var[off])))

/*
 * Lock management constants and functions
 */
#ifndef __CATALINA_P2
// on the Propeller 2, these are defined in p2.h
extern int _locknew();

extern void _lockret(int lockid);
#endif

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

#define _WAIT_INA 0 /* use in _waitpeq, _waitpne */
#define _WAIT_INB 1 /* use in _waitpeq, _waitpne */

extern void _waitcnt(uint32_t tick);

extern int _waitvid(unsigned colors, unsigned pixels);

extern int _waitpeq(unsigned mask, unsigned result, int a_or_b);

extern int _waitpne(unsigned mask, unsigned result, int a_or_b);

/*
 * Special Register access functions - you can either use these functions,
 * or use the Special Register definitions directly (note that you also 
 * need to include <prop.h> to do that). For example:
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
extern uint32_t  _cnt(void);

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

/*
 * memory management lock functions - note that if you manually specify
 * a memory lock, it needs to be allocated and/or released using _locknew() 
 * and _lockret(). Also, note that you do not need to specify a lock manually
 * if your program uses multithreading and already calls _thread_set_lock() 
 * because that function automatically allocates a memory management lock 
 * if one has not already been specified.
 */

/*
 * _memory_get_lock - return the identify of the current memory management 
 *                    lock, or -1 if no lock is currently in use.
 */ 
int _memory_get_lock();

/*
 * _memory_set_lock - set the current memory management lock to the specified
 *                    lock, which can be -1 to clear the lock, and also return
 *                    the identify of the lock that was in use previously (or
 *                    -1 if no lock was in use).
 */ 
int _memory_set_lock(int lock);

/*
 * _memory_lock - if a memory lock is currently in use, acquire it.
 */
void _memory_lock();

/*
 * _memory_unlock - if a memory lock is currently in use, release it.
 */
void _memory_unlock();

/*
 * dynamic memory allocation defragmentation function. Can be called
 * periodically to reduce memory fragmentation caused by using malloc,
 * calloc, realloc, free to allocate and/or deallocate so many small 
 * blocks of memory such that a request for a single large block of
 * memory cannot be satisfied even if sufficient free memory is available.
 * This function is part of the memory managment library, but since it is  
 * not a standard C function, it is not defined in stdlib.h.
 */
void malloc_defragment();

/*
 * set one or more service locks. If lock >= 0, it will be used for 
 * all services. Otherwise a differentl lock will be allocated for
 * each plugin. 
 * Returns -1 on error (e.g. if there are not enough locks available).
 */
int _set_service_lock(int lock);

#endif

