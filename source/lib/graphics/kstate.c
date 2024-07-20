#include <graphics.h>
#include <plugin.h>

/*
 * gk_state - get current state of key (0 .. 255)
 */

extern char *kb_block;

int gk_state(int key) {
   static int *key_state = 0;

   if (kb_block == 0) {
      gk_initialize();
   }
   if (key_state == 0) {
      key_state = (int *)(kb_block + OFF_STATES);
   }
   return (((key_state[key>>5])>>(key & 0x1f)) & 0x1);
}


