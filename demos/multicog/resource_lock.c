 /***************************************************************************\
 *                                                                           *
 *                            Resource Lock Demo                             *
 *                                                                           *
 * This program shows how to use a lock to synchronize activity amongst      *
 * multiple cogs - e.g. to share access to a common resource.                *
 *                                                                           *
 * Note that the program looks more complicated than it actually is because  *
 * (for the demo) we actually allocate TWO locks - one for the HMI           *
 * functions, which would not be needed in a program that just wants a       *
 * simple resource lock - and one for the resources.                         *
 *                                                                           *
 \***************************************************************************/

/*
 * include the definitions of some useful multi-cog utility functions:
 */
#include "cogutil.h"

/*
 * define global variables that all cogs will share (we would define our
 * common resource here as well, so that all cogs can access it):
 */
static int HMI_lock;            // lock to protect HMI functions
static int resource_lock;       // lock to protect some common resources

/*
 * lock_function : C function that can be executed in a cog.
 *                (the only requirement for such a function is that it 
 *                be a void function that requires no parameters - to 
 *                share data with it, use commmon variables).
 */
void lock_function(void) {
   int me = _cogid(); // get my cog id (for printing messages)

   cogsafe_print_int(HMI_lock, "Cog %d started!\n", me);
   // let all cogs start before we do anything else
   wait (500); 

   // do something forever - but only when we have the lock!
   while (1) {

      // ensure we have the resource lock
      do { } while (!_lockset(resource_lock));

      // do some work here that requires access to the common resource
      while (1) {
         // just as a test, wait some random number of seconds, 
         // with a 50% chance of giving up the lock each second
         cogsafe_print_int(HMI_lock, "Cog %d has the lock!\n", me);
         wait(1000);
         if (random(100) < 50) {
            break;
         }
      }

      // release the resource lock
      _lockclr(resource_lock);
   }
}

/*
 * main : start up to 7 cogs, then let them all compete for the lock
 */
void main(void) {
   int i = 0;
   int cog = 0;
   unsigned long stacks[STACK_SIZE* 7];

   // assign a lock to protect the HMI functions
   HMI_lock = _locknew();

   // assign a lock to protect our common resource
   resource_lock = _locknew();

   cogsafe_print(HMI_lock, "Press a key to start\n");
   k_wait();
   randomize();

   // start instances of lock_function until there are no cogs left
   do {
      cog = _coginit_C(&lock_function, &stacks[STACK_SIZE*(++i)]);
   } while (cog >= 0);

   // now letting the other cogs do their thing, all competing for 
   // access to the resource lock - and do the same ourselves!
   lock_function();
}
