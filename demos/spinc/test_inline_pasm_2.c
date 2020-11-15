#include <propeller.h>

/*
 * Thie program will flash the debug LED on the Hydra. On other platforms, you
 * will have to modify the PASM to specify the correct pin to use. 
 *
 * To compile it, use a command like:
 *
 *   catalina test_inline_pasm_2.c -lci -C NO_HMI -C HYDRA 
 *
*/

void main() {  
   PASM("or dira, #1");      // set bit 0 as output (DEBUG LED on Hydra)
   while(1) {
      msleep(500);
      PASM("xor outa, #1");  // toggle bit 0 (DEBUG LED on Hydra)
   }
}

