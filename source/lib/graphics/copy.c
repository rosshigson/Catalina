#include <graphics.h>

#include <stdlib.h>

extern unsigned long _display_base;

// Copy either the specified bitmap, or (if NULL)
// the double buffer bitmap to the display
// (use for flicker-free display)
//
void g_copy(void *bitmap_base) {
 
   if (bitmap_base == NULL) { 
      // copy double buffer bitmap
      bitmap_base = (void *)G_VAR.BITMAP_BASE;
      if ((void *)_display_base != bitmap_base) {
         _setcommand(CGI_loop, 0);
         g_memmove ((void *)_display_base, bitmap_base, G_VAR.BITMAP_SIZE); 
      }
   }
}
