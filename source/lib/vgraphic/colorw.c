#include <vgraphic.h>

extern int _cgi_cog;

// Set pixel color and width
//
void g_colorwidth(int color, int width) {
   g_color(color);
   g_width(width);
}
