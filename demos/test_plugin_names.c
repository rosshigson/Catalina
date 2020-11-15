#include <stdio.h>
#include <catalina_plugin.h>


void print_plugin_names() {
   int type;
   request_t *rqst;

   int i;
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      printf("Cog %d (%x) Type = %s\n", i, (unsigned)rqst, _plugin_name(type)); 
   }
}

int main(void) {
   printf("Press any key to start\n");
   getchar();
   printf("\nRegistry Address = %x\n\n", _registry());
   print_plugin_names();
   printf("\nPress any key to exit ...");
   getchar();

   return 0;
}
