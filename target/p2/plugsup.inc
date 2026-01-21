{{
'-------------------------------------------------------------------------------
'
' plugsup.inc -  include the plugin support code.
'                The actual plugin code is included by 'plugins.inc'
'
' Version 7.1  - Initial version
'                 
' Version 8.7  - Support read-only LUT (LARGE mode only)
'-------------------------------------------------------------------------------
'
'    Copyright 2011 Ross Higson
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

' All plugin selection logic and constants should go here ...

CON

' INITIALIZATION_DELAY must be long enough for all plugins to initialize 
' themselves - this value is currently set by trial and error, but should
' include a large margin in case we change some plugin code and forget to
' change it here - this can lead to some very confusing behaviour!

INITIALIZATION_DELAY = _CLOCKFREQ/1000

' plugin protection logic ...

#if defined(libthreads)
#if !defined (PROTECT_PLUGINS)
#define PROTECT_PLUGINS
#endif
#endif

' Floating point plugin selection logic ...

#if !(defined(NO_FLOAT) || defined(NO_FP))

#if defined(libma) || defined(libmb)
#if !(defined(NEED_FLOAT_A))
#define NEED_FLOAT_A
#endif
#endif

#if defined(libmb)
#if !defined(NEED_FLOAT_B)
#define NEED_FLOAT_B
#endif
#endif

#if defined(libmc) 
#if !defined(NEED_FLOAT_C)
#define NEED_FLOAT_C
#endif
#endif

#if defined(COMPACT) || defined(libthreads) || defined(SMALL) || defined(LARGE)
#if !(defined(NEED_FLOAT_C) || defined(NEED_FLOAT_A))
#define NEED_FLOAT_C
#endif
#endif

#if defined(FLOAT_PINS) && !defined(NEED_FLOAT_C)
#error FLOAT_PINS IS NOT SUPPORTED BY libma OR libmb
#endif

#endif

' SD Card selection logic ...

#if defined(libcx) || defined (libcix)
#if !defined(SD)
#define SD
#endif
#endif

DAT

' Registry initialization code ...

INITIALIZE_REGISTRY

' initialize registry entries, but don't overwrite the type of THIS cog, 
' which must be set up by the kernel executing this code.

 mov r1, #0
 mov r2, ##REQUESTS
 mov r6, ##REGISTRY
 cogid r3
.init_reg1
 mov r0, r2
 cmp r1, r3 wz
 if_nz or r0, ##$FF000000
 wrlong r0, r6
 add r6, #4
 add r2, #8
 add r1, #1
 cmp r1, #MAX_COGS wz
 if_nz jmp #.init_reg1

' initialize service entries 

 mov r6, ##REGISTRY
 mov r1, #SVC_MAX
 mov r0, ##$FF80
.init_reg2
 sub r6, #2
 wrword r0, r6
 djnz r1, #.init_reg2

' initialize cogstore and argc/argv entries 

 wrlong #0, ##COGSTORE
 wrlong #0, ##ARGC_ADDR
 mov r6, ##ARGV_0
 wrlong r6, ##ARGV_ADDR
 mov r1, #ARGV_MAX
.init_reg3
 wrlong #0, r6
 add r6, #4
 djnz r1, #.init_reg3
 ret


' terminate any plugins 
' (up to and including LAST_COG, but not ourselves)

TERMINATE_PLUGINS
         cogid   r1                       ' get our own cog id
         mov     r0, #0                   ' starting at cog 0 ...
.stop_another
         cmp     r0, r1 wz                ' ... but not ourselves ...
 if_nz   cogstop r0                       ' stop all cogs ...
.dont_stop                                
         add r0, #1
         cmp r0, #LAST_COG wcz
 if_be   jmp #.stop_another               ' ... up to and including LAST_COG
         ret

' All plugin initialization code should go in here ...

' NOTE: It may seem unnecessary to send the plugins the address of the
'       registry, or to allocate their required data blocks here, since 
'       they are compiled in the same source file and could currently 
'       get/do this for themselves ... but in future we may want to have
'       a library of dynamically loadable plugins, so plugins should not
'       assume anything about the size or layout of hub RAM. They should
'       also not assume their image will remain available after they are
'       loaded.

INITIALIZE_PLUGINS

' mov dira, #0                   ' !!!TBD!!! Is this really necessary?
' mov dirb, #0                   ' !!!TBD!!! Is this really necessary?

#if defined(INITIALIZE_SMARTPINS)
' reset all smartpins to mode 0
 mov   r0,#63                    ' span 64 pins 0 .. 63
 shl   r0,#5
 dirl  r0                        ' Set DIR  of pins 0 .. 63 to 0
 wrpin r0,#0                     ' Set MODE of pins 0 .. 63 to 0
#endif

' cache must be the FIRST plugin loaded, since it may need to share a
' cog with the XMM kernel (LUT_CACHE is specified, or NO_LUT is not specified)
#if defined(CACHED)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##CACHE_BLOCK_SIZE ' allocate a CACHE initialization block
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 call    #CACHE_Setup           ' set up CACHE control block
#if !defined(NO_LUT) || defined(LUT_CACHE)
 cogid   r1                     ' get our cog id (assuming we are the kernel)
 xor     r1,#1                  ' calculate other cog in pair (when LUT sharing)
#else
 mov     r1, #CACHE_COG         ' start ...
#endif
 setq    r0                     ' ...
 coginit r1, ##@CACHE_driver_start wc ' ... CACHE plugin
.cache_wait                     ' wait ...
 rdlong  r2,##XMM_CACHE_CMD wz  ' ... till ...
 if_nz jmp #.cache_wait         ' ... plugin starts
 shl     r1,#2                  ' point to ...
 add     r1,##REGISTRY          ' ... cache registry entry
 rdlong  r0,r1                  ' register ...
 and     r0,##$FFFFFF           ' ... the ...
 or      r0,##LMM_XCH<<24       ' ... cache ...
 wrlong  r0,r1                  ' plugin
 mov     r1,##CACHE_LINE_MASK   ' save cache line mask ...
 wrlong  r1,r0                  ' ... in request block (reqd by dynamic kernel)
#endif

#if !defined(NO_HMI)
 call    #HMI_Setup
#endif

#if defined(NEED_FLOAT_A)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_A_START wc ' ... Float_A plugin
 mov     r0, ##@Float_A_Service_Table
 call    #Register_Services
#endif

#if defined(NEED_FLOAT_B)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_B_START wc ' ... Float_B plugin
 mov     r0, ##@Float_B_Service_Table
 call    #Register_Services
#endif

#if defined(NEED_FLOAT_C)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_C_START wc ' ... Float_C plugin
 mov     r0, ##@Float_C_Service_Table
 call    #Register_Services
#endif

#if defined(SD)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@SD_START wc      ' ... SD plugin (which may also be CLOCK)
 call    #SD_Setup
#endif

#if (defined(CLOCK) && !defined(SD)) || defined(SEPARATE_CLOCK) || defined(RTC)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@CLOCK_START wc   ' ... Real-Time Clock
 call    #Clock_Setup
#endif

#if defined(libserial2)
 rdlong  r0, ##FREE_MEM         ' allocate ...
 sub     r0, ##S2_BLOCK_SIZE    ' ... S2 mailbox 
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 wrlong  #0, r0                 ' zero first long of S2 mailbox
 mov     r6, ##@Serial2_Init    ' save S2 mailbox address ...
 wrlong  r0, r6                 ' ... in initialization parameters
 mov     r1, #%10000            ' start ...
 setq    r6                     ' ...
 coginit r1, ##@cogserial_init wc ' ... S2 plugin
 .wait_for_serial2
 rdlong  r2, r0 wz              ' wait till ...
 if_z    jmp #.wait_for_serial2 ' ... plugin started
 mov     r3, #LMM_S2A           ' register ...
 call    #do_register           ' ... S2 plugin
#endif

#if defined(libserial8)
 rdlong  r0, ##FREE_MEM         ' allocate ...
 sub     r0, ##S8_BLOCK_SIZE    ' ... S8 data buffer block
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 mov     r6, ##@Serial8_Init    ' save data buffer block address ...
 wrlong  r0, r6                 ' ... in initialization parameters
 mov     r0, r6                 ' address to put in registry
 add     r6, #4                 ' address expected by s8 plugin
 mov     r1, #%10000            ' start ...
 setq    r6                     ' ...
 coginit r1, ##@uart_start wc   ' ... S8 plugin
 mov     r3, #LMM_S8A           ' register ...
 call    #do_register           ' ... S8 plugin
#endif

#if defined(libpsram)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##PSRAM_BLOCK_SIZE ' allocate a PSRAM control block
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 call    #PSRAM_Setup           ' set up PSRAM control block
 mov     r1, #%10000            ' start ...
 'mov     r1, #PSRAM_COG         ' start ...
 setq    r0                     ' ...
 coginit r1, ##@PSRAM_driver_start wc ' ... PSRAM plugin
.psram_wait                     ' wait ...
 rdlong  r2, r0 wz              ' ... till ...
 if_nz jmp #.psram_wait         ' ... plugin starts
 mov     r3, #LMM_PM1
 call    #do_register
#endif

#if defined(libhyper)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##HYPER_BLOCK_SIZE ' allocate a HYPER control block
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 call    #HYPER_Setup           ' set up HYPER control block
 mov     r1, #%10000            ' start ...
 'mov     r1, #HYPER_COG         ' start ...
 setq    r0                     ' ...
 coginit r1, ##@HYPER_driver_start wc ' ... HYPER plugin
.hyper_wait                     ' wait ...
 rdlong  r2, r0 wz              ' ... till ...
 if_nz jmp #.hyper_wait         ' ... plugin starts
 mov     r3, #LMM_HYP
 call    #do_register
#endif

#if defined(INITIALIZE_RAM)
' use an unusual value (i.e. not 0 or -1) to try
' and expose failures due to lack of initialization!
' e.g. -CINITIALIZE_RAM=$12345678
 mov     r0, ##INITIALIZE_RAM
 mov     r1, ##@sbrkinit
 mov     r2, ##HEAP_TOP
.zero_loop
 wrlong  r0,r1
 add     r1, #4
 cmp     r1, r2 wcz
 if_b jmp #.zero_loop

#endif

' wait for all plugins to initialize (exactly how long?)

 _ret_ waitx   ##INITIALIZATION_DELAY

#ifndef CATALINA_TOPLEVEL

' stop the optimizer complaining that these are undefined 
' when compiling intermediate files ...

HMI_START
HMI_Setup
HMI_Service_Table
HMI_BLOCK_SIZE
FLOAT_A_START
Float_A_Service_Table
FLOAT_B_START
Float_B_Service_Table
FLOAT_C_START
Float_C_Service_Table
CLOCK_START
Clock_Setup
Clock_Service_Table
RTC_SetFreq
SD_START
SD_Setup
SD_Service_Table
PSRAM_BLOCK_SIZE
PSRAM_Setup
PSRAM_driver_start
HYPER_BLOCK_SIZE
HYPER_Setup
HYPER_driver_start
S2_BLOCK_SIZE
Serial2_Init
cogserial_init
S8_BLOCK_SIZE
Serial8_Init
uart_start
CACHE_BLOCK_SIZE
CACHE_Setup
CACHE_driver_start 

#ifdef SBRK_AFTER_PLUGINS
sbrkinit
#endif

#endif

' plugin initialization support code ...
'
' Register_Services - register a table full of services
' on entry : r6 = cog id to use
'          : r0 = service table (2 bytes each entry, zero terminated)
'

Register_Services
        mov     r7,##REGISTRY ' point to registry

#ifdef PROTECT_PLUGINS
        locknew r3 wc          ' get a lock
 if_c   neg     r3,#1          ' no lock available
#else
        neg     r3,#1          ' no lock required
#endif
        and     r3, #$1f       ' use 5 bits for lock (0 .. 15 are valid locks)

.reg_loop
        rdword  r1,r0 wcz      ' get service table entry

 if_z   ret                    ' return if done all entries
        mov     r2,r1
        shr     r1,#8          ' r1 is ...
        and     r1,#$7F        ' ... plugin-specific request code (7 bits)
        and     r2,#$FF        ' r2 is global service id (SVC_X_XXXXX)
        call    #.register_1_service
        add     r0,#2
        jmp     #.reg_loop
'
' register_1_service
' On entry:
'       r1 = cog specific request id (7 bits)
'       r2 = global service id
'       r3 = lock to use (5 bits)
'       r6 = cog number (4 bits)
'       r7 = address of registry
'
.register_1_service
        mov     r5, r6         ' combine ...
        shl     r5, #5         ' ... cog number ...
        or      r5, r3         ' ... and ...
        shl     r5, #7         ' ... lock ...
        or      r5, r1         ' ... and plugin-specific request code
        mov     r4, r7         ' write it to ...
        sub     r4, r2         ' ... the word ...
        sub     r4, r2         ' ... at ...
_ret_   wrword  r5, r4         ' ... REGISTRY[-service id]

