 /***************************************************************************\
 *                                                                           *
 *                          Simple Interrupt Demo                            *
 *                                                                           *
 *    Demonstrates a C main program, with C interrupt service functions      *
 *                                                                           *
 *    NOTE: This program will only work on the P2, since the P1 does not     *
 *    support interrupts                                                     *
 *                                                                           *
 * Compile it with a command like (in Catalina 5.9.4 or earlier):            *
 *                                                                           *
 *   catalina -p2 -lci -linterrupts interrupts.c -C P2_EVAL                  *
 *                                                                           *
 * or (in Catalina 6.0 or later):                                            *
 *                                                                           *
 *   catalina -p2 -lci -lint interrupts.c -C P2_EDGE                         *
 *                                                                           *
 \***************************************************************************/

#include <stdio.h>
#include <propeller2.h>
#include <int.h>

/*
 * define the stack size each interrupt needs (since this number depends  
 * on the function executed by the interrupt, the stack size has to be 
 * established by trial and error):
 */
#define INT_STACK_SIZE (MIN_INT_STACK_SIZE + 100)

/*
 * define the pins that we will toggle in the interrupt functions
 */
#if defined (__CATALINA_P2_EDGE)
#define PIN_SHIFT (38-32) // use pin 38,39,40 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#elif defined (__CATALINA_P2_EVAL)
#define PIN_SHIFT (56-32) // use pin 56,57,58 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define PIN_SHIFT 0 // use pin 0,1,2 (and dira, outa) on other platforms
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
    t_printf(" << Interrupt 1! >> ");
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
    t_printf(" << Interrupt 2! >> ");
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
    t_printf(" << Interrupt 3! >> ");
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
        // just use the various _wait functions because doing so stalls 
        // the interrupts - but we also can't use the _iwait functions 
        // because they use interrupt 2 which we want to use ourselves). 
        // For programs wanting to use all the interrupts, busy waiting 
        // may be the only solution ...
        for (i = 1; i < 10000; i++) { }
    }
}
