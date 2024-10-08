{
'------------------------ RAMBLADE XMM Configuration ---------------------------
}
'============================= XMM CONFIGURATION ===============================
'
' This configuration file should only contain #defines for configuring XMM
' specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any platform-specific definitions or
' constants should be included in the configuration file for the platform.
'
' Include XMM Memory support in Catalyst Loader (for loading XMM programs)
#ifndef XMM_LOADER
#define XMM_LOADER
#endif
'
' XMM pins are shared with other devices
#ifndef SHARED_XMM
#define SHARED_XMM
#endif
'
'========================== END OF XMM CONFIGURATION ===========================
'
