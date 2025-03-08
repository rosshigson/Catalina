#ifndef PLATFORM_CONSTANTS_INCLUDED

' stop multiple inclusions of platform constants ...

#define PLATFORM_CONSTANTS_INCLUDED


'--------------------------- START OF PLATFORM CONSTANTS ---------------------
'
CON

#if defined(P2_EVAL)
#include "P2EVAL.inc"
#elif defined(P2_EDGE)
#include "P2EDGE.inc"
#elif defined(P2_MASTER)
#include "P2MASTER.inc"
#elif defined(P2_SLAVE)
#include "P2SLAVE.inc"
#elif defined(P2_WIFI)
#include "P2WIFI.inc"
#elif defined(P2_WIFI_MASTER)
#include "P2WIFI_M.inc"
#elif defined(P2_WIFI_SLAVE)
#include "P2WIFI_S.inc"
#elif defined(P2D2)
#include "P2D2.inc"
#elif defined(P2_CUSTOM) || defined(CUSTOM)
#include "P2CUSTOM.inc"
#else
' default is to use P2_CUSTOM constants
#include "P2CUSTOM.inc"
#endif

'--------------------------- END OF PLATFORM CONSTANTS -----------------------

#endif

