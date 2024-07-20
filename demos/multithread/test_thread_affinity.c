 /***************************************************************************\
 *                                                                           *
 *                          Thread Affinity Demo                             *
 *                                                                           *
 *            Demonstrates changing the affinity of a thread                 *
 *                                                                           *
 *      (i.e. moving threads between kernels running on different cogs)      *
 *                                                                           *
 \***************************************************************************/

/*
 * include Catalina multi-threading functions:
 */
#include <threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thutil.h>

/*
 * define how many additional kernel cogs we want (note: there must 
 * be this many free cogs available!):
 */
#define NUM_KERNELS 4

/*
 * define how many threads we want per kernel:
 */
#define NUM_THREADS 5 // 10 is too many for some modes on the Propeller 1!

/*
 * define how many thread locks we want (we only need 1 to protect
 * our HMI functions):
 */
#define NUM_LOCKS 1

/*
 * define the stack size for each kernel cog and each thread:
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 100)

/*
 * global variables that all multi-threaded cogs will share ...
 */

/*
 * flag to tell all kernels to start their threads:
 */
static int start_threads;

/*
 * flag to tell all threads to start switching between kernels:
 */
static int start_switching;

/*
 * a lock to use to avoid kernel contention (all kernels must use
 * the same lock for this purpose)
 */
static int kernel_lock;

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5):
 */
static char Pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

/*
 * The particular thread lock (out of the pool above) that we will use to 
 * protect our HMI functions:
 */
static int HMI_Lock;

/*
 * cogs running multithreading kernels notify the threads that they are
 * available by putting a 1 in this array:
 */
static int kernel[8] = { 0 };

/*
 * On the P2 Eval, flash some LEDs
 */
#ifdef __CATALINA_P2_EVAL
void drive_led(int led) {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
#endif  
   PASM(" drvnot r2");
}
#endif


/*
 * thread_function : this function can be started as a thread. It runs on the
 *                   cog it is started for a while, then moves itself to the 
 *                   next available cog (cogs running multi-threading kernels
 *                   are indicated by the value 1 in the kernel array).
 */
int thread_function(int argc, char *argv[]) {

   void *me = _thread_id();
   int old_cog;
   int new_cog;
   int rnd;

   // get our initial cog 
   old_cog = _cogid();

   // print where we were started
   _thread_printf(Pool, HMI_Lock, 
       "Thread %d (%s) started on cog %d\n", argc, argv[0], old_cog);


   // wait until we are told to start switching
   while (!start_switching) {
      _thread_yield();
   }

   while (1) {

      // wait a random time (to mix things up a little, but 
      // not go so fast that we can't read the messages!)
      _thread_wait(random(100));

      // get our current cog
      old_cog = _cogid();

      // find the next available multi-threading kernel
      new_cog = old_cog;
      do {
         new_cog = (new_cog + 1) % 8;
      } while (kernel[new_cog] == 0);

      // 50% of the time, move ourselves to the new kernel
      rnd = random(100);
      if ((rnd > 50) && (new_cog != _cogid())) {
         _thread_printf(
             Pool, HMI_Lock, 
             "Thread %d (%s) moving from cog %d to cog %d\n",
             argc, argv[0], old_cog, new_cog);
         _thread_affinity_change (me, new_cog);
      
        // get our new new cog
        new_cog = _cogid();
  
        // print a message about whether we moved (note that sometimes
        // not moving is not an error - it may be that two cogs tried
        // to move to the same destination cog before that cog had a chance 
        // to execute and perform the move, in which case only the first 
        // move will succeed).
        if ((new_cog != old_cog)) {
           _thread_printf(
               Pool, HMI_Lock, 
               "Thread %d (%s) moved from cog %d to cog %d\n",
               argc, argv[0], old_cog, new_cog);
        }
        else {
           _thread_printf(
               Pool, HMI_Lock, 
               "Thread %d (%s) FAILED to move from cog %d\n",
               argc, argv[0], old_cog);
        }
      }
   }
   return 0;
}


/*
 * cog_function : this function will be run as the first thread of a new 
 *                multi-threading kernel on a new cog. This function will
 *                then start NUM_THREADS threads, which will wander between
 *                all the available multi-threading kernels.
 */
int cog_function(int argc, char *argv[]) {

   int cog = _cogid();
   void *me = _thread_id();
   void *thread;
   char *message[1] = {"g'day!"};
   int i;

   // stack space for threads
   unsigned long thread_stack[STACK_SIZE * NUM_THREADS];

   // set the lock of this kernel (all kernels must use the same lock, and
   // this must be set up before any other thread functions are called)
   _thread_set_lock(kernel_lock);

   // announce ourselves 
   _thread_printf(
       Pool, HMI_Lock, 
       "Multi-threading kernel (%s) started on cog %d\n", argv[0], cog);

   // indicate we are available to run threads
   kernel[cog] = 1;

   // wait until we are told to start the threads
   while (!start_threads) {
      _thread_yield();
   }

   // start some threads that will wander between the kernels
   for (i = 0; i < NUM_THREADS; i++) {
      thread = _thread_start(&thread_function, 
                             &thread_stack[STACK_SIZE * (i + 1)], 
                             (cog+1)*10 + i, 
                             message);
      if (thread == 0) {
         _thread_printf(Pool, HMI_Lock, "Failed to start thread\n");
      }
   }

   // now wait forever - this thread does not actually do anything
   // except give the multi-threading kernel something to execute
   // when it is not executing any other threads. It could perform
   // other tasks if required.
   while (1) {
      _thread_yield();
#ifdef __CATALINA_P2_EVAL      
      _thread_wait(500);
      drive_led(57 + cog - 3);
#endif      
   }

   return 0;
}


/*
 * main : Start NUM_KERNELS additional kernels, and then start NUM_THREADS 
 *        threads that will switch between them. Each kernel will also start 
 *        NUM_THREADS threads of their own.
 */
int main(int argc, char *argv[]) {
   int i;
   int cog;
   void *thread;
   char *message[1] = {"hello!"};

   // stack space for kernels and threads   
   unsigned long kernel_stack[NUM_KERNELS * (STACK_SIZE * NUM_THREADS + 100)];
   unsigned long thread_stack[STACK_SIZE * NUM_THREADS];

   // assign a lock to be used to avoid kernel contention
   kernel_lock = _locknew();

   // set the lock of this kernel (all kernels must use the same lock, and
   // this must be set up before any other thread functions are called)
   _thread_set_lock(kernel_lock);
   
   // initialize a pool of thread locks
   _thread_init_lock_pool (Pool, NUM_LOCKS, _locknew());

   // assign a thread lock to avoid plugin contention
   HMI_Lock = _thread_locknew(Pool);

   // a delay here is used to introduce some randomness
   _thread_printf(Pool, HMI_Lock, "\nPress a key to start kernels\n");
   k_wait();
   randomize();

   // start additional multi-threading kernels
   for (i = 0; i < NUM_KERNELS; i++) {
      cog = _thread_cog(&cog_function, 
                        &kernel_stack[(STACK_SIZE*NUM_THREADS + 100)*(i + 1)], 
                        i, message);
      if (cog < 0) {
         _thread_printf(Pool, HMI_Lock, "Failed to start kernel\n");
      }
   }

   // announce ourselves
   cog = _cogid();
   _thread_printf(Pool, HMI_Lock, 
         "Multi-threading kernel also running on cog %d\n", cog);

   // declare ourselves available to run threads
   kernel[cog] = 1;

   _thread_wait(1000);

   // now start the threads on all the kernels
   _thread_printf(Pool, HMI_Lock, "\nPress a key to start all threads\n");
   k_wait();

   start_threads = 1;

   // start some threads of our own that will wander between the kernels
   for (i = 0; i < NUM_THREADS; i++) {
      thread = _thread_start(&thread_function, 
                             &thread_stack[STACK_SIZE * (i + 1)], 
                             (cog+1)*10 + i, 
                             message);
      if (thread == 0) {
         _thread_printf(Pool, HMI_Lock, "Failed to start thread\n");
      }
   }

   _thread_wait(1000);

   // now allow all the threads to switch between kernels
   _thread_printf(Pool, HMI_Lock, "\nPress a key to start switching\n");
   k_wait();

   start_switching = 1;

   // now wait forever - this thread does not actually do anything
   // except give the multi-threading kernel something to execute
   // when it is not executing any other threads. It could perform
   // other tasks if required.
   while (1) {
      _thread_yield();
#ifdef __CATALINA_P2_EVAL      
      _thread_wait(500);
      drive_led(56);
#endif
   }

   return 0;
}
