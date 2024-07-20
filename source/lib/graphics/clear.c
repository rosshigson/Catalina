#include <graphics.h>

// Clear ether the display (if not double buffering),
// or the double buffer bitmap (if double buffering)
//
void g_clear() {
   _setcommand(CGI_loop, 0);
   g_memset((void *)G_VAR.BITMAP_BASE, 0, G_VAR.BITMAP_SIZE);
}
