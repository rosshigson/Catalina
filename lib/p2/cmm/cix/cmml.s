'#line 1 "../../../target/p2/cmmlib.t"
'
' This file exists to allow the CMM LUT library code to be compiled and
' then turned into a blob suitable for loading as part of dynamically
' loading a program. This is required because with Multi-Model support,
' the kernel being loaded may require a different LUT library to the
' kernel doing the loading.
'
' Compile this library and convert it to a blob using commands similar
' to the following:
'
'    p2_asm -I ..\..\target\p2 ..\..\target\p2\cmmlib.t -o cmm
'    spinc -p2 -B2 -n CMM_LUT_LIBRARY cmm.bin >CMM_library.inc
'
' The resulting binary is not a true Catalina 1 binary - it is intended
' only to allow the LUT library to be extracted using the spinc command.
'

CON

'#line 1 "../../../target/p2/reserve.inc"
'------------------------- START OF RESERVED HUB ------------------------------

' this definition of the reserved Hub locations is for inclusion in cases
' where the values are defined during normal program compilation.
' Otherwise it should be identical to "reserven.inc"

DAT
         orgh  $1000

RESERVED jmp  #\NON_RESERVED  ' $1000 Lower 20 bits = addr of non-reserved hub
CLKFREQ  long _CLOCKFREQ      ' $1004 initial clock frequency (not updated)
CLKMODE  long _CLOCKMODE      ' $1008 initial clock mode (not updated)
BAUDRATE long _BAUDRATE       ' $100c initial baud rate (not updated)

' seglayout specifies the layout of the segments

seglayout                     ' $1010 - if this changes, change catbind.c
        long  SEGMENT_LAYOUT

' segtable contains the start address of each of the segments

segtable
        long  @Catalina_Code
        long  @Catalina_Cnst
        long  @Catalina_Init
        long  @Catalina_Data
        long  @Catalina_Ends
        long  @Catalina_RO_Base
        long  @Catalina_RW_Base
        long  @Catalina_RO_Ends
        long  @Catalina_RW_Ends
init_PC long  @C_main                    ' should be filled in with @C_main





NON_RESERVED

'--------------------------- END OF RESERVED HUB ------------------------------
'#line 21 "../../../target/p2/cmmlib.t"

CON

SEGMENT_LAYOUT=8 ' CMM memory layout 8 (Code, Cnst, Init, Data)

DAT

' Common Kernel library functions. This code is loaded and started by all
' kernels (static and dynamic) and must fit in the area $300 - $3FF ...

 orgf $300

Catalina_RO_Base
Catalina_Code

LUT_LIBRARY

' include any necessary kernel library functions. This code is loaded and
' executed from the LUT RAM ...

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



'#line 42 "../../../target/p2/cmmlib.t"

'#line 1 "../../../target/p2/cmmklib.inc"
' Catalina kernel functions that are specific to the CMM kernels ...

' avoid including the kernel library functions twice ...




DAT




























































































'#line 44 "../../../target/p2/cmmlib.t"





LUT_LIBRARY_END

 fit $400

Catalina_Cnst
Catalina_RO_Ends
Catalina_RW_Base
Catalina_Init
Catalina_Data
Catalina_RW_Ends
Catalina_Ends
C_main

' Include the appropriate CMM Kernel (to define offsets etc) ...




'#line 1 "../../../target/p2/cmmd.t"
{{
'------------------------------------------------------------------------------
' Catalina_CMM_dynamic - Implements a dynamically loadable Compact Memory
'                Model Kernel intended for use by the Catalina Code Generator
'                backend for LCC.
'
' Version 3.8 - initial version - by Ross Higson
' Version 3.13 - combine floating point operations, and add relative jumps
' Version 3.15 - Modified for 1 .
'
'------------------------------------------------------------------------------
'
'    Copyright 2012 Ross Higson
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


'--------------------- Start of CMM Kernel ------------------------------------

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

_VGA_BASE_PIN = 0

' USB constants
' =============

_USB_BASE_PIN = 8

' Hyper Flash / Hyper RAM constants
' =================================

' Base pin and reset pin mask
HYPER_BASE_PIN   = 16 ' If you change this, it may be required to change these:
HYPER_RST_A_MASK = 1<<(HYPER_BASE_PIN+15)           ' if HYPER_BASE_PIN < 32
HYPER_RST_B_MASK = 0' 1 <<(HYPER_BASE_PIN+15-32)    ' if HYPER_BASE_PIN >= 32

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
PSRAM_DELAY = 8

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



'#line 40 "../../../target/p2/cmmd.t"

' The symbol FCACHE_PRIMITIVE adds code to implement FCACHE - this can be done
' outside the kernel, but including it in the kenel is more efficient - but it
' adds 9 longs to the kernel:



' The symbol UNROLL_LMM_LOOP does just what it says - but it adds extra
' longs to the CMM kernel. The default is to unroll 2 times if this is not
' defined, or to unroll 4 times if it is defined :

'#define UNROLL_LMM_LOOP

' The symbol EXTERNAL_FLT_CMP forces the flt_cmp operation to the external
' FLOAT32_A plugin. This is because the CMM kernel is slightly too large to
' fit it in (until we manage to save 5 or so longs):



' The symbol BLACKBOX updates the PC_OFFS on each instruction (whereas the PC
' is only updated after reading each long). This is required for the BlackBox
' debugger. Normally, this symbol is defined automatically when programs are
' compiled with -g, so this symbol should not be defined manually:

'#define BLACKBOX

' instruction operand shifts

' NOTE: these must match compact.inc ...
S16A = 1  ' must match compact.inc
D16A = 6  ' must match compact.inc
S16B = 2  ' must match compact.inc
D16B = 2  ' must match compact.inc
S32  = 2  ' must match compact.inc
D32  = 11 ' must match compact.inc
D32S = 21 ' must match compact.inc

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not
'                 be used in an interrupt service routine. Can be defined here
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif

'--------------------- Start of CMM Kernel ------------------------------------

' the first $52 longs must be in the same place in all CMM kernels, to
' allow for the separate compilation of code that uses these locations

DAT
         org     0
KERNEL_START

r0       jmp     #cmm_init      '$00
r1       long    0              '$01
r2       long    0              '$02
r3       long    0              '$03
r4       long    0              '$04
r5       long    0              '$05
r6       long    0              '$06
r7       long    0              '$07
r8       long    0              '$08
r9       long    0              '$09
r10      long    0              '$0a
r11      long    0              '$0b
r12      long    0              '$0c
r13      long    0              '$0d
r14      long    0              '$0e
r15      long    0              '$0f
r16      long    0              '$10
r17      long    0              '$11
r18      long    0              '$12
r19      long    0              '$13
r20      long    0              '$14
r21      long    0              '$15
r22      long    0              '$16
r23      long    0              '$17

PC       long    0              '$18 ' set up during initialization
SP       long    0              '$19 ' set up during initialization
FP       long    0              '$1a
RI       long    0              '$1b
BC       long    0              '$1c
Save_PC  long    0              '$1d

DBG1     long    0              '$1e ' Debugger opAddr
DBG2     long    0              '$1f ' Debugger temp

low8     long   $0000_00FF      '$20
low16    long   $0000_FFFF      '$21
top8     long   $FF00_0000      '$22
low18    long   $0003_FFFF      '$23
sd_mask  long   %000000_0000_0000_000011111_000011111 '$24
INST_OFF                        ' must match INST_OFF in compact.inc
inst     long   $0000_0000      '$25
dlsb     long   1<<9            '$26

t1       long   $0000_0000      '$27
t2       long   $0000_0000      '$28
t3       long   $0000_0000      '$29
t4       long   $0000_0000      '$2a

t5       long   $0000_0000      '$2b
t6       long   $0000_0000      '$2c

xfer     long   $0000_0000      '$2d set up during initialization

ct1     long  0                 '$2e
ct2     long  0                 '$2f
ct3     long  0                 '$30

table_16a
X16A_NOP     nop                '$31
X16A_MOV     mov    0,0         '$32
X16A_RDBYTE  rdbyte 0,0         '$33
X16A_RDWORD  rdword 0,0         '$34
X16A_RDLONG  rdlong 0,0         '$35
X16A_WRBYTE  wrbyte 0,0         '$36
X16A_WRWORD  wrword 0,0         '$37
X16A_WRLONG  wrlong 0,0         '$38
X16A_ADD     add    0,0         '$39
X16A_ADDS    adds   0,0         '$3a
X16A_AND     and    0,0         '$3b
X16A_OR      or     0,0         '$3c
X16A_XOR     xor    0,0         '$3d
X16A_SUB     sub    0,0         '$3e
X16A_SUBS    subs   0,0         '$3f
X16A_CMP     cmp    0,0 wcz     '$40
X16A_CMPS    cmps   0,0 wcz     '$41
X16A_NEG     neg    0,0         '$42
X16A_SHL     shl    0,0         '$43
X16A_SHR     shr    0,0         '$44
X16A_SAR     sar    0,0         '$45
X16A_SHLI    shl    0,#0        '$46
X16A_SHRI    shr    0,#0        '$47
X16A_SARI    sar    0,#0        '$48
X16A_ADDI    add    0,#0        '$49
X16A_SUBI    sub    0,#0        '$4a
X16A_MOVI    mov    0,#0        '$4b
X16A_ADDSI   adds   0,#0        '$4c
X16A_SUBSI   subs   0,#0        '$4d
X16A_CMPI    cmp    0,#0 wcz    '$4e
X16A_CMPSI   cmps   0,#0 wcz    '$4f
X16A_NEGI    neg    0,#0        '$50

immi_bit long   %0000_0000000_001_000000000_000000000 '$51
bit31    long   $8000_0000      '$52
all_1s   long   $FFFF_FFFF      '$53

         long   0               '$54 spare, but kept to keep offsets correct
reg      long   0               '$55 registry address

X16B_BRKP                       ' execute break (when debug overlay loaded)
FC_START                        ' must match FC_START in compact.inc

' cmm_init : initialize VM - note that this code may be overlaid by
'            debug code or FCACHE code once initialization is complete.
'            It must be kept the same length as the main kernel.

DEBUG_OVERLAY
cmm_init
        rdlong  reg,PTRA++      '$56  1 load registry address (used later)
        cogid   r2              '$57  2 register ...
        shl     r2,#2           '$58  3 ... ourselves ...
        add     r2,reg          '$59  4 ... as ...
        rdlong  r1,r2           '$5a  5 ... a ...
        andn    r1,top8         '$5b  6 ... new ...
        wrlong  r1,r2           '$5c  7  kernel
        rdlong  PC,PTRA++       '$5d  8 load initial PC
        rdlong  SP,PTRA++       '$5e  9 load initial SP
        rdlong  r0,PTRA++       '$5f 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$60 11 load initial LUT library address
        rdlong  r2,PTRA++       '$61 12 load initial arg
        setq2   r0              '$62 13 copy lut library ...
        rdlong  $100,r1         '$63 14 ... to LUT RAM, starting at $100
        sub     SP,#8           '$64 15 reserve space ...
        mov     xfer,SP         '$65 16 ... for xfer block at top of stack
        jmp     #read_next      '$66 17 we can now start executing CMM code
        nop                     '$67 18
        nop                     '$68 19
        nop                     '$69 20
        nop                     '$6a 21
        nop                     '$6b 22
        nop                     '$6c 23
        nop                     '$6d 24
        nop                     '$6e 25





























' when NOT debugging, we don't need to keep track of offset from current PC

pasm_16
         long   0-0             '$6f execute generated instruction
done_16
         shr    inst,#16        '$70 decode ...
         tjnz   inst,#decode    '$71 ... another instruction ?
FC_INLINE                       ' must match FC_INLINE in compact.inc
done_32
         allowi                 '$72
         add    PC,#4           '$73 no - increment PC

EXEC_STOP                       ' must match EXEC_STOP in compact.inc
read_next
         stalli                 '$74
         rdlong inst,PC         '$75 fall through to ...
decode
         mov    t1,inst         '$76 test ...



         and    t1,#1           ' ... instruction ...
         tjz    t1,#decode_16a  ' ... type ...
         mov    t1,inst         ' ... to ...
         and    t1,#2           ' ... determine ...
         tjz    t1,#decode_16b  ' ... how to decode
decode_32
         mov    t1,inst         ' extract ...
         shr    t1,#26          ' ... 6 bit opcode
         add    t1,#table_32
         mov    t2,inst         ' extract ...
         shr    t2,#S32         ' ... 24 bits ...
         andn   t2,top8         ' ... of src (or src & dst)
         jmp    t1
table_32
         jmp    #X32_JMPA
         jmp    #X32_CALA
         jmp    #X32_LODI
         jmp    #X32_PSHA
         jmp    #X32_PSHF
         jmp    #X32_PSHM
         jmp    #X32_BR_Z
         jmp    #X32_BRNZ
         jmp    #X32_BRAE
         jmp    #X32_BR_A
         jmp    #X32_BRBE
         jmp    #X32_BR_B
         jmp    #X32_PSHB
         jmp    #X32_CPYB
         jmp    #X32_LODA
         jmp    #X32_NEWF
         jmp    #X32_RETF
         jmp    #X32_LODF
         jmp    #X32_MOV
         jmp    #X32_MOVI
         jmp    #X32_SPILL
         jmp    #X32_CPREP
         jmp    #X32_LODS

pasm_32  long   %1111_0000000_000_000000000_000000000
         jmp    #done_32


' decode 16 bit instruction (set a)

decode_16a
         mov    t2,inst         ' from instruction ....
         shr    t2,#S16A        ' ... extract ...
         sets   pasm_16,t2      ' ... src
         shr    t2,#D16A-S16A   ' ... and ...
         setd   pasm_16,t2      ' ... dst
         shr    t2,#11-D16A     ' extract 5 bits ...
         and    t2,#$1F         ' ... of op code
         add    t2,#table_16a   ' calculate addr of instruction template
         sets   set_inst,t2     ' put addr in setup instruction
         and    pasm_16,sd_mask ' mask src & dst to 5 bits each
	 nop                    ' 1 requires this!!!
set_inst or     pasm_16,0-0     ' put instruction in place
         jmp    #pasm_16        ' execute instruction


' decode 16 bit instructions (set b)

decode_16b
         mov    t1,inst         ' extract ...
         shr    t1,#11          ' ... 5 bits ...
         and    t1,#$1f         ' ... of op code
         add    t1,#table_16b   ' calculate jump
         jmp    t1              ' execute primitive
table_16b
         jmp    #X16B_LODF      '
         jmp    #X16B_RETF      '
         jmp    #X16B_RETN      '
         jmp    #X16B_POPM      '
         jmp    #X16B_JMPI      '
         jmp    #X16B_CALI      '
         jmp    #X16B_PSHL      '
         jmp    #X16B_DIVS      '
         jmp    #X16B_DIVU      '
         jmp    #X16B_MULT      '
         jmp    #X16B_FLTP      ' was #X16B_FADD      '
         jmp    #X16B_RJ_Z      ' was #X16B_FSUB      '
         jmp    #X16B_RJNZ      ' was #X16B_FMUL      '
         jmp    #X16B_RJAE      ' was #X16B_FDIV      '
         jmp    #X16B_RJ_A      ' was #X16B_FCMP      '
         jmp    #X16B_RJBE      ' was #X16B_FLIN      '
         jmp    #X16B_RJ_B      ' was #X16B_INFL      '
         jmp    #X16B_SYSP      '
         jmp    #X16B_EXEC      '
         jmp    #X16B_SIGN      '
         jmp    #X16B_CPL       '
         jmp    #X16B_TRN1      '
         jmp    #X16B_TRN2      '
         jmp    #X16B_LODL      '
         jmp    #X16B_BRKP      '
         jmp    #X16B_FCACHE    '
         jmp    #X16B_PASM      '
         jmp    #X16B_CPREP     '
         jmp    #X16B_JMPR      '

X16B_POPM
         rdlong RI,SP           ' load ...
         add    SP,#4           ' ... register specification to pop
         mov    t2, #r23        ' start with ...
         shl    RI,#(32-24)     ' ... r23
pop_nxt
         shl    RI,#1 wcz       ' load rX?
   if_c  altd   t2              ' if so ...
   if_c  rdlong 0-0,SP          ' ... load ...
   if_c  add    SP,#4           ' ... the register
   if_z  jmp   #pop_done
         sub    t2,#1           ' point to previous register
         jmp    #pop_nxt        ' continue till all registers popped
pop_done mov    t2,inst         ' extract ...
         and    t2,#$1FC wz     ' ... frame size (7 bits, multiple of 4)
         test   inst,frm_bit wz ' pop frame ?
   if_z  jmp    #X32_RETF       ' yes - pop frame (and execute implied return)
         test   inst,ret_bit wz ' no - return ?
   if_z  jmp    #X16B_RETN      ' yes
         jmp    #done_16        ' no - just carry on executing instructions

frm_bit  long   1<<(7+S16B)     ' bit to test for frame pop (pop if zero)
ret_bit  long   1<<(8+S16B)     ' bit to test for return (return if zero)

X16B_PSHL
         sub    SP,#4           ' decrement SP
         wrlong RI,SP           ' save value on stack
         jmp    #done_16
X16B_JMPI
         mov    PC,RI
         jmp    #read_next

'X16B_DIVS - Signed 32 bit division
'        Divisor  : r1
'        Dividend : r0
'        Result   :
'           Quotient in r0
'           Remainder in r1

X16B_DIVS
         call   #\signed_d32     ' performs signed division
         jmp    #done_16

'X16B_DIVU - unsigned 32 bit division
'        Divisor  : r1
'        Dividend : r0
'        Result   :
'           Quotient in r0
'           Remainder in r1

X16B_DIVU
        call    #\unsigned_d32   ' perform unsigned division
        jmp     #done_16

' X16B_MULT - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result :
'           Product in r0 (<= 32 bit)

X16B_MULT
         qmul   r0,r1
         getqx  r0
         jmp    #done_16

' X16B_SYSP - call a plugin
' On entry:
'        R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'        R2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'        R0 = result
'
X16B_SYSP
         call    #\do_plugin    ' do_plugin does all the work
         jmp     #done_16

'
' X16B_PASM - Execute one long (starting at next long boundary) as an instruction.
'
X16B_PASM
         andn   PC,#3           ' align PC to long
         add    PC,#4           ' point to next long
         rdlong exec1a,PC       ' fetch the instruction
         add    PC,#4           ' point to next long
	 nop                    ' 1 requires this!!!
exec1a   long   0-0
         jmp    #\EXEC_STOP      ' done
'
' X16B_EXEC - Execute multiple longs (starting at next long boundary) as instructions.
'            To exit, execute the instruction "jmp #EXEC_STOP"
X16B_EXEC
         andn   PC,#3           ' align PC to long
         add    PC,#4           ' point to next long
exec_loop
         rdlong exec1b,PC
         add    PC,#4           ' point to next long
	 nop                    ' 1 requires this!!!
exec1b   long   0-0














         jmp    #exec_loop

'
'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
'
'------------------------------------------------------------------------------
' X16B_FLTP - invoke the floating point plugin
'
' input:   t1          service to request
'          r0          32-bit floating point value
'          r1          32-bit floating point value
' output:  r0          32-bit floating point result
'------------------------------------------------------------------------------
'
X16B_FLTP
         mov     t5,r2          ' save r2
         mov     t6,r3          ' save r3
         mov     r3,inst        ' get floating point ...
         shr     r3,#S16B       ' ... operation ...
         and     r3,#$1f        ' ... code




         neg     r3,r3          ' negate it (to call a service)

         mov     r2,xfer        ' r2 = data is address of xfer block
         mov     t1,xfer        ' write ...
         wrlong  r0,t1          ' ... first argument to xfer block
         add     t1,#4          ' write ...
         wrlong  r1,t1          ' ... second argument to xfer block
         call    #\do_plugin    ' request the service
         mov     r2,t5          ' restore r2
         mov     r3,t6          ' restore r3
         cmps    r0,#0 wcz      ' set C & Z flags according to result
         jmp     #done_16

'






















'
' X32_CPYB - copy a structure (size in bytes at the PC)
'           from the address in R1 to the address in R0
'
X32_CPYB
         mov    t1,r1           ' source is in r1
         mov    t4,r0           ' destination is in r0
                                ' fall through to ...
copy_bytes
         tjz    t2,#done_32     ' no more to copy
         rdbyte t3,t1           ' read from src to t3
         wrbyte t3,t4           ' write t3 to dst
         add    t1,#1           ' increment source
         add    t4,#1           ' increment destination
         sub    t2,#1           ' decrement count ...
         jmp    #copy_bytes     ' ... and keep copying
'
X16B_LODL
         add    PC,#4           ' point to next long
         rdlong RI,PC           ' read the long
         andn   PC,#3           ' align PC to long boundary
         mov    pasm_16,X16A_MOV ' set up 'mov' instruction
         mov    t3,#RI          ' set up src
X16B_set_src_dst
         mov    t2,inst         ' set up ...
         shr    t2,#D16B        ' ...
'         and    t2,#$1FF        ' ...
         setd   pasm_16,t2      ' ... dst ...
         sets   pasm_16,t3      ' and src
         jmp    #pasm_16
X16B_TRN1
         mov    t3,#low8
         jmp    #X16B_set_and
X16B_TRN2
         mov    t3,#low16
X16B_set_and
         mov    pasm_16,X16A_AND ' set up 'and' instruction
         jmp    #X16B_set_src_dst
X16B_SIGN
         mov    t3,#bit31
         jmp    #X16B_set_xor
X16B_CPL
         mov    t3,#all_1s
X16B_set_xor
         mov    pasm_16,X16A_XOR ' set up 'xor' instruction
         jmp    #X16B_set_src_dst
'
X16B_LODF
         mov    t2,inst         ' 9 bit src
         shl    t2,#(32-S16B-9) ' sign ...
         sar    t2,#(32-9)      ' ... extend
         mov    RI,FP
         adds   RI,t2
         jmp    #done_16
'
X16B_FCACHE

         mov    t2,inst         ' set up ...
         shr    t2,#S16B        ' ... instruction count ...
         and    t2,#$1FF        ' ... in t2
         setd   finst,#FC_START ' start at FCACHE cog addr
	 nop                    ' 1 requires this!!!
floop
         add    PC,#4           ' point to next long
finst
         rdlong 0-0,PC          ' load inst to FCACHE
         add    finst,dlsb      ' next cog addr
         djnz   t2,#floop       ' continue until all inst loaded
         jmp    #FC_START       ' start execution of FCACHE

'
X16B_CPREP
         mov    BC,inst         ' put ...
         shr    BC,#4-(S16B-2)  ' ... upper 5 bits of src ...
         and    BC,#$7C         ' ... (multiplied by 4) into BC
         mov    t2,inst         ' subtract lower 4 bits of src ...
'         shr    t2,#S16B-2     ' ... (eliminating shift - not required!) ...
         and    t2,#$3C         ' ... (mutltiplied by 4) ...
         sub    SP,t2           ' ... from SP
         jmp    #done_16

X16B_CALI
         mov    t2,RI           ' fall through to ...
X32_CALA
         add    PC,#4           ' increment PC (this is return address)
         sub    SP,#8           ' save ...
         wrlong PC,SP           ' ... PC
                                ' fall through to ...
X32_JMPA
         mov    PC,t2
         jmp    #read_next
X32_LODI
         rdlong RI,t2
         jmp    #done_32
X32_PSHF
         shl    t2,#8           ' sign ...
         sar    t2,#8           ' ... extend
         adds   t2,FP
                                ' fall through to ...
X32_PSHA
         rdlong RI,t2
         sub    SP,#4
         wrlong RI,SP
         jmp    #done_32
X32_PSHM
         mov    t1,t2           ' save register specification for later
         mov    t3, #r6         ' start with ...
         shr    t2,#6           ' ... r6 ...

         test   t2,#$1FF wz     ' ... or ...
  if_z   shr    t2,#9           ' ... with ...
  if_z   mov    t3,#r15         ' ... r15 if r6 - r15 not used

push_nxt
         shr    t2,#1 wcz       ' save rX?
   if_c  sub    SP,#4           ' yes - save ...
   if_c  altd   t3
   if_c  wrlong 0-0,SP          ' ... register
         add    t3,#1           ' point to next register
   if_nz jmp    #push_nxt       ' continue till all registers checked
         sub    SP,#4           ' save ...
         wrlong t1,SP           ' .... register specification
         jmp    #done_32
'
X32_BRNZ
   if_nz jmp    #X32_JMPA
         jmp    #done_32
X32_BR_Z
   if_z  jmp    #X32_JMPA
         jmp    #done_32
X32_BRAE
   if_ae jmp    #X32_JMPA
X32_BR_A
   if_a  jmp    #X32_JMPA
         jmp    #done_32
X32_BRBE
   if_be jmp    #X32_JMPA
X32_BR_B
   if_b  jmp    #X32_JMPA
         jmp    #done_32
'
X16B_RJNZ
   if_nz jmp    #X16B_JMPR
         jmp    #done_16
X16B_RJ_Z
   if_z  jmp    #X16B_JMPR
         jmp    #done_16
X16B_RJAE
   if_ae jmp    #X16B_JMPR
X16B_RJ_A
   if_a  jmp    #X16B_JMPR
         jmp    #done_16
X16B_RJBE
   if_be jmp    #X16B_JMPR
X16B_RJ_B
   if_ae jmp    #done_16
X16B_JMPR
         shl    inst,#(32-S16B-9) ' sign ...
         sar    inst,#(32-9)      ' ... extend
         add    PC,inst         ' add relative jump to PC
         jmp    #read_next
'
' X32_PSHB - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP
'
X32_PSHB
         mov    t3,t2           ' round up the count ...
         add    t3,#3           ' ... to be ...
         andn   t3,#3           ' ... a multiple of 4
         sub    SP,t3           ' decrement SP by rounded up size
         mov    t1,r0           ' source is in r0
         mov    t4,SP           ' destination is SP
         jmp    #copy_bytes     ' do the copy
'
X32_MOV
         andn   pasm_32,immi_bit ' clear immediate bit
         jmp    #X32_MOVx
X32_MOVI
         or     pasm_32,immi_bit ' set immediate bit
X32_MOVx
         setr   pasm_32,#%0110000_00 ' mov
X32_SD
         andn   pasm_32,low18   ' clear out old src & dst
         or     pasm_32,t2      ' include 9 bits src and 9 bits dst
         jmp    #pasm_32
X32_SPILL
         sub    BC,#4
         cmp    BC,RI wcz
   if_b  jmp    #done_32
         andn   pasm_32,immi_bit ' clear immediate bit
         or     t2,#BC          ' set src to BC (dst is ok, src should be zero)
         setr   pasm_32,#%1100011_00 ' wrlong
         jmp    #X32_SD
X32_CPREP
         mov    BC,t2           ' put upper 9 bits of src (i.e. dst)
         shr    BC,#9           ' ... in BC
         and    t2,#$1FF        ' subtract lower 9 bits of src ...
         jmp    #X32_SUBSP      ' ... from SP
X32_LODA
         mov    RI,t2
         jmp    #done_32
X32_LODS
         mov    t1,t2           ' set ...
         shr    t1,#19          ' ... dst register ...
         setd   X32_LODd,t1     ' ... in move instruction
         shl    t2,#13          ' extract ...
         sar    t2,#13          ' src (sign extended immediate)
X32_LODd mov    0-0,t2          ' mov src to dst
         jmp    #done_32
X32_NEWF
         sub    SP,#4           ' decrement the stack pointer
         wrlong FP,SP           ' save FP to stack
         mov    FP,SP           ' set up new FP
         add    BC,#8           ' calculate what SP was ...
         add    BC,FP           ' ... before arguments were pushed
X32_SUBSP
         sub    SP,#4           ' allow for alloca
         wrlong Bit31,SP        ' initialize pre-alloca SP (to a known value)
         sub    SP,t2           ' allocate frame
         jmp    #done_32
X16B_RETF
         mov    t2,inst         ' extract 9 bit ...
         shr    t2,#S16B        ' ...
         and    t2,#$1FF        ' ... src, and fall through to X32_RETF
X32_RETF
         add    SP,t2           ' deallocate frame
         add    SP,#4           ' allow for alloca
         rdlong FP,SP           ' restore previous FP
         add    SP,#4           ' increment the SP
FC_RETURN                       ' must match FC_RETURN in compact.inc
X16B_RETN
         rdlong PC,SP           ' read the PC
         add    SP,#8           ' increment the SP
         jmp    #read_next
X32_LODF
         shl    t2,#8           ' sign ...
         sar    t2,#8           ' ... extend
         mov    RI,FP
         adds   RI,t2
         jmp    #done_32

' initcog (cannot be executed using CMM because rdlongs interrupt the setq)
'    r4 points to data block (REGISTRY, PC, SP)
'    r0 contains cog id (or ANY_COG)
'    r3 contains pointer to code to load into cog

' initcog & lockbits must be in the same place in all CMM kernels

         fit    $1e8
         orgf   $1e8

initcog
         setq r4                ' this will end up in PTRA of new cog
  _ret_  coginit r0,r3 wc

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








































































































































































































'#line 849 "../../../target/p2/cmmd.t"

'#line 1 "../../../target/p2/cmmklib.inc"
' Catalina kernel functions that are specific to the CMM kernels ...

' avoid including the kernel library functions twice ...

































































































'#line 851 "../../../target/p2/cmmd.t"


'#line 68 "../../../target/p2/cmmlib.t"

CON


