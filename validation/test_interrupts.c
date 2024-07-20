 /***************************************************************************\
 *                                                                           *
 *                        Thread and Interrupt Demo                          *
 *                                                                           *
 *    An interrupt test program designed to be validated by the Lua script   *
 *    'test_threads_and_interrupts.lua'                                      *
 *                                                                           *
 *    Demonstrates many threads executing concurrently on a single cog,      *
 *    in conjunction with interrupts going off periodically.                 *
 *                                                                           *
 *    NOTE: This program will only work on the P2, since the P1 does not     *
 *    support interrupts                                                     *
 *                                                                           *
 \***************************************************************************/

/*
 * Catalina interrupt support
 */
#include <int.h>

/*
 * Catalina multi-threading support
 */
#include <threads.h>

/*
 * Catalina HMI functions (unlike stdio functions, these 
 * functions can be used in interrupt functions)
 */
#include <hmi.h>

/*
 * include some useful multi-threading utility functions (but note
 * that we cannot call any thread functions while in an interrupt)
 */
#include <thutil.h>

/*
 * define how many threads we want
 */
#define THREAD_COUNT 100

/*
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the stack size has to be established by 
 * trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 100)

/*
 * define the stack size each interrupt needs (since this number depends  
 * on the function executed by the interrupt, the stack size has to be 
 * established by trial and error):
 */
#define INT_STACK_SIZE (MIN_INT_STACK_SIZE + 100)

/*
 * define the number of thread locks we want (we only need one)
 */
#define NUM_LOCKS 1

/*
 * define the pins that we will toggle in the interrupt functions
 */
#if defined (__CATALINA_P2_EVAL)
#define PIN_SHIFT (57-1-32) // use pin 57,58 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define PIN_SHIFT 0 // use pin 1,2 (and dira, outa) on other platforms
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

/*
 * define some global variables to be used by the thread functions
 */
static int ping;

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

/*
 * a lock allocated from the pool - required to protect the thread HMI
 * plugin functions
 */
static int lock;


/*
 * thread : this function can be executed as a thread. Multiple instances
 *          of this function can be started using the _thread_start function.
 */
int thread(int me, char *not_used[]) {

   while (1) {
      if (ping == me) {
         // print our id
         _thread_printf(pool, lock, "%d ", (unsigned)me);
         ping = 0;
      }
      else {
         // nothing to do, so yield
         _thread_yield();
      }
   }
   return 0;
}

/* 
 * interrupt_x : these functions can serve as interrupt service routines. 
 *               Such functions must have no arguments, and must return - but
 *               cannot return a value. They must be set as an interrupt 
 *               using one of the _set_int_x functions.
 */

void interrupt_1(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT1(100000000);

    // now toggle our LED
    _out(mask_1, (on_off_1 ^= mask_1));

    // just to demonstrate that we have full C functionality, do some output
    // (note 1: we would not usually do this in an interrupt routine!!!)
    // (note 2: we cannot call ANY thread operations while in an interrupt
    //          routine, and so instead of using _thread_printf we use 
    //          t_printf - but this may sometimes result in garbled output
    //          if an interrupt occurs when a thread is also performing I/O)
    t_printf(" <<Interrupt 1>> ");
}

void interrupt_2(void) {
    // we are a counter interrupt, so add to the counter for next time
    _add_CT2(300000000);

    // now toggle our LED
    _out(mask_2, (on_off_2 ^= mask_2));

    // just to demonstrate that we have full C functionality, do some output
    // (note 1: we would not usually do this in an interrupt routine!!!)
    // (note 2: we cannot call ANY thread operations while in an interrupt
    //          routine, and so instead of using _thread_printf we use 
    //          t_printf - but this may sometimes result in garbled output
    //          if an interrupt occurs when a thread is also performing I/O)
    t_printf(" <<Interrupt 2>> ");
}


/*
 * main : Start up to THREAD_COUNT threads, then ping each one in turn.
 *        Also, set up two timer interrupts that use interrupts 1 & 2 
 *        (note that a program that uses threads cannot use interrupt 3).
 */
void main(void) {

   int i = 0;
   void *thread_id;

   // declare some space that will be used as stack by the threads
   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   // declare some space that will be used as stack by the interrupts
   unsigned long int_stack[INT_STACK_SIZE * 2];

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // initialize a pool of thread locks (we need only 1 lock)
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to avoid HMI plugin contention
   lock = _thread_locknew(pool);

   _thread_printf(pool, lock, "Press a key to start\n");
   k_wait();

   // start THREAD_COUNT instances of our thread function. Note that we
   // need to point to the TOP of the stack space reserved for each thread
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&thread, &stacks[STACK_SIZE*i], i, NULL);
      _thread_printf(pool, lock, "thread %d ", i);
      if (thread_id == (void *)0) {
         _thread_printf(pool, lock, " failed to start\n");
         while (1) { };
      }
      else {
         _thread_printf(pool, lock, " started, id = %d\n", (unsigned)thread_id);
      }
   }

   // the interrupt service routines toggle their LEDs on
   // interrupt - set up the direction and initial value  
   _dir(mask_1 | mask_2, mask_1 | mask_2);
   _out(mask_1 | mask_2, on_off_1 | on_off_2);

   // these are counter interrupts so set up the initial counters
   _set_CT1(100000000);
   _set_CT2(300000000);

   // set up our interrupt service routines - note that we need to point
   // to the TOP of the stack space we have reserved for each interrupt

   // note: we cannot use interupt 3 in a multi-threaded program!!!

   _set_int_1(CT1, &interrupt_1, &int_stack[INT_STACK_SIZE * 1]);
   _set_int_2(CT2, &interrupt_2, &int_stack[INT_STACK_SIZE * 2]);

   // now loop forever, pinging each thread in turn. Periodically, an 
   // interrupt will occur ...
   while (1) {
      _thread_printf(pool, lock, "\n\nPinging all threads\n");
      for (i = 1; i <= THREAD_COUNT; i++) {
         _thread_printf(pool, lock, "%d:", i);
         // ping the thread
         ping = i;
         // wait till thread responds
         while (ping) {
            // nothing to do, so yield
            _thread_yield();
         };
      }
      // slow things down enough to read the messages
      for (i = 0; i < 1000; i++) {
         _thread_yield();
      }
   }
}
