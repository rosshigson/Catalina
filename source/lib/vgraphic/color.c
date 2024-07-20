#include <vgraphic.h>

// Set pixel color to two-bit pattern
//
//   color       - color code in bits[1..0]
//
void g_color(int color) {
   _setcommand(VGI_color, (long)&G_VAR.COLORS[color & 3]);
} 
