/* Display the Registry Entries */

// compile with...
//    catalina -lc registry -C PC                  --or--
//    catalina -lc registry.c -C CLOCK -C PC

// download with...
//    payload registry
 
#include <stdio.h>
#include <catalina_plugin.h>
#include <propeller.h>

/*
 * display_registry - decode and display the registry
 */
int display_registry(void) {
   int   i;
   long  *a_ptr;
   
   i=0;
   while (i<8) {
      printf("Registry Entry %d: ", i);
      printf("%3d ", (REGISTERED_TYPE(i)));   // =(REGISTRY_ENTRY(i) >> 24)
      printf("%-20.20s ", (long *) (_plugin_name(REGISTERED_TYPE(i)))); // get the plugin name
      printf("$%4x: ", (REQUEST_BLOCK(i)));  // =(REGISTRY_ENTRY(i) & 0x00FFFFFF))
      a_ptr = (long *)(REQUEST_BLOCK(i));   // get the pointer to the request block start
      printf("$%-8x ", *(a_ptr +0));     // first  Request_Block                       
      printf("$%-8x ", *(a_ptr +1));     // second Request_Block                               
      printf("\n");
      i++;
   };
   printf("\n");
   return 0;
}

/*
 * main - just display the registry repeatedly
 */
int main (void) {
   
   while (1) {                     
     display_registry();
     msleep(500);
   }
   return 0;
}
