#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Set pixel color to two-bit pattern
//
//   color       - color code in bits[1..0]
//
void g_color(int color) {
   int args[8];
   register int *arg_ptr = args;
   *arg_ptr++ = (long)G_VAR.COLORS[color & 3];
   _setcommand(VGI_color, (long)args);
}

