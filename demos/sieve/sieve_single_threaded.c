/******************************************************************************
 *                                                                            *
 *                         The Sieve of Eratosthenes                          *
 *                                                                            *
 *      This is a single cog, single-threaded version. The only change from   *
 *      the original is that the elimination of multiples of primes has been  *
 *      converted to  a separate function, the sieve itself has been moved    *
 *      to be a static   variable external to the main function, and some     *
 *      messages and timing  calculations have been added.                    *
 *                                                                            *
 * A command used to compile this program might look like:                    *
 *                                                                            *
 *    catalina -p2 sieve_single_threaded.c -lci -O5                           *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

/*
 * define the size of the sieve (if not already defined):
 */
#ifndef SIEVE_SIZE
#define SIEVE_SIZE   100
#endif

/*
 * the dynamically allocated sieve array will go here:
 */
static unsigned char *primes = NULL;

/*
 * eliminate_multiples: eliminate all multiples of a prime from the sieve
 */
void eliminate_multiples(unsigned long int i) {
   unsigned long j;
   // eliminate multiples of prime j
   for (j = 2; i*j < SIEVE_SIZE; j++) {
      primes[i*j] = 1;
   }
}

/*
 * main : allocate and initialize the sieve, then eliminate all multiples
 *        of primes, then print the resulting primes.
 */ 
void main(void){
   unsigned long i, j;
   unsigned long k = 1;
   unsigned long count;

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

   t_printf("starting ...\n");

   // remember starting time
   count = _cnt();

   // eliminate multiples of primes
   for (i = 2; i < SIEVE_SIZE/2; i++) {
      if (primes[i] == 0) {
         eliminate_multiples(i);
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
