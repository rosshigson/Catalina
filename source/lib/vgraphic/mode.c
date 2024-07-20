#include <vgraphic.h>

// Get mode
//
int g_mode() {
   int x_tiles;
   int y_tiles;

   x_tiles = cgi_x_tiles();
   y_tiles = cgi_y_tiles();
   return *(int *)((char *) cgi_display_base() + VGI_MODE);
}
