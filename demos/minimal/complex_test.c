/******************************************************************************\
 *              Complex program to test the Generic Plugin                    *
 *                                                                            *
 *        This program simply toggles some outputs by calling                 *
 *        services provided by the Generic Plugin - the OUTPUTS               *
 *        symbol specifies which output pins will be toggled                  *
 *                                                                            *
 *        This program is more complex than the simple test, since            *
 *        it unloads and reloads the plugin after every 10 toggles            *
 *                                                                            *
\******************************************************************************/

/*
 * include the definition of the services provided by the generic plugin:
 */
#include "generic_plugin.h"

/*
 * include the generic plugin itself (since we will load it dynamically):
 */
#include "plugin_array.h"

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
 * use_plugin - call various Generic Plugin services (iterate count times):
 */
void use_plugin(int count) {
   int i;

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

   // toggle the outputs 10 times ...
   for (i = 0; i < count; i++) {

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
}

int main(void) {
   
   unsigned reg;
   int cog;

   // get the address of the registry (so we can pass it to the plugin)
   reg = _registry(); 

   // see if the generic plugin is already loaded
   cog = _locate_plugin(LMM_DUM);
   
   if (cog >= 0) {

      // the plugin is loaded, so we can use it straight away ...
      use_plugin(10);

      // now unregister the plugin
      _unregister_plugin(cog);

      // now stop the plugin 
      _cogstop(cog);
   }

   // now keep loading, using and unloading the plugin - 
   // wait 5 seconds between each load/use/unload cycle
   while (1) {

      // wait for 5 seconds between cycles
      wait(5000);

      // load the generic plugin from our binary copy - we use the _coginit
      // function, passing the address of the registry as the parameter ...
      cog = _coginit((int)reg>>2, (int)catalina_plugin_array>>2, ANY_COG);
      if (cog > 0) {

         // now we can register the plugin (so various functions can find it)
         // NOTE that we don't need to do this if the plugin registers itself:
         // _register_plugin(cog, LMM_DUM);

         // now use the plugin services 
         use_plugin(10);

         // now unregister the plugin
         _unregister_plugin(cog);

         // now stop the plugin
         _cogstop(cog);
      }
      else {
         // failed to load plugin
      }
      
   }

   return 0;
}

