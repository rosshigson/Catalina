/******************************************************************************
 *                                                                            *
 *                         The Sieve of Eratosthenes                          *
 *                                                                            *
 *   This is a "classic" single-threaded version, but it uses an array        *
 *   of bits for the bitmap, not bytes. This means it can handle sieves       *
 *   around 8 times larger than the other versions - but the bit manipulation *
 *   used means it cannot easily be parallelized, because the bit operations  *
 *   are not atomic and it matters if the same array element (which contains  *
 *   32 sieve elements) were to be written by different threads.              *
 *                                                                            *
 * A command used to compile this program might look like:                    *
 *                                                                            *
 *    catalina -p2 sieve_bitmapped.c -lci -O5                                 *
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

#define ELEMENT_SIZE (CHAR_BIT*sizeof(unsigned long)) /* bits per element */

#define ARRAY_SIZE   ((SIEVE_SIZE)/ELEMENT_SIZE + 1) /* elements in bit array */

void main(void){
   unsigned long i, j;
   unsigned long *primes;
   unsigned long k = 1;
   unsigned long count;

   // allocate a bit array of suitable size
   primes = malloc(ARRAY_SIZE*sizeof(unsigned long));


   if (primes == NULL) {
      t_printf("Cannot allocate array, press a key to exit");
      k_wait();
      exit(1);
   }

   // initialize all array bits to zero
   for (i = 0; i < ARRAY_SIZE; i++) {
      primes[i] = 0;
   }

   // zero and one are not prime (this stops us printing them!)
   primes[0] = 0x3;

   t_printf("starting ...\n");

   // remember starting time
   count = _cnt();

   // eliminate multiples of primes
   for (i = 2; i < SIEVE_SIZE/2; i++) {
      if (((primes[i/ELEMENT_SIZE]>>(i%ELEMENT_SIZE))&1) == 0) {
         for (j = 2; i*j < SIEVE_SIZE; j++) {
            primes[(i*j)/ELEMENT_SIZE] |= 1<<((i*j)%ELEMENT_SIZE);
         }
      }
   }

   // calculate time taken
   count = _cnt() - count;
   t_printf("... done - %ld clocks\n", count);

   t_printf("\npress a key to see results\n");
   k_wait();

   for (i = 0; i < ARRAY_SIZE; i++) {
       if ((~primes[i]) != 0) {
           for (j = 0; j < ELEMENT_SIZE; j++) {
              if ((i*ELEMENT_SIZE + j < SIEVE_SIZE) 
              &&  ((primes[i] & 1) == 0)) {
                 t_printf("prime(%d) = %d, ", k++, i*ELEMENT_SIZE + j);
              }
              primes[i]>>=1;
           }
       }
   }

   t_printf("\n\ndone - press a key to exit");
   k_wait();
   exit(0);
}
