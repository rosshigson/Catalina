#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

#if defined(__CATALINA_LARGE)
#include <alloca.h>
#include <string.h>
#endif

// Draw text at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
//
void g_textarc(int x, int y, int xr, int yr, 
               int angle, void *string_ptr) {
   int args[8];
   register int *arg_ptr = args;
   register char *hub_string_ptr;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = xr;
   *arg_ptr++ = yr;
   *arg_ptr++ = angle;
#if defined(__CATALINA_LARGE)
   hub_string_ptr = alloca(strlen(string_ptr)+1);
   strcpy(hub_string_ptr, string_ptr);
   *arg_ptr++ = (int)hub_string_ptr;
#else
   *arg_ptr++ = (int)string_ptr;
#endif

   g_justify(string_ptr, &args[6], &args[7]); // justify str and draw text
   _setcommand(VGI_textarc, (long)args);
}


