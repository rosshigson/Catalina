 /***************************************************************************\
 *                                                                           *
 *                         Test Thread Operations                            *
 *                                                                           *
 *          Demonstrates thread stop, join and affinity change (move)        *
 *                                                                           *
 *       (i.e. stopping, joining and moving threads on different cogs)       *
 *                                                                           *
 \***************************************************************************/

#include <ctype.h>

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
 * define how many additional kernel cogs we want:
 */
#define NUM_KERNELS 3

/*
 * define how many additional threads we want each kernel to run:
 */
#define NUM_THREADS 4

/*
 * define the stack size for each cog and thread function:
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 100)

/*
 * define the number of times to retry various things:
 */
#define MAX_RETRIES 1000

/*
 * define an array to hold the id of each additional thread:
 */
static void *thread[NUM_KERNELS * NUM_THREADS];

/*
 * define the size of the resource thread lock pool:
 */
#define NUM_LOCKS 1


/*
 * define some global variables that all threads can share:
 */

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

static int kernel_lock;          // cog lock to prevent kernel contention
static int hmi_lock;             // thread lock to protect HMI calls
static int request = 0;          // request sent to thread (ping, join, move)
static int kernel[8];            // first thread number this kernel is running

/*
 * thread_function : this function will run as a new thread. 
 *                   It responds to ping, exit, join or move
 *                   requests.
 */
int thread_function(int me, char *not_used[]) {

   int cog;

   while (1) {
      if (request == me) {
         // ping request - just print our id
         _thread_printf(pool, hmi_lock, 
                        " thread %d pinged on cog %d", me, _cogid());
         request = 0;
      }
      else if (request == -me) {
         // exit request - just perform a graceful exit
         _thread_printf(pool, hmi_lock, " thread %d exiting", me);
         request = 0;
         return -me;
      }
      else if (request == 1000 * me) {
         // join request - wait a second, then exit
         // (another thread will join this one to retrieve the return value)
         _thread_printf(pool, hmi_lock, " thread %d waiting", me);
         _thread_wait(1000);
         request = 0;
         return 1000 * me; // retrieve this result by joining this thread
      }
      else if (request == -1000 * me) {
         // move request - move to the next cog
         // executing a multi-threaded kernel
         cog = (_cogid() + 1) % 8;
         while (!kernel[cog]) {
            cog = (cog + 1) % 8;
         }
         if (_thread_affinity_change(_thread_id(), cog) > 0) {
            _thread_printf(pool, hmi_lock, 
                           " thread %d now on cog %d", me, _cogid());
         }
         else {
            _thread_printf(pool, hmi_lock, 
                           " thread %d move failed, on cog %d", me, _cogid());
         }
         request = 0;
      }
      else {
         // nothing to do, so yield
         _thread_yield();
      }
   }
   return 0;
}

/*
 * cog_function : this function will be run as the first thread
 *                executed by a multi-threading kernel on a new 
 *                cog. It starts additional threads running in 
 *                the same kernel, but otherwise does nothing. 
 */
int cog_function(int first, char *not_used[]) {

   int cog;
   int i;

   // stack space for the additional threads we will start
   unsigned long thread_stack[STACK_SIZE * NUM_THREADS];

   // get our cog id 
   cog = _cogid();

   // set the lock of this kernel (all kernels must use the same lock)
   _thread_set_lock(kernel_lock);

   // now start additional threads in this kernel
   for (i = 0; i < NUM_THREADS; i++) {
      thread[first + i] = _thread_start(&thread_function, 
            &thread_stack[STACK_SIZE * (i + 1)], first + i, NULL);
      if (thread[first + i] == 0) {
         _thread_printf(pool, hmi_lock, "Failed to start thread\n");
         while (1) { };
      }
   }

   // indicate this cog is running a multi-threading kernel
   // and the numbers of the threads this kernel is executing
   kernel[cog] = first;
   _thread_printf(pool, hmi_lock, "Executing threads %d to %d on cog %d\n", 
         first, first + NUM_THREADS - 1, cog);

   // now wait forever - this thread does not actually do anything
   // except start the threads it has been asked to run. It could 
   // perform other tasks if required. However, it cannot exit or
   // the thread stack space we have allocated will be lost.
   while (1) { 
      _thread_yield();
   }

   return 0;
}

/*
 * main : start NUM_KERNELS additional kernels, then allow the
 *        user to perform various commands on the threads running 
 *        in those kernels.
 */
int main(int argc, char *argv[]) {

   int i;
   int cog;
   char cmd;
   int result;
   int retries;

   // stack space for the additional kernels we will start 
   // (note that this must also include stack space for their threads)
   unsigned long kernel_stack[NUM_KERNELS * (STACK_SIZE * NUM_THREADS + 100)];
   
   // assign a lock to be used to avoid kernel contention 
   kernel_lock = _locknew();

   // set the lock of this kernel (all kernels must use the same lock)
   _thread_set_lock(kernel_lock);

   // create a lock (pool) to protect our common resource
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to protect the HMI functions
   hmi_lock = _thread_locknew(pool);

   _thread_printf(pool, hmi_lock, "Press a key to start the kernels\n\n");
   k_wait();

   // start the additional multi-threaded kernels
   for (i = 0; i < NUM_KERNELS; i++) {
      cog = _thread_cog(&cog_function, 
            &kernel_stack[(STACK_SIZE * NUM_THREADS + 100) * (i + 1)], 
            i * NUM_THREADS + 1, NULL);
      if (cog < 0) {
         // coginit failed 
         _thread_printf(pool, hmi_lock, "Failed to start kernel\n");
         while (1) { };
      }
   }

   // give the kernels a chance to start their threads
   _thread_wait(500);

   // now prompt to exit, ping, stop, join or move each thread in turn
   while (1) {

      for (i = 1; i < NUM_KERNELS * NUM_THREADS + 1; i++) {

         // print the number and affinity of the thread
         _thread_printf(pool, hmi_lock, "\nThread %d (af=%x) ", i, 
               _thread_affinity(thread[i]));
         if ((_thread_affinity(thread[i]) & 0x0000C000) == 0) {
            _thread_printf(pool, hmi_lock, "executing\n", i);
         }
         else {
            _thread_printf(pool, hmi_lock, "stopped\n", i);
         }

         // get a command to execute on the the thread
         _thread_printf(pool, hmi_lock, 
            "\n Press E (exit), P (ping), S (stop), J (join) or M (move):");
         cmd = k_wait();

         // now process the command 
         switch (toupper(cmd)) {

            case 'P' :
               // ping the thread
               _thread_printf(pool, hmi_lock, " Ping\n Pinging %d:", i);
               request = i;
               // wait till thread responds or we have tried MAX_RETRIES times
               retries = 0;
               while (request && (retries++ < MAX_RETRIES)) {
                  // nothing to do, so yield
                  _thread_wait(1);
               };
               if (retries >= MAX_RETRIES) {
                  _thread_printf(pool, hmi_lock, 
                                 " thread %d did not respond (stopped?)", i);
               }
               request = 0;
               break;

            case 'E' :
               // ask the thread to exit (gracefully)
               _thread_printf(pool, hmi_lock, " Exit\n Exiting %d:", i);
               request = -i;
               // wait till thread terminated
               retries = 0;
               while ((_thread_affinity(thread[i]) & 0x0000C000) == 0 
               &&     (retries++ < MAX_RETRIES)) {
                  // nothing to do, so yield
                  _thread_wait(1);
               };
               if (retries >= MAX_RETRIES) {
                  _thread_printf(pool, hmi_lock, 
                                 " thread %d did not respond (stopped?)", i);
               }
               else {
                  _thread_printf(pool, hmi_lock, ": thread %d exited", i);
               }
               request = 0;
               break;

            case 'S' :
               // stop the thread (ungracefully)
               _thread_printf(pool, hmi_lock, " Stop\n Stopping %d:", i);
               if (_thread_affinity_stop(thread[i]) == 0) {
                  _thread_printf(pool, hmi_lock, 
                                 " thread %d cannot be stopped", i);
               }
               else {
                  _thread_printf(pool, hmi_lock, " thread %d stopping", i);
                  // wait till thread terminated 
                  retries = 0;
                  while (((_thread_affinity(thread[i]) & 0x0000C000) == 0) 
                  &&     (retries++ < MAX_RETRIES)) {
                     // nothing to do, so yield
                     _thread_wait(1);
                  };
                  if (retries >= MAX_RETRIES) {
                     _thread_printf(pool, hmi_lock, 
                                    " thread %d did not respond (stopped?)", i);
                  }
                  else {
                     _thread_printf(pool, hmi_lock, ": thread %d stopped", i);
                  }
               }
               break;

            case 'J' :
               // join the thread (and print returned value)
               _thread_printf(pool, hmi_lock, " Join\n Joining %d:", i);
               request = 1000 * i;
               if (_thread_join(thread[i], &result) == 0) {
                  _thread_printf(pool, hmi_lock,
                                 " thread %d cannot be joined", i);
               }
               else {
                  _thread_printf(pool, hmi_lock, ": result %d", result);
               }
               break;

            case 'M' :
               // change affinity of the thread (i.e. ask it to move to another cog)
               _thread_printf(pool, hmi_lock, " Move\n Moving %d:", i);
               request = - 1000 * i;
               // wait till thread responds
               retries = 0;
               while (request && (retries++ < MAX_RETRIES)) {
                  // nothing to do, so yield
                  _thread_wait(1);
               };
               if (retries >= MAX_RETRIES) {
                  _thread_printf(pool, hmi_lock, 
                                 " thread %d did not respond (stopped?)", i);
               }
               request = 0;
               break;

            default :
               _thread_printf(pool, hmi_lock, " no command");
               break;

         }   
         _thread_printf(pool, hmi_lock, "\n", i);
         _thread_wait(1);
      }
   }

   return 0;
}
