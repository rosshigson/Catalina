'===============================================================================
'
' Propeller ASC General definitions:
' 
'===============================================================================

KBD_PIN    = 22                 ' BASE PIN (ASC)
MOUSE_PIN  = 20                 ' BASE PIN (ASC)
TV_PIN     = 16                 ' BASE PIN (ASC)
VGA_PIN    = 16                 ' BASE PIN (ASC)
SOUND_PIN  = -1                 ' PIN (ASC) No Sound
NES_CL_PIN = -1                 ' PIN (ASC) No Gamepad
NES_LT_PIN = -1                 ' PIN (ASC) No Gamepad
NES_D1_PIN = -1                 ' PIN (ASC) No Gamepad
NES_D2_PIN = -1                 ' PIN (ASC) No Gamepad
SD_DO_PIN  = 12                 ' PIN (ASC)
SD_CLK_PIN = 13                 ' PIN (ASC) 
SD_DI_PIN  = 11                 ' PIN (ASC)
SD_CS_PIN  = 20                 ' PIN (ASC)
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (ASC)
SO_PIN     = 30                 ' PIN (ASC)
'
DEBUG_PIN  = -1                 ' PIN (ASC)
'
' Propeller ASC Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (ASC)
XTALFREQ  = 5_000_000           ' (ASC)
CLOCKFREQ = 80_000_000          ' (ASC) Nominal clock frequency (required by some drivers)
'
' Demo platform Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' ASC has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' ASC has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' ASC has only one CPU - this is for serial loading
TX_PIN        = -1              ' ASC has only one CPU
RX_PIN        = -1              ' ASC has only one CPU
'
' Propeller ASC Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Propeller ASC BlackCat debug pins (SI/SO pins)
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

