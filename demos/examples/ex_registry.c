/*
 * Display registry entries and demonstrate _set_service_lock()
 *
 * compile with different options - e.g:
 *
 *    catalina -lci ex_registry -C TTY
 *    catalina -lcx ex_registry.c -C CLOCK -C TTY
 *    catalina -lc  ex_registry.c -C TTY -C PROTECT_PLUGINS
 *    catalina -p2 -lc ex_registry.c -C VGA -C CR_ON_LF
 *    catalina -p2 -lc ex_registry.c -C HD_VGA -C MHZ_297 -C CR_ON_LF
 *
 * download to to display the plugins and service registry entries - e.g:
 *
 *    payload -i ex_registry
 * or
 *    payload -o2 ex_registry
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

/*
 * display_services - decode and display the service registry
 */
void display_services(void) {
   int i;
   int line;
   int cog, lock, code;
   
   i = 1;
   line = 1;
   while (i <= SVC_MAX) {
     code  = SERVICE_CODE(i);
     if (code > 0) {
        cog   = SERVICE_COG(i);
        lock  = SERVICE_LOCK(i);
        printf("Service Entry %3d: ", i);
        printf(" Cog=%3d:", cog);
        if (lock < LOCK_MAX) {
           printf(" Lock=%3d:", lock);
        }
        else {
           printf(" No Lock :");
        }
        printf(" Code=%3d\n", code);
        if ((line % 20) == 0) {
          printf("\nPress any key to continue ...\n");
          k_wait();
        }
        line++;
     }
     i++;
   }
}

/*
 * main - display the registry entries, then call _set_service_lock() and 
 *        then display them again.
 */
void main (void) {
   
   _waitsec(1); // wait in case using VT100 emulator

#if defined(__CATALINA_VGA) || defined(__CATALINA_HD_VGA)
   // Form Feed (to clear screen)
   t_char(1, 0x0c); 
   // set visible cursor mode to fast blink and scroll
   t_mode(1, HMI_cursor_fast|HMI_cursor_scroll); 
#endif

   printf("\nDisplaying plugin registry ...\n\n");
   display_registry(8);

   printf("\nPress any key to display service registry ...\n");
   k_wait();
   printf("\n\n");

   display_services();

   printf("\nSetting up service locks ...\n\n");
   _set_service_lock(-1);

   printf("\nPress any key to display service registry again ...\n");
   k_wait();
   printf("\n\n");

   display_services();

   while(1); // never exit
}
