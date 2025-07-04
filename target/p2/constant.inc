'--------------------------- START OF CONSTANTS -------------------------------

#ifndef CONSTANTS_INCLUDED

' stop multiple inclusions of constants ...

#define CONSTANTS_INCLUDED

#include <platform.inc>

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
#ifdef CACHED_1K
CACHE_BYTES_LOG2       = 10 ' 1024
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_2K
CACHE_BYTES_LOG2       = 11 ' 2048
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_4K
CACHE_BYTES_LOG2       = 12 ' 4096
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_8K
CACHE_BYTES_LOG2       = 13 ' 8192
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_16K
CACHE_BYTES_LOG2       = 14 ' 16384
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_32K
CACHE_BYTES_LOG2       = 15 ' 32768
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED_64K
CACHE_BYTES_LOG2       = 16 ' 65536
#ifndef CACHED
#define CACHED
#endif
#else
#ifdef CACHED
CACHE_BYTES_LOG2       = 13 ' 8192 (the default)
#endif
#endif
#endif
#endif
#endif
#endif
#endif
#endif

#if defined(LUT_CACHE) && !defined(CACHED_1K)
#error LUT_CACHE REQUIRES CACHED_1K
#endif

#ifdef CACHED

' The maximum value of CACHE_INDEX_LOG2 depends on the size of the XMM code,
' which must fit into the cache cog along with the index table, which (after
' initilization) occupies the first 2^CACHE_INDEX_LOG2 longs of the cache cog.
' Generally, the larger the better for performance, and it can be up to 8 on 
' all current P2 platforms, but may need to be reduced to 7 in future - e.g.
' if FLASH support is ever added to the P2 cache. The value can be as low as 2,
' but values this low are not recommended for LARGE mode programs because it 
' makes the page size is larger, and the write-back overheads get very high 
' since the whole page must be written back even if only one byte on the page 
' has changed. The optimal value must be determined by trial and error.

#if !defined(NO_LUT)

CACHE_INDEX_LOG2      = 8 ' log2 of entries in cache index
                          ' NOTE: The valid range depends on the cache size,
                          '       and is from (CACHE_BYTES_LOG2 - 10)  to 8,
                          '       so if the cache size is 64K, the possible
                          '       values are 6, 7 or 8.

#elif defined(LUT_CACHE)

CACHE_INDEX_LOG2      = 4 ' log2 of entries in cache index
                          ' NOTE: Only the value 4 is possible to allow the
                          '       whole cache to fit in 1K!
#else

CACHE_INDEX_LOG2      = 6 ' log2 of entries in cache index

#endif

CACHE_INDEX_MASK       = 1<<CACHE_INDEX_LOG2-1  ' mask for cache index

CACHE_LINE_LOG2        = CACHE_BYTES_LOG2 - CACHE_INDEX_LOG2 ' log2 of size of line
CACHE_LINE_MASK        = 1<<CACHE_LINE_LOG2-1   ' mask for address in cache line

CACHE_CMD_MASK         = %11

#if !defined(NO_LUT) && defined(LARGE)
' read/write commands (note: no extended commands = no FLASH support)
CACHE_WRITE_CMD        = %10 ' write page from Hub RAM
CACHE_READ_CMD         = %11 ' read page into Hub RAM
CACHE_CODE_CMD         = %01 ' read page into Hub RAM and copy to LUT
CACHE_CODE_MASK        = %10 ' this bit must be zero for a CODE command
#else
' read/write commands
CACHE_WRITE_CMD        = %10
CACHE_READ_CMD         = %11
' extended commands
CACHE_EXTEND_MASK      = %10   ' this bit must be zero for an extended command
CACHE_ERASE_CHIP_CMD   = %000_01
CACHE_ERASE_BLOCK_CMD  = %001_01
CACHE_WRITE_DATA_CMD   = %010_01
CACHE_SD_INIT_CMD      = %011_01
CACHE_SD_READ_CMD      = %100_01
CACHE_SD_WRITE_CMD     = %101_01
#endif

#else

#if defined(LUT_CACHE)
#error LUT_CACHE REQUIRES CACHE
#endif

#endif

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
' set if not used), the next lower 4 bits are a lock number (top bit of
' the 4 set if not required) and the lower 8 bits are the request number 
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

#ifdef CACHED

#if !defined(NO_LUT) || defined(LUT_CACHE)
' CACHE_COG    = 1              ' CACHE_COG is not used when sharing LUT
STORE_COG    = 7                ' CogStore will use this cog
#ifdef NO_ARGS
LAST_COG     = 7                ' Last cog to be restarted is 7
#else
LAST_COG     = 6                ' Last cog to be restarted is 6
#endif
#else
CACHE_COG    = 7                ' cache will use this cog
STORE_COG    = 6                ' CogStore will use this cog
#ifdef NO_ARGS
LAST_COG     = 6                ' Last cog to be restarted is 6
#else
LAST_COG     = 5                ' Last cog to be restarted is 5
#endif
#endif

#else

STORE_COG    = 7                ' CogStore will use this cog
#ifdef NO_ARGS
LAST_COG     = 7                ' Last cog to be restarted is 7
#else
LAST_COG     = 6                ' Last cog to be restarted is 6
#endif

#endif

QUOTE_CHAR = $22

'------------------------------- HUB CONSTANTS -------------------------------
'
CON
'
' Maximum number of cogs (note that this P2 may not have them all!)
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
' Base Address for all hub programs (on the P2 this is genrally zero)
'
BASE_ADDR  = $00000
'
' Useable Hub RAM (The P2 has 512Kb but the top 16Kb hold a copy of the boot ROM)
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

#ifdef CACHED
'
' Hub area for CACHED driver:
'
' with 64K CACHE : $6B9A4
' with 32K CACHE : $739A4
' with 16K CACHE : $779A4
' with  8K CACHE : $799A4
' with  4K CACHE : $7A9A4
' with  2K CACHE : $7B1A4
' with  1K CACHE : $7B5A4  (or LUT CACHE)
' with  NO CACHE : $7B9A4
'
XMM_CACHE       = FLIST_PREG - 1<<CACHE_BYTES_LOG2  
'
' Other equates (with CACHED XMM driver):
'
#ifdef NO_ENV
ENV_MAX  = 0
ENVIRON  = 0
HUB_TOP  = XMM_CACHE
#else
ENV_MAX  = 2048
ENVIRON  = XMM_CACHE - ENV_MAX
HUB_TOP  = ENVIRON
#endif

#else

'
' Other equates (without CACHED XMM driver):
'
#ifdef NO_ENV
ENV_MAX  = 0
ENVIRON  = 0
HUB_TOP  = FLIST_PREG
#else
ENV_MAX  = 2048
ENVIRON  = FLIST_PREG - ENV_MAX
HUB_TOP  = ENVIRON
#endif

#endif

'
' size of P2 Loader (for XMM programs):
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

#endif

