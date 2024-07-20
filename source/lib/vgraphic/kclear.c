#include <vgraphic.h>
#include <plugin.h>

/*
 * gk_clear - clear the keybaord buffer
 */

extern char *kb_block;

int gk_clear() {
   if (kb_block == 0) {
      gk_initialize();
   }
   if (kb_block != 0) {
      *(long *)(kb_block + OFF_TAIL) = *(long *)(kb_block + OFF_HEAD);
      return 1;
   }
   return 0;
}


