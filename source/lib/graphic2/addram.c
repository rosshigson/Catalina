#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Add RAM to the free tile list
//
// addr is the address of the first new tile byte, size is the number of bytes
//
void g_add_ram(void *addr, unsigned size) {
   int args[8];
   register int *arg_ptr = args;
   *arg_ptr++ = (int)addr;
   *arg_ptr = size;
   if (addr != NULL) {
      _setcommand(VGI_add, (long)args);
   }
}

