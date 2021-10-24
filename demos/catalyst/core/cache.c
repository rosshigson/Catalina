#include <propeller.h>
#include <catalina_cog.h>

#include "catalyst.h"

#ifdef __USING_CACHE

#include "cache_array.h"

int StartCache() {
   int result;
   unsigned long Data[4] = {
      XMM_CACHE_CMD,     // 0
      XMM_CACHE,         // 1
      0,                 // 2
      0                  // 3
   };

   *(unsigned long *)(XMM_CACHE_CMD) = 0xffffffff;
   result = _coginit((int)Data>>2, (int)CACHE_array>>2, CACHE_COG);
   if (result >= 0) {
      while (*(unsigned long *)(XMM_CACHE_CMD) != 0) ;
   }
   return result;
}

#endif
