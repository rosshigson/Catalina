{
'------------------------- FLASHPOINT XMM Configuration ------------------------
}
'============================= XMM CONFIGURATION ===============================
'
' This configuration file should only contain #defines for configuring XMM
' specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any platform-specific definitions or
' constants should be included in the configuration file for the platform.
'
#ifdef SUPERQUAD
' define this symbol since the SUPERQUAD contains no RAM, only FLASH
#ifndef NO_RAM
#define NO_RAM
#endif
#endif
'
' Include XMM Memory support in Catalyst Loader (for loading XMM programs)
#ifndef XMM_LOADER
#define XMM_LOADER
#endif
'
'========================== END OF XMM CONFIGURATION ===========================
'
