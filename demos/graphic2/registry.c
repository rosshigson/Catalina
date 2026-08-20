/*
 * A simple utility to display ite Registry.
 *
 * Compile with a command like:
 *
 *    catalina -p2 -lc registry.c -C HD_VGA -C MHZ_297 -C CR_ON_LF
 *
 * download to to display the plugins and service registry entries - e.g:
 *
 *    payload -o2 registry
 */
 
#include <stdio.h>
#include <prop.h>
#include <hmi.h>
#include <plugin.h>

/*
 * display_registry - decode and display the registry (n cogs)
 */
void display_registry(int n) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < n) {
      printf("Entry %2d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      printf("%-23.23s ", _plugin_name(REGISTERED_TYPE(i))); 
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

void main (void) {
   
   t_string(1, "\nWaiting for keyboard and/or mouse\n");
   t_mode(1,HMI_cursor_scroll|HMI_cursor_fast);
   while (!k_present() && !m_present()) {
      _waitsec(1);
      t_char(1, '.');
   }

   t_char(1,0x0c); // clear the screen (Form Feed)
   t_setpos(1, 0, 0);

   printf("\nDisplaying plugin registry ...        \n\n");
   display_registry(8);

   while(1); // never exit
}
