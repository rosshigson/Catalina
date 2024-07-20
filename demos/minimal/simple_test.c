/******************************************************************************\
 *              Simple program to test the Generic Plugin                     *
 *                                                                            *
 *        This program simply toggles some outputs by calling                 *
 *        services provided by the Generic Plugin - the OUTPUTS               *
 *        symbol specifies which output pins will be toggled                  *
 *                                                                            *
\******************************************************************************/

/*
 * include the definition of the services provided by the generic plugin:
 */
#include "generic_plugin.h"

/*
 * include the definitions of some useful utility functions:
 */
#include "util.h"

/*
 * define which pins to toggle:
 */
#ifdef __CATALINA_C3
// Pin 15 is the VGA LED on the C3  (compile with -C C3)
#define OUTPUTS 0x00008000
#else
// Pin 0 is a debug LED on HYDRA & HYBRID
// Note: You will also have to change Custom_DEF.inc in the 'minimal' directory
#define OUTPUTS 0x00000001
#endif

/*
 * main - call various Generic Plugin services:
 */
int main(void) {

   // define a buffer for the plugin to use
   char buffer[BUFFER_SIZE];

   // Call Service_1 to initialize the plugin 
   //
   // This is just an example of how we might configure the plugin - a
   // plugin that is intended to be permanently loaded would usually be
   // initialized once on startup using a reserved section of Hub RAM. 
   // That method would suit something like a video driver, which is
   // permanently loaded, and where we only need to communicate with 
   // the driver via registry requests - but if we wanted to interact
   // with the plugin directly from C then we can also initialize it
   // from within our C program ...
   Service_1(buffer);

   // Call Service_2 to turn on the outputs - this service uses a 
   // "short" request, but we can use it to turn on 24 outputs ...
   Service_2(OUTPUTS);

   // wait 1/2 second ...
   wait(500);
   
   while (1) {

      // Call Service_4 to wait for a specified delay, then turn off 
      // the ouputs - this service uses a "long" request, and allows
      // us to pass two parameters ...
      Service_4(OUTPUTS, _clockfreq()/2); 

      // wait 500 msec
      wait(500);

      // Call Service_3 to turn on the outputs - this service uses a 
      // "long" request, so we can turn on all 32 outputs ...
      Service_3(OUTPUTS);

   }

   return 0;
}
