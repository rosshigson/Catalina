#include <graphics.h>
#include <plugin.h>

/*
 * gk_get - get a key (return 0 if no key available or keyboard not found)
 */

extern char *kb_block;

int gk_get() {
   int key = 0;

   if (kb_block == 0) {
      gk_initialize();
   }
   if (kb_block != 0) {
      if (*((long *)(kb_block + OFF_TAIL)) != *((long *)(kb_block + OFF_HEAD))) {
         key = *(short *) (kb_block + OFF_KEYS + (*(long *)(kb_block + OFF_TAIL)<<1));
         *(long *)(kb_block + OFF_TAIL) = ((*(long *)(kb_block + OFF_TAIL)) + 1) & 0xF; 
      }
   }
   return key;
}


