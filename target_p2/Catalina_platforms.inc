#ifndef PLATFORM_CONSTANTS_INCLUDED

' stop multiple inclusions of platform constants ...

#define PLATFORM_CONSTANTS_INCLUDED


'--------------------------- START OF PLATFORM CONSTANTS ---------------------
'
CON

#if defined(P2_EVAL)
'------------------------------- P2_EVAL constants ---------------------------

' clock configuration constants

#if defined (MHZ_260)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 26          '| crystal / div * mul         to give 260MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 260MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#elif defined (MHZ_200)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 20          '| crystal / div * mul         to give 200MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 200MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#else
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 4           '\ crystal divider             to give 5.0MHz
_XMUL     = 72          '| crystal / div * mul         to give 360MHz
_XDIVP    = 2           '/ crystal / div * mul / divp  to give 180MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#endif

'NOTE: The final clock frequency is actually set in Catalina_Constants.inc
'      as _XTALFREQ / _XDIV * _XMUL / _XDIVP - i.e. in this case 180Mhz

' serial constants

_RX_PIN    = 63
_TX_PIN    = 62
_BAUDRATE  = 230400

' BlackCat Debugger I/O constants

#define _BLACKCAT_RX_PIN  50
#define _BLACKCAT_TX_PIN  52

_BLACKCAT_MODE    = %0000
_BLACKCAT_BAUD    = 115200
_BLACKCAT_SIZE    = 5*4   ' 5 longs

' SD Card constants

_SD_CK     = 61         'pin SD Card clock
_SD_CS     = 60         'pin SD Card select
_SD_DI     = 59         'pin SD Card MOSI
_SD_DO     = 58         'pin SD Card MISO

' 2 Port Serial constants

_RX1_PIN   = _RX_PIN
_TX1_PIN   = _TX_PIN
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _BAUDRATE
_RX2_PIN   = 50
_TX2_PIN   = 52
_RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE2 = _BAUDRATE

' VGA constants

_VGA_BASE_PIN = 32

' USB constants

_USB_BASE_PIN = 40

' miscellaneous constants

_DEBUG_PIN = 56

#elif defined (P2D2)
'----------------------------- P2D2 constants -----------------------------

#error "platform P2D2 not supported yet - see Catalina_platforms.inc!"

#if defined (MHZ_260)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 26          '| crystal / div * mul         to give 260MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 260MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#elif defined (MHZ_200)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 20          '| crystal / div * mul         to give 200MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 200MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#else
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 4           '\ crystal divider             to give 5.0MHz
_XMUL     = 72          '| crystal / div * mul         to give 360MHz
_XDIVP    = 2           '/ crystal / div * mul / divp  to give 180MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#endif

' serial constants

_RX_PIN    = 63
_TX_PIN    = 62
_BAUDRATE  = 230400

' BlackCat Debugger I/O constants

#define _BLACKCAT_RX_PIN  50
#define _BLACKCAT_TX_PIN  52

_BLACKCAT_MODE    = %0000
_BLACKCAT_BAUD    = 115200
_BLACKCAT_SIZE    = 5*4   ' 5 longs

' SD Card constants

_SD_CK     = 61         'pin SD Card clock
_SD_CS     = 60         'pin SD Card select
_SD_DI     = 59         'pin SD Card MOSI
_SD_DO     = 58         'pin SD Card MISO


' 2 Port Serial constants

_RX1_PIN   = _RX_PIN
_TX1_PIN   = _TX_PIN
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _BAUDRATE
_RX2_PIN   = 50
_TX2_PIN   = 52
_RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE2 = _BAUDRATE

' VGA constants

_VGA_BASE_PIN = 32

' USB constants

_USB_BASE_PIN = 40

' miscellaneous constants

_DEBUG_PIN = 56

#elif defined(P2_CUSTOM) || defined (CUSTOM)
'------------------------------- P2_CUSTOM constants ---------------------------

' clock configuration constants

#if defined (MHZ_260)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 26          '| crystal / div * mul         to give 260MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 260MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#elif defined (MHZ_200)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 20          '| crystal / div * mul         to give 200MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 200MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#else
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 4           '\ crystal divider             to give 5.0MHz
_XMUL     = 72          '| crystal / div * mul         to give 360MHz
_XDIVP    = 2           '/ crystal / div * mul / divp  to give 180MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#endif

'NOTE: The final clock frequency is actually set in Catalina_Constants.inc
'      as _XTALFREQ / _XDIV * _XMUL / _XDIVP - i.e. in this case 180Mhz

' serial constants

_RX_PIN    = 63
_TX_PIN    = 62
_BAUDRATE  = 230400

' BlackCat Debugger I/O constants

#define _BLACKCAT_RX_PIN  50
#define _BLACKCAT_TX_PIN  52

_BLACKCAT_MODE    = %0000
_BLACKCAT_BAUD    = 115200
_BLACKCAT_SIZE    = 5*4   ' 5 longs

' SD Card constants

_SD_CK     = 61         'pin SD Card clock
_SD_CS     = 60         'pin SD Card select
_SD_DI     = 59         'pin SD Card MOSI
_SD_DO     = 58         'pin SD Card MISO

' 2 Port Serial constants.

' Note that for P2_CUSTOM, the second serial port is set up to accommodate a PropPlug on pins 50 & 52

_RX1_PIN   = _RX_PIN
_TX1_PIN   = _TX_PIN
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _BAUDRATE
_RX2_PIN   = 50
_TX2_PIN   = 52
_RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE2 = _BAUDRATE

' VGA constants

_VGA_BASE_PIN = 32

' USB constants

_USB_BASE_PIN = 40

' miscellaneous constants

_DEBUG_PIN = 56

#else
'---------------- default constants (same as P2_EVAL) -------------------------

' clock configuration constants

#if defined (MHZ_260)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 26          '| crystal / div * mul         to give 260MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 260MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#elif defined (MHZ_200)
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 2           '\ crystal divider             to give 10.0MHz
_XMUL     = 20          '| crystal / div * mul         to give 200MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 200MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#else
_XTALFREQ = 20_000_000  ' crystal frequency
_XDIV     = 4           '\ crystal divider             to give 5.0MHz
_XMUL     = 72          '| crystal / div * mul         to give 360MHz
_XDIVP    = 2           '/ crystal / div * mul / divp  to give 180MHz
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#endif

' serial constants

_RX_PIN    = 63
_TX_PIN    = 62
_BAUDRATE  = 230400

' BlackCat Debugger I/O constants

#define _BLACKCAT_RX_PIN  50
#define _BLACKCAT_TX_PIN  52

_BLACKCAT_MODE    = %0000
_BLACKCAT_BAUD    = 115200
_BLACKCAT_SIZE    = 5*4   ' 5 longs

' SD Card constants

_SD_CK     = 61         'pin SD Card clock
_SD_CS     = 60         'pin SD Card select
_SD_DI     = 59         'pin SD Card MOSI
_SD_DO     = 58         'pin SD Card MISO

' 2 Port Serial constants

_RX1_PIN   = _RX_PIN
_TX1_PIN   = _TX_PIN
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _BAUDRATE
_RX2_PIN   = 50
_TX2_PIN   = 52
_RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE2 = _BAUDRATE

' VGA constants

_VGA_BASE_PIN = 32

' USB constants

_USB_BASE_PIN = 40

' miscellaneous constants

_DEBUG_PIN = 56

#endif

'--------------------------- END OF PLATFORM CONSTANTS -----------------------

#endif

