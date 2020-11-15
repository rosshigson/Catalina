'===============================================================================
'
' Propeller Platform (PP) General definitions:
' 
'===============================================================================

KBD_PIN    = -1                 ' BASE PIN (PP) No Keyboard
MOUSE_PIN  = -1                 ' BASE PIN (PP) No Mouse
TV_PIN     = 12                 ' BASE PIN (PP)
VGA_PIN    = -1                 ' BASE PIN (PP) No VGA
SOUND_PIN  = 11                 ' PIN (PP)
NES_CL_PIN = 23                 ' PIN (PP) 
NES_LT_PIN = 24                 ' PIN (PP)
NES_D1_PIN = 25                 ' PIN (PP)
NES_D2_PIN = 26                 ' PIN (PP)
'
' Note that for SD Card support, we check for the RP2, and if in
' use, we use those pin definitions. Otherwise we use the 
' Propeller Platform Board definitions.
'
#ifdef RP2
SD_DO_PIN  = 12                 ' RamPage2 (override)
SD_CLK_PIN = 13                 ' RamPage2 (override)
SD_DI_PIN  = 14                 ' RamPage2 (override)
SD_CS_PIN  = 15                 ' RamPage2 (override)
#else
SD_DO_PIN  = 0                  ' PIN (PP)
SD_CLK_PIN = 1                  ' PIN (PP) 
SD_DI_PIN  = 2                  ' PIN (PP)
SD_CS_PIN  = 3                  ' PIN (PP)
#endif
'
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (PP)
SO_PIN     = 30                 ' PIN (PP)
'
DEBUG_PIN  = -1                 ' PIN (PP)
'
' Propeller PP Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (PP)
XTALFREQ  = 5_000_000           ' (PP)
CLOCKFREQ = 80_000_000          ' (PP) Nominal clock frequency (required by some drivers)
'
' Demo platform Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' PP has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' PP has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' PP has only one CPU - this is for serial loading
TX_PIN        = -1              ' PP has only one CPU
RX_PIN        = -1              ' PP has only one CPU
'
' Propeller PP Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Propeller PP BlackCat debug pins (SI/SO pins)
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

