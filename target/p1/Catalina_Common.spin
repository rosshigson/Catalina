{{
'-------------------------------------------------------------------------------
'
' Catalina_Common - Common definitions for the Catalina LMM and XMM Kernels and
'                   targets.
' 
'                   This file also contains routines for setting up and using 
'                   the registry from Spin.
'
'                   The various include files (included by this file) can be 
'                   configured to suit your propeller platform. The file
'                   Custom_Def.inc should be used if you have a platform
'                   other than those with specific definitions files.
'
'
' Version 3.1 - Initial version - by Ross Higson
' Version 3.10 - Added LMM_SPI
' Version 3.11 - Added a workaround for a homespun bug - all layer 2 and 3
'                methods are now always included if Homespun us used as the
'                assembler. This incurs an overhead 240 or so bytes.
'                Changes to the SD Card FLIST layout, to accomodate loading
'                programs up to 4Mb, form either FAT16 or FAT32 SD cards.
'
'------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    This file is part of the Catalina Target Package.
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
'
' Inlcude platform independent constants
'
#include "Constants.inc"
'
' Include basic definitions and constants for the supported platforms
'
#include "DEF.inc"
'
'===============================================================================
'
' The following lines are required to work around a Homespun bug. Apparently 
' Homespun eliminates objects by name, not by doing a binary comparison. This
' means that instances of a common module (such as this one) may be eliminated 
' even if they differ, such as occurs if this module is included once without 
' Layer 2 or Layer 3 methods being enabled, and then again WITH them enabled. 
' To avoid this occurring, we always enable all Layer 3 mehods (Which in turn 
' enables ' all Layer 2 methods) when using Homespun. To help here, the 
' command-line symbol OPENSPIN__ is now defined automatically by Catalina if
' using the Openspin assembler, and HOMESPUN__ is defined automatically if
' using the Homespun assembler.
'
' These lines can be removed if this bug is ever fixed in Homespun:
'
#ifndef OPENSPIN__
#ifndef FULL_LAYER_3
#define FULL_LAYER_3
#endif
#endif
'
'===============================================================================
'
' Definitions following these lines are common to ALL platforms
'
'===============================================================================
'
CON
'
' For EEPROM modes, the address of the loadable image
'
BOOT_PIN       = 28              ' I2C Boot EEPROM SCL Pin
EEPROM_DEVICE  = $A0             ' I2C EEPROM Device Address
IMAGE_ADDR     = $8000           ' Address of Catalina Program within EEPROM

'
' For TV modes, select PAL_NTSC, INTERLACE
'
#ifdef NTSC
NTSC_PAL = 0                    ' 0 = NTSC                       
#else
NTSC_PAL = 1                    ' 1 = PAL
#endif

#ifdef NO_INTERLACE
INTERLACE = 0                   ' 0 = non-interlace
#else
INTERLACE = 1                   ' 1 = interlace
#endif

'
' Stack size required during SPIN initialization. May need to be increased
' if you add a lot of SPIN initialization code. This has nothing to do with
' the Catalina stack size.
'
STACKSIZE = 50
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
LMM_S8A = 25      ' 8 Port Serial Driver A (Propeller 2 only)
LMM_HYP = 26      ' HyperRam/HyperFlash Driver (Propeller 2 only)
LMM_SM1 = 27      ' SRAM Memory (8 Bit) Driver (Propeller 2 only)
LMM_PM1 = 28      ' PSRAM Memory (16 Bit) Driver (Propeller 2 only)
LMM_XCH = 29      ' XMM Cache
LMM_STO = 30      ' CogStore
LMM_P2P = 31      ' P2P Bus
LMM_RND = 32      ' Random Number Generator
LMM_NUL = 255     ' No plugin
'
#ifdef CACHED
'
' Definitions for XMM CACHE (compatible with jazzed's spisram_cache):
'
#ifdef CACHED_1K
CACHE_BYTES_LOG2       = 10 ' 1024
#elseifdef CACHED_2K
CACHE_BYTES_LOG2       = 11 ' 2048
#elseifdef CACHED_4K
CACHE_BYTES_LOG2       = 12 ' 4096
#else
CACHE_BYTES_LOG2       = 13 ' 8192 (the default)
#endif

'CACHE_INDEX_LOG2       = 7 ' log2 of entries in cache index (now platform-specific)

CACHE_INDEX_MASK       = 1<<CACHE_INDEX_LOG2-1  ' mask for cache index

CACHE_LINE_LOG2        = CACHE_BYTES_LOG2 - CACHE_INDEX_LOG2 ' log2 of size of line
CACHE_LINE_MASK        = 1<<CACHE_LINE_LOG2-1   ' mask for address in cache line

CACHE_CMD_MASK         = %11
' read/write commands
CACHE_WRITE_CMD        = %10
CACHE_READ_CMD         = %11

CACHE_EXTEND_MASK      = %10   ' this bit must be zero for an extended command
' extended commands
CACHE_ERASE_CHIP_CMD   = %000_01
CACHE_ERASE_BLOCK_CMD  = %001_01
CACHE_WRITE_DATA_CMD   = %010_01
CACHE_SD_INIT_CMD      = %011_01
CACHE_SD_READ_CMD      = %100_01
CACHE_SD_WRITE_CMD     = %101_01
'
#endif

'
' HUM RAM Definitions (make sure these are the same in Catalina_Common.spin in all targets):
'
' Size of Service array (if this changes, the Hub Layout below must change as well):
'
SVC_MAX         = 96                           ' must be a multiple of 2
'                                  
' Size of ARGV array (if this changes, the Hub Layout below must change as well):
'
ARGV_MAX        = 24                           ' maximum size (LONGs) of argv array
'
' Upper HUB RAM Layout:
'
HUB_SIZE        = $8000                        ' $8000
'
' NOTE: the value of FREE_MEM must match sbrk.le, sbrk.e & sbrk.ce
'
FREE_MEM        = HUB_SIZE - 4                 ' $7FFC
COGSTORE        = FREE_MEM - 4                 ' $7FF8 CHECK Catalyst_Arguments.spin
XMM_CACHE_RSP   = COGSTORE - 4                 ' $7FF4
XMM_CACHE_CMD   = XMM_CACHE_RSP - 4            ' $7FF0
REGISTRY        = XMM_CACHE_CMD - 8*4          ' $7FD0 CHECK registry.e
REQUESTS        = REGISTRY - 2*SVC_MAX - 8*4*2 ' $7ED0 CHECK request_status.e
ARGV_0          = REQUESTS - ARGV_MAX*4        ' $7E70 CHECK Catalyst_Arguments.spin
ARGV_ADDR       = ARGV_0 - 2                   ' $7E6E CHECK Catalyst_Arguments.spin
ARGC_ADDR       = ARGV_ADDR - 2                ' $7E6C CHECK Catalyst_Arguments.spin, blackbox_comms.c, catalina_default.s, catalina_blackcat.s & catalina_pod.s (all targets)
DEBUG_FLAG      = ARGC_ADDR - 16               ' $7E5C CHECK blackbox_comms.c, BlackCat_DebugCog.spin & catalina_blackcat.s (all targets)
DEBUG_IN        = DEBUG_FLAG - 4               ' $7E58 CHECK blackbox_comms.c, BlackCat_DebugCog.spin & catalina_blackcat.s (all targets)
DEBUG_OUT       = DEBUG_IN - 4                 ' $7E54 CHECK blackbox_comms.c, BlackCat_DebugCog.spin & catalina_blackcat.s (all targets)
DEBUG_ADDR      = DEBUG_OUT - 4                ' $7E50 CHECK blackbox_comms.c, BlackCat_DebugCog.spin & catalina_blackcat.s (all targets)
DEBUG_BREAK     = DEBUG_ADDR - 4               ' $7E4C CHECK blackbox_comms.c, BlackCat_DebugCog.spin & catalina_blackcat.s (all targets)
PROXY_XFER      = DEBUG_BREAK - 4              ' $7E48
MEM_LOCK        = PROXY_XFER - 4               ' $7E44 CHECK memory_lock.e & memory_lock_compact.e !!!
CGI_DATA        = MEM_LOCK - 4                 ' $7E40 CHECK cgi_data.e & cgi_data_compact.e
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
                                               ' and Catalina_XMM_SD_Loader.spin)
MAX_CLUS_SIZE  = 32768                         ' assumed cluster size (2^15 bytes)
MAX_FLIST_SIZE = MAX_LOAD_SIZE/MAX_CLUS_SIZE   ' number of entries in cluster list (2^7)
'
FLIST_LOG2     = 9                             ' LOG (Base 2) of sector size
FLIST_SSIZ     = 1<<FLIST_LOG2                 ' size of sector
'
' Resume defining Loadtime Hub Layout (note overlap with debug locations!!!):
'
FLIST_ADDRESS  = ARGC_ADDR - (4*MAX_FLIST_SIZE)     ' $7C6C check catalyst.h
FLIST_BUFF     = FLIST_ADDRESS - FLIST_SSIZ         ' $7A6C check catalyst.h
FLIST_SIOB     = FLIST_BUFF - 68                    ' $7A28 check catalyst.h
FLIST_XFER     = FLIST_SIOB - 12                    ' $7A1C check catalyst.h
FLIST_SECT     = FLIST_XFER - 4                     ' $7A18 check catalyst.h
FLIST_SHFT     = FLIST_SECT - 4                     ' $7A14 check catalyst.h
FLIST_FSIZ     = FLIST_SHFT - 4                     ' $7A10 check catalyst.h
FLIST_PSTK     = FLIST_FSIZ - 4                     ' $7A0C check catalyst.h
FLIST_PREG     = FLIST_PSTK - 4                     ' $7A08 check catalyst.h
'
' size of P1 Loader (for XMM programs):
'
P1_LOAD_SIZE      = $8000      ' max size of loader (32kb) - must match 
                               ' catalina_cog.h, payload.c and catbind.c
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
' The top 4 bits of the word are the cog number, the next lower 5 bits 
' are a lock number (all bits set if lock not required) and the lower 
' 7 bits are the plugin specific request code to send to the cog to 
' request the service.
' Note that we allow 5 bits for lock for compatibility with the P2,
' which has 16 locks, even though the P1 only has 8 locks.
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
'
' BlackCat Debugger Support (NOTE: these must match the definitions in 
'                            Catalina_blackcat.s)
'
DEBUG_OVERLAY    = LMM_INIT_OFF    ' Cog location to overlay debug code
DEBUG_VECTORS    = $1eb            ' Cog location to overlay hub vectors (last 5 longs!!!)
#ifdef COMPACT
DEBUG_MARKER     = CMM_PC_OFF      ' CMM Cog location to write to DEBUG_BREAK at breakpoint (PC)
#elseifdef CMM
DEBUG_MARKER     = CMM_PC_OFF      ' CMM Cog location to write to DEBUG_BREAK at breakpoint (PC)
#else
DEBUG_MARKER     = LMM_PC_OFF      ' LMM Cog location to write to DEBUG_BREAK at breakpoint (PC)                   
#endif
BLACKCAT_SIZE    = 5 * 4           ' size (in bytes) of Hub RAM communications block for Black Cat
'BLACKCAT_BAUD    = 9600            ' Baud Rate for Black Cat comms (RS232 or USB)
'BLACKCAT_BAUD    = 57600           ' Baud Rate for Black Cat comms (RS232or USB)
BLACKCAT_BAUD    = 115200          ' Baud Rate for Black Cat comms (RS232 or USB)
'BLACKCAT_BAUD    = 230400          ' Baud Rate for Black Cat comms (USB)
'BLACKCAT_BAUD    = 460800          ' Baud Rate for Black Cat comms (USB)
'BLACKCAT_BAUD    = 921600          ' Baud Rate for Black Cat comms (USB)
'
' GRAPHICS Support:
'
X_TILES        = 16             ' Tiles are 16 by 16, so X resolution is 256
Y_TILES        = 12             ' Tiles are 16 by 16, so Y resolution is 192
'
' CogStore Support:
'
COGSTORE_MAX   = 300            ' maximum size (LONGS) of CogStore
'
' CACHE support:
'
#ifdef CACHED
'
' Hub area for CACHED driver:
'
' with 8K CACHE : $5B8C
' with 4K CACHE : $6D8C
' with 2K CACHE : $738c
' with 1K CACHE : $778C
'
XMM_CACHE       = FLIST_PREG - 1<<CACHE_BYTES_LOG2  
'
' Other equates (with CACHED XMM driver):
'
RUNTIME_ALLOC   = XMM_CACHE   ' can allocate from here down at runtime
LOADTIME_ALLOC  = XMM_CACHE   ' can allocate from here down (loadtime)

#else

'
' Other equates (without CACHED XMM driver):
'
RUNTIME_ALLOC   = CGI_DATA    ' can allocate from here down at runtime
LOADTIME_ALLOC  = FLIST_PREG  ' can allocate from here down (loadtime)

#endif

'
' Kernel Constants. These values are used by the various targets
' and the POD debugger and disassembler as well as by the Kernel.
'
' NOTE : if the Kernel is changed, the values below must also
'        be changed or the debug targets will not work correctly. 
'
LMM_FIRST_REG_OFF = $2b                           
LMM_PC_OFF        = $2b
LMM_SP_OFF        = $2c
LMM_FP_OFF        = $2d
LMM_RI_OFF        = $2e
LMM_BC_OFF        = $2f
LMM_BA_OFF        = $30
LMM_BZ_OFF        = $31
LMM_CS_OFF        = $32
LMM_LAST_REG_OFF  = $4a
'
LMM_INIT_B0_OFF   = $51         ' must match init_B0 in Catalina_LMM.spin (and
                                ' variants), Catalina_XMM.spin, lmm_progbeg.s,
                                ' emm_progbeg.s, smm_progbeg.s, xmm_progbeg.s,
                                ' and LMM_INIT_B0_OFF in catbind.c
'
LMM_INIT_BZ_OFF   = $51 
LMM_INIT_PC_OFF   = $52
'
LMM_INIT_OFF      = $53
'
#ifdef SMALL
XMM_RD_OFF        = $6d         ' XMM_ReadReg
XMM_RD_RET_OFF    = $6f         ' XMM_ReadReg_ret
XMM_WR_OFF        = $70         ' XMM_WriteReg
XMM_WR_RET_OFF    = $72         ' XMM_WriteReg_ret
XMM_ADDR_OFF      = $73         ' XMM_Addr
LMM_1_OFF         = $79         ' for SMALL (XMM) Kernel
#elseifdef LARGE
XMM_RD_OFF        = $6d         ' XMM_ReadReg
XMM_RD_RET_OFF    = $6f         ' XMM_ReadReg_ret
XMM_WR_OFF        = $70         ' XMM_WriteReg
XMM_WR_RET_OFF    = $72         ' XMM_WriteReg_ret
XMM_ADDR_OFF      = $73         ' XMM_Addr
LMM_1_OFF         = $79         ' for SMALL (XMM) Kernel
#else
LMM_1_OFF         = $67         ' for TINY (LMM) Kernel
LMM_2_OFF         = $6a
LMM_3_OFF         = $6d
LMM_4_OFF         = $70
#endif
'
LMM_FIRST_OPCODE  = $02
LMM_INIT          = $02
LMM_LODL          = $03
LMM_LODI          = $04
LMM_LODF          = $05
LMM_PSHL          = $06
LMM_PSHB          = $07
LMM_CPYB          = $08
LMM_NEWF          = $09
LMM_RETF          = $0a
LMM_CALA          = $0b
LMM_RETN          = $0c
LMM_CALI          = $0d
LMM_JMPA          = $0e
LMM_JMPI          = $0f
LMM_DIVS          = $10
LMM_DIVU          = $11
LMM_MULT          = $12
LMM_BR_Z          = $13
LMM_BRNZ          = $14
LMM_BRAE          = $15
LMM_BR_A          = $16
LMM_BRBE          = $17
LMM_BR_B          = $18
LMM_SYSP          = $19
LMM_PSHA          = $1a
LMM_FADD          = $1b
LMM_FSUB          = $1c
LMM_FMUL          = $1d
LMM_FDIV          = $1e
LMM_FCMP          = $1f
LMM_FLIN          = $20
LMM_INFL          = $21
LMM_PSHM          = $22
LMM_POPM          = $23
LMM_PSHF          = $24
LMM_RLNG          = $25
LMM_RWRD          = $26
LMM_RBYT          = $27
LMM_WLNG          = $28
LMM_WWRD          = $29
LMM_WBYT          = $2a
LMM_LAST_OPCODE   = $2a
'
' CMM offsets are different to LMM offsets:
'
CMM_PC_OFF        = $18
'
CON
''==============================================================================
'' LAYER 1 METHODS
''==============================================================================

PUB InitializeRegistry | i
'
' this method should be called by the first Spin program executed,
' before it starts or initializes any of the plugins to be loaded.
'
' Note we use the value $FF in the upper byte to mean "unknown" or "none"
'
#ifdef CATALYST
  ' initalize the free memory pointer (for loadtime memory allocation)
  long[FREE_MEM] := LOADTIME_ALLOC
#else
  ' initalize the free memory pointer (for runtime memory allocation)
  long[FREE_MEM] := RUNTIME_ALLOC
#endif

  ' initialize the memory lock (i.e. no lock currently in use)
  long[MEM_LOCK] := -1

  ' initialize LAYER 1 registry (cog-oriented registry)
  repeat i from 0 to 7
    long[REGISTRY][i] := REQUESTS + (8*i) + $FF000000
    long[REQUESTS][2 * i] := 0
    long[REQUESTS][2 * i + 1] := 0

  ' initialize LAYER 3 registry (service-oriented registry)
  repeat i from 1 to SVC_MAX
     word[REGISTRY][-i] := $FF80

PUB Register (cog, plugin_type)
'
' this routine can be used by a plugin to register itself
' with the Catalina Kernel. Plugins must register themselves
' before the Kernel can invoke them or Catalina programs
' can use the functions they provide.
'
  long[REGISTRY][cog] := (plugin_type<<24) + (long[REGISTRY][cog] & $00FFFFFF)

PUB Unregister (cog)
'
' this method can be used by a plugin to unregister itself
' with the Catalina Kernel. Plugins must unregister themselves
' if they may later be stopped or restarted in a different cog.
' Note we use the value $FF in the upper byte to indicate
' "unknown" or "none"
'
  long[REGISTRY][cog] := (long[REGISTRY][cog] | $FF000000)

PUB Multiple_Register (cogbits, plugin_type) | i
'
' this routine can be used by a plugin to register multiple
' cogs, based on up to 8 bits set in the cogbits parameter
'
   repeat i from 0 to 7
     if cogbits & 1
        Register(i, plugin_type)
     cogbits >>= 1

PUB SendInitializationData(cog, data_1, data_2) : commsblk
'
' this routine can be called to send initialization data
' to a cog - note that once initialization is complete,
' SPIN methods such as this cannot be used - requests
' must be done in PASM. Also note that since most
' plugins trigger off the first long of the request,
' it is important to initialize that long second. 
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  long[commsblk][1] := data_2
  long[commsblk][0] := data_1

PUB SendInitializationDataAndWait(cog, data_1, data_2) : response | commsblk
'
' This routine is similar to SendInitializationData,
' except this routine waits for the initialization 
' to complete and then returns the result.
'
  commsblk := SendInitializationData(cog, data_1, data_2)
  repeat while long[commsblk][0] <> 0
  ' get the response of the request
  return long[commsblk][1]

CON
''==============================================================================
'' LAYER 2 METHODS
''
'' Note that some Layer 2 methods are not included by default - to include them,
'' define the symbol FULL_LAYER_2 on the command line
''==============================================================================
PUB WaitForCompletion(cog) : response | commsblk
'
' when the first long of the cog's comms block is zero,
' return the response from the second long
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  ' wait for a request to be processed
  repeat while long[commsblk][0] <> 0
  ' get the response of the request
  return long[commsblk][1]

#ifdef FULL_LAYER_3
' Layer 3 requires Layer 2
#ifndef FULL_LAYER_2
#define FULL_LAYER_2
#endif
#endif

#ifdef FULL_LAYER_2

PUB SetRequest(cog, request) | commsblk
'
' Set the first long in the cog's comms block to the specified request.
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  long[commsblk][0] := request

PUB GetRequest(cog) : request | commsblk
'
' Get the request from the first long in the cog's comms block
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  request := long[commsblk][0]

PUB SetResponse(cog, response) | commsblk
'
' Set the second long in the cog's comms block to the specified response.
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  long[commsblk][1] := response

PUB GetResponse(cog) : response | commsblk
'
' Get the second long in the cog's comms block.
'
  commsblk := long[REGISTRY][cog] & $00FFFFFF
  ' get the response of a previous request
  return long[commsblk][1]

PUB PerformRequest (cog, request) : response
'
' Set the request in the first long of the comms block of the cog,
' wait till it is acknowledged, then return the response (note that
' this method does not check that the previous request has completed)
' 
  SetRequest(cog, request)
  return WaitForCompletion(cog)

PUB LocatePlugin(plugin_type) : cog | i
'
' search the registry for the plugin type, returning the cog if found,
' or -1 if no such plugin type is found
'
  repeat i from 0 to 7
    if long[Registry][i] >> 24 == plugin_type
      return i
  return -1
  
PUB ShortPluginRequest(plugin_type, request_id, parameter) : response | cog, request
'
' this routine attempts to locate a plugin of the specified type, then
' sends a short command made up of the service and the parameter to it,
' then waits for the service to complete and returns the response. It
' returns -1 if it cannnot locate the plugin.
'
  cog := LocatePlugin(plugin_type)
  if (cog => 0)
    return PerformRequest(cog, (request_id << 24) | (parameter & $00FFFFFF))
  return -1

PUB LongPluginRequest(plugin_type, request_id, parameter) : response | cog, request
'
' this routine attempts to locate a plugin of the specified type, then
' sends a long command made up of the service and a pointer to the parameter to it,
' then waits for the service to complete and returns the response. It
' returns -1 if it cannnot locate the plugin.
'
  cog := LocatePlugin(plugin_type)
  if (cog => 0)
    return PerformRequest(cog, (request_id << 24) | @parameter)
  return -1

PUB LongPluginRequest_2(plugin_type, request_id, param_1, param_2) : response | cog, request
'
' this routine attempts to locate a plugin of the specified type, then
' sends a long command made up of the service and a pointer to the parameter to it,
' then waits for the service to complete and returns the response. It
' returns -1 if it cannnot locate the plugin.
'
  cog := LocatePlugin(plugin_type)
  if (cog => 0) 
    return PerformRequest(cog, (request_id << 24) | @param_1)
  return -1

#endif

CON  
''==============================================================================
'' LAYER 3 METHODS
''
'' Note that some Layer 3 methods are not included by default - to include them,
'' define the symbol FULL_LAYER_3 on the command line
''==============================================================================
PUB RegisterServiceCog(service_id, lock, cog, request_id)
'
' Use this function to register services if you know the cog
'
  if (service_id > 0) and (service_id =< SVC_MAX) 
    if (cog => 0) and (cog < 8)
      word[REGISTRY][-service_id] := ((cog&$F)<<12)|((lock&$1F)<<7)|(request_id&$7F)
      return cog
  return -1

#ifdef FULL_LAYER_3

PUB RegisterServiceType(service_id, lock, plugin_type, request_id) : cog
'
' Use this function to register services if you know the type but not the cog
'
  if (service_id > 0) and (service_id =< SVC_MAX) 
    cog := LocatePlugin(plugin_type)
    if (cog => 0) and (cog < 8)
      word[REGISTRY][-service_id] := ((cog&$F)<<12)|((lock&$1F)<<7)|(request_id&$7F)
      return cog
  return -1

PUB UnregisterService(service)
'
' Remove details of the service from the registry
'
  if (service > 0) and (service =< SVC_MAX)
    word[REGISTRY][-service] := $FF80

PUB ShortServiceRequest(service_id, parameter) : response | entry, lock, cog
'
' Request the specified service using a short request, passing the
' appropriate request code and the lower 24 bits of the parameter
' to the plugin currently servicing these requests. Return -1 on error.
' If the service requires the use of a lock, the lock is set prior to
' the service call, and cleared afterwards.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12 
    if (cog < 8)
      lock := (entry>>7) & $1F
      entry := entry & $7F
      if (lock < 8)
        repeat until not LOCKSET(lock)
        response := PerformRequest(cog, (entry<<24) | (parameter & $00FFFFFF))
        LOCKCLR(lock)
        return 
      else
        return PerformRequest(cog, (entry<<24) | (parameter & $00FFFFFF))
  return -1
  
PUB LongServiceRequest(service_id, parameter) : response | entry, lock, cog
'
' Request the specified service using a long request, passing the
' appropriate request code and a pointer to the parameter to the
' plugin currently servicing these requests. Return -1 on error.
' If the service requires the use of a lock, the lock is set prior to
' the service call, and cleared afterwards.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12 
    if (cog < 8)
      lock := (entry>>7) & $1F
      entry := entry & $7F
      if (lock < 8)
        repeat until not LOCKSET(lock)
        response := PerformRequest(cog, (entry<<24) | @parameter)
        LOCKCLR(lock)
        return 
      else
        return PerformRequest(cog, (entry<<24) | @parameter)
  return -1

PUB LongServiceRequest_2(service_id, param_1, param_2) : response | entry, lock, cog
'
' Request the specified service using a long request, passing the
' appropriate request code and a pointer to param_1 and param_2 to
' the plugin currently servicing these requests. Return -1 on error.
' If the service requires the use of a lock, the lock is set prior to
' the service call, and cleared afterwards.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12 
    if (cog < 8)
      lock := (entry>>7) & $1F
      entry := entry & $7F
      if (lock < 8)
        repeat until not LOCKSET(lock)
        response := PerformRequest(cog, (entry<<24) | @param_1)
        LOCKCLR(lock)
        return 
      else
        return PerformRequest(cog, (entry<<24) | @param_1)
  return -1

PUB ServiceLock(service_id) : lock
'
' Return the lock allocated to the service (or a value => 8 if
' no lock has been allocated). Return -1 on error.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    return (word[REGISTRY][-service_id]>>7)&$1F
  return -1

PUB NoLockShortServiceRequest(service_id, parameter) : response | entry, cog
'
' Request the specified service using a short request, passing the
' appropriate request code and the lower 24 bits of the parameter
' to the plugin currently servicing these requests. Return -1 on error.
' NOTE: No locking is performed, even if the service requires it - this
' must be done manually prior to the service request.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12
    if (cog < 8)
      return PerformRequest(cog, ((entry&$7F)<<24) | (parameter & $00FFFFFF))
  return -1

PUB NoLockLongServiceRequest(service_id, parameter) : response | entry, cog
'
' Request the specified service using a long request, passing the
' appropriate request code and a pointer to the parameter to the
' plugin currently servicing these requests. Return -1 on error.
' NOTE: No locking is performed, even if the service requires it - this
' must be done manually prior to the service request.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12 
    if (cog < 8)
      return PerformRequest(cog, ((entry&$7F)<<24) | @parameter)
  return -1

PUB NoLockLongServiceRequest_2(service_id, param_1, param_2) : response | entry, cog
'
' Request the specified service using a long request, passing the
' appropriate request code and a pointer to param_1 and param_2 to 
' the plugin currently servicing these requests. Return -1 on error.
' NOTE: No locking is performed, even if the service requires it - this
' must be done manually prior to the service request.
'
  if (service_id > 0) and (service_id =< SVC_MAX)
    entry := word[REGISTRY][-service_id] 
    cog := entry>>12 
    if (cog < 8)
      return PerformRequest(cog, ((entry&$7F)<<24) | @param_1)
  return -1

#endif

#ifdef FLASH_HEX

CON

  LED_MASK   = |< DEBUG_PIN

  BLIP_TIME  = 100
  DIGIT_TIME = 250
  HEX_TIME   = 1000

PUB LED_On 
   dira |= LED_MASK
#ifdef INVERT_DEBUG_LED
   outa &= !LED_MASK
#else
   outa |= LED_MASK
#endif

PUB LED_Off
   dira |= LED_MASK
#ifdef INVERT_DEBUG_LED
   outa |= LED_MASK
#else
   outa &= !LED_MASK
#endif

PUB Wait(ms)

   waitcnt(CLKFREQ/1000*ms + cnt)

PUB LED_Pulse(ms)

   Led_On
   Wait(ms)
   Led_Off

PUB LED_Count(count) | i

  if count == 0
     LED_Pulse(BLIP_TIME)
  else
     repeat i from 1 to count
        LED_Pulse(DIGIT_TIME)
        Wait(DIGIT_TIME)


PUB Flash_Hex (hex_value) | i

   i := 0
   
   repeat 
      hex_value <-= 4
      if (i < 7) and (hex_value & $F == 0)
         i++
      else
         quit

   repeat 
      LED_Count(hex_value & $F)
      Wait(HEX_TIME)
      hex_value <-= 4
      i++
   until i == 8

   Wait(HEX_TIME)

#endif
