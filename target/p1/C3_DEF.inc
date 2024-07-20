'===============================================================================
'
' C3 General definitions:
'
'===============================================================================
KBD_PIN    = 26                 ' BASE PIN  (C3) - NOTE SHARED WITH MOUSE
MOUSE_PIN  = 26                 ' BASE PIN  (C3) - NOTE SHARED WITH KBD
TV_PIN     = 12                 ' BASE PIN  (C3)
VGA_PIN    = 16                 ' BASE PIN  (C3)  
SOUND_PIN  = 24                 ' PIN (C3)
NES_CL_PIN = -1                 ' PIN (C3) No Gamepad
NES_LT_PIN = -1                 ' PIN (C3) No Gamepad
NES_D1_PIN = -1                 ' PIN (C3) No Gamepad
NES_D2_PIN = -1                 ' PIN (C3) No Gamepad
SD_DO_PIN  = 10                 ' PIN (C3)
SD_CLK_PIN = 11                 ' PIN (C3)
SD_DI_PIN  = 9                  ' PIN (C3)
SD_CS_CLK  = 8                  ' REQUIRES SPI SELECT LOGIC
SD_CS_CLR  = 25                 ' REQUIRES SPI SELECT LOGIC
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (C3)
SO_PIN     = 30                 ' PIN (C3)
'
VGA_ENABLE = 15                 ' PIN (C3)
'
DEBUG_PIN  = 15                 ' Debug LED (same as VGA - do not use with VGA)
'
' C3 SPI Channel Select Support 
'
SPI_SO      = 10                ' PIN (C3)
SPI_SI      = 9                 ' PIN (C3)
SPI_CLK     = 11                ' PIN (C3)
SPI_CS_CLR  = 25                ' REQUIRES SPI SELECT LOGIC
SPI_CS_CLK  = 8                 ' REQUIRES SPI SELECT LOGIC
'                               
SPI_SELECT_NULL   = 0           ' SPI Channel
SPI_SELECT_SRAM_0 = 1           ' SPI Channel
SPI_SELECT_SRAM_1 = 2           ' SPI Channel
SPI_SELECT_FLASH  = 3           ' SPI Channel
SPI_SELECT_SD     = 5           ' SPI Channel
'
' C3 Clock Definitions:
'
CLOCKMODE = xtal1 + pll16x      ' (C3)
XTALFREQ  = 5_000_000           ' (C3)
CLOCKFREQ = 80_000_000          ' (C3) Nominal clock frequency (required by some drivers)
'
' C3 InterProp comms definitions:
'
DEFAULT_CPU   = 0               ' C3 has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' SIO Mode used by targets during load (loader uses SIO_COMM_MODE)
SIO_COMM_MODE = %0000           ' SIO Mode used by clients and servers for InteProp Comms

TX_PIN     = -1                 ' C3 has only one CPU
RX_PIN     = -1                 ' C3 has only one CPU
'
' C3 Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' C3 BlackCat debug pins (SI/SO pins)
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


