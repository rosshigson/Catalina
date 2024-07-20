/******************************************************************************
 *                                                                            *
 *                         The Sieve of Eratosthenes                          *
 *                                                                            *
 *      This is a "classic" version of the sieve program, augmented           *
 *      with the new Catalina Multi-processing pragmas, which will            *
 *      enable multi-processng if this program is compiled using the          *
 *      Catalina compiler, but ignored if it is compiled with another         *
 *      compiler. Multi-processing typically improves the program             *
 *      performance by 3 or 4 times (depending on the number of cogs          *
 *      available).                                                           *
 *                                                                            *
 * Commands to compile this program as a serial program on a P2 might be:     *
 *                                                                            *
 *    catalina -p2 sieve.c -lci -O5 -C NATIVE                                 *
 *                                                                            *
 * Commands to compile this program as a parallel program on a P2 might be:   *
 *                                                                            *
 *    catalina -p2 -Z sieve.c -lthreads -lci -O5 -C NATIVE                    *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>

// define the size of the sieve (if not already defined):
#ifndef SIEVE_SIZE
#if defined(__P2__)||defined(__CATALINA_P2)
#define SIEVE_SIZE   400000
#else
#define SIEVE_SIZE   12000
#endif
#endif

unsigned char *primes = NULL;

#pragma propeller worker(unsigned long i) local(unsigned long j) stack(60)

// main : allocate and initialize the sieve, then eliminate all multiples
//        of primes, then print the time taken, and all the resulting primes. 
void main(void){

   unsigned long i, j;
   unsigned long k = 1;
   unsigned long count;

   // allocate a byte array of suitable size
   primes = malloc(SIEVE_SIZE);

   if (primes == NULL) {
      // cannot allocate array
      exit(1); 
   }

   // initialize sieve array to zero
   for (i = 0; i < SIEVE_SIZE; i++) {
      primes[i] = 0;
   }

   t_printf("starting ...\n");

   #pragma propeller start

   // remember starting time
   count = _cnt();

   // eliminate multiples of primes
   for (i = 2; i < SIEVE_SIZE/2; i++) {
      if (primes[i] == 0) {

	 #pragma propeller begin 
         for (j = 2; i*j < SIEVE_SIZE; j++) {
            primes[i*j] = 1;
         }
	 #pragma propeller end
      }
   }

   #pragma propeller wait

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

   while(1);
}
