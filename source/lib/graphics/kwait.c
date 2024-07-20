#include <graphics.h>
#include <plugin.h>

/*
 * gk_wait - return a key, waiting until a key is available if necessary
 */

extern char *kb_block;

int gk_wait() {
   int key;
   if (kb_block == 0) {
      gk_initialize();
   }
   do {
      key = gk_get();
   } while (key == 0);
   return key;
}


