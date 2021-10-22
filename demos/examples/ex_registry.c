/* Display Registry Entries */

// compile with different options - e.g:
//
//    catalina -lci display_registry -C TTY                  --or--
//    catalina -lcx display_registry.c -C CLOCK -C TTY

// download to to display the plugins loaded - e.g:
//
//    payload -i display_registry
 
#include <stdio.h>
#include <catalina_plugin.h>
#include <propeller.h>

/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int   i;
   long  *a_ptr;
   
   i=0;
   while (i<8) {
      printf("Registry Entry %d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      printf("%-20.20s ", (long *) (_plugin_name(REGISTERED_TYPE(i)))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (long *)(REQUEST_BLOCK(i));   
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
 * main - just display the registry 
 */
void main (void) {
   
   display_registry();

   while(1); // never exit
}
