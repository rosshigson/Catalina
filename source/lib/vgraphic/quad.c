#include <vgraphic.h>

extern int _cgi_cog;

// Draw a solid quadrilateral
// vertices must be ordered clockwise or counter-clockwise
//
void g_quad(int x1, int y1, int x2, int y2, 
            int x3, int y3, int x4, int y4) {
  g_plot(x1,y1);
  g_line(x2,y2);
  g_line(x3,y3);
  g_line(x4,y4);
  g_line(x1,y1);
}
