#include <vgraphic.h>

// Set pixel color to 8 bit RGB pattern (returns address of pallette)
//
//   Color     -  0 .. 3 (0 = background)
//   RGB       -  red   in bits[7..6]
//                green in bits[5..4]
//                blue  in bits[3..2]
//
int g_pallete(int color, int RGB) {
   int x_tiles = cgi_x_tiles(); // may be called before g_setup
   int y_tiles = cgi_y_tiles(); // may be called before g_setup
   char *pallete = (char *)cgi_display_base() + VGI_CLRS; // may be called before g_setup
   int i;

   for (i = 0; i < 64; i += 4) {
      pallete[i + (color & 3)] = RGB;
   }

   return (int)pallete;
}


