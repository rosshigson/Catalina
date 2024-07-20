/*****************************************************************************
 *                         Inline PASM Demo                                  *
 *                                                                           *
 * This program flashes the specified LED 10 times. It will work "as is" on  *
 * the HYDRA, the C3, the P2_EDGE and the P2_EVAL. On other platforms you    *
 * may have to adjust the LED constant.                                      *
 *                                                                           *
 * Although it is a fully working program, it is mainly intended to          *
 * demonstrate the use and effect of the 'PASM' function and _PASM macro.    *
 *                                                                           *
 * Compile this program using a command like the following, being sure to    *
 * generate a listing by including the -y command line flag:                 *
 *                                                                           *
 *   catalina test_inline_pasm.c -lci -y -C NO_HMI -C C3                     *
 *                                                                           *
 * Then examine the listing, looking specifically for the string "PASM!".    *
 * You will see the arguments to the PASM function calls inserted inline     *
 * in the assembly code generated for the C program.                         *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>

// make sure we are compiled using the correct model for our PASM code
#ifndef __CATALINA_TINY
#error "This program will only work in TINY mode"
#endif

#if defined(__CATALINA_C3)
#define LED 15     // VGA LED on C3
#elif defined(__CATALINA_P2_EDGE)
#define LED 38     // LED on P2 EDGE
#elif defined(__CATALINA_P2_EVAL)
#define LED 56     // LED on P2 EVAL
#else
#define LED 0      // DEBUG LED on HYDRA
#endif

#if LED < 32
#define PORT "A"   // use INA, OUTA, DIRA
#else
#define PORT "B"   // use INB, OUTB, DIRB
#endif

#define COUNT 10   // number of times to flash

void test_pasm(int count, int led) {
   count = count*2 - 1;
   PASM(" mov r0, #1 ' PASM!");          // set up mask ... 
   PASM(" shl r0, _PASM(led)");          // ... using led argument ...
   PASM(" mov _PASM(led), r0");          // ... and save it
   PASM("my_loop");                      // we can declare our own labels
   _waitms(500);                         // we can intersperse other C Code
   PASM(" sub _PASM(count), #1 wz");     // we can set and use Z & C flags
   PASM(" xor OUT" PORT ", _PASM(led)"); // we can use special registers
   PASM(" jmp #BRNZ\n long @my_loop");   // we can branch to our own labels
}

// use a global variable, which is accessible to the _PASM macro
static int led = LED;

void main() {

   // we can execute the PASM inline, but if
   // we do so we can only access globals ...

   PASM(" jmp #LODL ' PASM!");           // set up ...
   PASM(" long @_PASM(led)");            // ... mask ...
   PASM(" rdlong r1, RI");               // ... using ...
   PASM(" mov r0, #1");                  // ... value in ...
   PASM(" shl r0, r1");                  // ... led global variable
   PASM(" or DIR" PORT ", r0");

   // or we can put the PASM in a subroutine
   // and then we can pass arguments to it,
   // which means we don't need the global ...

   test_pasm(COUNT, LED);

}

