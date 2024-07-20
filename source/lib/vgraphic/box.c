#include <vgraphic.h>

extern int _cgi_cog;

// Draw a box 
//
//   x,y      - box left, box bottom
//
void g_box(int x, int y, int box_width, int box_height) {
   int x2, y2, pmin, pmax;
   register int pixel_width = G_VAR.PIXEL_WIDTH;

   //get pixel-half-min and pixel-half-max
   pmax = pixel_width - (pmin = (pixel_width >> 1));

   x += pmin; //adjust coordinates to accomodate width
   y += pmin;
   x2 = x + box_width - 1 - pixel_width;
   y2 = y + box_height - 1 - pixel_width;

   g_plot(x, y); 
   g_line(x, y2);
   g_line(x2, y);
   g_line(x2, y2);
   g_line(x, y);

}
