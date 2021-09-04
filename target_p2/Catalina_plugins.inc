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
 mov r0, ##$FF00
.init_reg2
 sub r6, #2
 wrword r0, r6
 djnz r1, #.init_reg2

' initialize cogstore and argc/argv entries 

 mov r0, #0
 wrlong r0, ##COGSTORE
#ifndef NO_ARGS
 wrlong r0, ##ARGC_ADDR
 mov r6, ##ARGV_0
 wrlong r6, ##ARGV_ADDR
 mov r1, #ARGV_MAX
.init_reg3
 wrlong r0, r6
 add r6, #4
 djnz r1, #.init_reg3
#endif
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

 mov dira, #0
 mov dirb, #0

#if !defined(NO_HMI)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##HMI_BLOCK_SIZE+4  ' allocate HMI block (min 4 bytes)
 andn    r0, #$3                 ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 mov     r6, ##REGISTRY
 wrlong  r6, r0
 mov     r6, #%10000
 setq    r0                      ' start ...
 coginit r6, ##@HMI_START wc     ' ... HMI plugin
 mov     r0, ##@HMI_Service_Table
 call    #.register_services
#endif

#if defined(NEED_FLOAT_A)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_A_START wc ' ... Float_A plugin
 mov     r0, ##@Float_A_Service_Table
 call    #.register_services
#endif

#if defined(NEED_FLOAT_B)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_B_START wc ' ... Float_B plugin
 mov     r0, ##@Float_B_Service_Table
 call    #.register_services
#endif

#if defined(NEED_FLOAT_C)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@FLOAT_C_START wc ' ... Float_C plugin
 mov     r0, ##@Float_C_Service_Table
 call    #.register_services
#endif

#if defined(SD)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@SD_START wc      ' ... SD plugin (which may also be CLOCK)
 mov     r0, ##@SD_Service_Table
 call    #.register_services     ' register SD services

#if defined(CLOCK)
 mov     r0, ##@Clock_Service_Table
 call    #.register_services     ' register RTC services
 mov     r0, r6                  ' point ...
 shl     r0, #2                  ' ... to ...
 add     r0, ##REGISTRY          ' RTC registry entry
.wait_for_clock
 rdlong  r1, r0                  ' wait ...
 mov     r2, r1                  ' ... till ...
 shr     r1, #24                 ' ... RTC ...
 cmp     r1, #$FF wz             ' ... is ...
 if_z    jmp #.wait_for_clock    ' ... registered
 mov     r0, ##(RTC_SetFreq<<24 + @CLKFREQ)
 wrlong  r0, r2                  ' set frequency
.wait_for_setfreq
 rdlong  r0, r2 wz               ' wait till ...
 if_nz   jmp #.wait_for_setfreq  ' ... frequency set
#endif

#else

#if defined(CLOCK)
 mov     r6, #%10000
 setq    ##REGISTRY              ' start ...
 coginit r6, ##@CLOCK_START wc   ' ... Real-Time Clock
 mov     r0, ##@Clock_Service_Table
 call    #.register_services     ' register RTC services
 mov     r0, r6                  ' point ...
 shl     r0, #2                  ' ... to ...
 add     r0, ##REGISTRY          ' RTC registry entry
.wait_for_clock
 rdlong  r1, r0                  ' wait ...
 mov     r2, r1                  ' ... till ...
 shr     r1, #24                 ' ... RTC ...
 cmp     r1, #$FF wz             ' ... is ...
 if_z    jmp #.wait_for_clock    ' ... registered
 mov     r0, ##(RTC_SetFreq<<24 + @CLKFREQ)
 wrlong  r0, r2                  ' set frequency
.wait_for_setfreq
 rdlong  r0, r2 wz               ' wait till ...
 if_nz   jmp #.wait_for_setfreq  ' ... frequency set
#endif

#endif

#if defined(libserial2)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##S2_BLOCK_SIZE    ' allocate S2 mailbox (min 32 bytes)
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
 mov     r3, #LMM_S2A
 call    #do_register           ' register plugin

#endif

#if defined(libserial8)
 rdlong  r0, ##FREE_MEM
 sub     r0, ##S8_BLOCK_SIZE    ' allocate S8 control block
 andn    r0, #$3                ' FREE_MEM should always be long aligned
 wrlong  r0, ##FREE_MEM
 mov     r2, ##@Serial8_Init    ' point to initialization parameters
 mov     r1, ##S8_BLOCK_SIZE    ' copy initialization parameters ...
 call    #do_copy
 sub     r0, ##S8_BLOCK_SIZE    ' restore S8 control block address
 mov     r1, #%10000            ' start ...
 setq    r0                     ' ...
 coginit r1, ##@uart_start wc   ' ... S8 plugin
 mov     r3, #LMM_S8A
 call    #do_register

#endif

' wait for all plugins to initialize (exactly how long?)

 waitx   ##INITIALIZATION_DELAY

 ret

#ifndef CATALINA_TOPLEVEL

' stop the optimizer complaining that these are undefined when compiling intermediate files ...

HMI_START
HMI_Service_Table
HMI_BLOCK_SIZE
FLOAT_A_START
Float_A_Service_Table
FLOAT_B_START
Float_B_Service_Table
FLOAT_C_START
Float_C_Service_Table
CLOCK_START
Clock_Service_Table
RTC_SetFreq
SD_Service_Table
SD_START

#endif

' plugin initialization support code ...
'
' .register_services - register a table full of services
' on entry : r6 = cog id to use
'          : r0 = service table (2 bytes each entry, zero terminated)
'

.register_services
        mov     r7,##REGISTRY ' point to registry

#ifdef PROTECT_PLUGINS
        locknew r3 wc          ' get a lock
 if_c   neg     r3,#1          ' no lock available
#else
        neg     r3,#1          ' no lock required
#endif
        and     r3, #$f        ' use only 4 bits for lock

.reg_loop
        rdword  r1,r0 wcz      ' get service table entry

 if_z   ret                    ' return if done all entries
        mov     r2,r1
        and     r2,#$FF        ' r1 is cog specific request id
        shr     r1,#8          ' r2 is global service id (SVC_X_XXXXX)
        call    #.register_1_service
        add     r0,#2
        jmp     #.reg_loop
'
' register_1_service
' On entry:
'       r1 = cog specific request id
'       r2 = global service id
'       r3 = lock to use (4 bits)
'       r6 = cog number
'       r7 = address of registry
'
.register_1_service
        mov     r5, r6         ' combine ...
        shl     r5, #4         ' ... cog number ...
        or      r5, r3         ' ... and ...
        shl     r5, #8         ' ... lock ...
        or      r5, r1         ' ... and cog-specific request id
        mov     r4, r7         ' write it to ...
        sub     r4, r2         ' ... the word ...
        sub     r4, r2         ' ... at ...
_ret_   wrword  r5, r4         ' ... REGISTRY[-service id]

