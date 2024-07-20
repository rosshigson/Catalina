 /***************************************************************************\
 *                                                                           *
 *                      prop2.h Clock Tests                                  *
 *                                                                           *
 * This program shows how to use the clock functions defined in the          *
 * "prop2.h" file. It also tests the clock related macros and                *
 * the special register names _OUTB and _DIRB                                *
 *                                                                           *
 * Note that not all boards support 360Mhz!                                  *
 *                                                                           *
 \***************************************************************************/

#include <prop2.h>

#if defined(__CATALINA_P2_EDGE)
#define LED_PIN         38 // for P2_EDGE board
#elif defined(__CATALINA_P2_EVAL)
#define LED_PIN         56 // for P2_EVAL board
#else
#define LED_PIN         56  // for other boards
#endif
#define TEST_CYCLES     12

#ifdef __CATALINA_NATIVE
#define TEST_ITERATIONS 1000000 // native is quicker, so do more iterations
#else
#define TEST_ITERATIONS 100000
#endif

// this function just uses some CPU time - the internals are irrelevant,
// but it toggles the LED_PIN on each of a number of test cycles
void test_function(void) {
   int i;
   int j;
   int a, b, c;
   int on_off = 0;

   for (j = 0; j < TEST_CYCLES; j++) {
      on_off ^= 1;
      _OUTB ^= on_off<<(LED_PIN-32);
      for (i = 0; i < TEST_ITERATIONS; i++) {
         a = 1;
         b = 2;
         c = a*b;
      }
   }
}

// set clock speed to 180Mhz (the initial default) - required so we can print!
void set_180Mhz(void) {
   unsigned long XFREQ,XDIV,XMUL,XDIVP,XOSC,XSEL,XPLL;
   unsigned mode, freq;

   XFREQ = 20000000;  
   XDIV  = 4;           
   XMUL  = 72;          
   XDIVP = 2;           
   XOSC  = 1;         
   XSEL  = 3;         
   XPLL  = 1;           

   mode = CLOCKMODE(XPLL, XDIV, XMUL, XDIVP, XOSC, XSEL);
   freq = CLOCKFREQ(XFREQ, XDIV, XMUL, XDIVP);

   _clkset(mode, freq);
}

// a small delay to allow printf to complete ...
void delay(void) {
   _waitcnt(_cnt() + _clockfreq()/10);
}

void main() {
   unsigned long t;
   unsigned long XFREQ,XDIV,XMUL,XDIVP,XOSC,XSEL,XPLL;
   unsigned mode, freq;

   _DIRB |= 1<<(LED_PIN-32);
   _OUTB |= 1<<(LED_PIN-32);

   printf("\ninitial clock mode = %8X, %dHz\n", _clockmode(), _clockfreq());

   printf("\nNOTE 1: THIS PROGRAM WILL ONLY WORK ON THE P2\n");
   printf("\nNOTE 3: WATCH THE LEDS TO SEE THE DIFFERENCE THE CLOCK SPEED MAKES\n");

   // set up for 100 Mhz
   XFREQ = 20000000;  
   XDIV  = 4;           
   XMUL  = 20;          
   XDIVP = 1;           
   XOSC  = 1;         
   XSEL  = 3;         
   XPLL  = 1;           

   mode = CLOCKMODE(XPLL, XDIV, XMUL, XDIVP, XOSC, XSEL);
   freq = CLOCKFREQ(XFREQ, XDIV, XMUL, XDIVP);

   printf("\n\nbegin test 1: mode = %8X, %dHz\n", mode, freq);
   delay();

   _clkset(mode, freq);
   test_function();

   set_180Mhz();
   printf("end test 1\n");
   delay();

   // set up for clock speed of 200Mhz
   XFREQ = 20000000;  
   XDIV  = 4;           
   XMUL  = 40;          
   XDIVP = 1;           
   XOSC  = 1;         
   XSEL  = 3;         
   XPLL  = 1;           

   mode = CLOCKMODE(XPLL, XDIV, XMUL, XDIVP, XOSC, XSEL);
   freq = CLOCKFREQ(XFREQ, XDIV, XMUL, XDIVP);
   
   printf("\n\nbegin test 2: mode = %8X, %dHz\n", mode, freq);
   delay();

   _clkset(mode, freq);
   test_function();

   set_180Mhz();
   printf("end test 2\n");
   delay();

   // set up for clock speed to 300Mhz
   XFREQ = 20000000;  
   XDIV  = 4;           
   XMUL  = 60;          
   XDIVP = 1;           
   XOSC  = 1;         
   XSEL  = 3;         
   XPLL  = 1;           

   mode = CLOCKMODE(XPLL, XDIV, XMUL, XDIVP, XOSC, XSEL);
   freq = CLOCKFREQ(XFREQ, XDIV, XMUL, XDIVP);
   
   printf("\n\nbegin test 3: mode = %8X, %dHz\n", mode, freq);
   delay();

   _clkset(mode, freq);
   test_function();

   set_180Mhz();
   printf("end test 3\n");

   // set up for clock speed to 360Mhz
   XFREQ = 20000000;  
   XDIV  = 4;           
   XMUL  = 72;          
   XDIVP = 1;           
   XOSC  = 1;         
   XSEL  = 3;         
   XPLL  = 1;           

   mode = CLOCKMODE(XPLL, XDIV, XMUL, XDIVP, XOSC, XSEL);
   freq = CLOCKFREQ(XFREQ, XDIV, XMUL, XDIVP);
   
   printf("\n\nbegin test 4: mode = %8X, %dHz\n", mode, freq);
   delay();

   _clkset(mode, freq);
   test_function();

   set_180Mhz();
   printf("end test 4\n");

   printf("\nall tests completed\n");

   while (1) { };
}
