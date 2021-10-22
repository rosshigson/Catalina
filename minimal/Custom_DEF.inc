'
' The Custom board in the minimal target supports no HMI option. 
'
' It assumes a 5Mhz crystal is installed. 
'
' Programs should be compiled to use the CUSTOM platform - e.g:
'
'    catalina hello_world.c -lc -C CUSTOM
'
'===============================================================================
'
' CUSTOM platform General definitions:
' 
'===============================================================================

KBD_PIN    = -1                 ' BASE PIN  (Custom)
MOUSE_PIN  = -1                 ' BASE PIN  (Custom)
TV_PIN     = -1                 ' BASE PIN  (Custom)
VGA_PIN    = -1                 ' BASE PIN  (Custom)
SOUND_PIN  = -1                 ' PIN (Custom) No Sound
NES_CL_PIN = -1                 ' PIN (Custom) No Gamepad
NES_LT_PIN = -1                 ' PIN (Custom) No Gamepad
NES_D1_PIN = -1                 ' PIN (Custom) No Gamepad
NES_D2_PIN = -1                 ' PIN (Custom) No Gamepad
SD_DO_PIN  = -1                 ' Custom has no SD Card
SD_CLK_PIN = -1                 ' Custom has no SD Card 
SD_DI_PIN  = -1                 ' Custom has no SD Card
SD_CS_PIN  = -1                 ' Custom has no SD Card
I2C_PIN    = 28                 ' I2C Boot EEPROM SCL Pin
I2C_DEV    = $A0                ' I2C Boot EEPROM Device Address
SI_PIN     = 31                 ' PIN (Custom)
SO_PIN     = 30                 ' PIN (Custom)
'
DEBUG_PIN  = -1                 ' PIN (Custom)
'
' Custom platform Clock definitions:
' 
CLOCKMODE = xtal1 + pll16x      ' (Custom)
XTALFREQ  = 5_000_000           ' (Custom)
CLOCKFREQ = 80_000_000          ' (Custom) Nominal clock frequency
                                ' (required by some drivers)
'
' Custom platform Loader and InterProp Comms definitions:
'
DEFAULT_CPU   = 0               ' Custom has only one CPU
SIO_BAUD      = 115200          ' Baud rate to use for all interprop comms                 
SIO_LOAD_MODE = %0000           ' Custom has only one CPU - this is for serial loading
SIO_COMM_MODE = %0000           ' Custom has only one CPU - this is for serial loading
TX_PIN        = -1              ' Custom has only one CPU
RX_PIN        = -1              ' Custom has only one CPU
'
' Custom platform Payload pins (SI/SO pins)
'
PAYLOAD_RXPIN = SI_PIN          ' Rx pin to use for Payload comms
PAYLOAD_TXPIN = SO_PIN          ' Tx pin to use for Payload comms
'
' Custom platform BlackCat debug pins (SI/SO pins)
'
BLACKCAT_RXPIN = SI_PIN         ' Rx pin to use for BlackCat comms
BLACKCAT_TXPIN = SO_PIN         ' Tx pin to use for BlackCat comms
BLACKCAT_MODE  = %0000          ' SIO mode to use for BlackCat comms
'
' Cog Allocation. The value LAST_COG specifies the last cog that will 
' be restarted during the load process. Note that it is still the users 
' responsibility to ensure that the combination of loaded drivers and 
' plugins does not exceed this value.
'
LAST_COG     = 7                ' Last cog to be restarted is 7
'

