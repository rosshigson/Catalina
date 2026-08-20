'----------------------------- P2_WIFI_SLAVE constants ------------------------

' clock configuration constants
' =============================

#if defined(_CLOCK_XTAL)
_XTALFREQ = _CLOCK_XTAL ' required crystal frequency
#else
_XTALFREQ = 20_000_000  ' default crystal frequency
#endif

' NOTE: _CLOCK_XDIV, _CLOCK_MULT and _CLOCK_DIVP must all be defined,
'       otherwise the default values will be used - this is normally 
'       accomplished using the -f, -F & -E command-line options. The
'       final clock frequency will be _XTALFREQ / _XDIV * _XMUL / _XDIVP

#if defined(_CLOCK_XDIV) && defined(_CLOCK_MULT) && defined(_CLOCK_DIVP)
_XDIV     = _CLOCK_XDIV
_XMUL     = _CLOCK_MULT
_XDIVP    = _CLOCK_DIVP
#else
_XDIV     = 1           '\ crystal divider             to give 20MHz
_XMUL     = 9           '| crystal / div * mul         to give 180MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 180MHz
#endif

#if defined(_CLOCK_OSC)
_XOSC     = _CLOCK_OSC
#else
_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
#endif
#if defined(_CLOCK_SEL)
_XSEL     = _CLOCK_SEL
#else
_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL
#endif

#if defined(_CLOCK_PLL)
_XPLL     = _CLOCK_PLL
#else
_XPLL     = 1           ' 0= PLL off, 1=PLL on
#endif

' RTC constants
' =============

' RTC base pin - note that if this is changed, the cache pin and float 
' pin constants may also need to be changed (see below) 
_RTC_BASE   = 24

' cache pin constants
' ===================

' Pins used for pin communications with cache
CACHE_CMD_PIN    = 26 ' these pins will be spare when the RTC ...
CACHE_RSP_PIN    = 27 '  ... add-on board is in use on pin 24
CACHE_PIN_MODE   = %0000_0000_000_0000000000000_00_00001_0 'mode bits 

' float pin constants
' ===================

' Pins used for pin communications with floating point co-processor
FLOAT_CMD_PIN    = 28 ' these pins will be spare when the RTC ...
FLOAT_RSP_PIN    = 29 ' ... add-on board ...
FLOAT_AVAL_PIN   = 30 ' ... is in use ...
FLOAT_BVAL_PIN   = 31 '  ... on pin 24
FLOAT_PIN_MODE   = %0000_0000_000_0000000000000_00_00001_0 'mode bits 

' serial constants
' ================

#if !defined(_RX_PIN)
_RX_PIN    = 63
#endif

#if !defined(_TX_PIN)
_TX_PIN    = 62
#endif

#if !defined(_BAUDRATE)
_BAUDRATE  = 230400
#endif

' BlackCat/BlackBox Debugger I/O constants
' ========================================

#if !defined(_BLACKCAT_RX_PIN)
#define _BLACKCAT_RX_PIN  63
#endif

#if !defined( _BLACKCAT_TX_PIN)
#define _BLACKCAT_TX_PIN  62
#endif

#if !defined(_BLACKCAT_BAUD)
_BLACKCAT_BAUD    = 115200
#endif

_BLACKCAT_MODE    = %0000
_BLACKCAT_SIZE    = 5*4   ' 5 longs

' SD Card constants
' =================

_SD_CK     = 61         'pin SD Card clock
_SD_CS     = 60         'pin SD Card select
_SD_DI     = 59         'pin SD Card MOSI
_SD_DO     = 58         'pin SD Card MISO

' WiFi constants
' ==============

#if !defined(_WIFI_BASE_PIN)
_WIFI_BASE_PIN = 16           ' base pin of P2 WX adapter board (64007)
#endif

_WIFI_DO  = _WIFI_BASE_PIN + 7   ' must match pin used for serial comms
_WIFI_DI  = _WIFI_BASE_PIN + 6   ' must match pin used for serial comms
_WIFI_RES = _WIFI_BASE_PIN + 0   ' -1 disables module RESET function
_WIFI_PGM = _WIFI_BASE_PIN + 1   ' -1 disables module PGM function
_WIFI_BRK = _WIFI_DI             ' -1 disables module BREAK function

#if !defined(_WIFI_BAUDRATE)
_WIFI_BAUDRATE = 230400       ' must match baud rate configured in WiFi board
#endif

' 2 Port Serial constants
' =======================

' NOTE that the ports are numbered 1 and 2 here for consistency with the 
' names used in the PASM code, but in C the ports are numbered 0 and 1

_RX1_PIN   = _WIFI_DO
_TX1_PIN   = _WIFI_DI
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _WIFI_BAUDRATE ' _BAUDRATE

#if NO_HMI
' NO_HMI means _RX_PIN & _TX_PIN are available for the second serial port
_RX2_PIN   = _RX_PIN
_TX2_PIN   = _TX_PIN
#else
' assume _RX_PIN & _TX_PIN are not available for the second serial port
_RX2_PIN   = -1
_TX2_PIN   = -1
#endif
_RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE2 = _BAUDRATE

' Multi Port Serial (aka 8 Port Serial) constants
' ===============================================

' NOTE Multi Port 1 and 2 use the 2 Port Serial constants defined above for
' pins and baud rate (but not mode) - This is done so that by default the 
' Multi Port Serial plugin behaves the same way as the 2 Port Serial plugin. 
' To disable thiis "auto-configuration" behaviour, set the pins to -1 (or 
' anything outside the range 0 .. 63). All such ports will have to be 
' manually configured in the C program (see the s8_openport() function).

'    rxmode = %0xx1 = invert rx              (same for txmode)
'             %0x1x = invert tx
'             %01xx = open-drain/open-source tx

' NOTE that the ports are numbered 1 to 8 here for compatibility with the 2
' port serial port numbering, but in C the ports are numbered 0 to 7

_RX1_MULTI_PIN  = _RX1_PIN
_TX1_MULTI_PIN  = _TX1_PIN
_RX1_MULTI_BAUD = _BAUDRATE1
_TX1_MULTI_BAUD = _BAUDRATE1
_RX1_MULTI_MODE = %0000
_TX1_MULTI_MODE = %0000
_RX2_MULTI_PIN  = _RX2_PIN
_TX2_MULTI_PIN  = _TX2_PIN
_RX2_MULTI_BAUD = _BAUDRATE2
_TX2_MULTI_BAUD = _BAUDRATE2
_RX2_MULTI_MODE = %0000
_TX2_MULTI_MODE = %0000
_RX3_MULTI_PIN  = 1         ' ALOHA on port 3 (port 2 in C!)
_TX3_MULTI_PIN  = 0         ' ALOHA on port 3 (port 2 in C!)
_RX3_MULTI_BAUD = _BAUDRATE
_TX3_MULTI_BAUD = _BAUDRATE
_RX3_MULTI_MODE = %0000
_TX3_MULTI_MODE = %0000
_RX4_MULTI_PIN  = -1
_TX4_MULTI_PIN  = -1
_RX4_MULTI_BAUD = _BAUDRATE
_TX4_MULTI_BAUD = _BAUDRATE
_RX4_MULTI_MODE = %0000
_TX4_MULTI_MODE = %0000
_RX5_MULTI_PIN  = -1
_TX5_MULTI_PIN  = -1
_RX5_MULTI_BAUD = _BAUDRATE
_TX5_MULTI_BAUD = _BAUDRATE
_RX5_MULTI_MODE = %0000
_TX5_MULTI_MODE = %0000
_RX6_MULTI_PIN  = -1
_TX6_MULTI_PIN  = -1
_RX6_MULTI_BAUD = _BAUDRATE
_TX6_MULTI_BAUD = _BAUDRATE
_RX6_MULTI_MODE = %0000
_TX6_MULTI_MODE = %0000
_RX7_MULTI_PIN  = -1
_TX7_MULTI_PIN  = -1
_RX7_MULTI_BAUD = _BAUDRATE
_TX7_MULTI_BAUD = _BAUDRATE
_RX7_MULTI_MODE = %0000
_TX7_MULTI_MODE = %0000
_RX8_MULTI_PIN  = -1
_TX8_MULTI_PIN  = -1
_RX8_MULTI_BAUD = _BAUDRATE
_TX8_MULTI_BAUD = _BAUDRATE
_RX8_MULTI_MODE = %0000
_TX8_MULTI_MODE = %0000

' VGA constants
' =============

_VGA_BASE_PIN = 16

' USB constants
' =============

_USB_BASE_PIN = 24

' Hyper Flash / Hyper RAM constants
' =================================

' Base pin and reset pin mask
HYPER_BASE_PIN   = 0 ' If you change this, it may be required to change these:
HYPER_RST_A_MASK = 1<<(HYPER_BASE_PIN+15)           ' if HYPER_BASE_PIN < 32
HYPER_RST_B_MASK = 0 ' 1<<(HYPER_BASE_PIN+15-32)    ' if HYPER_BASE_PIN >= 32

' RAM size (number of address bits)
HYPER_RAM_SIZE   = 24 ' 16Mb Hyper RAM
HYPER_FLASH_SIZE = 25 ' 32Mb Hyper Flash

' RAM addresses
HYPER_RAM_ADDR   = $0000_0000 ' 16Mb starting at 0
HYPER_FLASH_ADDR = $0200_0000 ' 32Mb starting on 32Mb boundary

' RAM options
HYPER_FASTREAD   = 0 ' 0 disables, 1 enables
HYPER_FASTWRITE  = 0 ' 0 disables, 1 enables
HYPER_UNREGCLK   = 0 ' 0 disables, 1 enables

' RAM latency, burst size and delay
HYPER_LATENCY_RAM   = 6
HYPER_BURST_RAM     = $0280
HYPER_DELAY_RAM     = 10 ' 7 for <100Mhz, 8 or 9 for < 100-180Mhz, 10 for 180-260Mhz, 11 for > 260Mhz
HYPER_LATENCY_FLASH = 16
HYPER_BURST_FLASH   = $FFF0
HYPER_DELAY_FLASH   = 8

' PSRAM constants
' ===============

' P2 EDGE with PSRAM pin mappings (P2-EC32MB)
PSRAM_DATABUS  = 40
PSRAM_CLK_PIN  = 56
PSRAM_CE_PIN   = 57

' number of address bits used in 32MB of PSRAM
PSRAM_ADDRSIZE = 25   

' 8 microsecond CS low time
PSRAM_MAX_CS_LOW_USEC = 8

' burst size and delay
PSRAM_MAXBURST = 512
PSRAM_DELAY = 9 ' 8 for <180Mhz, 9 or 10 for 180Mhz-260Mhz, 11 for >260Mhz

' optional FLAGS for driver
PSRAM_OPTIONS = 0

' miscellaneous constants
' =======================

_DEBUG_PIN = 38

' sanity checks and defaults
' ==========================

#ifdef LARGE

#ifdef SBRK_AFTER_PLUGINS
#error SBRK_AFTER_PLUGINS DOES NOTHING IN XMM LARGE MODE
#endif

' use specified XMM RAM (or PSRAM by default)
#if defined(PSRAM)
#ifndef libpsram
#define libpsram
#endif
#elif defined(HYPER)
#ifndef libhyper
#define libhyper
#endif
#else
#define PSRAM
#ifndef libpsram
#define libpsram
#endif
#endif

#if defined(PSRAM)
XMM_RW_SIZE = $0200_0000         ' 32Mb Read-Write Size
XMM_RO_SIZE = $0000_0000         ' 32Mb Read-Only Size
#elif defined(HYPER)
XMM_RW_SIZE = $0100_0000         ' 16Mb Read-Write Size
XMM_RO_SIZE = $0200_0000         ' 32Mb Read-Only Size
#else
XMM_RW_SIZE = $0000_0000         '  0Mb Read-Write Size
XMM_RO_SIZE = $0000_0000         '  0Mb Read-Only Size
#endif

#ifndef CACHED
#define CACHED
#endif

#endif

#ifdef SMALL

#ifdef SBRK_AFTER_PLUGINS
#error SBRK_AFTER_PLUGINS NOT SUPPORTED IN XMM SMALL MODE
#endif

' use specified XMM RAM (or PSRAM by default)
#if defined(PSRAM)
#ifndef libpsram
#define libpsram
#endif
#elif defined(HYPER)
#ifndef libhyper
#define libhyper
#endif
#else
#define PSRAM
#ifndef libpsram
#define libpsram
#endif
#endif

#if defined(PSRAM)
XMM_RW_SIZE = $0200_0000         ' 32Mb Read-Write Size
XMM_RO_SIZE = $0000_0000         ' 32Mb Read-Only Size
#elif defined(HYPER)
XMM_RW_SIZE = $0100_0000         ' 16Mb Read-Write Size
XMM_RO_SIZE = $0200_0000         ' 32Mb Read-Only Size
#else
XMM_RW_SIZE = $0000_0000         '  0Mb Read-Write Size
XMM_RO_SIZE = $0000_0000         '  0Mb Read-Only Size
#endif

#ifndef CACHED
#define CACHED
#endif

#endif
