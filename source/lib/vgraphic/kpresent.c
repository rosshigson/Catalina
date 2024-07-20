#include <vgraphic.h>
#include <plugin.h>

/*
 * gk_present - return non-zero if keyboard found and connected
 */

extern char *kb_block;

int gk_present() {
   if (kb_block == 0) {
      gk_initialize();
   }
   if (kb_block != 0) {
      return *(long *)(kb_block + OFF_PRESENT);
   }
   return 0;
}


