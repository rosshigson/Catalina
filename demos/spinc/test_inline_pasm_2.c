#include <propeller.h>

/*
 * This program will flash the debug LED on the Hydra. On other platforms, you
 * will have to modify the PASM to specify the correct pin to use. 
 *
 * To compile it, use a command like:
 *
 *   catalina test_inline_pasm_2.c -lci -C NO_HMI -C HYDRA 
 *
 * This program should work in any memory mode on any Propeller. The use
 * of I16B_PASM in COMPACT mode is sufficient for executing a single following
 * PASM instruction - to execute more than one, use I16B_EXEC and EXEC_STOP
 * (see the program test_inline_pasm_1.c for more details).
 */

void main() {

#ifdef _CATALINA_COMPACT
   PASM(" word I16B_PASM\n alignl")
#endif  
   PASM(" or dira, #1");      // set bit 0 as output (DEBUG LED on Hydra)
   
   while(1) {

      msleep(500);

#ifdef _CATALINA_COMPACT
      PASM(" word I16B_PASM\n alignl")
#endif  
      PASM(" xor outa, #1");  // toggle bit 0 (DEBUG LED on Hydra)

   }
}

