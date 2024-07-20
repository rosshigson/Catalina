'
' The ACTIVITY Board supports only serial comms HMI options, such as the PC
' and PROPTERMINAL options (the default is TTY). 
'
' It assumes a 5Mhz crystal is installed. 
'
' Programs should be compiled to use the ACTIVITY board - e.g:
'
'    catalina hello_world.c -lc -C ACTIVITY
'
'===============================================================================
'
' ACTIVITY board General definitions:
' 
'===============================================================================

KBD_PIN    = -1                 ' BASE PIN  (ACTIVITY)
MOUSE_PIN  = -1                 ' BASE PIN  (ACTIVITY)
TV_PIN     = -1                 ' BASE PIN  (ACTIVITY)
VGA_PIN    = -1                 ' BASE PIN  (ACTIVITY)
SOUND_PIN  = -1                 ' PIN (ACTIVITY) No Sound
NES_CL_PIN = -1                 ' PIN (ACTIVITY) No Gamepad
NES_LT_PIN = -1                 ' PIN (ACTIVITY) No Gamepad
NES_D1_PIN = -1                 ' PIN (ACTIVITY) No Gamepad
NES_D2_PIN = -1                 ' PIN (ACTIVITY) No Gamepad
SD_DO_PIN  = 22                 ' ACTIVITY has no SD Card
SD_CLK_PIN = 23                 ' ACTIVITY has no SD Card 
SD_DI_PIN  = 24                 ' ACTIVITY has no SD Card
SD_CS_PIN  = 25                 ' ACTIVITY has no SD Card
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (ACTIVITY)
SO_PIN     = 30                 ' PIN (ACTIVITY)
'
DEBUG_PIN  = -1                 ' PIN (ACTIVITY)
'
' ACTIVITY board Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (ACTIVITY)
XTALFREQ  = 5_000_000           ' (ACTIVITY)
CLOCKFREQ = 80_000_000          ' (ACTIVITY) Nominal clock frequency
                                ' (required by some drivers)
'
' ACTIVITY board Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' ACTIVITY has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' ACTIVITY has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' ACTIVITY has only one CPU - this is for serial loading
TX_PIN        = -1              ' ACTIVITY has only one CPU
RX_PIN        = -1              ' ACTIVITY has only one CPU
'
' ACTIVITY board Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' ACTIVITY board BlackCat debug pins (SI/SO pins)
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
