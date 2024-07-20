#include <prop.h>
#include <cog.h>

#include "catalyst.h"

#ifndef __CATALINA_P2

#if ENABLE_CPU

#ifndef __USING_CACHE // can't use cache and sio (multi-cpu loader) together

#include "sio_array.h"

int StartSIO() {
   return _coginit(REGISTRY>>2, (int)SIO_array>>2, ANY_COG);
}

#endif

#endif

#endif
