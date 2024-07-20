/*
 * This program just displays the registry and argc & argv - it can be loaded
 * serially to display the registry, but to display argc and argv it must be 
 * executed by Catalyst, so it has to be compiled and then loaded onto an SD 
 * Card in a system with Catalyst programmed into EEPROM (or FLASH) - see the 
 * Catalyst documentation for more details.
 *
 * Optinally add -C NO_ARGUMENTS or -C NO_REGISTRY to the compilation command
 * to disable the display of one or the other (disabling both would be a bit 
 * pointless!)
 *
 * Note that NO_ARGUMENTS is not the same as NO_ARGS. The former disables
 * the display, whereas the latter disables the setting up of argc & argv 
 * in the first place - and you can test that this works correctly by adding 
 * -C NO_ARGS but not -C NO_ARGUMENTS
 *
 * Note that this program will always display 16 registry entries on the 
 * Propeller 2, even if the Propeller 2 in use has less than 16 cogs.
 * There is (AFAIK) no simple way of telling how many cogs are actually
 * available.
 *
 */

#include <ctype.h>
#include <stdio.h>
#include <hmi.h>

#ifndef __CATALINA_NO_KEYBOARD
void press_key_to_continue() {
   printf("press any key to continue\n");
   k_wait();
}
#endif

#ifndef __CATALINA_NO_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
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

int main (int argc, char *argv[]) {
   int i;
   char *cp;

#ifndef __CATALINA_NO_KEYBOARD
   k_clear();
#endif

#ifndef __CATALINA_NO_REGISTRY
   printf("Registry:\n\n");
   display_registry();
#endif
#ifndef __CATALINA_NO_ARGUMENTS
   printf("\nArguments:\n\n");
   printf("argc = %d\n", argc);
   printf("argv = %08x\n", argv);

   for (i = 0; i < argc; i++) {
      printf("argv[%d]=%s\n", i, argv[i]);
   }
   printf("done\n");
#endif

#ifdef __CATALINA_NO_KEYBOARD
   while (1) {};
#else
   press_key_to_continue();
#endif
   return 0;
}

