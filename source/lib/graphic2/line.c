#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Draw a line to point
//
//   x,y         - endpoint
//
void g_line(int x, int y) {
   int args[8];
   register int *arg_ptr = args;
   
   *arg_ptr++ = x;
   *arg_ptr = y;
   _setcommand(VGI_line, (long)args);
}

