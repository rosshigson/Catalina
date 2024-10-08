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

/*
 * include the definitions of some useful multi-cog utility functions:
 */
#include "cogutil.h"

/*
 * pin to use for pin tests:
 */
#define TEST_PIN 58

/*
 * define global variables that multiple cogs can share:
 */
static int lock = 0;

/*
 * pasm_program : a PASM program (flash.pasm) encoded into an array. The
 *                content of the array (i.e. flash.inc) was generated by
 *                the following commands:
 *                   p2_asm flash.pasm
 *                   bindump flash.bin -c -p 0x > flash.inc
 */
unsigned long pasm_program[] = {
   #include "flash.inc"
};

/*
 * cog_function : C function that can be started in a cog using _cogstart_C.
 *                The function _cogstart_C differs from _coginit_C in that 
 *                the function started accepts a void * parameter 'arg', and 
 *                the 'stack' parameter points to the base of the stack, not
 *                the top.
 */
void cog_function(void *arg) {
   int me = _cogid();

   cogsafe_print_int(lock, "Cog: cog %d started\n", me);
   cogsafe_print_int(lock, "Cog: argument passed = %X\n", (int)arg);
   while (1) {
      // alternate waiting for attention, and polling for attention 
      _waitatn();
      cogsafe_print_int(lock, "Cog: cog %d attending!\n", me);
      while (1) {
         if (_pollatn()) {
            cogsafe_print_int(lock, "Cog: cog %d attending!\n", me);
         }
      }
   }
}

/*
 * main : test out various Propeller 2 functions
 */
void main(void) {
   int i = 0;
   int cog = 0;
   int result = 0;
   unsigned long ulval = 0;
   char stack[STACK_SIZE];
   int my_arg = 12345;
   void *arg = &my_arg;
   cartesian_t c;
   polar_t     p;
   counter64_t c64;
   int pin = TEST_PIN;
   uint32_t val;

   // assign a lock to be used to avoid plugin contention
   lock = _locknew();

   cogsafe_print(lock, "Press a key to start the tests\n");
   k_wait();

   // test lock functions
   cogsafe_print(lock, "Main: test lock functions ...\n");
   cogsafe_print_int(lock, "Main: _locknew() = %d\n", lock);
   result = _lockchk(lock);
   cogsafe_print_int(lock, "Main: _lockchk() = %d\n", result);
   result = _locktry(lock);
   cogsafe_print_int(lock, "Main: _locktry() = %d\n", result);
   result = _lockchk(lock);
   cogsafe_print_int(lock, "Main: _lockchk() = %d\n", result);
   _lockrel(lock);
   result = _lockchk(lock);
   cogsafe_print_int(lock, "Main: _lockchk() = %d\n", result);
   cogsafe_print(lock, "Main: lock functions test complete\n\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _waitx() & _clockfreq()
   cogsafe_print(lock, "Main: test clock functions (1) (wait 3 seconds) ...\n");
   _waitx(_clockfreq()*3); 
   cogsafe_print(lock, "Main: clock functions (1) test complete\n\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _clockmode()
   cogsafe_print(lock, "Main: test clock functions (2) \n");
   ulval = _clockmode(); 
   cogsafe_print_int(lock, "Main: _clockmode() = %X\n", ulval);
   cogsafe_print(lock, "Main: clock functions (2) test complete\n\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _cogstart_PASM & _cogstart_C()
   cogsafe_print(lock, "Main: test cog functions (1) ...\n");
   // start an instance of pasm_program in a new cog
   cog = _cogstart_PASM(ANY_COG, &pasm_program, NULL);
   cogsafe_print_int(lock, "Main: _cogstart_PASM() started cog %X ...\n", cog);

   cogsafe_print_int(lock, "Main: _cogstart_C() argument will be %X ...\n", (int)arg);
   // start an instance of cog_function in a new cog
   cog = _cogstart_C(&cog_function, arg, &stack, STACK_SIZE);
   cogsafe_print_int(lock, "Main: _cogstart_C() %d started cog\n", cog);
   // now request attention from the cog a few times
   for (i = 0; i < 4; i++) {
      cogsafe_print_int(lock, "Main: cog %d attention! ...\n", cog);
      _cogatn(1<<cog);
      _waitx(_clockfreq()/5); 
   }
   cogsafe_print(lock, "Main: cog functions (1) test complete\n\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _cogchk() & _cogstop()
   cogsafe_print(lock, "Main: test cog functions (2) ...\n");
   result = _cogchk(cog);
   cogsafe_print_int(lock, "Main: _cogchk() = %d\n", result);
   cogsafe_print(lock, "Main: stopping cog\n");
   _cogstop(cog);
   result = _cogchk(cog);
   cogsafe_print_int(lock, "Main: _cogchk() = %d\n", result);
   cogsafe_print(lock, "Main: cog functions (2) test complete\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _rotxy(), _polxy(), _xypol()
   cogsafe_print(lock, "Main: test cordic functions ...\n");
   c.x = 200;
   c.y = 100;
   c = _rotxy(c, 0x7FFFFFFF/360*30);
   cogsafe_print_int(lock, "Main: _rotxy() x = %d\n", c.x);
   cogsafe_print_int(lock, "Main: _rotxy() y = %d\n", c.y);
   p = _xypol(c);
   cogsafe_print_int(lock, "Main: _xypol() r = %d\n", p.r);
   cogsafe_print_int(lock, "Main: _xypol() t = %X\n", p.t);
   c = _polxy(p);
   cogsafe_print_int(lock, "Main: _polxy() r = %d\n", c.x);
   cogsafe_print_int(lock, "Main: _polxy() t = %d\n", c.y);
   cogsafe_print(lock, "Main: cordic functions test complete\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _rnd(), _rev(), _encod(), _isqrt()
   cogsafe_print(lock, "Main: test misc functions ...\n");
   for (i = 0; i < 10; i++) {
      result = _rnd();
      cogsafe_print_int(lock, "Main: _rnd() = %X ... \n", result);
      cogsafe_print_int(lock, "Main: ... _rev() = %X\n", _rev(result));
      cogsafe_print_int(lock, "Main: ... _encod() = %X\n", _encod(result));
      cogsafe_print_int(lock, "Main: ... _isqrt() = %X\n", _isqrt(result));
   }
   cogsafe_print(lock, "Main: misc functions test complete\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _cnt(), _cnth(), _cntl(), _cnthl()
   cogsafe_print(lock, "Main: test counter functions ...\n");
   cogsafe_print_int(lock, "Main: _cnt()  = %X\n", _cnt());
   cogsafe_print_int(lock, "Main: _cnth() = %X\n", _cnth());
   c64 = _cnthl();
   cogsafe_print_int(lock, "Main: _cnthl() high = %X\n", c64.high);
   cogsafe_print_int(lock, "Main: _cnthl() low = %X\n", c64.low);
   cogsafe_print(lock, "Main: counter functions test complete\n");

   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();

   // test _pinw(), _pinh(), _pinl(), _pinnot(), _pinrnd(), _pinf(), _pinr()
   cogsafe_print_int(lock, "Main: test pin functions (watch pin %d)...\n", pin);
   _pinw(pin, 0);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   _pinw(pin, 1);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   _pinl(pin);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   _pinh(pin);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   _pinnot(pin);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue (random for 10 seconds)\n\n");
   k_wait();
   for (i = 0; i < 100; i++) {
      _pinrnd(pin);
      _waitx(_clockfreq()/10);
   }
   _pinf(pin);
   result = _pinr(pin);
   cogsafe_print_int(lock, "Main: _pinr() = %d\n", result);
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   cogsafe_print(lock, "Main: pin functions test complete\n");

   // give up lock (and test _lockret() )
   cogsafe_print(lock, "\nPress a key to continue\n\n");
   k_wait();
   cogsafe_print(lock, "Main: returning lock\n");
   _lockret(lock);
   // get another lock (so we can continue using cogsafe_print!)
   lock = _locknew();
   result = _lockchk(lock);
   cogsafe_print_int(lock, "Main: _lockchk() = %d\n", result);

   cogsafe_print(lock, "\nPress a key to reboot the propeller\n");
   k_wait();

   // reboot the propeller (and test hubset() )
   _hubset(0x10000000);

   // the following function calles are here just to make 
   // sure they compile - they are not tested yet ...

   /* smart pin controls */
   _wrpin(pin, val);
   _wxpin(pin, val);
   _wypin(pin, val);
   _akpin(pin);
   val = _rdpin(pin);
   val = _rqpin(pin);
}
