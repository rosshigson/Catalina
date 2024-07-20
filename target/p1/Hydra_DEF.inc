'===============================================================================
'
' Hydra General definitions:
'
'===============================================================================
KBD_PIN    = 13                 ' BASE PIN  (Hydra)
MOUSE_PIN  = 2                  ' PIN GROUP (Hydra)
TV_PIN     = 24                 ' BASE PIN  (Hydra)
VGA_PIN    = 16                 ' BASE PIN  (Hydra)
SOUND_PIN  = 7                  ' PIN (Hydra)
NES_CL_PIN = 3                  ' PIN (Hydra)
NES_LT_PIN = 4                  ' PIN (Hydra)
NES_D1_PIN = 5                  ' PIN (Hydra)
NES_D2_PIN = 6                  ' PIN (Hydra)
SD_DO_PIN  = 16                 ' (Hydra) - note shared with VGA
SD_CLK_PIN = 17                 ' (Hydra) - note shared with VGA 
SD_DI_PIN  = 18                 ' (Hydra) - note shared with VGA
SD_CS_PIN  = 19                 ' (Hydra) - note shared with VGA
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (Hydra)
SO_PIN     = 30                 ' PIN (Hydra)
'
DEBUG_PIN  = 0                  ' Debug LED on pin 0
'
' Hydra Clock definitions:
' 
CLOCKMODE = xtal2 + pll8x       ' (Hydra)
XTALFREQ  = 10_000_000          ' (Hydra)
CLOCKFREQ = 80_000_000          ' (Hydra) Nominal clock frequency (required by some drivers)
'
' Hydra Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' Hydra has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms and serial loading                
SIO_LOAD_MODE = %0000           ' Hydra has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' Hydra has only one CPU - this is for serial loading
TX_PIN        = -1              ' Hydra has only one CPU
RX_PIN        = -1              ' Hydra has only one CPU
'
' Hydra Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Hydra BlackCat debug pins (mouse pins) - can be used for LMM or XMM but requires special cable
'
BLACKCAT_RXPIN = 9              ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = 10             ' Tx pin to use for BlackCat comms
BLACKCAT_MODE  = %0010          ' SIO must invert Tx on Hydra when using mouse port
{
'
' Hydra BlackCat debug pins (SI/SO pins) - can only be used for LMM, but uses normal serial cable
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

