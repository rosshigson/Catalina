'
' This file has been modified to suit the Parallax QuickStart board, with 
' the QuickStart Human Interface board installed. 
'
' Programs should be compiled to use the QUICKSTART platform - e.g:
'
'    catalina hello_world.c -lc -C QUICKSTART
'
' This file also supports the Propeller Memory Card. If this card is 
' in use, the SD card pins change from those used by the Human Interface
' board, so in addition to the QUICKSTART symbol, a separate PMC symbol 
' must also be specified to select the correct SD card pins - e.g.
'
'    catalina hello_world.c -lc -C QUICKSTART -C PMC
'
'===============================================================================
'
' QuickStart platform General definitions:
' 
'===============================================================================

KBD_PIN    = 26                 ' BASE PIN (QuickStart)
MOUSE_PIN  = 24                 ' BASE PIN (QuickStart)
TV_PIN     = 12                 ' BASE PIN (QuickStart)
VGA_PIN    = 16                 ' BASE PIN (QuickStart)
SOUND_PIN  = 10                 ' BASE PIN (QuickStart) (Right channel)
NES_CL_PIN = -1                 ' PIN (QuickStart) No Gamepad
NES_LT_PIN = -1                 ' PIN (QuickStart) No Gamepad
NES_D1_PIN = -1                 ' PIN (QuickStart) No Gamepad
NES_D2_PIN = -1                 ' PIN (QuickStart) No Gamepad
'
' Note that for SD Card support, we check for the PMC and RP2, and
' if in use, we use those pin definitions. Otherwise we use the 
' Human Interface Board definitions.
'
#ifdef PMC
SD_DO_PIN  = 1                  ' Propeller Memory Card (override)
SD_CLK_PIN = 7                  ' Propeller Memory Card (override)
SD_DI_PIN  = 0                  ' Propeller Memory Card (override)
SD_CS_PIN  = 4                  ' Propeller Memory Card (override)
#elseifdef RP2
SD_DO_PIN  = 12                 ' RamPage2 (override)
SD_CLK_PIN = 13                 ' RamPage2 (override)
SD_DI_PIN  = 14                 ' RamPage2 (override)
SD_CS_PIN  = 15                 ' RamPage2 (override)
#else
SD_DO_PIN  = 0                  ' Human Interface Board
SD_CLK_PIN = 1                  ' Human Interface Board
SD_DI_PIN  = 2                  ' Human Interface Board
SD_CS_PIN  = 3                  ' Human Interface Board
#endif
'
IR_TX_PIN  = 8                  ' Human Interface Board
IR_RX_PIN  = 9                  ' Human Interface Board
'
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (QuickStart)
SO_PIN     = 30                 ' PIN (QuickStart)
'
DEBUG_PIN  = -1                 ' PIN (QuickStart)
'
' QuickStart platform Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (QuickStart)
XTALFREQ  = 5_000_000           ' (QuickStart)
CLOCKFREQ = 80_000_000          ' (QuickStart) Nominal clock frequency
                                ' (required by some drivers)
'
' QuickStart platform Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' QuickStart has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' QuickStart has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' QuickStart has only one CPU - this is for serial loading
TX_PIN        = -1              ' QuickStart has only one CPU
RX_PIN        = -1              ' QuickStart has only one CPU
'
' QuickStart platform Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' QuickStart platform BlackCat debug pins (SI/SO pins)
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
