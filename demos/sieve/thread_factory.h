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

#include <catalina_threads.h>
#include <catalina_cog.h>
#include <stdlib.h>

/*
 * declare a type for our factory:
 */
typedef struct factory_struct FACTORY;

/*
 * create_factory : create a factory with the specified number of cogs, the
 *                  specified stack size for each cog, and use the specified 
 *                  kernel lock.
 */ 
FACTORY *create_factory(int num_cogs, int stack_size, int kernel_lock);

/*
 * create_worker : create a worker thread to work in the specified factory,
 *                 using the specified worker function, and with the specified
 *                 stack size and ticks between context switches. The worker 
 *                 will be passed the specified argc and argv parameters.
 */
void *create_worker(FACTORY *factory, _thread worker, int stack_size, int ticks, int argc, char *argv[]);

/*
 * factory_cogs : return the number of cogs in the factory
 */
int factory_cogs(FACTORY *factory);

/*
 * idle : currently, idle just does a yield. Eventually, it may also be 
 *        used in dynamically calculating the current load on the cog.
 */
#define idle() _thread_yield()

