/******************************************************************************
 *                                                                            *
 *                         The Sieve of Eratosthenes                          *
 *                                                                            *
 *        This is a multi-threaded version. We can select the number of       *
 *        threads we want to execute, but all the threads will execute on     *
 *        the same cog.                                                       *
 *                                                                            *
 *        Note that due to the overhead of context switching between threads, *
 *        this version executes slightly slower than the single-threaded      *
 *        version, although it is very comparable if the number of threads    *
 *        is set to "1". Also, increasing the number of threads does not      *
 *        increase performance - in fact, it reduces it. This is expected.    *
 *                                                                            *
 *        It is worth pointing out that one reason this program works is      *
 *        that it uses a byte array as the sieve, and since the only reason   *
 *        to write to the byte array once the program is eliminating primes   *
 *        is to indicate the integer represented is NOT prime, it does not    *
 *        matter if the same byte is overwritten by multiple threads.         *
 *                                                                            *
 * A command used to compile this program might look like:                    *
 *                                                                            *
 *    catalina -p2 sieve_multi_threaded.c -lci -lthreads -O5                  *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

/*
 * include Catalina multi-threading:
 */
#include <catalina_threads.h>

/*
 * define the size of the sieve (if not already defined):
 */
#ifndef SIEVE_SIZE
#define SIEVE_SIZE   100
#endif

/*
 * define stack size for workers:
 */
#define STACK_SIZE   60

/*
 * define how many worker threads we want:
 */
#define NUM_WORKERS  10

/*
 * the dynamically allocated sieve array will go here:
 */
static unsigned char *primes = NULL;

/*
 * define a place to put the prime number a worker thread should process 
 * (0 means thread is either not started, or is waiting for a new prime)
 */
static unsigned long int my_prime[NUM_WORKERS] = { 0 };

/*
 * idle : idle just does a thread yield, indicating we have no work to do
 */
#define idle() _thread_yield()

/*
 * eliminate_multiples: eliminate all multiples of a prime from the sieve
 *
 * This is our worker thread function - note that the "me" parameter passed is
 * a thread number, which the worker uses to look up their allocated prime
 * in the array "my_prime" - this is just an easy way of passing a parameter
 * other than a plain int, and also indicating completion of our task.
 */
int eliminate_multiples(int me, char *unused[]) {
   unsigned long i;
   unsigned long j;

   while (1) {
      // get my allocated prime
      while ((i = my_prime[me]) == 0) {
         idle();
      }
      // eliminate multiples 
      for (j = 2; i*j < SIEVE_SIZE; j++) {
         primes[i*j] = 1;
      }
      // indicate we are done
      my_prime[me] = 0;
   }
   return 0;
}

/*
 * create_worker: create a worker thread.
 */
void *create_worker(_thread worker, int stack_size, int ticks, int argc, char *argv[]) {
   long *s = NULL;
   _thread *w = NULL;

    s = malloc(STACK_SIZE*4);
    if (s != NULL) {
       w = _thread_start(worker, s + STACK_SIZE, argc, argv);
       if (ticks > 0) {
          _thread_ticks(w, ticks);
       }
    }
    return w;
}

/*
 * next_worker - move to the next worker
 */
#define next_worker(j) (j = (j + 1)%NUM_WORKERS)

/*
 * main : allocate and initialize the sieve, then eliminate all multiples
 *        of primes, then print the resulting primes.
 */ 
void main(void){
   unsigned long i, j;
   unsigned long k = 1;
   unsigned long count;

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // allocate a byte array of suitable size
   primes = malloc(SIEVE_SIZE);

   if (primes == NULL) {
      t_printf("Cannot allocate array, press a key to exit");
      k_wait();
      exit(1);
   }

   // initialize sieve array to zero
   for (i = 0; i < SIEVE_SIZE; i++) {
      primes[i] = 0;
   }

   // create workers
   for (i = 0; i < NUM_WORKERS; i++) {
      if (create_worker(&eliminate_multiples, STACK_SIZE, 100, i, NULL) == NULL) {
          t_printf("Cannot create worker\n");
          exit(1);
      }
   }

   t_printf("starting ...\n");

   // remember starting time
   count = _cnt();

   // eliminate multiples of primes
   j = 0;

   for (i = 2; i < SIEVE_SIZE/2; i++) {
      if (primes[i] == 0) {
         // find a free worker thread, waiting as necessary
         while (my_prime[j] != 0) {
            next_worker(j);
            if (j == 0) {
               idle();
            }
         }
         // found a free worker thread, so give them some work!
         my_prime[j] = i;
         next_worker(j);
      }
   }

   // wait till all worker threads complete
   j = 0;

   while (1) {
      if (my_prime[j] != 0) {
         idle();
      }
      else {
         next_worker(j);
         if (j == 0) {
            break;
         }
      }
   }

   // calculate time taken
   count = _cnt() - count;
   t_printf("... done - %ld clocks\n", count);

   t_printf("\npress a key to see results\n");
   k_wait();

   // print the resulting primes, starting from 2
    for (i = 2; i < SIEVE_SIZE; i++) {
        if (primes[i] == 0) {
           t_printf("prime(%d)= %d, ", k++, i);
        }
    }

    t_printf("\n\ndone - press a key to exit");
    k_wait();
    exit(0);
}
