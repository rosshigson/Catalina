#include <graphics.h>

// Draw a line to point
//
//   x,y         - endpoint
//
void g_line(int x, int y) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr = y;
   _setcommand(CGI_line, (long)G_VAR.ARGS);
}
