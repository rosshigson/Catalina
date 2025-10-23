 /***************************************************************************\
 *                                                                           *
 *                            Dynamic Kernel Demo                            *
 *                                                                           *
 * This program shows how to use the utility function _thread_cog to start   *
 * and stop a multi-threaded kernel, and use it to run a simple C function.  *
 *                                                                           *
 * The program can use either _thread_cog or _threadstart_C to start the     *
 * new cog, by setting USE_THREADSTART_C to 0 or 1                           *
 *                                                                           *
 \***************************************************************************/

/*
 * include propeller functions
 */
#include <prop.h>
#ifdef __CATALINA_P2
#include <prop2.h>
#endif

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thutil.h>

/*
 * which start function to use ...
 */
#define USE_THREADSTART_C 1 // 0 to use _thread_cog, 1 to use _threadstart_C

/*
 * whether or not the dynamic cog should print its arguments
 */
#define PRINT_ARGC_ARGV 1 // 0 to print nothing, 1 to print arguments

/*
 * define the pin to use for output (pin 1 is the debug LED 
 * on the Hybrid or Hydra, pin 16 is the VGA LED on the C3)
 */
#if defined (__CATALINA_C3)
#define OUTPUT_PIN 16 // use VGA pin (and dira, outa) on C3
#define _dir _dira
#define _out _outa
#elif defined (__CATALINA_P2_EVAL)
#define OUTPUT_PIN (57-32) // use pin 57 (and dirb, outb) on P2_EVAL
#define _dir _dirb
#define _out _outb
#else
#define OUTPUT_PIN 1 // use pin 1 (and dira, outa) on other platforms
#define _dir _dira
#define _out _outa
#endif

/*
 * define the size to use for the stack of the new thread
 */
#define STACK_SIZE MIN_THREAD_STACK_SIZE + 100

static int lock;

/*
 * define a C function to be executed by the dynamic kernel 
 * (cycles the output pin at a frequency of 1Hz).
 *
 */
int function(int argc, char *argv[]) {
   unsigned count;
   unsigned mask   = 1<<(OUTPUT_PIN-1);
   unsigned on_off = 1<<(OUTPUT_PIN-1);

   _dir(mask, mask);
   _out(mask, on_off);
   count = _cnt();

#if PRINT_ARGC_ARGV == 1
   t_printf("\nargc = %4X\nargv[0] = %s\nargv[1] = %s\nargv[2] = %s\n\n",
            argc, argv[0], argv[1], argv[2]);
#endif

   while (1) {
      _out(mask, on_off);
      count += _clockfreq() / 2;
      _waitcnt(count);
      on_off ^= mask;
   }
   return 0;
}

/*
 * The main C program - loops forever, starting and stopping 
 * a C function running in a dynamic multi-threading kernel 
 */
int main(void) {

   int cog;
   int argc = 3;
   char *argv[3] = {"main", "hello", "there!"};

#if USE_THREADSTART_C == 1
   char stack[STACK_SIZE*4]; // _threadstart C uses bytes
#else
   unsigned long stack[STACK_SIZE]; // _thread_cog uses longs
#endif

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   _thread_wait(3000);

   while (1) {
      t_printf("starting ...\n");

#if USE_THREADSTART_C == 1
      cog = _threadstart_C(&function, argc, argv, stack, STACK_SIZE*4);
#else
      cog = _thread_cog(&function, &stack[STACK_SIZE], argc, argv);
#endif
      if (cog < 0) {
         t_printf("... failed\n");
         // cog_start failed - turn on LED and leave it on
         _dir(OUTPUT_PIN, OUTPUT_PIN);
         _out(OUTPUT_PIN, OUTPUT_PIN);
      }

      _thread_wait(10000);

      t_printf("stopping ...\n");
      _cogstop(cog);

      _thread_wait(5000);

   }

   return 0;
}
