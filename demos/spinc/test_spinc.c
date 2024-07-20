#ifdef __CATALINA_P2
#error THIS PROGRAM REQUIRES A PROPELLER 1
#endif

/*
 * Include the cog program formatted into a C arrary. The include file can 
 * be generated using the following commands:
 *
 *       spinnaker -p -a flash_led.spin -b
 *       spinc flash_led.binary > flash_led_array.h
 */
#include "flash_led_array.h"


/*
 * Include the cog function definitions
 */
#include <cog.h>


/*
 * This is an example of how to format data to be passed to the cog program 
 * (via the usual PAR parameter). Note this is an example only - the flash_led 
 * cog program does not actually expect any data.
 */ 
unsigned long data[] = { 1, 2, 3 };


/*
 * The main C program - loads the cog program, then loops forever
 */
int main(void) {

   if (_coginit ((int)data>>2, (int)flash_led_array>>2, ANY_COG) == -1) {
      // LED should start flashing on success - turn it
      // on and leave it to indicate a coginit failure
      _dira(1, 1);
      _outa(1, 1);
   }

   while (1) ; // loop forever - flash led cog should continue running
   
   return 0;
}
