#include <vgraphic.h>

#include <stdlib.h>

// Enable double buffering
//
void g_db_setup(int double_buffer) {
   register int *arg_ptr = G_VAR.DB_ARGS;

   g_flush();
   *arg_ptr++ = (int)G_VAR.OFFSCRN_BASE;
   //if (double_buffer) {
      *arg_ptr++ = (int)G_VAR.ONSCRN_BASE;
   //}
   //else {
   //   *arg_ptr++ = 0;
   //}
   *arg_ptr++ = double_buffer;
   *arg_ptr++ = (int)G_VAR.TILE_0;
   *arg_ptr++ = (int)G_VAR.X_TILES * G_VAR.Y_TILES;
   *arg_ptr   = (int)&G_VAR.TILE_LIST;
   _db_setcommand(VDB_setup, (long)G_VAR.DB_ARGS);
}
