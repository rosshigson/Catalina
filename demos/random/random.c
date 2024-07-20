/*
 * This program demonstrates manually loading, using, then unloading the
 * RANDOM plugin. The RANDOM plugin is supported on the Propeller 1 only.
 *
 * To build this program, first use spinnaker to compile the RND plugin:
 *
 *    spinnaker -p "%LCCDIR%\target\p1\Catalina_RND_Plugin.spin" -o Plugin
 *
 * Then use spinc to produce a loadable version of the binary in RND.inc:
 *
 *    spinc Plugin.binary -n RND > Plugin.inc
 *
 * Then compile this program using catalina, adding -C DISPLAY_REGISTRY
 * to display the registry after the plugin is loaded and unloaded:
 *
 *    catalina random.c -lci
 * or
 *    catalina random.c -lci -C DISPLAY_REGISTRY
 */

#include <stdio.h>
#include <stdlib.h>

#include <prop.h>
#include <cog.h>
#include <plugin.h>

#include "Plugin.inc"

#define NUM_RANDOMS 10 // number of random numbers to print

#ifdef __CATALINA_DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   printf("Registry:\n\n");
   while (i < COG_MAX) {
      printf("Registry Entry %2d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      printf("%-24.24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      printf("$%08x ", *(a_ptr +1));     
      printf("\n");
      i++;
   };
   printf("\n");
}
#endif

void press_key_to_continue() {
   printf("Press any key to continue");
   k_wait();
   printf("\n\n");
}

void main() {
   int i;
   int cog = -1;

   // load and start the plugin ...
   cog = _coginit(_registry()/4, (int)RND_array/4, ANY_COG);
   // give the plugin a chance to register itself
   _waitms(1); 

   if (cog >= 0) {
      // find the plugin 
      cog = _locate_plugin(LMM_RND);
      if (cog >= 0) {

#ifdef __CATALINA_DISPLAY_REGISTRY
         display_registry();
         press_key_to_continue();
#endif

         for (i = 0; i < NUM_RANDOMS; i++) {
            // use getrealrand() to fetch random numbers
            printf("random = %08X\n", getrealrand());
            // to prove getrealrand() is using the RANDOM plugin and not
            // the C pseudo random number generator, reseed the pseudo 
            // random number generator so that we get the same number
            // on every call (after the first) if we are using the
            // pseudo random number generator
            srand(0);
         }

         // unload the plugin ...
         _cogstop(cog);
         _unregister_plugin(cog);

#ifdef __CATALINA_DISPLAY_REGISTRY
         press_key_to_continue();
         display_registry();
#endif

      }
      else {
         printf("RND plugin not found!\n");
      }
   }
   else {
      printf("RND plugin not started!\n");
   }
   // give output a chance to get out
   _waitms(200);
}
