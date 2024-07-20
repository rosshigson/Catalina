#include <graphics.h>

// Plot point
//
//   x,y         - endpoint
//
void g_plot(int x, int y) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr = y;
   _setcommand(CGI_plot, (long)G_VAR.ARGS);
}
