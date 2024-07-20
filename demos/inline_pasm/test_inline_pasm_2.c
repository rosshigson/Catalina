/*****************************************************************************
 *                  Inline PASM demo - for any memory model                  *
 *                                                                           *
 * This program just flashes a LED forever. It will work "as is" on          *
 * the HYDRA, the C3, the P2_EDGE and the P2_EVAL. On other platforms you    *
 * may have to adjust the LED constant.                                      *
 *                                                                           *
 * To compile it, use a command like:                                        *
 *                                                                           *
 *   catalina test_inline_pasm_2.c -lci -C NO_HMI -C C3                      *
 *                                                                           *
 * This program should work in any memory mode on any Propeller. The use     *
 * of I16B_PASM in COMPACT mode is sufficient for executing a single PASM    *
 * instruction as "normal" PASM - to execute more than one, use I16B_EXEC    *
 * and EXEC_STOP (see the "compact.inc" file in the target directory for     *
 * more details).                                                            *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>

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
#define LED_SHIFT LED
#else
#define PORT "B"   // use INB, OUTB, DIRB
#define LED_SHIFT (LED-32)
#endif

void flash(int mask) {
#ifdef __CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl");
#endif
   PASM(" or DIR" PORT ", _PASM(mask)");
   while(1) {
      _waitms(500);
#ifdef __CATALINA_COMPACT
      PASM(" word I16B_PASM\n alignl");
#endif  
      PASM(" xor OUT" PORT ", _PASM(mask)");
   }
}

void main() {
   flash(1<<LED_SHIFT);
}

