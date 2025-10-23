#ifndef _INT__H
#define _INT__H

#ifndef __CATALINA_P2
#error INTERRUPTS ARE ONLY SUPPORTED ON THE PROPELLER 2
#endif

#if defined(__CATALINA_LARGE) || defined(__CATALINA_SMALL)
#error INTERRUPTS ARE NOT SUPPORTED IN XMM PROGRAMS
#endif

#if defined(__CATALINA_COMPACT) && !defined(__CATALINA_NO_FIFO)
#error COMPACT PROGRAMS THAT USE INTERRUPTS MUST SPECIFY NO_FIFO
#endif

#ifdef __CATALINA_NO_INTERRUPTS
#error NO_INTERRUPTS SPECIFIED FOR A PROGRAM THAT REQUIRES INTERRUPTS
#endif

/*
 * define the type of an interrupt function. Such a function must have no 
 * arguments, and it must return - but it cannot return a value. It must be 
 * set as an interrupt using one of the _set_int_x functions.
 */
typedef void (* _interrupt)(void);

/*
 * define the size (in LONGs) of an interrupt block - the block is used to
 * save the registers of the executing C program or thread during the servicing
 * of the interrupt. The block should be long aligned.
 */
#define INT_BLOCK_SIZE 32

/*
 * define the minimum size (in LONGs) of the interrupt stack - the top of this
 * space is used for the interrupt block, and the rest is used as stack space.
 */
#define MIN_INT_STACK_SIZE (INT_BLOCK_SIZE + 10)

/*
 * define the possible interrupt sources
 */
enum int_src {
   OFF=0, // interrupts off
   CT1,   // CT-passed-CT1, established by _set_ct1
   CT2,   // CT-passed-CT2, established by _set_ct2
   CT3,   // CT-passed-CT3, established by _set_ct3
   SE1,   // SE1 event occurred, established by _set_se1    
   SE2,   // SE2 event occurred, established by _set_se2
   SE3,   // SE3 event occurred, established by _set_se3
   SE4,   // SE4 event occurred, established by _set_se4
   PAT,   // Pin pattern match or mismatch occurred, established by _set_pat
   FBW,   // Hub RAM FIFO interface wrapped and reloaded
   XMT,   // Streamer is ready for another command
   XFI,   // Streamer ran out of commands
   XRO,   // Streamer NCO rolled over
   XRL,   // Streamer read location $1FF of lookup RAM
   ATN,   // Attention requested by other cog(s)
   QMT    // CORDIC read but no results available
};

/*
 * set up initial counter interrupt source (after this, use _add_CTx)
 */
void _set_CT1(unsigned long CT1);
void _set_CT2(unsigned long CT2);
void _set_CT3(unsigned long CT3);

/*
 * add to counter interrupt source (initially set up by _set_CTx)
 */
void _add_CT1(unsigned long CT1);
void _add_CT2(unsigned long CT2);
void _add_CT3(unsigned long CT3);

/*
 * set up pattern interrupt source (A = 0, B = 1, EQ = 0, NE = 1)
 */
void _set_PAT(int A_or_B, int EQ_OR_NE, unsigned long MASK, unsigned long MATCH);

/*
 * set up configurable interrupt sources
 */
void _set_SE1(unsigned long SE1);
void _set_SE2(unsigned long SE2);
void _set_SE3(unsigned long SE3);
void _set_SE4(unsigned long SE3);

/*
 * nix (cancel) an interrupt
 */
void _nix_int_1();
void _nix_int_2();
void _nix_int_3();

/*
 * simulate (trigger) an interrupt
 */
void _sim_int_1();
void _sim_int_2();
void _sim_int_3();

/*
 * set up (establish) an interrupt service function
 */
void _set_int_1(enum int_src SRC, _interrupt SVC, void *stack);
void _set_int_2(enum int_src SRC, _interrupt SVC, void *stack);
void _set_int_3(enum int_src SRC, _interrupt SVC, void *stack);

/*
 * clear (remove) an interrupt service function
 */
void _clr_int_1();
void _clr_int_2();
void _clr_int_3();

/*
 * get interrupt status
 */
unsigned long _get_status();

/*
 * poll for interrupt XXX
 * returns 0 if event has not occured, 1 if event has occurred
 */
unsigned long _poll_ANY(); 
unsigned long _poll_CT1(); 
unsigned long _poll_CT2(); 
unsigned long _poll_CT3(); 
unsigned long _poll_SE1(); 
unsigned long _poll_SE2(); 
unsigned long _poll_SE3(); 
unsigned long _poll_SE4(); 
unsigned long _poll_PAT(); 
unsigned long _poll_FBW(); 
unsigned long _poll_XMT(); 
unsigned long _poll_XFI(); 
unsigned long _poll_XRO(); 
unsigned long _poll_XRL(); 
unsigned long _poll_ATN(); 
unsigned long _poll_QMT(); 

/*
 * wait for interrupt XXX
 * returns with 0 if timeout occurred, or 1 if event occurred
 */
unsigned long _wait_ANY(unsigned long timeout);
unsigned long _wait_CT1(unsigned long timeout);
unsigned long _wait_CT2(unsigned long timeout);
unsigned long _wait_CT3(unsigned long timeout);
unsigned long _wait_SE1(unsigned long timeout);
unsigned long _wait_SE2(unsigned long timeout);
unsigned long _wait_SE3(unsigned long timeout);
unsigned long _wait_SE4(unsigned long timeout);
unsigned long _wait_PAT(unsigned long timeout);
unsigned long _wait_FBW(unsigned long timeout);
unsigned long _wait_XMT(unsigned long timeout);
unsigned long _wait_XFI(unsigned long timeout);
unsigned long _wait_XRO(unsigned long timeout);
unsigned long _wait_XRL(unsigned long timeout);
unsigned long _wait_ATN(unsigned long timeout);

/*
 * request the attention of all the cogs specified in 'cogs' bits 0 .. 15
 */
void _cog_ATN(unsigned long cogs);

#endif
