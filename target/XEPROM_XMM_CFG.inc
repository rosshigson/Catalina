{
'-------------------------- XMM EEPROM Configuration ---------------------------
'
' This file contains configuration details for using EEPROM as XMM. The EEPROM 
' must be larger than 32k to be used for XMM (note that a 64k EEPROM is better 
' used as CMM or LMM, which can be done using just the EEPROM loader). 
' 
}
'============================= XMM CONFIGURATION ===============================
'
' This configuration file should only contain #defines for configuring XMM
' specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any platform-specific definitions or
' constants should be included in the definition file for the platform.
'
' XMM pins are shared with other devices (uncomment these lines if required)
'#ifndef SHARED_XMM
'#define SHARED_XMM
'#endif
'
' Include XMM Memory support in Catalyst Loader (for loading XMM programs -
' uncomment these lines if required)
'#ifndef XMM_LOADER
'#define XMM_LOADER
'#endif
'
'========================== END OF XMM CONFIGURATION ===========================
'
