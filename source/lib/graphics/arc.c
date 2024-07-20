#include <graphics.h>

// Draw an arc
//
//   x,y        - center of arc
//   xr,yr      - radii of arc
//   angle      - initial angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   anglestep  - angle step in bits[12..0]
//   steps      - number of steps (0 just leaves (x,y) at initial arc position)
//   arcmode    - 0: plot point(s)
//                1: line to point(s)
//                2: line between points
//                3: line from point(s) to center
//
void g_arc(int x, int y, int xr, int yr, 
           int angle, int anglestep, int steps, int arcmode) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = xr;
   *arg_ptr++ = yr;
   *arg_ptr++ = angle;
   *arg_ptr++ = anglestep;
   *arg_ptr++ = steps;
   *arg_ptr = arcmode;

   _setcommand(CGI_arc, (long)G_VAR.ARGS);
}
