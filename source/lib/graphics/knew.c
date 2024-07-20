#include <graphics.h>
#include <plugin.h>

/*
 * gk_new - erase keyboard buffer, then wait for a new key
 */

extern char *kb_block;

int gk_new() {
   if (kb_block == 0) {
      gk_initialize();
   }
   if (kb_block != 0) {
      *(long *)(kb_block + OFF_TAIL) = *(long *)(kb_block + OFF_HEAD);
      return gk_wait();
   }
   return 0;
}


