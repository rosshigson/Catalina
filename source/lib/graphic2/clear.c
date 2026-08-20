#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Clear the working buffer
//
void g_clear() {
   int args[8];
   register int *arg_ptr = args;
   *arg_ptr = (int)G_VAR.SCREEN;
   _setcommand(VGI_clear,  (long)args);
}


