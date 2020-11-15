'===============================================================================
'
' RamBlade General definitions:
' 
'===============================================================================
KBD_PIN    = 23                 ' BASE PIN  (RamBlade - for "1 pin" KBD driver only)
MOUSE_PIN  = -1                 ' BASE PIN  (RamBlade)
TV_PIN     = 22                 ' BASE PIN  (RamBlade - for "1 pin" TV driver only)
VGA_PIN    = -1                 ' BASE PIN  (RamBlade)
SOUND_PIN  = -1                 ' PIN (RamBlade) No Sound
NES_CL_PIN = -1                 ' PIN (RamBlade) No Gamepad
NES_LT_PIN = -1                 ' PIN (RamBlade) No Gamepad
NES_D1_PIN = -1                 ' PIN (RamBlade) No Gamepad
NES_D2_PIN = -1                 ' PIN (RamBlade) No Gamepad
SD_DO_PIN  = 24                 ' PIN (RamBlade)
SD_CLK_PIN = 26                 ' PIN (RamBlade) 
SD_DI_PIN  = 25                 ' PIN (RamBlade)
SD_CS_PIN  = 19                 ' PIN (RamBlade)
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 23                 ' PIN (RamBlade)
SO_PIN     = 22                 ' PIN (RamBlade)
'
DEBUG_PIN  = -1                 ' PIN (ASC)
'
' RamBlade Clock definitions:
' 
'CLOCKMODE = xtal1 + pll8x       ' (RamBlade)
'XTALFREQ  = 10_000_000          ' (RamBlade)
'CLOCKFREQ = 80_000_000          ' (RamBlade) Nominal clock frequency (required by some drivers)
'
CLOCKMODE = xtal1 + pll16x      ' (RamBlade)
XTALFREQ  = 6_250_000           ' (RamBlade)
CLOCKFREQ = 100_000_000         ' (RamBlade) Nominal clock frequency (required by some drivers)
'
'CLOCKMODE = xtal1 + pll16x      ' (RamBlade)
'XTALFREQ  = 6_500_000           ' (RamBlade)
'CLOCKFREQ = 104_000_000         ' (RamBlade) Nominal clock frequency (required by some drivers)
'
' RamBlade Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 1               ' RamBlade has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms and serial loading                
SIO_LOAD_MODE = %0000           ' RamBlade has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' RamBlade has only one CPU - this is for serial loading
TX_PIN        = -1              ' RamBlade has only one CPU
RX_PIN        = -1              ' RamBlade has only one CPU
'
' RamBlade Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' RamBlade BlackCat debug pins (SI/SO pins)
'
BLACKCAT_RXPIN = 31             ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = 30             ' Tx pin to use for BlackCat comms
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

