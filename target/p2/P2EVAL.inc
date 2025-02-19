'------------------------------- P2_EVAL constants ---------------------------

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
_XOSC     = %10         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF
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

' VGA constants
' =============

_VGA_BASE_PIN = 0

' USB constants
' =============

_USB_BASE_PIN = 8

' Hyper Flash / Hyper RAM constants
' =================================

' Base pin and reset pin mask
HYPER_BASE_PIN   = 32 ' If you change this, it may be required to change these:
HYPER_RST_A_MASK = 0 ' 1<<(HYPER_BASE_PIN+15)   ' if HYPER_BASE_PIN < 32
HYPER_RST_B_MASK = 1<<(HYPER_BASE_PIN+15-32)    ' if HYPER_BASE_PIN >= 32

' RAM size (number of address bits)
HYPER_RAM_SIZE   = 24 ' 16Mb Hyper RAM
HYPER_FLASH_SIZE = 25 ' 32Mb Hyper Flash

' RAM addresses
HYPER_RAM_ADDR   = $0000_0000 ' 16Mb starting at 0
HYPER_FLASH_ADDR = $0200_0000 ' 32Mb starting on 32Mb boundary

' RAM options
HYPER_FASTREAD   = 1 ' 0 disables, 1 enables
HYPER_FASTWRITE  = 0 ' 0 disables, 1 enables
HYPER_UNREGCLK   = 0 ' 0 disables, 1 enables

' RAM latency, burst size and delay
HYPER_LATENCY_RAM   = 6
HYPER_BURST_RAM     = $0280
HYPER_DELAY_RAM     = 9

HYPER_LATENCY_FLASH = 16
HYPER_BURST_FLASH   = $FFF0
HYPER_DELAY_FLASH   = 8

' miscellaneous constants
' =======================

_DEBUG_PIN = 56

' sanity checks and defaults
' ==========================

#ifdef LARGE

#ifdef SBRK_AFTER_PLUGINS
#error SBRK_AFTER_PLUGINS DOES NOTHING IN XMM LARGE MODE
#endif

' use specified XMM RAM (or Hyper RAM by default)
#if defined(HYPER)
#ifndef libhyper
#define libhyper
#endif
#elif defined(PSRAM)
#ifndef libpsram
#define libpsram
#endif
#else
#define HYPER
#ifndef libhyper
#define libhyper
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

' use specified XMM RAM (or Hyper RAM by default)
#if defined(HYPER)
#ifndef libhyper
#define libhyper
#endif
#elif defined(PSRAM)
#ifndef libpsram
#define libpsram
#endif
#else
#define HYPER
#ifndef libhyper
#define libhyper
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
