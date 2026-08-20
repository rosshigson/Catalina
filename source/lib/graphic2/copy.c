#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Copy the working buffer to the display
//
// The double_buffer parameter is ignored.
//
void g_copy(int double_buffer) {
   int args[8];
   register int *arg_ptr = args;
   *arg_ptr = (int)G_VAR.SCREEN;
   _setcommand(VGI_copy,  (long)args);
}


