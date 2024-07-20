#include <vgraphic.h>

// Draw text at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
//
void g_textarc(int x, int y, int xr, int yr, 
               int angle, void *string_ptr) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = xr;
   *arg_ptr++ = yr;
   *arg_ptr++ = angle;
   *arg_ptr = (int)string_ptr;

   g_justify(string_ptr, 
         (int *)&G_VAR.ARGS[6], 
         (int *)&G_VAR.ARGS[7]); // justify str and draw text
   _setcommand(VGI_textarc, (long)G_VAR.ARGS);
}
