#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

// Draw a vector sprite at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
//   vecscale    - scale of vector sprite ($100 = 1x)
//   vecangle    - rotation angle of vector sprite in bits[12..0]
//   vecdef_ptr  - address of vector sprite definition
//
void g_vecarc(int x, int y, int xr, int yr, int angle, 
              int vecscale, int vecangle, void * vecdef_ptr) {
   int args[8];
   register int *arg_ptr = args;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = xr;
   *arg_ptr++ = yr;
   *arg_ptr++ = angle;
   *arg_ptr++ = vecscale;
   *arg_ptr++ = vecangle;
   *arg_ptr = (int)vecdef_ptr;
   _setcommand(VGI_vecarc, (long)args);
}

