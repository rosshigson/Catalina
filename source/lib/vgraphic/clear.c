#include <vgraphic.h>

// Clear ether the display (if not double buffering),
// or the double buffer bitmap (if double buffering)
//
void g_clear() {
   g_flush();
   _db_setcommand(VDB_clear, 0);
}
