/******************************************************************************
 *                                                                            *
 *                         The Sieve of Eratosthenes                          *
 *                                                                            *
 *            This is a "classic" version of the sieve program.               *
 *                                                                            *
 * A command used to compile this program might look like:                    *
 *                                                                            *
 *    catalina -p2 sieve_original.c -lci -O5                                  *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>

/*
 * define the size of the sieve (if not already defined):
 */
#ifndef SIEVE_SIZE
#define SIEVE_SIZE   100
#endif

/*
 * main : allocate and initialize the sieve, then eliminate all multiples
 *        of primes, then print the resulting primes.
 */ 
void main(void){
   unsigned long i, j;
   unsigned long k = 1;
   unsigned char *primes = NULL;

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

   // eliminate multiples of primes
   for (i = 2; i < SIEVE_SIZE/2; i++) {
      if (primes[i] == 0) {
         for (j = 2; i*j < SIEVE_SIZE; j++) {
            primes[i*j] = 1;
         }
      }
   }

   // print the resulting primes, starting from 2
    for (i = 2; i < SIEVE_SIZE; i++) {
       if (primes[i] == 0) {
          printf("prime(%d)= %d, ", k++, i);
       }
   }

   while(1);
}
