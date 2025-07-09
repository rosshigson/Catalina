#include <prop.h>
#include <plugin.h>

#if __CATALINA_P2
int getrealrand() {
   return PASM("getrnd r0");
}
#else
int getrealrand() {
   static int cog = -1;
   static request_t *request_block = NULL;
   static int last_random = 0;
   int new_random = 0;

   if (cog == -1) {
      cog = _locate_plugin(LMM_RND);
      if (cog >= 0) {
         request_block = REQUEST_BLOCK(cog);
      }
   }
   if (request_block) {
      // RANDOM plugin loaded - wait for a new random
      while ((new_random == 0) || (new_random == last_random)) {
        new_random = request_block->response;
      }
      last_random = new_random;
   }
   else {
      // RANDOM not loaded - fall back to getrand()
      new_random = getrand();
      last_random = new_random;
   }
   return new_random;
}
#endif
