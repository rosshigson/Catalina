'===============================================================================
'
' This configuration file should only contain #defines for configuring various
' platform-specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any other platform-specific definitions or
' constants should be included in the definitions file for the platform.
'
' RamBlade platform #defines (note XMM #defines now in RamBlade_XMM.inc):
'
'===============================================================================
'
' SD must be activated before each use
#define ACTIVATE_EACH_USE_SD
'
' SD must be tristated (rather than just deactivated) afer each use
#define TRISTATE_SD
'
' Stop_IO after each request in Proxy Server
#define STOP_IO_PROXY
