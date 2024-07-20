#include <graphics.h>

extern int _cgi_cog;

// Draw a box with round/square corners, according to pixel width
//
//   x,y      - box left, box bottom
//
void g_box(int x, int y, int box_width, int box_height) {
   int x2, y2, pmin, pmax;
   register int pixel_width = G_VAR.PIXEL_WIDTH;

   if ((box_width > pixel_width) 
   &&  (box_height > pixel_width)) {

      //get pixel-half-min and pixel-half-max
      pmax = pixel_width - (pmin = (pixel_width >> 1));

      x += pmin; //adjust coordinates to accomodate width
      y += pmin;
      x2 = x + box_width - 1 - pixel_width;
      y2 = y + box_height - 1 - pixel_width;

      g_plot(x, y); // plot round/square corners
      g_plot(x, y2);
      g_plot(x2, y);
      g_plot(x2, y2);

      g_fill(x, y2 + pmax, 0, (x2 - x) << 16, 0, 0, pmax); // fill gaps
      g_fill(x, y, 0, (x2 - x) << 16, 0, 0, pmin);
      g_fill(x - pmin, y2, 0, (x2 - x + pixel_width) << 16, 0, 0, y2 - y);
   }
}
