'===============================================================================
'
' This configuration file should only contain #defines for configuring various
' platform-specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any other platform-specific definitions or
' constants should be included in the definitions file for the platform.
'
' C3 platform #defines (note C3 XMM #defines now in C3_XMM.inc):
'
'===============================================================================
'
' explictly enable VGA
#define ENABLE_VGA
'
' use C3-style channel select for the SD
#define CHANNEL_SELECT_SD
'
' SD must be activated before each use
#define ACTIVATE_EACH_USE_SD
'
' flash debug LED in CogCount Plugin
'#define DEBUG_LED_COGCOUNT
'
' sense of Debug LED is inverted
#define INVERT_DEBUG_LED
'
