'===============================================================================
'
' Demo Board General definitions:
' 
'===============================================================================
KBD_PIN    = 26                 ' BASE PIN  (Demo)
MOUSE_PIN  = 24                 ' BASE PIN  (Demo)
TV_PIN     = 12                 ' BASE PIN  (Demo)
VGA_PIN    = 16                 ' BASE PIN  (Demo)
SOUND_PIN  = -1                 ' PIN (Demo) No Sound
NES_CL_PIN = -1                 ' PIN (Demo) No Gamepad
NES_LT_PIN = -1                 ' PIN (Demo) No Gamepad
NES_D1_PIN = -1                 ' PIN (Demo) No Gamepad
NES_D2_PIN = -1                 ' PIN (Demo) No Gamepad
'
' Note that for SD Card support, we check for the PMC, and if in use we use 
' those pin definitions. Otherwise we do not have an SD Card.
'
#ifdef PMC
SD_DO_PIN  = 1                  ' Propeller Memory Card (override)
SD_CLK_PIN = 7                  ' Propeller Memory Card (override)
SD_DI_PIN  = 0                  ' Propeller Memory Card (override)
SD_CS_PIN  = 4                  ' Propeller Memory Card (override)
#else
SD_DO_PIN  = -1                 ' Demo has no SD Card
SD_CLK_PIN = -1                 ' Demo has no SD Card 
SD_DI_PIN  = -1                 ' Demo has no SD Card
SD_CS_PIN  = -1                 ' Demo has no SD Card
#endif

I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (Demo)
SO_PIN     = 30                 ' PIN (Demo)
'
DEBUG_PIN  = -1                 ' PIN (Demo)
'
' Demo Board Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (Demo)
XTALFREQ  = 5_000_000           ' (Demo)
CLOCKFREQ = 80_000_000          ' (Demo) Nominal clock frequency (required by some drivers)
'
' Demo Board Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' Demo has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' Demo has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' Demo has only one CPU - this is for serial loading
TX_PIN        = -1              ' Demo has only one CPU
RX_PIN        = -1              ' Demo has only one CPU
'
' Demo Board Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Demo Board BlackCat debug pins (SI/SO pins)
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

