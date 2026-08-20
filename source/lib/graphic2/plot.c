#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Plot point
//
//   x,y         - endpoint
//
void g_plot(int x, int y) {
   int args[8];
   register int *arg_ptr = args;
   
   *arg_ptr++ = x;
   *arg_ptr = y;
   _setcommand(VGI_plot, (long)args);
}


