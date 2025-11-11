'#line 1 "../../../target/p2/lmmd.t"
{{
'------------------------------------------------------------------------------
' Catalina_LMM_dynamic - Implements a dynamically loadable Large Memory Model
'                Kernel intended for use by the Catalina Code Generator
'                backend for LCC.
'
' Version 2.6 - Initial version
' Version 3.5 - Minor virtual machine changes (e.g. load_i replaced load_a).
' Version 3.6 - New smaller image format.
'               New smaller division.
' Version 3.15 - Modified for 1 .
'
'
' This file incorporates software derived from:
'    Float_32A by Cam Thompson, Micromega Corporation,
'              Copyright (c) 2006-2007 Parallax, Inc.
'
'------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    The portion of this file identified as the LMM Kernel is part of the
'    Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute
'    it and/or modify it under the terms of the GNU Lesser General Public
'    License as published by the Free Software Foundation, either version
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public
'    License along with the Catalina Target Package.  If not, see
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}

CON

'#line 1 "../../../target/p2/constant.inc"
'--------------------------- START OF CONSTANTS -------------------------------



' stop multiple inclusions of constants ...



'#line 1 "../../../target/p2/platform.inc"


' stop multiple inclusions of platform constants ...




'--------------------------- START OF PLATFORM CONSTANTS ---------------------
'
CON




















' default is to use P2_CUSTOM constants
'#line 1 "../../../target/p2/P2CUSTOM.inc"
'----------------------------- P2_CUSTOM constants -----------------------------

' clock configuration constants
' =============================




_XTALFREQ = 20_000_000  ' default crystal frequency


' NOTE: _CLOCK_XDIV, _CLOCK_MULT and _CLOCK_DIVP must all be defined,
'       otherwise the default values will be used - this is normally
'       accomplished using the -f, -F & -E command-line options. The
'       final clock frequency will be _XTALFREQ / _XDIV * _XMUL / _XDIVP






_XDIV     = 1           '\ crystal divider             to give 20MHz
_XMUL     = 9           '| crystal / div * mul         to give 180MHz
_XDIVP    = 1           '/ crystal / div * mul / divp  to give 180MHz





_XOSC     = %01         ' %00=OFF, %01=OSC, %10=15pF, %11=30pF




_XSEL     = %11         ' %00=rcfast, %01=rcslow, %10=XI, %11=PLL





_XPLL     = 1           ' 0= PLL off, 1=PLL on


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


_RX_PIN    = 63



_TX_PIN    = 62



_BAUDRATE  = 230400


' BlackCat/BlackBox Debugger I/O constants
' ========================================










_BLACKCAT_BAUD    = 115200


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


_WIFI_BASE_PIN = 16           ' base pin of 1 WX adapter board (64007)


_WIFI_DO  = _WIFI_BASE_PIN + 7   ' must match pin used for serial comms
_WIFI_DI  = _WIFI_BASE_PIN + 6   ' must match pin used for serial comms
_WIFI_RES = _WIFI_BASE_PIN + 0   ' -1 disables module RESET function
_WIFI_PGM = _WIFI_BASE_PIN + 1   ' -1 disables module PGM function
_WIFI_BRK = _WIFI_DI             ' -1 disables module BREAK function


_WIFI_BAUDRATE = 230400       ' must match baud rate configured in WiFi board


' 2 Port Serial constants
' =======================

' NOTE that the ports are numbered 1 and 2 here for consistency with the
' names used in the PASM code, but in C the ports are numbered 0 and 1

_RX1_PIN   = _RX_PIN
_TX1_PIN   = _TX_PIN
_RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0 ' async rx mode, true input, input  enabled for smart input
_TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0 ' async tx mode, true output, output enabled for smart output
_BAUDRATE1 = _BAUDRATE
_RX2_PIN   = -1
_TX2_PIN   = -1
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
_RX1_MULTI_BAUD = _BAUDRATE
_TX1_MULTI_BAUD = _BAUDRATE
_RX1_MULTI_MODE = %0000
_TX1_MULTI_MODE = %0000
_RX2_MULTI_PIN  = -1
_TX2_MULTI_PIN  = -1
_RX2_MULTI_BAUD = _BAUDRATE
_TX2_MULTI_BAUD = _BAUDRATE
_RX2_MULTI_MODE = %0000
_TX2_MULTI_MODE = %0000
_RX3_MULTI_PIN  = -1
_TX3_MULTI_PIN  = -1
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

' 1 EDGE with PSRAM pin mappings (1 -EC32MB)
PSRAM_DATABUS  = 40
PSRAM_CLK_PIN  = 56
PSRAM_CE_PIN   = 57

' number of address bits used in 32MB of PSRAM
PSRAM_ADDRSIZE = 25

' 8 microsecond CS low time
PSRAM_MAX_CS_LOW_USEC = 8

' burst size and delay
PSRAM_MAXBURST = 512
PSRAM_DELAY = 10 ' 8 for <150Mhz, 9 or 10 for 150Mhz-260Mhz, 11 for >260Mhz

' optional FLAGS for driver
PSRAM_OPTIONS = 0

' miscellaneous constants
' =======================

_DEBUG_PIN = 38

' sanity checks and defaults
' ==========================


















































































'#line 33 "../../../target/p2/platform.inc"


'--------------------------- END OF PLATFORM CONSTANTS -----------------------



'#line 10 "../../../target/p2/constant.inc"

CON
'
' Platform-independent clock configuration constants
'
_XPPPP    = ((_XDIVP>>1) + 15) & $F  ' 1->15, 2->0, 4->1, 6->2...30->14

' %0000_000e_dddddd_mmmmmmmmmm_pppp_cc_ss  ' set clock oscillator mode

' initial clock mode => enable crystal+PLL, stay in 20MHz+

_CLOCKINIT  = _XPLL<<24 + (_XDIV-1)<<18 + (_XMUL-1)<<8 + _XPPPP<<4 + _XOSC<<2 + %00

' wait time => 10ms (@ 20Mhz) for crystal+PLL to stabilize

_CLOCKWAIT  = 20000000/100

' final clock mode => switch to PLL

_CLOCKMODE  = _XPLL<<24 + (_XDIV-1)<<18 + (_XMUL-1)<<8 + _XPPPP<<4 + _XOSC<<2 +_XSEL

' final clock frequency

_CLOCKFREQ  = _XTALFREQ / _XDIV * _XMUL / _XDIVP

'
' Plugin types - the Catalina Kernel generally attempts to locate plugins
' by type, not by the cog they happen to be running on. Values up to 127
' and the value 255 are reserved.
'
' User plugin types should be in the range 128 .. 254. Note that the LMM
' prefix is historical - the same definitions are used for all program
' types (LMM, EMM, SMM, XMM etc).
'
LMM_VMM = 0       ' main LMM (single threaded)
LMM_HMI = 1       ' HMI Drivers (Kbd/Mouse/Screen)
LMM_LIB = 2       ' Utility library
LMM_FLA = 3       ' Floating Point Library A
LMM_FLB = 4       ' Floating Point Library B
LMM_RTC = 5       ' Real-Time Clock
LMM_FIL = 6       ' File System
LMM_SIO = 7       ' Serial I/O
LMM_DUM = 8       ' Dummy Plugin
LMM_CGI = 9       ' Graphics Plugin
LMM_KBD = 10      ' Keyboard Driver
LMM_SCR = 11      ' Screen Driver
LMM_MOU = 12      ' Mouse Driver
LMM_PRX = 13      ' Proxy Driver
LMM_GAM = 14      ' Gamepad Driver
LMM_SND = 15      ' Sound Driver
LMM_ADC = 16      ' ADC Driver
LMM_S4  = 17      ' 4 Port Serial Driver (Propeller 1 only)
LMM_TTY = 18      ' Full Duplex Serial Driver
LMM_VGI = 19      ' Virtual Graphics Plugin
LMM_VDB = 20      ' Virtual Double Buffer Support Driver
LMM_SPI = 21      ' SPI Support Driver
LMM_FLC = 22      ' Floating Point Library C (Propeller 2 only)
LMM_S2A = 23      ' 2 Port Serial Driver A (Propeller 2 only)
LMM_S2B = 24      ' 2 Port Serial Driver B (Propeller 2 only)
LMM_S8A = 25      ' 8 Port Serial Driver A (Propeler 2 only)
LMM_HYP = 26      ' HyperRam/HyperFlash Driver (Propeller 2 only)
LMM_SM1 = 27      ' SRAM Memory (8 Bit) Driver (Propeller 2 only)
LMM_PM1 = 28      ' PSRAM Memory (16 Bit) Driver (Propeller 2 only)
LMM_XCH = 29      ' XMM Cache
LMM_STO = 30      ' CogStore
LMM_P2P = 31      ' P2P Bus
LMM_RND = 32      ' Random Number Generator
LMM_NUL = 255     ' No plugin

'
' XMM Addressing (currently only PSRAM and Hyper RAM supported):
'
XMM_BASE_ADDRESS = $0008_0000   ' XMM adddressing from $8_0000
'
' XMM RW & RO Base Addresses - Note that these are the addresses used
' by the Catalina XMM Kernel - they typically start AFTER the last
' Hub address (note: only used for modes 3 and 4):
'
XMM_RW_BASE_ADDRESS = $0008_0000 ' Read-Write Base address
XMM_RO_BASE_ADDRESS = $0008_0000 ' Read-Only Base address
'
' Definitions for XMM CACHE (compatible with jazzed's spisram_cache):
'




























































































































'
' Notes on the Registry definitions.
'
' The Catalina registry provides a place where all plugins can be found,
' and a request block for sending requests to each plugin. The registry
' location must be known to all plugins. To use the registry, each plugin
' finds its own cog number, and then registers by putting its plugin type
' in the top 8 bits of the long at
'    long[REGISTRY][cog]
' The bottom 24 bits of that long point to the request block the plugin
' must use to receive requests and return results. A request block of
' two longs is automatically created for each plugin, but plugins that
' need more are free to allocate their own. However, all request blocks
' must be at least two longs - the first long is the request, which may
' be a 'short' request (if the request and all its parameters can fit
' into a single long, or the address of a 'long' parameter block that
' is allocated elsewhere in Hub RAM. Note that all requests are plugin
' specific, and each plugin only typically knows how to interpret its
' own requests. When complete, the plugin zeroes the first long of the
' request block, and may either return the result in the second long
' of the request block (typical for ' short' requests, but also used
' for some 'long' requests), or in the 'long' parameter block.
' Below the cog-oriented registry is a service-oriented registry. Each
' Service is allocated a word, and services go from 1 to SVC_MAX (i.e.
' there is no service 0). The details of the service can be found in
' the word at
'    word[REGISTRY][-service]
' The top 4 bits of the word are the cog number (top bit of the 4 bits
' set if not used), the next lower 5 bits are a lock number (all bits
' set if lock not required) and the lower 7 bits are the request number
' to send to the cog to request the service.
'
' Predefined Service Numbers (and the internal plugin types and requests):
'
SVC_FLOAT_ADD    = 1  ' LMM_FLA 1
SVC_FLOAT_SUB    = 2  ' LMM_FLA 2
SVC_FLOAT_MUL    = 3  ' LMM_FLA 3
SVC_FLOAT_DIV    = 4  ' LMM_FLA 4
SVC_FLOAT_FLOAT  = 5  ' LMM_FLA 5
SVC_FLOAT_TRUNC  = 6  ' LMM_FLA 6
SVC_FLOAT_RND    = 7  ' LMM_FLA 7
SVC_FLOAT_SQR    = 8  ' LMM_FLA 8
SVC_FLOAT_CMP    = 9  ' LMM_FLA 9
SVC_K_PRESENT    = 10 ' LMM_HMI 1
SVC_K_GET        = 11 ' LMM_HMI 2
SVC_K_WAIT       = 12 ' LMM_HMI 3
SVC_K_NEW        = 13 ' LMM_HMI 4
SVC_K_READY      = 14 ' LMM_HMI 5
SVC_K_CLEAR      = 15 ' LMM_HMI 6
SVC_K_STATE      = 16 ' LMM_HMI 7
SVC_M_PRESENT    = 17 ' LMM_HMI 11
SVC_M_BUTTON     = 18 ' LMM_HMI 12
SVC_M_BUTTONS    = 19 ' LMM_HMI 13
SVC_M_ABS_X      = 20 ' LMM_HMI 14
SVC_M_ABS_Y      = 21 ' LMM_HMI 15
SVC_M_ABS_Z      = 22 ' LMM_HMI 16
SVC_M_DELTA_X    = 23 ' LMM_HMI 17
SVC_M_DELTA_Y    = 24 ' LMM_HMI 18
SVC_M_DELTA_Z    = 25 ' LMM_HMI 19
SVC_M_RESET      = 26 ' LMM_HMI 20
SVC_T_GEOMETRY   = 27 ' LMM_HMI 21
SVC_T_CHAR       = 28 ' LMM_HMI 22
SVC_T_STRING     = 29 ' LMM_HMI 23
SVC_T_INT        = 30 ' LMM_HMI 24
SVC_T_UNSIGNED   = 31 ' LMM_HMI 25
SVC_T_HEX        = 32 ' LMM_HMI 26
SVC_T_BIN        = 33 ' LMM_HMI 27
SVC_T_SETPOS     = 34 ' LMM_HMI 28
SVC_T_GETPOS     = 35 ' LMM_HMI 29
SVC_T_MODE       = 36 ' LMM_HMI 30
SVC_T_SCROLL     = 37 ' LMM_HMI 31
SVC_T_COLOR      = 38 ' LMM_HMI 32
SVC_SD_INIT      = 39 ' LMM_FIL 1
SVC_SD_READ      = 40 ' LMM_FIL 2
SVC_SD_WRITE     = 41 ' LMM_FIL 3
SVC_SD_BYTEIO    = 42 ' LMM_FIL 4
SVC_SD_STOPIO    = 43 ' LMM_FIL 5
SVC_RTC_DEBUG    = 44 ' LMM_RTC 10 or LMM_FIL 10
SVC_RTC_SETFREQ  = 45 ' LMM_RTC 6 or LMM_FIL 6
SVC_RTC_GETCLOCK = 46 ' LMM_RTC 7 or LMM_FIL 7
SVC_SETTIME      = 47 ' LMM_RTC 8 or LMM_FIL 8
SVC_RTC_GETTIME  = 48 ' LMM_RTC 9 or LMM_FIL 9
SVC_FLOAT_SIN    = 49 ' LMM_FLA 10
SVC_FLOAT_COS    = 50 ' LMM_FLA 11
SVC_FLOAT_TAN    = 51 ' LMM_FLA 12
SVC_FLOAT_LOG    = 52 ' LMM_FLA 13
SVC_FLOAT_LOG10  = 53 ' LMM_FLA 14
SVC_FLOAT_EXP    = 54 ' LMM_FLA 15
SVC_FLOAT_EXP10  = 55 ' LMM_FLA 16
SVC_FLOAT_POW    = 56 ' LMM_FLA 17
SVC_FLOAT_FRAC   = 57 ' LMM_FLA 18
SVC_FLOAT_FMOD   = 58 ' LMM_FLB 19
SVC_FLOAT_ASIN   = 59 ' LMM_FLB 20
SVC_FLOAT_ACOS   = 60 ' LMM_FLB 21
SVC_FLOAT_ATAN   = 61 ' LMM_FLB 22
SVC_FLOAT_ATAN2  = 62 ' LMM_FLB 23
SVC_FLOAT_FLOOR  = 63 ' LMM_FLB 24
SVC_FLOAT_CEIL   = 64 ' LMM_FLB 25
SVC_T_COLOR_FG   = 65 ' LMM_HMI 33
SVC_T_COLOR_BG   = 66 ' LMM_HMI 34
SVC_GETTICKS     = 67 ' LMM_RTC_11 or LMM_FIL_11
SVC_GETRANDOM    = 68 ' LMM_RND 1

'
SVC_RESERVED     = 80 ' Services 1..80 reserved for Catalina

' Floating point constants

pi = 3.141592654

FAddCmd       = 1 << 24       ' Implemented in Float32_A and Float32_B
FSubCmd       = 2 << 24       ' Implemented in Float32_A and Float32_B
FMulCmd       = 3 << 24       ' Implemented in Float32_A and Float32_B
FDivCmd       = 4 << 24       ' Implemented in Float32_A and Float32_B
FFloatCmd     = 5 << 24       ' Implemented in Float32_A and Float32_B
FTruncCmd     = 6 << 24       ' Implemented in Float32_A and Float32_B
FRoundCmd     = 7 << 24       ' Implemented in Float32_A and Float32_B
FSqrCmd       = 8 << 24       ' Implemented in Float32_A and Float32_B
FCmpCmd       = 9 << 24       ' Implemented in Float32_A and Float32_B

SinCmd        = 10 << 24      ' Implemented in Float32_A
CosCmd        = 11 << 24      ' Implemented in Float32_A
TanCmd        = 12 << 24      ' Implemented in Float32_A
LogCmd        = 13 << 24      ' Implemented in Float32_A
Log10Cmd      = 14 << 24      ' Implemented in Float32_A
ExpCmd        = 15 << 24      ' Implemented in Float32_A
Exp10Cmd      = 16 << 24      ' Implemented in Float32_A
PowCmd        = 17 << 24      ' Implemented in Float32_A
FracCmd       = 18 << 24      ' Implemented in Float32_A

FModCmd       = 19 << 24      ' Implemented in Float32_B
ASinCmd       = 20 << 24      ' Implemented in Float32_B
ACosCmd       = 21 << 24      ' Implemented in Float32_B
ATanCmd       = 22 << 24      ' Implemented in Float32_B
ATan2Cmd      = 23 << 24      ' Implemented in Float32_B
FloorCmd      = 24 << 24      ' Implemented in Float32_B
CeilCmd       = 25 << 24      ' Implemented in Float32_B

SignFlag      = $1
ZeroFlag      = $2
NaNFlag       = $8

' CogStore constants

MAX_LONGS  = 300                ' store up to 300 LONGS in HUB (1200 chars)

LUT_LONGS  = 512                ' store up to 512 LONGS in LUT (2048 chars)

CMD_READ   = $1000_0000         ' copy Hub to Cog (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_WRITE  = $2000_0000         ' copy Cog to Hub (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

CMD_SIZE   = $3000_0000         ' return size of stored data (in LONGs) - set
                                ' lower 24 bits to $FFFFFF on call - lower 24
                                ' bits (set to size when complete)

CMD_SETUP  = $4000_0000         ' setup argc and argv array with the stored
                                ' data (set to zero when complete)

CMD_STOP   = $5000_0000         ' stop the CogStore cog.

LUT_READ   = $6000_0000         ' copy Hub to LUT (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

LUT_WRITE  = $7000_0000         ' copy LUT to Hub (address in lower 24 bits)
                                ' COGSTORE set to zero when complete

LUT_SIZE   = $8000_0000         ' return size of LUT data (in LONGs) - set
                                ' lower 24 bits to $FFFFFF on call - lower 24
                                ' bits (set to size when complete)

CMD_RESPONSE = $FEED_FACE       ' COGSTORE set to this on any other command























STORE_COG    = 7                ' CogStore will use this cog



LAST_COG     = 6                ' Last cog to be restarted is 6




QUOTE_CHAR = $22

'------------------------------- HUB CONSTANTS -------------------------------
'
CON
'
' Maximum number of cogs (note that this 1 may not have them all!)
'
MAX_COGS   = 16

'
' Maximum number of locks
'
MAX_LOCKS  = 16

' HUB RAM Definitions
'
'   (make sure these are the same in all targets)
'
' Size of Service array (if this changes, the Hub Layout below must change
' as well):
'
SVC_MAX    = 96                ' must be a multiple of 2
'
' Size of ARGV array (if this changes, the Hub Layout below must change
'  as well):
'
ARGV_MAX   = 24                ' maximum size (LONGs) of argv array
'
' Base Address for all hub programs (on the 1 this is genrally zero)
'
BASE_ADDR  = $00000
'
' Useable Hub RAM (The 1 has 512Kb but the top 16Kb hold a copy of the boot ROM)
'
' NOTE: The definitions from here to the end of this file must match those
'       in catalyst.h
'
HUB_SIZE   = $7C000            ' the last 16K contain a copy of the boot ROM.
'
' NOTE: the value of FREE_MEM must match sbrk.le, sbrk.e & sbrk.ce
'
FREE_MEM   = HUB_SIZE-4                               ' $7BFFC the FREE_MEM pointer
'
' <<< ALLOCATE OTHER RESERVED HUB LOCATIONS DOWN FROM HERE >>>
'
COGSTORE        = FREE_MEM - 4                        ' $7BFF8 CHECK Catalyst_Arguments.spin
XMM_CACHE_RSP   = COGSTORE - 4                        ' $7BFF4
XMM_CACHE_CMD   = XMM_CACHE_RSP - 4                   ' $7BFF0
REGISTRY        = XMM_CACHE_CMD - MAX_COGS*4          ' $7BFB0 CHECK registry.e
REQUESTS        = REGISTRY - 2*SVC_MAX - MAX_COGS*4*2 ' $7BE70 CHECK request_status.e
ARGV_0          = REQUESTS - ARGV_MAX*4               ' $7BE10 CHECK Catalyst_Arguments.spin2
ARGV_ADDR       = ARGV_0 - 4                          ' $7BE0C CHECK Catalyst_Arguments.spin2
ARGC_ADDR       = ARGV_ADDR - 4                       ' $7BE08 CHECK Catalyst_Arguments.spin2, blackbox_comms.c, default.s, blackcat.s (all targets)
DEBUG_FLAG      = ARGC_ADDR - 16                      ' $7BDF8 CHECK blackbox_comms.c, debugcog.s & blackcat.s (all targets)
DEBUG_IN        = DEBUG_FLAG - 4                      ' $7BDF4 CHECK blackbox_comms.c, debugcog.s & blackcat.s (all targets)
DEBUG_OUT       = DEBUG_IN - 4                        ' $7BDF0 CHECK blackbox_comms.c, debugcog.s & blackcat.s (all targets)
DEBUG_ADDR      = DEBUG_OUT - 4                       ' $7BDEC CHECK blackbox_comms.c, debugcog.s & blackcat.s (all targets)
DEBUG_BREAK     = DEBUG_ADDR - 4                      ' $7BDE8 CHECK blackbox_comms.c, debugcog.s & blackcat.s (all targets)
PROXY_XFER      = DEBUG_BREAK - 4                     ' $7BDE4
MEM_LOCK        = PROXY_XFER - 4                      ' $7BDE0 CHECK memory_lock.e & memory_lock_compact.e
CGI_DATA        = MEM_LOCK - 4                        ' $7BDDC CHECK cgi_data.e & cgi_data_compact.e
'
' For loading programs from SD card, the key decision is how large a program
' we want to be able to load, because the larger the program, the more Hub RAM
' space it takes to store the cluster list for it. The following calculations
' determine how much Hub RAM space to allocate for a particular load size,
' assuming FAT32 is in use and we have a cluster size of 32768 (note that
' smaller clusters will result in correspondingly smaller load sizes):
'
MAX_LOAD_SIZE  = 4194304                       ' we want 4MB loads (2^22 bytes)
                                               ' (if this is changed, check catalyst.h
                                               ' and Catalina_SD_Loader.spin)
MAX_CLUS_SIZE  = 32768                         ' assumed cluster size (2^15 bytes)
MAX_FLIST_SIZE = MAX_LOAD_SIZE/MAX_CLUS_SIZE   ' number of entries in cluster list (2^7)
'
FLIST_LOG2     = 9                             ' LOG (Base 2) of sector size
FLIST_SSIZ     = 1<<FLIST_LOG2                 ' size of sector
'
' Resume defining Loadtime Hub Layout (note overlap with debug locations!!!):
'
FLIST_ADDRESS  = ARGC_ADDR - (4*MAX_FLIST_SIZE)     ' $7BC08 check catalyst.h
FLIST_BUFF     = FLIST_ADDRESS - FLIST_SSIZ         ' $7BA08 check catalyst.h
FLIST_SIOB     = FLIST_BUFF - 68                    ' $7B9C4 check catalyst.h
FLIST_XFER     = FLIST_SIOB - 12                    ' $7B9B8 check catalyst.h
FLIST_SECT     = FLIST_XFER - 4                     ' $7B9B4 check catalyst.h
FLIST_SHFT     = FLIST_SECT - 4                     ' $7B9B0 check catalyst.h
FLIST_FSIZ     = FLIST_SHFT - 4                     ' $7B9AC check catalyst.h
FLIST_PSTK     = FLIST_FSIZ - 4                     ' $7B9A8 check catalyst.h
FLIST_PREG     = FLIST_PSTK - 4                     ' $7B9A4 check catalyst.h






























'
' Other equates (without CACHED XMM driver):
'





ENV_MAX  = 2048
ENVIRON  = FLIST_PREG - ENV_MAX
HUB_TOP  = ENVIRON




'
' size of 1 Loader (for XMM programs):
'
P2_LOAD_SIZE      = $10000     ' max size of loader (64kb)  - must match
                               ' catalina_cog.h, payload.c and catbind.c
'
' Size of thread block and offsets (for multithreading):
'
THREAD_BLOCK_SIZE = 35         ' size (LONGs) of thread_block
THREAD_REG_OFF    = 1          ' offset (LONGs) of register save area
THREAD_AFF_OFF    = 33         ' offset (LONGs) of affinity and status data
THREAD_EXT_OFF    = 34         ' offset (LONGs) of extended information
'
'--------------------------- END OF CONSTANTS ---------------------------------



'#line 45 "../../../target/p2/lmmd.t"

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not
'                 be used in an interrupt service routine. Can be defined here
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif

'--------------------- Start of LMM Kernel ------------------------------------

DAT

        org 0
KERNEL_START

' the first $73 longs must be in the same place in all LMM and XMM kernels,
' to allow for the separate compilation of code that uses these locations

INIT    jmp #lmm_init          '$00 ' CAN ONLY BE CALLED ONCE !!!
SPEC    jmp #special           '$01
LODL    jmp #load_l            '$02
LODI    jmp #load_i            '$03
LODF    jmp #fp_ind            '$04
PSHL    jmp #push_l            '$05
PSHB    jmp #push_b            '$06
CPYB    jmp #copy_b            '$07
NEWF    jmp #new_fp            '$08
RETF    jmp #fp_ret            '$09
CALA    jmp #f_call            '$0a
RETN    jmp #f_ret             '$0b
CALI    jmp #f_cali            '$0c
JMPA    jmp #f_jump            '$0d
JMPI    jmp #f_jmpi            '$0e
DIVS    jmp #f_d32s            '$0f
DIVU    jmp #f_d32u            '$10
MULT    jmp #f_m32             '$11
BR_Z    jmp #bra_z             '$12
BRNZ    jmp #bra_nz            '$13
BRAE    jmp #bra_ae            '$14
BR_A    jmp #bra_a             '$15
BRBE    jmp #bra_be            '$16
BR_B    jmp #bra_b             '$17
SYSP    jmp #plugin            '$18
PSHA    jmp #push_a            '$19
FADD    jmp #flt_add           '$1a
FSUB    jmp #flt_sub           '$1b
FMUL    jmp #flt_mul           '$1c
FDIV    jmp #flt_div           '$1d
FCMP    jmp #flt_cmp           '$1e
FLIN    jmp #flt_int           '$1f
INFL    jmp #int_flt           '$20
PSHM    jmp #push_m            '$21
POPM    jmp #pop_m             '$22
PSHF    jmp #push_i            '$23
RLNG    jmp #rd_long           '$24
RWRD    jmp #rd_word           '$25
RBYT    jmp #rd_byte           '$26
WLNG    jmp #wr_long           '$27
WWRD    jmp #wr_word           '$28
WBYT    jmp #wr_byte           '$29

        long 0                 '$2a spare

PC      long 0                 '$2b ' set up during initialization
SP      long 0                 '$2c ' set up during initialization
FP      long 0                 '$2d
RI      long 0                 '$2e
BC      long 0                 '$2f
DBG1    long 0                 '$30 debug opAddr
DBG2    long 0                 '$31 debug temp
        long 0                 '$32 spare

r0      long 0                 '$33
r1      long 0                 '$34
r2      long 0                 '$35
r3      long 0                 '$36
r4      long 0                 '$37
r5      long 0                 '$38
r6      long 0                 '$39
r7      long 0                 '$3a
r8      long 0                 '$3b
r9      long 0                 '$3c
r10     long 0                 '$3d
r11     long 0                 '$3e
r12     long 0                 '$3f
r13     long 0                 '$40
r14     long 0                 '$41
r15     long 0                 '$42
r16     long 0                 '$43
r17     long 0                 '$44
r18     long 0                 '$45
r19     long 0                 '$46
r20     long 0                 '$47
r21     long 0                 '$48
r22     long 0                 '$49
r23     long 0                 '$4a

Bit31   long  $80000000        '$4b
all_1s  long  $ffffffff        '$4c
cviu_m1 long  $000000ff        '$4d
cviu_m2 long  $0000ffff        '$4e
top8    long  $ff000000        '$4f ' top 8 bits bitmask
low24   long  $00ffffff        '$50 ' low 24 bits bitmask

Save_PC long  0                '$51
reg     long  0                '$52 ' registry address

t1      long  0                '$53
t2      long  0                '$54
t3      long  0                '$55
t4      long  0                '$56

ct1     long  0                '$57
ct2     long  0                '$58
ct3     long  0                '$59

' lmm_init : initialize VM - note that this code is kept 17 longs long
'            to make various offsets match the main kernel, where this
'            code may be overlaid by 17 longs of debug code once
'            initialization is complete - eventually, the same may be
'            true of this kernel as well.

DEBUG_OVERLAY
lmm_init
        rdlong  reg,PTRA++      '$5a  1 load registry address (used later)
        cogid   r2              '$5b  2 register ...
        shl     r2,#2           '$5c  3 ... ourselves ...
        add     r2,reg          '$5d  4 ... as ...
        rdlong  r1,r2           '$5e  5 ... a ...
        and     r1,low24        '$5f  6 ... new ...
        wrlong  r1,r2           '$60  7  kernel
        rdlong  PC,PTRA++       '$61  8 load initial PC
        rdlong  SP,PTRA++       '$62  9 load initial SP
        rdlong  r0,PTRA++       '$63 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$64 11 load initial LUT library address
        rdlong  r2,PTRA++       '$65 12 load initial arg
        setq2   r0              '$66 13 copy lut library ...
        rdlong  $100,r1         '$67 14 ... to LUT RAM, starting at $100
        jmp     #LMM_loop       '$68 15 we can now start executing LMM code
        long    0               '$69 16
        long    0               '$6a 17
        long    0               '$6b 18
        long    0               '$6c 19
        long    0               '$6d 20
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'
LMM_next
        add    PC,#4            '$6e
'
' LMM_loop - Fetch an instruction from HUB RAM to COG RAM and execute it.
'
LMM_loop
        stalli                  '$6f
        rdlong LMM_1,PC         '$70
        add    PC,#4            '$71
        nop                     '$72 1 needs an extra NOP
LMM_1
        nop                     '$73
        allowi
        jmp    #LMM_loop
'
'load_l - load the long stored at the PC into RI, incrementing the PC
'
load_l
       rdlong RI,PC         ' load the address
       jmp    #LMM_next     ' increment PC, execute next instruction
'
'load_i - load the long at the address stored at the PC into RI,
'         incrementing the PC (i.e. load indirect)
'
load_i
       rdlong RI,PC         ' load the address
       rdlong RI,RI         ' load the long at that address
       jmp    #LMM_next     ' execute next instruction
'
' fp_ind - load the FP into RI, then add the long at the PC to result, incrementing the PC
'
fp_ind
       rdlong RI,PC         ' load the long value
       adds   RI,FP         ' add the frame pointer
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' push_l - push a long value in RI onto the stack, decrementing the SP
'
push_l
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_loop     ' increment PC, execute next instruction
'
' push_a - push a value whose address is specified indirectly in a global
'          variable onto the stack
'
push_a
       rdlong RI,PC         ' load the address
       jmp    #push_x       ' use the result as an address of the value to push
'
' push_i - push a value whose address is specified indirectly in a frame variable
'          onto the stack
'
push_i
       rdlong RI,PC         ' load the long value
       adds   RI,FP         ' add the frame pointer
push_x
       rdlong RI,RI         ' read the value at that address
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' push_m - push many registers (specified by long at PC) onto the stack,
' decrementing the SP before each one
'
push_m
       rdlong RI,PC         ' load the long value specifying the registers to push
       mov    t1,RI         ' save register specification for later
       mov    t2, #r6       ' start with ...
       shr    RI,#6         ' ... r6 ...
       test   RI,#$1FF wz   ' ... or ...
  if_z shr    RI,#9         ' ... with ...
  if_z mov    t2,#r15       ' ... r15 if r6 - r15 not used
push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  sub    SP,#4         ' yes - save ...
 if_c  altd   t2
 if_c  wrlong 0-0,SP        ' ... register
       add    t2,#1         ' point to next register
 if_nz jmp    #push_nxt    ' continue till all registers checked
       sub    SP,#4         ' save ...
       wrlong t1,SP         ' .... register specification
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' pop_m - pop many registers (specified by the long on top of stack)
' from the stack, incremening the SP after each one
'
pop_m
       rdlong RI,SP         ' load ...
       add    SP,#4         ' ... register specification to pop
       mov    t2, #r23      ' start with ...
       shl    RI,#(32-24)   ' ... r23
pop_nxt
       shl    RI,#1 wcz     ' load rX?
 if_c  altd   t2
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done
       sub    t2,#1         ' point to previous register
       jmp    #pop_nxt     ' continue till all registers popped
'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP.
'
push_b
       rdlong BC,PC         ' load the byte count
       add    PC,#4         ' increment the PC
       mov    t3,BC         ' round up the count ...
       add    t3,#3         ' ... to be ...
       andn   t3,#3         ' ... a multiple of 4
       sub    SP,t3         ' decrement SP by rounded up size
       mov    t1,R0         ' source is in R0
       mov    t2,SP         ' destination is SP
       jmp    #copy_bytes   ' do the copy
'
' copy_b - copy a structure (size in bytes at the PC)
'          from the address in R1 to the address in R0
'
copy_b
       rdlong BC,PC         ' load the byte count
       add    PC,#4         ' increment the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
'
copy_bytes
       tjz    BC,#LMM_loop  ' no more to copy
       rdbyte t3,t1         ' read from src to t3
       wrbyte t3,t2         ' write t3 to dst
       add    t1,#1         ' increment source
       add    t2,#1         ' increment destination
       sub    BC,#1         ' decrement count ...
       jmp    #copy_bytes   ' ... and keep copying
'
' new_fp - save current frame pointer and set up a new frame pointer
' also calculate what SP was before data was pushed and save it in BC
'
new_fp
       sub    SP,#4         ' decrement the stack pointer
       wrlong FP,SP         ' save FP to stack
       mov    FP,SP         ' set up new FP
       add    BC,#8         ' calculate what SP was ...
       add    BC,FP         ' ... before arguments were pushed
       sub    SP,#4         ' allow for alloca
       wrlong Bit31,SP      ' initialize pre-alloca SP (to a known value)
       jmp    #LMM_loop     ' execute the next instruction
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
       add    SP,#4         ' allow for alloca
       rdlong FP,SP         ' restore previous FP
       add    SP,#4         ' increment the SP
f_ret
       rdlong PC,SP         ' read the PC
       add    SP,#8         ' increment the SP
       jmp    #LMM_loop     ' execute the next instruction
'
' f_call - call the routine at the address pointed to by the PC (increment the PC)
' f_cali - call the routine whose address is in RI
'
f_call
       rdlong RI,PC         ' get the address to call
       add    PC,#4         ' increment the PC (this is the return address)
f_cali
       sub    SP,#8         ' decrement the SP
       wrlong PC,SP         ' save current PC to stack
       jmp    #f_jmpi       ' jump to location in RI
'
' f_jump - jump to the location at the address pointed to by PC (increment the PC)
'
f_jump
       rdlong PC,PC         ' get the address to jump to
       jmp    #LMM_loop     ' execute next instruction
'
' f_jmpi - jump to the location whose address in RI
'
f_jmpi
       mov    PC,RI         ' get the address to jump to
       jmp    #LMM_loop     ' execute next instruction
'
' rd_long/rd_word/rd_byte : Read long/word/byte from HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to read
' On exit:
'    BC : long/word/byte read
'
rd_long
        rdlong  BC,RI
        jmp     #LMM_Next
rd_word
        rdword  BC,RI
        jmp     #LMM_Next
rd_byte
        rdbyte  BC,RI
        jmp     #LMM_Next
'
' wr_long/wr_word/wr_byte : Write long/word/byte to HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to write
'    BC : long/word/byte to write
' On exit:
'    (none)

wr_long
        wrlong  BC,RI
        jmp     #LMM_Next
wr_word
        wrword  BC,RI
        jmp     #LMM_Next
wr_byte
        wrbyte  BC,RI
        jmp     #LMM_Next

'f_d32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1

f_d32s
        call    #\signed_d32     ' perform signed division
        jmp     #LMM_loop

'f_d32u - unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        call    #\unsigned_d32   ' perform signed division
        jmp     #LMM_loop


'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)

f_m32
        qmul   r0,r1
        getqx  r0
        jmp #LMM_loop

' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4
'
bra_z
  if_z  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_nz
 if_nz  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_ae
 if_ae  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_a
 if_a   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_be
 if_be  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_b
 if_b   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction

' plugin - call a plugin
' On entry:
'       R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'       R2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result

plugin
        call    #\do_plugin     ' do_plugin does all the work
        jmp     #LMM_loop

'---------------------------- local constants ---------------------------------

dlsb          long   1<<9

'--------------------- Start of Float32 Components ----------------------------
'
{{
                            TERMS OF USE: MIT License
              (Float32 Components only - i.e. excludes LMM Kernel)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}












DAT

'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
' flt_add   r0 = r0 + r1
' flt_sub   r0 = r0 - r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1
'------------------------------------------------------------------------------

flt_sub                 xor     r1, Bit31               ' negate B
flt_add                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     jmp     #LMM_loop               ' check for NaN or B = 0

                        test    flagA, #SignFlag wz     ' negate A mantissa if negative
          if_nz         neg     manA, manA
                        test    flagB, #SignFlag wz     ' negate B mantissa if negative
          if_nz         neg     manB, manB

                        mov     t1, expA                ' align mantissas
                        sub     t1, expB
                        abs     t1, t1
                        fle     t1, #31
                        cmps    expA, expB wcz
          if_nz_and_nc  sar     manB, t1
          if_nz_and_c   sar     manA, t1
          if_nz_and_c   mov     expA, expB

                        add     manA, manB              ' add the two mantissas

                        cmps    manA, #0 wc             ' set sign of result
          if_c          or      flagA, #SignFlag
          if_nc         andn    flagA, #SignFlag
                        abs     manA, manA              ' pack result and exit
pack_loop               call    #_Pack
                        jmp     #LMM_loop

'------------------------------------------------------------------------------
' flt_mul  r0 = r0 * r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_mul                 call    #_Unpack2               ' unpack two variables
          if_nc         jmp     #flt_mul2               ' multiply if neither is NaN
                        cmp     expA, #255 wz           ' NaN, so check for r0 = Inf
          if_z          jmp     #flt_mul1               ' yes - return Inf
                        cmp     expB, #255 wz           ' no - check for r1 = Inf
          if_nz         jmp     #LMM_loop               ' no - return NaN
flt_mul1                mov     r0, Inf                 ' yes, r0 or r1 is Inf, so return Inf
                        xor     flagA, flagB            '
                        test    flagA, #SignFlag wz
          if_nz         or      r0, Bit31
                        jmp     #LMM_loop
flt_mul2                xor     flagA, flagB            ' get sign of result
                        add     expA, expB              ' add exponents
                        qmul    manA, manB
                        getqy   t1
                        shl     t1, #3                  ' justify result and exit
                        mov     manA, t1
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' flt_div  r0 = r0 / r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_div                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     mov     r0, NaN                 ' check for NaN or divide by 0
          if_c_or_z     jmp     #LMM_loop

                        xor     flagA, flagB            ' get sign of result
                        sub     expA, expB              ' subtract exponents
                        shr     manA, #1
                        setq    manA
                        qdiv    #0, manB
                        getqx   manA
                        shr     manA, #2
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' flt_int  r0 = float(r0)
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

flt_int                 mov     flagA, r0               ' get integer value
                        mov     r0, #0                  ' set initial result to zero
                        abs     manA, flagA wz          ' get absolute value of integer
          if_z          jmp     #LMM_loop               ' if zero, exit
                        shr     flagA, #31              ' set sign flag
                        mov     expA, #31               ' set initial value for exponent
normalize_1             shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #normalize_1
                        rcr     manA, #1                ' justify mantissa
                        shr     manA, #2
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' int_flt  r0 = fix(r0)
' changes: r0, flagA, expA, manA, t1
'------------------------------------------------------------------------------

int_flt
fix                     call    #_Unpack                ' unpack floating point value
          if_c          jmp     #LMM_loop               ' check for NaN
                        shl     manA, #2                ' left justify mantissa
                        mov     r0, #0                  ' initialize result to zero
                        neg     expA, expA              ' adjust for exponent value
                        add     expA, #31 wz
                        cmps    expA, #33 wc
          if_nc_or_z    jmp     #LMM_loop
                        sub     expA, #1
                        shr     manA, expA
                        shr     manA, #1
                        test    flagA, #signFlag wz     ' check sign and exit
                        sumnz   r0, manA
                        jmp     #LMM_loop

'------------------------------------------------------------------------------
' flt_cmp   set Z and C flags for r0 - r1
' changes: status, t1
'------------------------------------------------------------------------------

flt_cmp                 mov     t1, r0               ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #cmp1                  ' same, then compare magnitude

                        mov     t1, r0               ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wcz
          if_z          jmp     #LMM_loop

                        test    r0, Bit31 wc         ' compare signs
                        jmp     #LMM_loop

cmp1                    test    r0, Bit31 wz         ' check signs
          if_nz         jmp     #cmp2
                        cmp     r0, r1 wcz
                        jmp     #LMM_loop
cmp2                    cmp     r1, r0 wcz           ' reverse test if negative
                        jmp     #LMM_loop

'------------------------------------------------------------------------------
' input:   r0        32-bit floating point value
'          r1        32-bit floating point value
' output:  flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
'          flagB        r1 flag bits (Nan, Infinity, Zero, Sign)
'          expB         r1 exponent (no bias)
'          manB         r1 mantissa (aligned to bit 29)
'          C flag       set if r0 or r1 is NaN
'          Z flag       set if r1 is zero
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1
'------------------------------------------------------------------------------

_Unpack2                mov     t1, r0               ' save A
                        mov     r0, r1               ' unpack B to A
                        call    #_Unpack
                        mov     r1, r0               ' save B variables
                        mov     flagB, flagA
                        mov     expB, expA
                        mov     manB, manA
                        mov     r0, t1               ' unpack A
                        call    #_Unpack
          if_nc         test    flagB, #NanFlag wz
          if_nc_and_nz  modc    _set wc
          _ret_         cmp     manB, #0 wz          ' set Z flag

'------------------------------------------------------------------------------
' input:   r0        32-bit floating point value
' output:  flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
'          C flag       set if r0 is NaN
'          Z flag       set if r0 is zero
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

_Unpack                 mov     flagA, r0            ' get sign
                        shr     flagA, #31
                        mov     manA, r0             ' get mantissa
                        and     manA, Mask23
                        mov     expA, r0             ' get exponent
                        shl     expA, #1
                        shr     expA, #24 wz
          if_z          jmp     #zeroSubnormal         ' check for zero or subnormal
                        cmp     expA, #255 wz           ' check if finite
          if_nz         jmp     #finite
                        mov     r0, NaN              ' no, then return NaN
                        or      flagA, #NaNFlag
                        jmp     #U_exit2

zeroSubnormal          mov     t4, manA
                        or      t4, expA wz             ' check for zero
          if_nz         jmp     #subnorm
                        or      flagA, #ZeroFlag        ' yes, then set zero flag
                        neg     expA, #150              ' set exponent and exit
                        jmp     #U_exit2

subnorm                 shl     manA, #7                ' fix justification for subnormals
subnorm2                test    manA, Bit29 wz
          if_nz         jmp     #U_exit1
                        shl     manA, #1
                        sub     expA, #1
                        jmp     #subnorm2

finite                  shl     manA, #6                ' justify mantissa to bit 29
                        or      manA, Bit29             ' add leading one bit

U_exit1                 sub     expA, #127              ' remove bias from exponent
U_exit2                 test    flagA, #NaNFlag wc      ' set C flag
          _ret_         cmp     manA, #0 wz             ' set Z flag

'------------------------------------------------------------------------------
' input:   flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
' output:  r0        32-bit floating point value
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

_Pack                   cmp     manA, #0 wz             ' check for zero
          if_z          mov     expA, #0
          if_z          jmp     #P_exit3

normalize_2             shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #normalize_2

                        add     expA, #2                ' adjust exponent
                        add     manA, #$100 wc          ' round up by 1/2 lsb
          if_c          add     expA, #1

                        add     expA, #127              ' add bias to exponent
                        fges    expA, Minus23
                        fles    expA, #255

                        cmps    expA, #1 wc             ' check for subnormals
          if_nc         jmp     #P_exit3

subnormal               or      manA, #1                ' adjust mantissa
                        ror     manA, #1

                        neg     expA, expA
                        shr     manA, expA
                        mov     expA, #0                ' biased exponent = 0

P_exit3                 mov     r0, manA             ' bits 22:0 mantissa
                        shr     r0, #9
                        shl     expA, #23
                        or      r0, expA
                        shl     flagA, #31
         _ret_          or      r0, flagA            ' bit 31 sign

NaN                     long    $7FFF_FFFF
Inf                     long    $7F80_0000
Minus23                 long    -23
Mask23                  long    $007F_FFFF
Bit29                   long    $2000_0000

flagA                   long    0
expA                    long    0
manA                    long    0

flagB                   long    0
expB                    long    0
manB                    long    0

'-------------------- End of Float32 Components -------------------------------

'---------------------------- local variables ---------------------------------

' temporary storage used in mul & div calculations

ftemp    long    0
ftmp2    long    0

' lockbits must be in the same place in all LMM kernels

         fit    $1ea
         orgf   $1ea

lockbits long   0               ' lockbits used to simulate P1-style locks

' last 5 longs are reserved for debug overlay vectors (or debug LED)

         fit    $1eb
         orgf   $1eb

DEBUG_VECTORS











         long   DEBUG_BREAK
         long   DEBUG_ADDR
         long   DEBUG_OUT
         long   DEBUG_IN
         long   DEBUG_FLAG

         fit    $1f0

'------------------------- END OF KERNEL --------------------------------------

         org $300

' Common Kernel library functions. This code is included only to get the LUT
' offsets correct in the dynamically loaded kernel. The actual LUT code is
' loaded into LUT from elsewhere. There must be a better way to do this, but I
' can't think of one at the moment :(

'#line 1 "../../../target/p2/klib.inc"
' Catalina kernel library functions ...

' avoid including the kernel library functions twice ...




DAT

' unsigned_d32 - 32 bit unsigned division

unsigned_d32
         qdiv   r0,r1
         getqx  r0
  _ret_  getqy  r1

' signed_d32 - 32 bit signed division

signed_d32
         mov    t3,r1           ' save sign for later
         mov    t4,r0
         abs    r1,r1
         abs    r0,r0
         xor    t3,t4
         call   #\unsigned_d32  ' perform unsigned division
         mov    t4,t4 WC        ' get bit #31 into carry
         negc   r1,r1           ' adjust the sign of the remainder
         mov    t3,t3 WC        ' get bit #31 into carry
  _ret_  negc   r0,r0           ' adjust the sign of the result


' find_ptype - find plugin by type
'
' On entry:
'      r0 = plugin type
'
' On exit:
'      t2 = cog id if found, -1 if not found
'      t1 = registry entry if found
'      Z set if found, Z clr if not found
'      t3 lost

find_ptype
        mov     t1,reg          ' point to registry
        mov     t2,#0           ' start at cog id 0
plgt1
        cmp     t2,#MAX_COGS wcz ' run out of cogs?
 if_ae  jmp     #plgt2          ' yes - no such plugin
        rdlong  t3,t1           ' no - check cog's plugin type
        shr     t3,#24          ' is it ...
        cmp     t3,r0 wz        ' ... the plugin type what we wanted?
 if_z   ret                     ' yes - return cog id in r0, Z set
        add     t2,#1           ' no - try ...
        add     t1,#4           ' ... next ...
        jmp     #plgt1          ' ... cog id
plgt2
 _ret_  neg     t2,#1 wz        ' plugin type not found

' do_plugin - call a plugin
'
' On entry:
'       r3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0 (i.r. -1 .. -127)
'       r2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result

do_plugin
        mov     t4,#MAX_LOCKS   ' t4 stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
        mov     r0,r3           ' otherwise ...
        call    #\find_ptype    ' ... find plugin by type
 if_nz  jmp     #plugerr        ' if Z clr, no such plugin
        mov     r0,t2           ' use the cog where we found the plugin
        jmp     #pcog           ' invoke plugin (via the cog id)
psvc
        shl     r0,#1           ' read entry ...
        add     r0,reg          ' ... from ...
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        and     r0,#$f          ' cog number is 4 bits
        mov     t2,t1           ' save in t2 and extract ...
        and     t1,#$7f         ' ... 7 bit plugin-specific code ...
        shl     t1,#24 wz       ' ... to t1 (top 8 bits) ...
 if_z   jmp     #plugerr        ' ... or throw error if request code is zero
        mov     t4,t2           ' extract ...
        shr     t4,#7           ' ... lock number to t4
        and     t4,#$1f         ' lock is 5 bits
        test    t4,#$10 wz      ' are we required to use a lock?
 if_nz  jmp     #no_lock        ' no - just make the request
set_lock
        bith    lockbits, t4 wcz ' have we acquired ...
 if_nz  locktry t4 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz bitl  lockbits, t4 ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z jmp  #set_lock       ' keep trying until we have set the lock
no_lock
        andn    r2,top8         ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#$f          ' mask off cog id to 0 .. 15
        shl     r0,#2           ' point to ...
        add     r0,reg          ' ... registry entry for the cog
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' is a plugin registered in this cog?
 if_z   jmp     #plugerr        ' no - throw error
        andn    r0,top8         ' yes - write ...
        wrlong  r2,r0           ' ... request
ploop
        rdlong  r3,r0   wz      ' wait till ...
 if_nz  jmp     #ploop          ' ... request completed
        add     r0,#4           ' get ...
        rdlong  r0,r0           ' ... result
clr_lock
        cmp     t4,#MAX_LOCKS wcz ' did we set a lock?
 if_b   lockrel t4              ' yes - release the lock we set
 if_b   bitl lockbits, t4
        ret
plugerr
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required

' do_register - register a plugin
'
' On entry:
'
'        r0 - initial value to write to request block
'        r1 - cog to register (lost)
'        r2 - lost
'        r3 - plugin type to register (lost)

do_register
        shl     r1, #2          ' register ...
        add     r1, ##REGISTRY  ' ... plugin ...
        rdlong  r2, r1          ' ...
        and     r2, ##$00FFFFFF ' ... as ...
        shl     r3, #24         ' ...
        or      r2, r3          ' ...
        wrlong  r2, r1          ' ... plugin type
  _ret_ wrlong  r0, r2          ' save in request block

' do_copy
'
' On entry:
'
'       r0 - dst addr
'       r1 - number of bytes to copy (must not be zero!)
'       r2 - src addr
'
' On exit:
'
'       r0 incremented by r1 (i.e. number of bytes)
'       r1 lost
'       r2 incremented by r1 (i.e. number of bytes)
'       r3 lost

do_copy
       rdbyte  r3, r2           '
       wrbyte  r3, r0
       add     r0, #1
       add     r2, #1
       djnz    r1, #do_copy     '
       ret

' do_loadlut_hub
'
' On entry:
'
'       r0 - Hub src addr
'       r1 - LUT dst addr
'       RI - number of longs to copy - 1
'
' On exit:
'       t1 lost
'       t2 lost

do_loadlut_hub
       rdlut   t1, ##.lutsrc  ' we can't use sets on code in the LUT ...
       sets    t1, r1         ' ... so we have ...
       wrlut   t1, ##.lutsrc  ' ... to do this instead!
       rdlong  t2, r0         ' read signature from hub
       nop                    ' need this!
.lutsrc
       rdlut   t1, #0-0        ' read signature from LUT
       cmp     t1, t2 wz      ' do we need to load?
       rdlut   t1, ##.lutdst  ' yes - we can't use setd on code in the LUT ...
       setd    t1, r1         ' ... so we have ...
       wrlut   t1, ##.lutdst  ' ... to do this instead!
       setq2   RI           '
.lutdst
 _ret_ rdlong  0-0, r0



'#line 845 "../../../target/p2/lmmd.t"

'#line 1 "../../../target/p2/lmmklib.inc"
' Catalina kernel functions that are specific to the LMM kernels ...

' avoid including the kernel library functions twice ...




DAT

' do_initcog - cannot be executed via LMM because rdlongs interrupt the setq
'    r4 points to data block (REGISTRY, PC, SP)
'    r0 contains cog id (or ANY_COG)
'    r3 contains pointer to code to load into cog

do_initcog
        setq    r4             ' this will end up in PTRA of new cog
        coginit r0, r3 wc
        jmp     #LMM_Loop

' do_rotxy - cannot be executed via LMM because rdlongs interrupt the setq
'    r1 contains Y
'    r0 contains X
'    r2 contains angle

do_rotxy
        setq    r1
        qrotate r0, r2
        jmp     #LMM_Loop

' do_cnthl - cannot be executed via LMM as the 2 instructions must be adjacent
do_cnthl
        getct   r1 wc
        getct   r0
        jmp     #LMM_Loop

' do_div64 - cannot be executed via LMM because rdlongs interrupt the setq
 ' on entry r0 = lower 32 bits of dividend
 '          r1 = upper 32 bits of dividend
 '          r2 = divisor
 ' on exit  r0 = quotient

do_div64
        setq    r1       ' set upper 32 bits of product to q register
        qdiv    r0, r2   ' divide 64 bit product by 32 bit divisor
        jmp     #LMM_loop

' special - perform a special operation that cannot be performed via LMM
'    RI contains 1 => do_initcog
'                2 => do_rotxy
'                3 => do_cnthl
'                4 => do_div64

special
        djz     RI, #do_initcog
        djz     RI, #do_rotxy
        djz     RI, #do_cnthl
        jmp     #do_div64




'#line 847 "../../../target/p2/lmmd.t"


