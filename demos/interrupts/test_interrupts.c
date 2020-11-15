 /***************************************************************************\
 *                                                                           *
 *                          Simple Interrupt Demo                            *
 *                                                                           *
 *    Demonstrates a C main program, with C interrupt service functions      *
 *                                                                           *
 *    NOTE: This program will only work on the P2, since the P1 does not     *
 *    support interrupts                                                     *
 *                                                                           *
 \***************************************************************************/

/*
 * Catalina interrupt support
 */
#include <catalina_interrupts.h>

/*
 * Catalina HMI functions (unlike stdio functions, these 
 * functions can be used in interrupt functions)
 */
#include <catalina_hmi.h>

/*
 * define the stack size each interrupt needs (since this number depends  
 * on the function executed by the interrupt, the stack size has to be 
 * established by trial and error):
 */
#define INT_STACK_SIZE (MIN_INT_STACK_SIZE + 100)

/*
 * define the pins that we will toggle in the interrupt functions
 */
#if defined (__CATALINA_P2_EVAL)
#define PIN_SHIFT (57-1-32) // use pin 57,58,59 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define PIN_SHIFT 0 // use pin 1,2,3 (and dira, outa) on other platforms
#define _dir _dira
#define _out _outa
#endif

/*
 * define some global variables to be used by the interrupt functions
 */
static unsigned long mask_1   = 1<<(PIN_SHIFT + 0);
static unsigned long on_off_1 = 1<<(PIN_SHIFT + 0);

static unsigned long mask_2   = 1<<(PIN_SHIFT + 1);
static unsigned long on_off_2 = 1<<(PIN_SHIFT + 1);

static unsigned long mask_3   = 1<<(PIN_SHIFT + 2);
static unsigned long on_off_3 = 1<<(PIN_SHIFT + 2);

/* 
 * interrupt_x : these functions can serve as interrupt service routines. 
 *               Such functions must have no arguments, and must return - but
 *               cannot return a value. They must be set as an interrupt 
 *               using one of the _set_int_x functions.
 */

void interrupt_1(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT1(20000000);

    // now toggle our LED
    _out(mask_1, (on_off_1 ^= mask_1));

    // just to demonstrate that we have full C functionality, do some output
    // (note: we would not usually do this in an interrupt routine!!!)
    t_printf("\n\n<< Interrupt 1! >>\n\n");
}

void interrupt_2(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT2(30000000);

    // now toggle our LED
    _out(mask_2, (on_off_2 ^= mask_2));

    // just to demonstrate that we have full C functionality, do some output
    // (note 1: we would not usually do this in an interrupt routine!!!)
    // (note 2: we cannot call any stdio operations while in an interrupt
    //          routine, and so instead of using printf we use t_printf) 
    t_printf("\n\n<< Interrupt 2! >>\n\n");
}

void interrupt_3(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT3(70000000);

    // now toggle our LED
    _out(mask_3, (on_off_3 ^= mask_3));

    // just to demonstrate that we have full C functionality, do some output
    // (note 1: we would not usually do this in an interrupt routine!!!)
    // (note 2: we cannot call any stdio operations while in an interrupt
    //          routine, and so instead of using printf we use t_printf) 
    t_printf("\n\n<< Interrupt 3! >>\n\n");
}

void main(void) {
    int i;

    // declare some space that will be used as stack by the interrupts
    long int_stack[INT_STACK_SIZE * 3];

    // the interrupt service routines toggle their LEDs on
    // interrupt - set up the direction and initial value  
    _dir(mask_1 | mask_2 | mask_3, mask_1 | mask_2 | mask_3);
    _out(mask_1 | mask_2 | mask_3, on_off_1 | on_off_2 | on_off_3);

    t_printf("Press a key to start\n");
    k_wait();

    // these are counter interrupts so set up the initial counters 
    _set_CT1(20000000);
    _set_CT2(30000000);
    _set_CT3(70000000);

    // set up our interrupt service routines - note that we need to point
    // to the TOP of the stack space we have reserved for each interrupt
    _set_int_1(CT1, &interrupt_1, &int_stack[INT_STACK_SIZE * 1]);
    _set_int_2(CT2, &interrupt_2, &int_stack[INT_STACK_SIZE * 2]);
    _set_int_3(CT3, &interrupt_3, &int_stack[INT_STACK_SIZE * 3]);

    while(1) {

        t_printf(".");

        // waste some time just to slow things down (note that we can't
        // just "wait" here, because waiting stalls the interrupts) - if
        // we are expecting interrupts, then busy waiting is appropriate 
        for (i = 1; i < 10000; i++) { }
    }
}
