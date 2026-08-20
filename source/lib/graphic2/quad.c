#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Draw a solid quadrilateral
// vertices must be ordered clockwise or counter-clockwise
//
void g_quad(int x1, int y1, int x2, int y2, 
            int x3, int y3, int x4, int y4) {
   //g_plot(x1,y1);
   //g_line(x2,y2);
   //g_line(x3,y3);
   //g_line(x4,y4);
   //g_line(x1,y1);
   g_tri(x1, y1, x2, y2, x3, y3); //draw two triangle to make 4-sides polygon
   g_tri(x3, y3, x4, y4, x1, y1);
}

