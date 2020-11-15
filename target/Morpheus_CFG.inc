'===============================================================================
'
' This configuration file should only contain #defines for configuring various
' platform-specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any other platform-specific definitions or
' constants should be included in the definitions file for the platform.
'
' Morpheus platform #defines (note XMM #defines now in Morpheus_XMM.inc):
'
'===============================================================================
'
' Include SIO Support in Catalyst Loader (for loading multiple CPUs)
#define MULTI_CPU_LOADER
'
' Process Replies in Loader (when loading other CPUs)
#define PROCESS_REPLIES_LOADER
