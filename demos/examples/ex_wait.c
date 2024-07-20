/*
 * ex_wait.c - demonstrate _wait functions - i.e. _waitus(), _waitms() or 
 *             _waitsec(). Note that only one at a time is demonstrated.
 *             Prints the clock frequency in use and the actual number of 
 *             clock ticks each example wait takes.
 *
 * By default, the program tests the seconds timer - i.e. _waitsec() - Define 
 * the C symbol TEST_MSECS to test milliseconds instead, or TEST_USECS to test 
 * milliseconds (note that these are C symbols, not Catalina symbols, so use
 * -D not -C to define them). You can also define _TEST_IWAIT to test the 
 * interrupt-safe versions of the functions. For example:
 *
 *    catalina -lci ex_wait.c 
 * or
 *    catalina -lci ex_wait.c -D TEST_MSECS 
 * or
 *    catalina -p2 -lci ex_wait.c -D TEST_USECS -D TEST_IWAIT
 *
 * Also, note that using the Optimizer reduces the function call overheads, and
 * improves accuracy. 
 *
 * Note also that there is a minimum number of microseconds that can be waited 
 * for accurately - typically about 30us on the Propeller 1, or 6us on the 
 * Propeller 2. For example, here is an example of what you might see for:
 *
 *    catalina -p2 ex_wait.c -lci -D TEST_USECS -O5 -f200M
 *
 * Frequency = 200000000
 *
 * Press a key
 * wait delay(0)  = 1181 (1181)
 * Press a key
 * wait delay(1)  = 1181 (0)
 * Press a key
 * ...
 * wait delay(6)  = 1181 (0)
 * Press a key
 * wait delay(7)  = 1397 (216)
 * Press a key
 * wait delay(8)  = 1597 (200)
 * Press a key
 * wait delay(9)  = 1797 (200)
 * Press a key
 * wait delay(10)  = 1997 (200)
 * Press a key
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <prop.h>
#include <prop2.h>

void main() {
   uint32_t delay;
   uint32_t last;
   int i;

   // the initial call to _waitus delay will be slightly longer than 
   // normal so if this is a problem, make an initial call - e.g:
   _waitus(0);

   printf("Frequency = %lu\n\n", _clockfreq());

   i = 0;
   last = 0;

   while (1) {
      printf("Press a key\n");
      k_wait();

      delay = _cnt();

#ifdef TEST_IWAIT

      // use interrupt-safe functions
#if defined(TEST_USECS)
      _iwaitus(i);
#elif defined(TEST_MSECS)
      _iwaitms(i);
#else
      _iwaitsec(i);
#endif

#else

      // use ordinary (non-interrupt safe) functions
#if defined(TEST_USECS)
      _waitus(i);
#elif defined(TEST_MSECS)
      _waitms(i);
#else
      _waitsec(i);
#endif

#endif
      delay = _cnt() - delay;

      printf("wait delay(%d)  = %lu (%ld)\n", i, delay, delay-last);
      last = delay;

      // only do significant waits (e.g. 1 - 40, 50 - 100, 100 - 1000 etc)
      if (i < 40) {
         i = i + 1;
      }
      else if (i < 100) {
         i = i + 10;
      }
      else if (i < 1000) {
         i = i + 100;
      }
      else if (i < 10000) {
         i = i + 1000;
      }
      else {
         i=i+ 10000;
      }
   }
}

