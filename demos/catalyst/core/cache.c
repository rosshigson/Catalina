#include <prop.h>
#include <cog.h>
#include <plugin.h>

#include "catalyst.h"

#ifdef __USING_CACHE

#ifdef __CATALINA_P2
#include "cache_array_p2.h"
#else
#include "cache_array.h"
#endif

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
      _register_plugin(result, LMM_XCH);
      while (*(unsigned long *)(XMM_CACHE_CMD) != 0) ;
   }
   return result;
}

#endif
