'===============================================================================
'
' Hybrid General definitions:
'
'===============================================================================
KBD_PIN    = 12                 ' BASE PIN (Hybrid)
MOUSE_PIN  = 14                 ' BASE PIN (Hybrid)
TV_PIN     = 24                 ' BASE PIN (Hybrid)
VGA_PIN    = -1                 ' BASE PIN (Hybrid) No VGA 
SOUND_PIN  = 7                  ' PIN (Hybrid)
NES_CL_PIN = 3                  ' PIN (Hybrid)
NES_LT_PIN = 4                  ' PIN (Hybrid)
NES_D1_PIN = 5                  ' PIN (Hybrid)
NES_D2_PIN = 6                  ' PIN (Hybrid)
SD_DO_PIN  = 8                  ' (Hybrid)
SD_CLK_PIN = 9                  ' (Hybrid) 
SD_DI_PIN  = 10                 ' (Hybrid)
SD_CS_PIN  = 11                 ' (Hybrid)
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
'
' On the Hybrid, we can use the PC HMI option throught the mouse port!
'
#ifdef LARGE
SI_PIN     = 14                 ' PIN (Hybrid)
SO_PIN     = 15                 ' PIN (Hybrid)
#elseifdef SMALL
SI_PIN     = 14                 ' PIN (Hybrid)
SO_PIN     = 15                 ' PIN (Hybrid)
#else
SI_PIN     = 31                 ' PIN (Hybrid)
SO_PIN     = 30                 ' PIN (Hybrid)
#endif
'
DEBUG_PIN  = 0                  ' Debug LED on pin 0
'
' Hybrid Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (Hybrid)
XTALFREQ  = 6_000_000           ' (Hybrid)
CLOCKFREQ = 96_000_000          ' (Hybrid) Nominal clock frequency (required by some drivers)
'
' Hybrid Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' Hybrid has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms and serial loading               
SIO_LOAD_MODE = %0000           ' Hybrid has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' Hybrid has only one CPU - this is for serial loading
TX_PIN        = -1              ' Hybrid has only one CPU
RX_PIN        = -1              ' Hybrid has only one CPU
'
' Hybrid Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Hybrid BlackCat debug pins (mouse pins) - can be used for LMM or XMM but requires special cable
'
BLACKCAT_RXPIN = 14             ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = 15             ' Tx pin to use for BlackCat comms
BLACKCAT_MODE  = %0000          ' SIO mode to use for BlackCat comms
{
'
' Hybrid BlackCat debug pins (SI/SO pins) - can only be used for LMM, but uses normal serial cable
'
BLACKCAT_RXPIN = SI_PIN         ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = SO_PIN         ' Tx pin to use for BlackCat comms
BLACKCAT_MODE  = %0000          ' SIO mode to use for BlackCat comms
}
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

