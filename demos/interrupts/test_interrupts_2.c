 /***************************************************************************\
 *                                                                           *
 *    Demonstrates a C main program, with C interrupt service functions      *
 *                                                                           *
 * NOTE: This program will only work on the P2, since the P1 does not        *
 * support interrupts.                                                       *
 *                                                                           *
 * Compile it with a command like (in Catalina 5.9.4 or earlier):            *
 *                                                                           *
 *   catalina -p2 -lci -linterrupts interrupts.c -C P2_EVAL                  *
 *                                                                           *
 * or (in Catalina 6.0 or later):                                            *
 *                                                                           *
 *   catalina -p2 -lci -lint interrupts.c -C P2_EDGE                         *
 *                                                                           *
 *                                                                           *
 \***************************************************************************/

#include <stdio.h>
#include <propeller2.h>
#include <int.h>

// define the stack size each interrupt needs 
#define INT_STACK_SIZE (MIN_INT_STACK_SIZE + 100)

#ifdef __CATALINA_COMPACT
// in COMPACT mode we can support about 500 interrupts per second
#define INTERRUPTS_PER_SECOND 500
#else
// in NATIVE or TINY mode we can support about 20000 interrupts per second
#define INTERRUPTS_PER_SECOND 20000
#endif

// define the LED pin to use:
#if defined (__CATALINA_P2_EDGE)
#define PIN_SHIFT (38-32) // use pin 38 on the P2_EDGE
#define _dir _dirb
#define _out _outb
#elif defined (__CATALINA_P2_EVAL)
#define PIN_SHIFT (56-32) // use pin 56 on the P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define PIN_SHIFT 0 // use pin 0 on other platforms
#define _dir _dira
#define _out _outa
#endif

static unsigned long led_mask = 1<<(PIN_SHIFT);
static unsigned long on_off   = 1<<(PIN_SHIFT);
static unsigned long counter  = 0;

// return a random from 1 .. range
int random(int range) {
  return 1 + (int)(((float)range*(float)rand())/32768);
}

// interrupt_x : these functions can serve as interrupt service routines. 
//               Such functions must have no arguments, and must return - but
//               cannot return a value. They must be set as an interrupt 
//               using one of the _set_int_x functions. Note that we would
//               not normally do anything as silly as calling 'printf' in an 
//               interrupt service routine - but we CAN!

// interrupt_1 - increment the counter INTERRUPTS_PER_SECOND times per second 
void interrupt_1(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT1(_clockfreq()/INTERRUPTS_PER_SECOND);
    counter++;
}

// interrupt_2 - print the current value of the counter every second
void interrupt_2(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT2(_clockfreq());
    printf(" Counter = %lu \n", counter);
}

// interrupt 3 - throw a random spanner into the works!
void interrupt_3(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT3((random(10))*_clockfreq());
    printf(" << A SPANNER >> \n");
}

void main(void) {
    int i;

    // declare some space that will be used as stack by the interrupts
    long int_stack[INT_STACK_SIZE * 3];

    // set up the direction and initial value of the LED pin 
    _dir(led_mask, led_mask);
    _out(led_mask, on_off);

    printf("Press a key to start\n");
    k_wait();

    // these are counter interrupts so set up the initial counters 
    _set_CT1(_clockfreq()/INTERRUPTS_PER_SECOND);
    _set_CT2(_clockfreq());
    _set_CT3(1+random(10)*_clockfreq());

    // set up our interrupt service routines
    _set_int_1(CT1, &interrupt_1, &int_stack[INT_STACK_SIZE * 1]);
    _set_int_2(CT2, &interrupt_2, &int_stack[INT_STACK_SIZE * 2]);
    _set_int_3(CT3, &interrupt_3, &int_stack[INT_STACK_SIZE * 3]);

    // now just let the interrupts do their thing
    while(1) {
        // toggle the LED to show some activity. 
        _out(led_mask, (on_off ^= led_mask));
        // waste some time just to slow things down (note that we can't
        // just use the various _wait functions because doing so stalls 
        // the interrupts - but we also can't use the _iwait functions 
        // because they use interrupt 2 which we want to use ourselves). 
        // For programs wanting to use all the interrupts, busy waiting 
        // may be the only solution ...
        for (i = 1; i < 1000000; i++) { }
    }
}
