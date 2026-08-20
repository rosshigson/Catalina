#include <stdlib.h>
#include <plugin.h>

#include <graphic2.h>

#if defined(__CATALINA_LARGE)
#include <alloca.h>
#include <string.h>
#endif

// Draw text
//
//   x,y         - text position (see textmode for sizing and justification)
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
void g_text(int x, int y, void *string_ptr) {
   int args[8];
   register int *arg_ptr = args;
   register char *hub_string_ptr;

   *arg_ptr++ = x;
   *arg_ptr++ = y;
#if defined(__CATALINA_LARGE)
   hub_string_ptr = alloca(strlen(string_ptr)+1);
   strcpy(hub_string_ptr, string_ptr);
   *arg_ptr++ = (int)hub_string_ptr;
#else
   *arg_ptr++ = (int)string_ptr;
#endif
   *arg_ptr++ = 0;
   *arg_ptr++ = 0;
   g_justify(string_ptr, (&args[3]), (&args[4])); // justify str and draw text
   _setcommand(VGI_text, (long)args);

}


