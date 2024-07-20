#include <vgraphic.h>

#include <stdlib.h>

extern unsigned long _display_base;

// Copy the double buffer bitmap to the display
// (use for flicker-free display)
//
void g_move(int double_buffer) {
 
   g_flush();
   if (double_buffer) {
      // copy double buffer bitmap
      //G_VAR.DB_ARGS[1] = (int)G_VAR.ONSCRN_BASE;
      _db_setcommand(VDB_move, (long)G_VAR.DB_ARGS);   
   }
}
