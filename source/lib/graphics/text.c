#include <graphics.h>

// Draw text
//
//   x,y         - text position (see textmode for sizing and justification)
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
void g_text(int x, int y, void *string_ptr) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr = (int)string_ptr;
   
   g_justify(string_ptr, 
         (int *)&G_VAR.ARGS[3], 
         (int *)&G_VAR.ARGS[4]); // justify str and draw text
   _setcommand(CGI_text, (long)G_VAR.ARGS);
}
