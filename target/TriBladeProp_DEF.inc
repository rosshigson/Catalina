'===============================================================================
'
' TriBladeProp CPU #1 General definitions:
'
'===============================================================================
' Note that there are two main ways to configure CPU #1 - for VGA or for TV.
' The keyboard and mouse can be configured to use two different sets of pins, 
' but to use XMM they MUST be configured to use pins 8 - 11. The VGA output 
' cannot be used at the same time as the XMM RAM, so there are therefore two 
' different sets of definitions given below. 
' The first assumes no XMM, VGA display, and mouse and keyboard on pins 24 - 27.
' The second assumes XMM, TV display, and mouse and keyboard on pins 8-11. 
' All of the TriBladeProp targets assume the latter.
' 
#ifdef VGA

' TriBladeProp CPU #1 General definitions (no XMM, VGA display, Kbd, Mouse)
'
'    NOTE that LK11 links 5,6,7,8 should be installed, and all LK12 links 
'    should be on 2-3 and should be connected straight through, as shown in
'    the diagram below:
'
'          9  10  11  12  13  14  15  16
'       +-------------------------------+
'     3 | o   o   o   o   o   o   o   o |
'       | |   |   |   |   |   |   |   | |
'     2 | o   o   o   o   o   o   o   o |
'       |                               |
'     1 | o   o   o   o   o   o   o   o |
'       +------------------------------++
'
KBD_PIN   = 26                  ' BASE PIN  (TriBladeProp)
MOUSE_PIN = 24                  ' BASE PIN  (TriBladeProp)
TV_PIN    = -1                  ' BASE PIN  (TriBladeProp)
VGA_PIN   = 8                   ' BASE PIN  (TriBladeProp) 
'
#elseifdef HIRES_VGA
'
' Same as VGA (see above)
'
KBD_PIN   = 26                  ' BASE PIN  (TriBladeProp)
MOUSE_PIN = 24                  ' BASE PIN  (TriBladeProp)
TV_PIN    = -1                  ' BASE PIN  (TriBladeProp)
VGA_PIN   = 8                   ' BASE PIN  (TriBladeProp) 
'
#elseifdef LORES_VGA
'
' Same as VGA (see above)
'
KBD_PIN   = 26                  ' BASE PIN  (TriBladeProp)
MOUSE_PIN = 24                  ' BASE PIN  (TriBladeProp)
TV_PIN    = -1                  ' BASE PIN  (TriBladeProp)
VGA_PIN   = 8                   ' BASE PIN  (TriBladeProp) 
'
#else
'
'
' TriBladeProp CPU #1 General definitions (XMM, TV display, Kbd, Mouse)
'
'    NOTE that no links should be installed on LK11 and that all lk12 links 
'    should be on pins 1-2, but that LINKS 9 & 10, and LINKS 11 & 12 must be 
'    CROSSED OVER - not connected straight - see the diagram below and note 
'    the positions of the 'X' connections:
'
'          9  10  11  12  13  14  15  16
'       +-------------------------------+
'     3 | o   o   o   o   o   o   o   o |
'       |                               |
'     2 | o   o   o   o   o   o   o   o |
'       |   X       X     |   |   |   | |
'     1 | o   o   o   o   o   o   o   o |
'       +------------------------------++
'
KBD_PIN   = 8                   ' BASE PIN  (TriBladeProp)
MOUSE_PIN = 10                  ' BASE PIN  (TriBladeProp)
TV_PIN    = 12                  ' BASE PIN  (TriBladeProp)
VGA_PIN   = -1                  ' BASE PIN  (TriBladeProp)
'
#endif
'
DEBUG_PIN  = 31                 ' PIN (TriBladeProp)
'
'
' TriBladeProp CPU #1 General definitions (I2C):
'
I2C_PIN   = 28                  ' I2C Boot EEPROM SCL Pin
I2C_DEV   = $A0                 ' I2C Boot EEPROM Device Address
'
' TriBladeProp CPU #2 General definitions:
'
SD_DO_PIN  = 9                  ' PIN (TriBladeProp)
SD_CLK_PIN = 28                 ' PIN (TriBladeProp) 
SD_DI_PIN  = 8                  ' PIN (TriBladeProp)
SD_CS_PIN  = 14                 ' PIN (TriBladeProp)
'
' TriBladeProp General defintions common to all CPUs:
'
SI_PIN     = 31                 ' PIN (TriBladeProp)
SO_PIN     = 30                 ' PIN (TriBladeProp)
'
' TriBladeProp Clock definitions (all CPUs):
' 
CLOCKMODE = xtal1 + pll16x      ' (TriBladeProp)
XTALFREQ  = 5_000_000           ' (TriBladeProp)
CLOCKFREQ = 80_000_000          ' (TriBladeProp) Nominal clock frequency (required by some drivers)
'
SOUND_PIN  = -1                 ' PIN (TriBladeProp) No Sound
NES_CL_PIN = -1                 ' PIN (TriBladeProp) No Gamepad
NES_LT_PIN = -1                 ' PIN (TriBladeProp) No Gamepad
NES_D1_PIN = -1                 ' PIN (TriBladeProp) No Gamepad
NES_D2_PIN = -1                 ' PIN (TriBladeProp) No Gamepad
'
' TriBladeProp InterProp comms definitions:
'
#ifdef CPU_1
DEFAULT_CPU   = 1               ' Default CPU for multi-CPU system
#elseifdef CPU_2
DEFAULT_CPU   = 2               ' Default CPU for multi-CPU system
#else
DEFAULT_CPU   = 0               ' Default CPU for multi-CPU system
#endif
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms
#ifdef CPU_2                 
SIO_LOAD_MODE = %0000           ' SIO Mode used by targets during load loader uses SIO_COMM_MODE
#else 
SIO_LOAD_MODE = %0100           ' SIO Mode used by targets during load loader uses SIO_COMM_MODE
#endif
SIO_COMM_MODE = %0000           ' SIO Mode used by clients and servers for InteProp Comms
#ifdef CPU_2
TX_PIN        = 31              ' Proxy Tx on CPU #2 (for comms to other CPUs)
RX_PIN        = 30              ' Proxy Rx on CPU #2 (for comms to other CPUs)
#else
TX_PIN        = 30              ' Proxy Tx on CPU CPU #1 or CPU #3 (for comms to other CPUs)
RX_PIN        = 31              ' Proxy Tx on CPU CPU #1 or CPU #3 (for comms to other CPUs)
#endif
'
' TriBladeProp Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' TriBladeProp BlackCat debug pins (SI/SO pins)
'
BLACKCAT_RXPIN = SI_PIN         ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = SO_PIN         ' Tx pin to use for BlackCat comms
BLACKCAT_MODE  = %0000          ' SIO mode to use for BlackCat comms
'
' Cog Allocation. The value LAST_COG specifies the last cog that will 
' be restarted during the load process. It should be set to one less than
' the cog used for the CogStore. If the Cache is in use it will always be
' started in Cog 7, and if CogStore is in use it will always be started in
' the next lower cog. Set this value lower still to reserve one or more cogs 
' for other purposes. Note that it is still the users responsibility to 
' ensure that the combination of loaded drivers and plugins does not 
' exceed this value. Note also that the CogStore cog can be used by an
' application - it is not restarted during the load process (otherwise 
' its values would be lost) - but it is restarted before any user 
' plugins are loaded. 
'
#ifdef CACHED

CACHE_COG    = 7                ' XMM Cache driver will use this cog
STORE_COG    = 6                ' Catalina CogStore will use this cog
LAST_COG     = 5                ' Last cog to be restarted is 5

#else

CACHE_COG    = -1               ' XMM Cache driver not loaded
STORE_COG    = 7                ' Catalina CogStore will use this cog
LAST_COG     = 6                ' Last cog to be restarted is 6

#endif 

