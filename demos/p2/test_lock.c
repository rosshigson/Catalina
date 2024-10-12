 /***************************************************************************\
 *                                                                           *
 *                            prop2.h Tests                                  *
 *                                                                           *
 *    This program tests the various functions defined in "prop2.h"          *
 *                                                                           *
 \***************************************************************************/

#include <stdint.h>

/*
 * include the definitions of the Propeller 2 functions:
 */
#include <prop2.h>

int my_lockchk(lock) {
  return PASM(" mov r0, r2\n"
              " lockrel r0 wc\n"
              " if_c mov r0,#99\n"
             );
}

/*
 * main : test out various Propeller 2 functions
 */
void main(void) {
   int result = 0;
   int lock;

   printf("Press a key to start the tests\n");
   k_wait();

   // test lock functions
   printf("Main: test lock functions ...\n");
   lock = _locknew();
   lock = _locknew();
   lock = _locknew();
   printf("Main: _locknew() = %d\n", lock);
   result = my_lockchk(lock);
   printf("Main: _lockchk() = %d\n", result);
   result = _locktry(lock);
   printf("Main: _locktry() = %d\n", result);
   result = my_lockchk(lock);
   printf("Main: _lockchk() = %d\n", result);
   _lockrel(lock);
   result = my_lockchk(lock);
   printf("Main: _lockchk() = %d\n", result);
   printf("Main: lock functions test complete\n\n");

   printf("\nPress a key to continue\n\n");
   k_wait();

}
