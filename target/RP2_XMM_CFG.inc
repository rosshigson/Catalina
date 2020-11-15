{
'------------------------ RAMPAGE2 XMM Configuration ---------------------------
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
' Force the loader to use CHIP_ERASE (instead of BLOCK_ERASE)
#ifndef CHIP_ERASE
#define CHIP_ERASE
#endif
'
' Force the RAM Test program to use buffers of an even size (i.e. whole words)
#ifndef NO_OVERLAP
#define NO_OVERLAP
#endif
'
'========================== END OF XMM CONFIGURATION ===========================
'
