/******************************************************************************
 *                                                                            *
 *                              Thread Factory                                *
 *                                                                            *
 * This is a simple prototype of a thread factory. We can create a factory    *
 * from one or more free cogs, and then create worker threads who will work   *
 * in the factory. In this proof of concept, the workers are simply allocated *
 * to cogs in a "round-robin" fashion. In the final version, they will be     *
 * allocated (and moved dynamically between cogs) in order to balance the     *
 * load on each cog in the factory.                                           *
 *                                                                            *
 ******************************************************************************/

#include "thread_factory.h"

/*
 * define a structure to hold factory data
 */
struct factory_struct {
   int cogs[ANY_COG];
   int cog_count;
   int last_used;
};

/*
 * all multi-threading kernels in all factories must use the same lock
 */
static int factory_lock = -1;

/*
 * foreman : this function will be run as the first thread of a new 
 *           multi-threading kernel on a new cog. It does nothing, forever.
 */
static int foreman(int argc, char *not_used[]) {

   // set the lock of this kernel (all kernels must use the same lock, and
   // this must be set up before any other thread functions are called)
   _thread_set_lock(factory_lock);

   // now wait forever - this thread does not actually do anything
   // except give the multi-threading kernel something to execute
   // when it is not executing any other threads. It could perform
   // other tasks if required. 
   while (1) {
      idle();
   }

   return 0;
}

/*
 * create_factory : create a factory with the specified number of cogs, the
 *                  specified stack size for each cog, and use the specified 
 *                  kernel lock.
 */ 
FACTORY *create_factory(int num_cogs, int stack_size, int lock) {
   FACTORY *factory = NULL;
   long *s = NULL;
   int i;

   factory_lock = lock;

   factory = malloc(sizeof(FACTORY));
   if (factory != NULL) {
      for (i = 0; i < ANY_COG; i++) {
         factory->cogs[i] = -1;
      }
      factory->last_used = 0;
      factory->cog_count = 0;
      // start the multi-threading kernels
      for (i = 0; i < num_cogs; i++) {
         s = malloc(stack_size*4);
         if (s != NULL) {
            factory->cogs[i] = _thread_cog(&foreman, s + stack_size, 0, NULL);
            if (factory->cogs[i] >= 0) {
               factory->cog_count++;
               factory->last_used = i;
            }
         }
      }
   }
   return factory;
}

/*
 * create_worker : create a worker thread to work in the specified factory,
 *                 using the specified worker function, and with the specified
 *                 stack size and ticks between context switches. The worker 
 *                 will be passed the specified argc and argv parameters.
 */
void *create_worker(FACTORY *factory, _thread worker, int stack_size, int ticks, int argc, char *argv[]) {
   long *s = NULL;
   void *w = NULL;

   if (factory != NULL) {
      if (factory->cog_count > 0) {
         s = malloc(stack_size*4);
         if (s != NULL) {
            while (factory->cogs[factory->last_used] < 0) {
               factory->last_used = (factory->last_used + 1)%ANY_COG;
            }
            w = _thread_start(worker, s + stack_size, argc, argv);
            if (ticks > 0) {
               _thread_ticks(w, ticks);
            }
            _thread_affinity_change(w, factory->cogs[factory->last_used]);
            factory->last_used = (factory->last_used + 1)%ANY_COG;
            // give the affinity change an opportunity to be processed ...
            idle();
         }
      }
   }
   return w;
}

/*
 * factory_cogs : return the number of cogs in the factory
 */
int factory_cogs(FACTORY *factory) {
   return factory->cog_count;
}
