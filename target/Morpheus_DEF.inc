'===============================================================================
'
' Morpheus General definitions (for CPU #1 and CPU #2):
'
'===============================================================================
KBD_PIN    = 26                 ' BASE PIN (Morpheus) (CPU #1)
MOUSE_PIN  = 24                 ' BASE PIN (Morpheus) (CPU #1)
TV_PIN     = -1                 ' BASE PIN (Morpheus) No TV out
VGA_PIN    = 16                 ' BASE PIN (Morpheus) Custom VGA (CPU #2) 
SOUND_PIN  = 22                 ' PIN (Morpheus) Stereo on 22/23
NES_CL_PIN = -1                 ' PIN (Morpheus)
NES_LT_PIN = -1                 ' PIN (Morpheus)
NES_D1_PIN = -1                 ' PIN (Morpheus)
NES_D2_PIN = -1                 ' PIN (Morpheus)
SD_DO_PIN  = 6                  ' (Morpheus) (CPU #1)
SD_CLK_PIN = 5                  ' (Morpheus) (CPU #1)
SD_DI_PIN  = 7                  ' (Morpheus) (CPU #1)
SD_CS_PIN  = 4                  ' (Morpheus) (CPU #1)
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (Morpheus)
SO_PIN     = 30                 ' PIN (Morpheus)
'
DEBUG_PIN  = -1                 ' PIN (Morpheus)
'
' Morpheus SPI RAM Support (CPU #1 only)
'
SPI_SO   = 11                 '
SPI_SI   = 10
SPI_CLK  = 9
SPI_CS   = 8
'
'
' Morpheus SPI FLASH Support (CPU #1 only)
'
FLASH_SO   = 15                 '
FLASH_SI   = 14
FLASH_CLK  = 13
FLASH_CS   = 12
'
' Morpheus Clock Definitions (all CPUs):
'
CLOCKMODE = xtal1 + pll16x      ' (Morpheus)
XTALFREQ  = 5_000_000           ' (Morpheus)
CLOCKFREQ = 80_000_000          ' (Morpheus) Nominal clock frequency (required by some drivers)
'
' Morpheus InterProp comms definitions:
'
DEFAULT_CPU   = 1               ' Default CPU for multi-CPU system
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' SIO Mode used by targets during load (loader uses SIO_COMM_MODE)
SIO_COMM_MODE = %0000           ' SIO Mode used by clients and servers for InteProp Comms
'
#ifdef CPU_1                 
TX_PIN     = 19                 ' Server Tx Pin on CPU #1 (to CPU #2 Pin 31)
RX_PIN     = 18                 ' Server Rx Pin on CPU #1 (to CPU #2 Pin 30)
#else
TX_PIN     = 30                 ' Server Tx Pin on CPU #2 (to CPU #1 Pin 18)
RX_PIN     = 31                 ' Server Rx Pin on CPU #2 (to CPU #1 Pin 19)
#endif
'
' Morpheus Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Morpheus BlackCat debug pins (SI/SO pins)
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

