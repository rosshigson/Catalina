#include <prop.h>

/* 
 * use getrand() or getrealrand() to seed the C random number generator, 
 * depending on whether the Catalina symbol RANDOM is defined, then test 
 * rand() and getrand(), If the Catalina symbol RANDOM is defined, then 
 * also test getrealrand().
 *
 * Note that on the Propeller 1 the Catalina symbol RANDOM includes the real 
 * random number generator plugin, but it does nothing on the Propeller 2, 
 * which has built in support for generating true random numbers. However, in
 * this program, this symbol also enables the testing of getrealrand(), so
 * it should be defined even for a Propeller 2.
 *
 * The difference between getrand() and getrealrand() is that getrand()
 * uses rand() internally - the C pseudo random number generator - and so 
 * generates pseudo random numbers whereas getrealrand() uses a true random 
 * number generator. The pseudo random number generator is seeded using the 
 * system clock, so this difference will only evident in situations where 
 * the program using it is loaded immediately on power up. In such cases the 
 * system clock will be reset, and getrand() will always return the same 
 * sequence of pseudo random numbers, whereas getrealrand() will not. 
 * This difference will not be evident if the program is downloaded 
 * serially or booted from a Catalyst command line.
 *
 * For example:
 *
 *    catalina -lci ex_random.c
 * or
 *    catalina -lci ex_random.c -C RANDOM
 * or
 *    catalina -p2 -lci ex_random.c -C RANDOM
 */

void main() {
   int i;
   int seed;

#ifdef __CATALINA_RANDOM
   seed = getrealrand();
#else
   seed = getrand();
#endif
   // seed should be 0 to 32767
   srand(seed & 0x7FFF);

   while (1) {
      for (i = 0; i < 20; i++) {
         printf("rand() = %08X", rand());
         printf(", getrand() = %08X", getrand());
#ifdef __CATALINA_RANDOM
         printf(", getrealrand() = %08X", getrealrand());
#endif
         printf("\n");
      }
      printf("press a key to continue\n");
      k_wait();
   }
}
