#include <graphics.h>
#include <plugin.h>

/*
 * gk_ready - return true if there is a key available to read
 */

extern char *kb_block;

int gk_ready() {
   if (kb_block == 0) {
      gk_initialize();
   }
   if (kb_block != 0) {
      return (*((long *)(kb_block + OFF_TAIL)) != *((long *)(kb_block + OFF_HEAD)));
   }
   return 0;
}


