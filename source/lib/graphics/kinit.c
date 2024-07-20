#include <graphics.h>
#include <plugin.h>

/*
 * initialize - locate keyboard driver and set up kb_block
 */

char *kb_block = 0;  // initialized on first use

void gk_initialize() {
   int cog;
  
   if (kb_block == 0) {
      // find Keyboard plugin (if loaded)
      cog = _locate_plugin(LMM_KBD);
      if (cog >= 0) {
         // fetch our base pointer
         kb_block = (char *)((*REQUEST_BLOCK(cog)).request);
      }
   }
}


