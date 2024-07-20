#include <graphics.h>

// Draw a pixel sprite at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   pixrot      - 0: 0°, 1: 90°, 2: 180°, 3: 270°, +4: mirror
//   pixdef_ptr  - address of pixel sprite definition
//
void g_pixarc(int x, int y, int xr, int yr, int angle, 
              int pixrot, void *pixdef_ptr) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = xr;
   *arg_ptr++ = yr;
   *arg_ptr++ = angle;
   *arg_ptr++ = pixrot;
   *arg_ptr = (int)pixdef_ptr;

   _setcommand(CGI_pixarc, (long)G_VAR.ARGS);
}
