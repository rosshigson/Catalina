{
'--------------------------- DualSRAM XMM Configuration ------------------------
}
'============================= XMM CONFIGURATION ===============================
'
' This configuration file should only contain #defines for configuring XMM
' specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any platform-specific definitions or
' constants should be included in the configuration file for the platform.
'
' XMM pins are shared with other devices (uncomment these lines if required)
#ifndef SHARED_XMM
#define SHARED_XMM
#endif
'
' Include XMM Memory support in Catalyst Loader (for loading XMM programs -
' uncomment these lines if required)
#ifndef XMM_LOADER
#define XMM_LOADER
#endif

' Force the RAM Test program to use buffers of an even size (i.e. whole words)
#ifndef NO_OVERLAP
#define NO_OVERLAP
#endif



'
'========================== END OF XMM CONFIGURATION ===========================
'
