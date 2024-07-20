{
' This file is a skeleton file that can be used to add XMM support for a
' completely new Propeller platform, or for a memory add-on board to be
' used with multiple Propeller platforms.
'
' The first step is to decide on the Platform or Board name, and the Catalina 
' symbol that will be used to specify it on the command line (using the -C 
' command line option). In this file We will assume the platform is to be 
' called "New_Board", and we will use the symbol NEW_BOARD. 
'
' 1. The first step is to rename this file to be "New_Board_XMM_CFG.inc".
' 
' 2. The next step is to update CFG.inc. Add the following lines 
'    to the first list in CFG.inc, just before the line that says
'    "#elseifdef CUSTOM":
'
'      #elseifdef NEW_BOARD
'      #include "New_Board_XMM_CFG.inc"
'
' 3. Determine if there are any Configuration #defines that must be specified
'    for this platform, and include them below. The two most common options
'    are already included below - the XMM_LOADER should always be included for
'    all XMM boards, so it is already defined. Uncomment the SHARED_XMM option
'    if the XMM circuitry on this board shares pins with other devices.
'
}
'============================= XMM CONFIGURATION ===============================
'
' This configuration file should only contain #defines for configuring XMM
' specific hardware (for example, whether the pins used for XMM access
' are shared with other devices). Any platform-specific definitions or
' constants should be included in the configuration file for the platform.
'
' XMM pins are shared with other devices (uncomment these lines if required)
'#ifndef SHARED_XMM
'#define SHARED_XMM
'#endif
'
' Include XMM Memory support in Catalyst Loader (for loading XMM programs)
#ifndef XMM_LOADER
#define XMM_LOADER
#endif

'
'========================= END OF XMM CONFIGURATION ============================
'
