{{
--------------------------------------------------------------------------------------------------

 Propeller 2 Hyper Driver COG
 ============================
 
 This driver enables P2 COGs to access multiple Hyper memory devices sharing a common data bus.

 Features:
 --------
 
 * single COG PASM2 based driver
 * supports HyperFlash and HyperRAM devices sharing a common data bus
 * up to 16 memory devices can be mapped on 16MB/32MB/64MB/128MB/256MB boundaries 
 * device selected on the bus will be based on the address bank in the memory request
 * configurable control pins and data bus group for the memory devices
 * optional device reset support during driver startup
 * uses a 3 long mailbox per COG for reading memory requests and for writing results
 * error reporting for all failed requests
 * supports strict priority and round-robin request polling (selectable per COG)
 * optional notification of request completion with the COGATN signal to the requesting COG
 * re-configurable maximum transfer burst size limits setup per COG, and per device
 * automatic fragmentation of transfers exceeding configured burst sizes
 * device register read/write access capabilities
 * reprogrammable address phase latency per device
 * sysclk/2 read/write transfer rates are supported and optionally sysclk/1 transfer rates
 * provides single byte/word/long and burst transfers for reading/writing external memory
 * input delay can be controlled to allow driver to operate with varying P2 clocks/temps/boards
 * graphics copies/fill and other Hyper-memory to Hyper-memory copy operations are supported
 * request lists supported allowing multiple requests with one mailbox transaction (DMA engine)
 * maskable read-modify-write support for atomic memory changes and sub-byte sized pixel writes
 * protection of HyperFlash memory during erases/write operations, reads prevented or stalled
 * unserviced COGs can be removed from the polling loop to reduce latency

 Revision history:
 ----------------
   0.7b   22 SEP 2020  rogloh      -initial BETA pre-release for Ahle2-
   0.8b   27 SEP 2020  rogloh      -general BETA release-
   0.9b   22 DEC 2021  rogloh      -second BETA release
 
--------------------------------------------------------------------------------------------------

 Modified for Catalina by Ross Higson: 
  - Comment out the Spin2 methods (Catalina only uses the PASM code)
  - Some names changed (by adding PSRAM_ prefix and/or making them local) 
    to avoid name collisions
 
--------------------------------------------------------------------------------------------------
}}

' common definitions have been extracted to this file ...

#include <psram.def>

CON

' This Cog is started by the SPIN2 memory driver API, however it can also be started independently
' in non-SPIN2 setups.  The startup parameters and data formats it requires are identified below if
' started directly by PASM2 code or other environments.  The HUB address of the startup parameter 
' structure is to be passed into this driver COG when it starts up via PTRA.
'
' COG startup parameter format (8 consecutive longs)
'   startupParams[0]: P2 operating frequency in Hz (used for reset delay time calculation)
'   startupParams[1]: configuration flags for driver
'   startupParams[2]: port A reset mask (lower 32 P2 pins)
'   startupParams[3]: port B reset mask (upper 32 P2 pins)
'   startupParams[4]: base P2 pin number of data bus used by driver (0, 8,16,24,32,40,48,56)
'   startupParams[5]: pointer to 32 long device parameter structure in HUB RAM
'   startupParams[6]: pointer to 8 long COG parameter structure in HUB RAM
'   startupParams[7]: mailbox base address for this driver to read in HUB RAM
'
' 
' Configuration flags:
'
'  bit31 - set 1 to enable faster sysclk/1 reads, otherwise 0 for sysclk/2 reads
'  bit30 - set 1 to enable sysclk/1 writes (experimental), otherwise 0 for sysclk/2 writes (default)
'  bit29 - set 1 to enable unregistered clock pin, otherwise  0 for registered clock pins (default)
'  bit28 - set 1 to enable (future) expansion of graphics functions in HUB-exec calls, 0 to disable
'  bit27..0  - reserved (set to 0)
'
' Structure for COG parameters:
' 8 longs in the following format, one per COG id
'  bits
'   31                        16  15     12 11  10  9 8       0
'  -------------------------------------------------------------
' |      COG's Burst Limit      | Priority |  Flags  | Internal |
'  -------------------------------------------------------------
'  COG's Burst Limit:
'    This restricts a COG's maximum burst size which helps bound the latency for servicing the 
'    highest priority COG.  A smaller burst size setup for lower priority COGs would let a video 
'    COG have its requests serviced sooner, for example.  This burst size is measured in bytes.
'
'    To guarantee the real-time (e.g video / audio) priority transfers can be reliably sustained 
'    without artifacts the burst size for all lower priority and round robin COGs should be 
'    set to a value that allows both the real-time COG's transfer and any single lower priority
'    (or round-robin) serviced COG's transfer to be completed before the next real-time request
'    requires processing.  
'
'    In the specific case of video both the video COG and any lower priority COG's transfer will
'    need to complete in a single scanline (with some margin for overheads). In this case the
'    optimal value will depend on the video timing, the resolution and colour depth as well as the 
'    P2 frequency and actual transfer rate on the Hyper bus.
'
'    So if you had a 31us video scan line for example, and if the video burst transfers per line
'    totals 24us after any fragmentation/overheads, no more than 7us of bursts (incl. overheads) 
'    should be allocated to any of the COGs lower in priority.  That way, once the lower priority
'    COG is serviced following video, its request will complete in time such that the next video
'    request can occur and complete before the total deadline expires.
'
'  Priority (4 bits):
'    This field holds an optional priority assigned to the COG being serviced by the driver.
'    Strict priority COGs are serviced before any round-robin COGs.  Round-Robin polled COGs
'    share the bandwidth remaining fairly, by request but not necessarily bandwidth.
'
'    Pattern  Description
'    -------  -----------
'    1_111    Highest priority polled COG
'    1_110    2nd highest priority polled COG.
'    1_...    ...
'    1_000    Lowest priority polled COG (but still above round robin COGs)
'    0_xxx    Round-robin polled COG 
'                 if x==000, COG stalls if accessed flash is locked by another COG
'                    x<>000, COG returns with ERR_BUSY if flash locked by another COG
'    
'   Flag bits:
'    11      0 = serviced COG is notified of completion/error via its mailbox only
'            1 = serviced COG is notified with COGATN on completion as well as via its mailbox
'    10      0 = COG can be pre-empted when its burst is broken up (polling restarts then)
'            1 = COG's transfer is locked until it completes, even if broken into sub-bursts
'     9      Internally used flag for tracking request list processing state (value is ignored)
'
'   Internal:
'    8-0     Internally maintained field that holds the COG ID within the driver.  Value ignored.
'
' Device parameter structure:
'
' This is arranged as 16 bank parameter longs followed by 16 pin parameter longs, one each per bank.
' Devices over 16MB in size span multiple bank addresses (bits 24-27) and require duplicate values
' configured in each associated bank's parameter and pin parameter longs.
'
' Bank parameter long format (16 consecutive longs, one per bank):
'  bit
'   31                         16 15     12 11      8 7        0
'  -------------------------------------------------------------
' |         Maximum Burst        |  Delay  |  Flags  |   Size   |
'  -------------------------------------------------------------
'  Maximum Burst:
'    This is the burst size allowed for the *device* in bytes, assuming a sysclk/1 transfer rate.
'    When unlimited, (eg. Flash) it will effectively be set to the P2 streamer limit of just under
'    64kB ($fff0) bytes.  Its 3 LSBs are also shared to indicate which COG is allowed to modify the 
'    HyperFlash or access its registers in an uninterruptible sequence when bit 11 is set true.
'
'  Delay:
'   This nibble is comprised of two fields which create the delay needed for Hyper memory reads.
'   bits
'   15-13 = P2 clock delay cycles when waiting for valid data bus input to be returned
'   12 = set to 0 if bank uses registered data bus inputs for reads, or 1 for unregistered
'  
'  Flags:
'   bit
'   11 = Flash COG access protection: (1) if bank is being modified, (0) bank is not being modified
'   10 = memory type: HyperRAM (0) or HyperFLASH (1)
'  9-8 = reserved (perhaps for future 1x or 2x read/write capability per device or v2 HyperRAM type?)
'   
'   Size:
'    number of valid address bits - 1 used by the device mapped into this bank
'      16MB = 23  ' also use this size for 8MB devices or smaller
'      32MB = 24
'      64MB = 25
'     128MB = 26
'     256MB = 27
'
' NOTE: If the bank is not in use all its parameters must remain zeroed.
' 
' The 16 bank parameters above are then followed by the 16 pin parameter longs, one long per bank.
'
' Pin parameter long format (16 consecutive longs, one per bank):
'  bit
'   31 30           24 23          16 15            8 7            0
'  -----------------------------------------------------------------
' | I | Latency Edges |   RWDS pin   |    CLK pin    |    CS pin    |
'  -----------------------------------------------------------------
'
'  The "I" bit (bit31) is the "invalid" bit, it must be set to 1 if the bank is not in use.
'
'  The Latency Edges field is set to a value that is twice the latency clocks for this devices
'
'  The 3 pin fields define the P2 pins attached to the device control pins (and range from 0-63).
'  All 3 pins are required to be defined and all are used by this driver.
'--------------------------------------------------------------------------------------------------
{{
' Returns the address of this driver's location in hub RAM to start it

PUB getDriverAddr() : r
    return @HYPER_driver_start
}}

'--------------------------------------------------------------------------------------------------
DAT 
                            orgh
HYPER_driver_start
                            org
'..................................................................................................
' Memory layout for COG RAM once operational:
'
'  COG RAM address      Usage
'  ---------------      ----
'    $00-$17            Mailbox data area (3 longs x 8 COGs) (24)
'    $18-$1F            Mailbox HUB parameter addresses per COG (8)
'    $20-$7F            COG service handlers (8 COGs x 12 longs per COG) (96)
'    $80-$FF            EXECF vector storage (8 requests x 16 banks) (128)
'   $100-$197           Mailbox poller, error handlers, and all driver management code
'  ~$198-$1F3           State and register variables
'
' Also during driver COG startup:
'  $00-$17  is init as temporary init code - stage 3 (EXECF vector table init)
' $100-$1FF is uses as temporary init code - stage 1 (HW setup & majority of driver init)
'..................................................................................................
                            
' Mailbox storage after vector initialization

req0                        call    #.HYPER_init            'do HW setup/initialization
data0                       rdlut   c, b wz                 'read bank info          
count0                      mov     a, b                    'set COGRAM address low nibble
req1        if_z            mov     ptra, #$68              'set pointer to invalid vectors
data1                       testb   c, #FLASH_BIT wc        'check type: HyperFlash(1) or HyperRAM(0)
count1      if_nc_and_nz    mov     ptra, #$50              'set pointer to hyperRAM vectors
req2        if_c_and_nz     mov     ptra, #$58              'set pointer to hyperFLASH vectors
data2                       mov     c, #$8                  'setup vector base to $80
count2                      setnib  a, c, #1                'prepare vector base address for bank
req3                        altd    a, #0                   'prepare COG destination read address
data3                       rdlut   0-0, ptra++             'read vector into table in COG RAM
count3                      incmod  c, #15 wz               'next vector
req4        if_nz           jmp     #count2                 'repeat
data4                       incmod  b, #15 wz               'next bank
count4      if_nz           jmp     #data0                  'repeat
req5                        mov     ptra, #$20              'setup base LUT address to clear
data5                       rep     #5, #80                 'update next 80 longs      
count5                      cmp     ptra, addrlo wc         'check if LUT address range 
req6        if_nc           cmpr    ptra, addrhi wc         '...falls in/outside control region
data6       if_c            wrlut   #0, ptra++              'if outside, clear LUT RAM      
count6      if_nc           wrlut   addr1, ptra++           'copy control vector table into LUT
req7        if_nc           add     $-1, const512           'increment source of LUT write data
data7                       mov     burstwrite, 255-0       'save real bank 15 burst write vector
count7      _ret_           mov     255, #dolist            'setup list address, return to notify

' Mailbox parameter addresses per COG once patched
                            
cog0mboxdata                long    0*12+4                  'address offset for cog0 mbox data
cog1mboxdata                long    1*12+4                  'address offset for cog1 mbox data
cog2mboxdata                long    2*12+4                  '...
cog3mboxdata                long    3*12+4
cog4mboxdata                long    4*12+4
cog5mboxdata                long    5*12+4
cog6mboxdata                long    6*12+4
cog7mboxdata                long    7*12+4                  'address offset for cog7 mbox data

'..................................................................................................
' Per COG request and state setup and service branching
        
cog0                 
                            mov     ptra, #$20+0*10         'determine COG0 parameter save address
                            mov     ptrb, cog0mboxdata      'determine COG0 mailbox data address
                            mov     id, id0                 'get COG0 state
                            getword limit, id, #1           'get COG0 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req0             'get mailbox request parameter for COG0
                            mov     hubdata, data0          'get COG0 mailbox data parameter
                            mov     count, count0           'get COG0 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog1                        
                            mov     ptra, #$20+1*10         'determine COG1 parameter save address
                            mov     ptrb, cog1mboxdata      'determine COG1 mailbox data address
                            mov     id, id1                 'get COG1 state
                            getword limit, id, #1           'get COG1 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req1             'get mailbox request parameter for COG1
                            mov     hubdata, data1          'get COG1 mailbox data parameter
                            mov     count, count1           'get COG1 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog2                         
                            mov     ptra, #$20+2*10         'determine COG2 parameter save address
                            mov     ptrb, cog2mboxdata      'determine COG2 mailbox data address
                            mov     id, id2                 'get COG2 state
                            getword limit, id, #1           'get COG2 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req2             'get mailbox request parameter for COG2
                            mov     hubdata, data2          'get COG2 mailbox data parameter
                            mov     count, count2           'get COG2 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog3                        
                            mov     ptra, #$20+3*10         'determine COG3 parameter save address
                            mov     ptrb, cog3mboxdata      'determine COG3 mailbox data address
                            mov     id, id3                 'get COG3 state
                            getword limit, id, #1           'get COG3 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req3             'get mailbox request parameter for COG3
                            mov     hubdata, data3          'get COG3 mailbox data parameter
                            mov     count, count3           'get COG3 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog4                        
                            mov     ptra, #$20+4*10         'determine COG4 parameter save address
                            mov     ptrb, cog4mboxdata      'determine COG4 mailbox data address
                            mov     id, id4                 'get COG4 state
                            getword limit, id, #1           'get COG4 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req4             'get mailbox request parameter for COG4
                            mov     hubdata, data4          'get COG4 mailbox data parameter
                            mov     count, count4           'get COG4 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog5                        
                            mov     ptra, #$20+5*10         'determine COG5 parameter save address
                            mov     ptrb, cog5mboxdata      'determine COG5 mailbox data address
                            mov     id, id5                 'get COG5 state
                            getword limit, id, #1           'get COG5 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req5             'get mailbox request parameter for COG5
                            mov     hubdata, data5          'get COG5 mailbox data parameter
                            mov     count, count5           'get COG5 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog6                        
                            mov     ptra, #$20+6*10         'determine COG6 parameter save address
                            mov     ptrb, cog6mboxdata      'determine COG6 mailbox data address
                            mov     id, id6                 'get COG6 state
                            getword limit, id, #1           'get COG6 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req6             'get mailbox request parameter for COG6
                            mov     hubdata, data6          'get COG6 mailbox data parameter
                            mov     count, count6           'get COG6 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service
cog7                        
                            mov     ptra, #$20+7*10         'determine COG7 parameter save address
                            mov     ptrb, cog7mboxdata      'determine COG7 mailbox data address
                            mov     id, id7                 'get COG7 state
                            getword limit, id, #1           'get COG7 burst limit
                            rdlut   resume, ptra[8] wz      'check if we are in the middle of something
            if_nz           jmp     #restore                'if so restore state and resume
                            mov     addr1, req7             'get mailbox request parameter for COG7
                            mov     hubdata, data7          'get COG7 mailbox data parameter
                            mov     count, count7           'get COG7 mailbox count parameter
                            getbyte request, addr1, #3      'get request + bank info
                            altd    request, #0             'lookup jump vector service table 
                            execf   request-0               'jump to service

                            fit     128
pad                         long    0[128-$]                'align init code to $80

'..................................................................................................

' This initialization code ($80-$FF) gets reused as the main service EXECF jump table later (128 longs)

.HYPER_init                        
                            ' read in the additional LUT RAM code
                            add     lutcodeaddr, ptrb       'determine hub address of LUT code   
                            setq2   #511-64                 'read the remaining instructions 
                            rdlong  $40, lutcodeaddr       '...and load into LUT RAM address $240

                            ' read the startup parameters
                            setq    #8-1                    'read 8 longs from hub
                            rdlong  startupparams, ptra     '.. as the startup parameters 

                            ' generate timed reset pin pulses
                            qdiv    frequency, ##1000000    'convert from Hz to MHz
                            getqx   c                       'get P2 clocks per microsecond
                            mov     a, #RESET_HIGH_US       'get before reset delay in microseconds 
                            mul     a, c                    'convert microseconds to clocks
                            or      outa, resetmaskA        'raise all resets on port A
                            or      outb, resetmaskB        'raise all resets on port B
                            or      dira, resetmaskA        'enable reset pin(s) on port A
                            or      dirb, resetmaskB        'enable reset pin(s) on port B
                            waitx   a                       'delay
                            mov     a, #RESET_LOW_US        'get reset delay in microseconds 
                            mul     a, c                    'convert microseconds to clocks
                            andn    outa, resetmaskA        'apply all reset low signals
                            andn    outb, resetmaskB        '...on both ports
                            waitx   a                       'delay
                            or      outa, resetmaskA        'remove reset pulses
                            or      outb, resetmaskB        '...on both ports
                            mov     a, #MIN_CS_DELAY_US     'get delay before CS can be driven
                            mul     a, c                    'convert into clock cycles
                            waitx   a                       'wait this minimum time before access

                            ' setup some of the config flag dependent state and patch LUTRAM
                            testb   HYPER_flags, #EXPANSION_BIT wz'test for graphics expansion enabled
            if_z            add     expansion, ptrb         'compensate for HUB address
            if_nz           mov     expansion, ##donerepeats'disable expansion when flag bit clear
                            testb   HYPER_flags, #UNREGCLK_BIT wc 'check if we have registered clks
            if_nc           or      clkconfig, registered   'enable this if so
            if_nc           mov     clkdelay, #0            'remove clk delay if registered clock
            if_c            setword ximm3, #2, #0           'adjust streamer command by one byte
                            testb   HYPER_flags, #FASTREAD_BIT wz 'z=1 if fast reads enabled (sysclk/1)
            if_z            wrlut   clockpatch, #(p1 & $1ff)'set sysclk/1 clock rate if enabled
            if_z            wrlut   shiftpatch, #(p0 & $1ff)'set sysclk/1 clock rate if enabled
            if_z            wrlut   speedpatch, #(p2 & $1ff)'double the data rate for sysclk/1
            if_nz_or_nc     rdlut   a, #(compensate & $1ff) 'no extra compensation needed
            if_nz_or_nc     sets    a, #0
            if_nz_or_nc     wrlut   a, #(compensate & $1ff) 'no extra compensation needed

                            ' setup data pin modes and data bus pin group in streamer commands
                            and     datapins, #%111000      'compute base pin
                            or      datapins, #(7<<6)       'configure 8 pins total
                            wrpin   registered, datapins    'prepare data pins for address phase transfer
                            mov     a, datapins             'get data pin base
                            shr     a, #3                   'determine data pin group
                            and     a, #7                   'ignore the unwanted bits
                            or      a, #8
                            setnib  ximm, a, #5             'setup bus group in streamer
                            setnib  ximm1, a, #5
                            setnib  ximm2, a, #5
                            setnib  ximm4, a, #5
                            setnib  ximm3, a, #5
                            setnib  xhub, a, #5
                            setnib  xrecv, a, #5
 
                            ' setup device control pin states
                            setq2   #32-1                   'read 32 longs to LUTRAM
                            rdlong  $000, devicelist        'read bank/pin data for all banks    
                            mov     const512, ##512         'prepare constant

                            mov     ptrb, #16               'point to bank pin config data
                            rep     @pinloop, #16           'iterate through 16 banks
                            rdlut   pinconfig, ptrb++ wc    'invalid if pin config bit 31 is one
                            and     pinconfig, pinmask      'save us from invalid bits in args
            if_nc           getbyte cspin, pinconfig, #0    'read CS pin number
            if_nc           wrpin   #0, cspin               'clear smart pin mode
            if_nc           drvh    cspin                   'setup hyperRAM pins for all banks
            if_nc           getbyte clkpin, pinconfig, #1   'read CLK pin number
            if_nc           wrpin   clkconfig, clkpin       'set clk to Smartpin transition output
            if_nc           drvl    clkpin                  'set clk state low
            if_nc           getbyte rwdspin, pinconfig, #2  'read RWDS pin number
            if_nc           fltl    rwdspin                 'tri-state the RWDS pin
            if_nc           wrpin   #0, rwdspin             'clear smart pin mode
pinloop
                            ' setup the COG mailboxes and addresses 
                            rep     #2, #8                  'setup loop to patch mailbox addresses
                            alti    $+1, #%111_000          'increase D field
                            add     cog0mboxdata, mbox      'apply base offset to mailbox data

                            setq    #24-1
                            wrlong  #0, mbox                'clear out mailboxes ????

                            ' setup the polling loop for active COGs 
                            cogid   id
                            alts    id, #id0                'determine id register of control COG
                            setd    patchid, #0             'patch into destination address
                            push    ptra                    'save ptra before we lose it
                            mov     ptra, #10
                            mul     ptra, id
                            add     ptra, #$20              'prep ptra for reloadcogs
                            alts    id, #cog0_handler       'add to handler base
                            sets    ctrlpollinst, #0-0      'patch into jump instruction
                            mul     id, #3
                            setd    ctrlpollinst, id
                            rdlut   id, ptra[9]             'save original value
                            wrlut   initctrl, ptra[9]       'prep LUT data for reloadcogs
                            call    #reloadcogs
                            wrlut   id, ptra[9]             'restore original value
                            pop     ptra                    'restore original ptra

                            ' move LUT control vectors into temporary location to avoid clobbering them later
                            setd    d, #addr1
                            sets    d, #$60
                            rep     #2, #8
                            alti    d, #%111_111            'patch & increment d/s fields in next instr.
                            rdlut   addr1-0, #$60-0

                            'setup control COG service handling, we need to patch 5 instructions
                            'one existing instruction is moved earlier and four instructions get replaced
                            cogid   id
                            mov     a, #(cog1-cog0)         'get code separation of handlers
                            mul     a, id                   'scale ID by separation
                            add     a, #cog0+4              'add to base for COG0 and offset
                            setd    d, a                    'set this as the destination
                            add     a, #2                   'increment COG address
                            sets    d, a                    'set this as the source
                            alti    d, #%111_100             
                            mov     0-0, 0-0                'move instruction
                            sets    d, #controlpatch        'set source of patched instructions
                            rep     #2, #2                  'patch two instructions
                            alti    d, #%111_111
                            mov     0-0, 0-0
                            add     d, const512             'skip two instructions
                            add     d, const512
                            rep     #2, #2                  'patch two instructions
                            alti    d, #%111_111
                            mov     0-0, 0-0
                            
                            ' setup register values for control vector loop setup after we return
                            mov     addrlo, id              'get cog ID
                            mul     addrlo, #10             'multiply by size of state memory per COG
                            add     addrlo, #$20            'add to COG state base address in LUT
                            mov     addrhi, addrlo          'determine start/end LUT address
                            add     addrhi, #9              '...for control region
                            or      id, initctrl            'set id field for control COG
                            altd    id, #id0
                            mov     0-0, id                 'setup id field for notification
                            jmp     #patchlutram            'out of space here for init, continue in LUT
 
controlpatch                getnib  request, addr1, #7      'instructions to patch for control COG
                            and     request, #7
                            add     request, ptra           'add request vector offset
                            rdlut   request, request        'lookup jump vector service table 

                            fit     $100                    'ensure all init code fits this space

                            long    0[$100-$]               'pad more if required until table ends

'..................................................................................................
' Error result handling and COG notification of request completion

unsupported                 callpa  #-ERR_UNSUPPORTED, #err 'operation not supported
invalidbank                 callpa  #-ERR_INVALID_BANK, #err'bank accessed has no devices mapped
invalidlist                 callpa  #-ERR_INVALID_LIST, #err'invalid list item request
alignmenterror              callpa  #-ERR_ALIGNMENT, #err   'flash alignment error
busyerror                   mov     pa, #-ERR_BUSY          'flash busy, falls through...
err                         altd    id, #id0                'adjust for the running COG
                            bitl    0-0, #LIST_BIT          'cancel any list in progress by this COG
                            wrlut   #0, ptra[8]             'cancel any resume state
                            skipf   #%10                    'dont notify with success code 0 below
                            wrlong  pa, ptrb[-1]            'set error code in mailbox response
notify                      wrlong  #0, ptrb[-1]            'if no error, clear mailbox request
                            testb   id, #NOTIFY_BIT wz      'check if COG also wants ATN notification
                            decod   a, id                   'convert COG ID to bitmask
            if_z            cogatn  a                       'notify COG via ATN
' Poller re-starts here after a COG is serviced
poller                      testb   id, #PRIORITY_BIT wz    'check what type of COG was serviced
            if_nz           incmod  rrcounter, rrlimit      'cycle the round-robin (RR) counter
                            bmask   mask, rrcounter         'generate a RR skip mask from the count
' Main dynamic polling loop repeats until a request arrives
polling_loop                rep     #0-0, #0                'repeat until we get a request for something
                            setq    #24-1                   'read 24 longs
                            rdlong  req0, mbox              'get all mailbox requests and data longs

polling_code                tjs     req0, cog0_handler      ']A control handler executes before skipf &
                            skipf   mask                    ']after all priority COG handlers if present
                            tjs     req1, cog1_handler      ']Initially this is just a dummy placeholder
                            tjs     req2, cog2_handler      ']loop taking up the most space assuming 
                            tjs     req3, cog3_handler      ']a polling loop with all round robin COGs 
                            tjs     req4, cog4_handler      ']from COG1-7 and one control COG, COG0.
                            tjs     req5, cog5_handler      ']This loop is recreated at init time 
                            tjs     req6, cog6_handler      ']based on the active COGs being polled
                            tjs     req7, cog7_handler      ']and whether priority or round robin.
                            tjs     req1, cog1_handler      ']Any update of COG parameters would also
                            tjs     req2, cog2_handler      ']regenerate this code, in case priorities
                            tjs     req3, cog3_handler      ']have changed.
                            tjs     req4, cog4_handler      ']A skip pattern that is continually 
                            tjs     req5, cog5_handler      ']changed selects which RR COG is the
                            tjs     req6, cog6_handler      ']first to be polled in the seqeuence.
pollinst                    tjs     req7, cog7_handler      'instruction template for RR COGs

ctrlpollinst                tjs     req0, cog0_handler      'instruction template for control
skipfinst                   skipf   mask                    'instruction template for skipf
 
'..................................................................................................
' List handler                               

dolist                      tjf     addr1, #real_list       'if addr1 is all ones this is a real list
                            execf   burstwrite              'otherwise do a burst write to this bank
real_list                   setq    #8-1                    'read 8 longs (largest request size)
                            rdlong  addr1, hubdata          '..to update the request state
                            tjns    addr1, #invalidlist     'error if request list item not valid
                            altd    id, #id0                'get COG state
                            bith    0-0, #LIST_BIT wcz      'retain fact that we are in a list
                            bith    id, #LIST_BIT           'retain fact that we are in a list
            if_z            jmp     #unsupported            'no list recursion is allowed!
                            getbyte request, addr1, #3      'get upper byte of this request
service_request             altd    request, #0             'get request address in COG RAM
                            execf   0-0                     'process the request 

'..................................................................................................
' Restoring per COG state and resuming where we left off

restore                     rdlut   addr1, ptra[0]          'restore then continue with working state
                            rdlut   hubdata, ptra[1]
                            rdlut   count, ptra[2]
                            rdlut   addr2, ptra[3] wc       'C=1 indicates an extended request size
                            getbyte request, addr1, #3
            if_nc           execf   resume                  'if not extended then resume immediately
                            rdlut   total, ptra[4]          'we need to read the extended parameters
                            rdlut   offset1, ptra[5]
                            rdlut   offset2, ptra[6]
                            rdlut   link, ptra[7]
                            rdlut   orighubsize, ptra[9]
                            execf   resume                  'then resume what we were doing last time
                   
'..................................................................................................
' Re-configuration of QoS settings and custom polling loop sequence generator

reconfig                    push    #notify                 'setup return addr, then reload 
reloadcogs                  setq    #8-1                    'reload all per COG QoS params
                            rdlong  addr1, coglist          'use addr1+ as 8 long scratch area
                            setd    a, #id0
                            sets    a, #addr1
                            setq    ##!($FF + (1<<LIST_BIT))'preserve list flag and COG ID state 
                            rep     #2, #8                  'repeat for 8 COGs
                            alti    a, #%111_111 
                            muxq    0-0, 0-0
patchid                     rdlut   0-0, ptra[9]            'restore static control COG ID information
                            cogid   c
                            decod   excludedcogs, c         'exclude driver cog initially
                            mov     a, #$8                  'a iterates through prio levels 8=lowest
                            neg     pa, #1                  'start with all ones
fillprio                    mov     c, #7                   'c iterates through cogs
prioloop                    alts    c, #id0
                            mov     b, 0-0
                            getword d, b, #1                'get burst field
                            test    d wz                    'if burst=0 
            if_z            bith    excludedcogs, c         '...then exclude this COG from polling
            if_z            jmp     #excluded               
                            getnib  d, b, #3                'get RR/PRI flag & priority
                            cmp     d, a wz                 'compare against current priority level
            if_z            rolnib  pa, c, #0               'if matches include COG at this level
excluded                    djnf    c, #prioloop            'repeat for all 8 COGs
                            incmod  a, #15 wz               'next level
            if_nz           jmp     #fillprio 

'determine priority cogs and build instructions for the polling sequence
                            mov     pb, #0                  'clear out set of priority COGs
                            mov     a, #3                   'start with no COGs being polled + 3 instructions
                            setd    d, #polling_code        'initialize COGRAM write position

                            rep     @endprioloop, #8        'test all 8 priority slots
                            testb   pa, #3 wc               'test validity bit, c=1 if invalid
                            getnib  c, pa, #0               'get cogid ID at this priority level
            if_nc           testb   pb, c wz                'check if already exists as priority COG
            if_nc_and_nz    bith    pb, c                   'and only add if it doesn't
            if_nc_and_nz    add     a, #1                   'add another COG to poll 
            if_nc_and_nz    alts    c, #cog0_handler        'determine jump address per COG
            if_nc_and_nz    sets    pollinst, #0-0          'patch jump handler in instruction
            if_nc_and_nz    mul     c, #3
            if_nc_and_nz    setd    pollinst, c             'patch REQ slot to poll in instruction
            if_nc_and_nz    alti    d, #%111_000            'generate new COG RAM write address
            if_nc_and_nz    mov     0-0, pollinst           'move the instruction to COG RAM
                            ror     pa, #4                  'advance to next priority
endprioloop
                            xor     pb, #$ff                'invert to find all the non-priority COGs
                            andn    pb, excludedcogs        'and remove any other excluded COGs
                            ones    rrlimit, pb wz          'count the number of RR COGs
                            add     a, rrlimit              'account for this number of RR COGs to poll
                            sub     rrlimit, #1             'setup last RR count value for incmod
                            alti    d, #%111_000            'generate the control polling instruction
                            mov     0-0, ctrlpollinst       'write the instruction
            if_nz           alti    d, #%111_000            'if RR COG count not zero we need a skipf
            if_nz           mov     0-0, skipfinst          'add the skipf instruction
            if_nz           add     a, #2                   'account for the extra skipf overhead instructions
                            setd    polling_loop, a         'save it as the repeat count
            if_z            ret                             'we are done now, if no round robin COGs

' populate the round robin COG polling instructions
                            mov     rrcounter, #2           'fill the RR poll instruction list twice
rrloop                      mov     b, pb                   'get the set of RR COGs
                            mov     c, #0                   'start at COG ID = 0
                            mov     a, #0                   'req mailbox COGRAM address for COG 0
nextrrcog                   shr     b, #1 wcz               'test for COG ID in RR COG set, set C=1
            if_c            setd    pollinst, a             'patch REQ slot to poll in instruction
            if_c            alts    c, #cog0_handler        'determine jump address
            if_c            sets    pollinst, #0-0          'patch jump handler in instruction
            if_c            alti    d, #%111_000            'generate new COG RAM write address
            if_c            mov     0-0, pollinst           'move the instruction to COG RAM
                            add     c, #1                   'increment the COG ID
                            add     a, #3                   'increase the request address
            if_nz           jmp     #nextrrcog              'repeat for all COG IDs
            _ret_           djnz    rrcounter, #rrloop      'repeat twice, leave rrcounter zeroed
'..................................................................................................
' Code to get/set driver settings per bank or to dump COG/LUT state

set_latency                                                 '            (a) set latency
get_latency                                                 '            (b) get latency
set_burst                                                   '            (c) set burst size of bank
get_burst                                                   '            (d) get burst size of bank
                                                            '            (e) dump state
                            getnib  b, addr1, #6            ' a b c d    get bank address
dump_state                  setq    #511                    ' | | | | e  prepare burst write
                            wrlong  0, hubdata              ' | | | | e  write COG RAM to HUB
                                                            ' | | | | e  account for following AUGS
                            add     hubdata, ##2048         ' | | | | e  advance by 2k bytes
                            setq2   #511                    ' | | | | e  prepare burst write
                            wrlong  0, hubdata              ' | | | | e  write LUT RAM to HUB
                            add     b, #16                  ' a b | | |  point to latency params
                            rdlut   a, b                    ' a b c d |  read data for bank
                            setbyte a, hubdata, #3          ' a | | | |  patch latency
                            mov     a, hubdata              ' | | c | |  patch burst/delay etc
                            wrlut   a, b                    ' a | c | |  if setting, save bank data
                            getbyte a, a, #3                ' | b | | |  extract latency field only
                            wrlong  a, ptrb                 ' | b | d |  write result          
                            jmp     #notify                 ' a b c d e  return success

'..................................................................................................
' Misc EXECF code

start_read_exec             execf   newburstr
start_write_exec            execf   resumewrites
continue_read_exec          execf   lockedreads
continue_write_exec         execf   lockedwrites
start_read_flash_exec       execf   newflashr

'..................................................................................................
' Variables

xrecv           long    $E0CE_0000 
xhub            long    $A0CE_0000
xsend           long    $60CE_0000
ximm            long    $60CE_0000
ximm1           long    $60CE_0001
ximm2           long    $60CE_0002
ximm3           long    $60CE_0003
ximm4           long    $60CE_0004

xfreq1          long    $80000000
xfreq2          long    $40000000
delay           long    3

lutcodeaddr                 
startupparams
excludedcogs                                    'careful: shared register use!
frequency       long    lut_code - HYPER_driver_start 'determine offset of LUT code from base
HYPER_flags    long    0
mask                                            'careful: shared register use!
resetmaskA      long    0
limit                                           'careful: shared register use!
resetmaskB      long    0
datapins        long    0
const512                                        'careful: shared register use!
devicelist      long    0
coglist         long    0
mbox            long    0 

clkpin                                          'shared with code patched during init
clockpatch      wxpin   #1, clkpin              'adjust transition delay to # clocks
cspin                                           'shared with code patched during init
speedpatch      setxfrq xfreq1                  'instruction to set read speed to sysclk/1
rwdspin                                         'shared with code patched during init
shiftpatch      shr     b, #16                  'get burst limit for sysclk/1 rate
invertrwds      long    %1_000000_01_00100_0    'configure RWDS smartpin for inverted output
registered      long    %100_000_000_00_00000_0 'config pin for clocked input
clkconfig       long    %1_00101_0              'config for Smartpin transition output mode
clkdelay        long    1
regdatabus      long    0

deviceaddr      long    $10
rdcommand       long    $A0         
rrcounter
pinmask         long    $ff3f3f3f

' jump addresses for the per COG handlers
cog0_handler    long    cog0
cog1_handler    long    cog1
cog2_handler    long    cog2
cog3_handler    long    cog3
cog4_handler    long    cog4
cog5_handler    long    cog5
cog6_handler    long    cog6
cog7_handler    long    cog7
expansion       long    gfxexpansion - HYPER_driver_start

' EXECF sequences
newflashr       long    (%1000000000111111100000 << 10) + r_flash_burst
newburstr       long    (%0000100000000011111110 << 10) + r_burst
lockedfill      long    (%0011111000011110100110 << 10) + w_locked_fill
restorefill     long    (%1111010001011000001110 << 10) + w_fill_cont
lockedreads     long    (%0000111111000011100000 << 10) + r_locked_burst
lockedwrites    long    (%0000011111110100000000 << 10) + w_locked_burst
regreads        long    (%0011111100011111011000 << 10) + r_reg
regwrites       long    (%0000000110111111011100 << 10) + w_reg
resumewrites    long    (%0000001101000000001110 << 10) + w_resume_burst
resumereads     long    (%0000000000000100000000 << 10) + r_resume_burst

' SKIPF sequences
skipcase_a      long    %01101111100000000001000011111101
skipcase_b      long    %00000000010100000001100000010000
skipcase_c      long    %00000000011000000011111000010001
skipseq_write   long    %00000000000000000000111100000010
skip_fastwrites long    %11111100000

' LUT RAM address values
complete_rmw    long    complete_rmw_lut          
complete_rw     long    complete_rw_lut
continue_read   long    continue_read_lut
continue_write  long    continue_write_lut
check_fill      long    check_fill_lut
doneregread     long    doneregread_lut
noread          long    noread_lut

id0             long    0
id1             long    1
id2             long    2
id3             long    3
id4             long    4
id5             long    5
id6             long    6
id7             long    7

'These next 10 request registers below are also temporarily reused during init 
'and COG updates and need to follow immediately after id0-id7
addr1           long    0
hubdata         long    0
count           long    0
addr2           long    0
total           long    0
offset1         long    0
offset2         long    0
link            long    0

burstwrite                                      'note shared register use during init
initctrl        long    $FEF01000               'round robin, burst=$fff0, no ATN, ERR on busy
id              long    0

latency         long    0
addrhi          long    0
addrlo          long    0
request         long    0
rrlimit         long    0
pinconfig       long    0
clks            long    0
resume          long    0
orighubsize     long    0

' temporary general purpose regs
a               long    0
b               long    0
c               long    0
d               long    0

                fit     502

'..................................................................................................

            orgh

lut_code
'..................................................................................................
' Memory layout for LUT RAM once operational:
'
'  LUT RAM address      Usage
'  ---------------      ----
'    $200-$20F          Bank parameters: burst + type + size per bank (16)
'    $210-$21F          Pin parameters : latency + control pins per bank (16)
'    $220-$26F          COG state storage (8 COGs x 10 longs per COG)
'    $270-$3FF          Main HyperRAM/HyperFlash access code in LUTRAM 
'
' Also during driver COG startup:
' $240-$24F is used as temporary init code stage 2 (fast write patching)
' $250-$26F is used as temporary vector storage 
'..................................................................................................

                org $240    
patchlutram                 testb   HYPER_flags, #FASTWRITE_BIT wz'z=1 if fast writes enabled (sysclk/1)
                if_z        wrlut   shiftpatch, #(p3 & $1ff)'set sysclk/1 clock rate if enabled
                if_z        mov     ptrb, #(patchaddrs & $1ff) 'start with list of addresses to patch
                if_z        rep     #4, #4                  'repeat next 4 instructions 4 times
                if_z        rdlut   c, ptrb++               'read LUT address of instruction to patch
                if_z        rdlut   a, c                    'read instruction from LUT
                if_z        setnib  a, #$a, #7              'add "if_z" to instruction for sysclk/1
                if_z        wrlut   a, c                    'write instruction back to LUT
                            mov     ptrb, ptra              'get startup parameter address
                            add     ptrb, #4                'ptrb[-1] will be cleared at notify
                            mov     b, #0                   'prepare b for upcoming loop
                _ret_       push    #notify                 'continue init in mailbox area

patchaddrs      long        p4-$200                         'LUT addresses to patch for sysclk/1 writes
                long        p5-$200
                long        p6-$200
                long        p7-$200
                            
vectors
' EXECF vectors only used during bank initialization at startup time, reclaimed later for COG state
' HyperRAM jump vectors
                long    (%0011111011110100110100 << 10) + r_single
                long    (%0011111011110100110010 << 10) + r_single
                long    (%0011111011110100101110 << 10) + r_single
                long    (%0000100000000011111110 << 10) + r_burst
                long    (%1111010000010001111100 << 10) + w_single
                long    (%1111010000010001111010 << 10) + w_single
                long    (%1111010000010001110110 << 10) + w_single
                long    (%0000011010000000001100 << 10) + w_burst
' HyperFlash jump vectors
                long    (%0011111011000100110100 << 10) + r_single
                long    (%1111101100010011001010 << 10) + r_flash_word
                long    (%0111110110001001011100 << 10) + r_flash_long
                long    (%1000000000111111100000 << 10) + r_flash_burst
                long    unsupported
                long    (%0000000010000000000000 << 10) + w_flash_word
                long    unsupported
                long    (%0000001111100000000000 << 10) + w_flash_burst
' Control jump vectors
                long    (%0000000000111001111110 << 10) + get_latency
                long    (%0000000001010110000000 << 10) + reg_read
                long    (%0000000001111011111110 << 10) + get_burst
                long    (%0000000001111111000000 << 10) + dump_state
                long    (%0000000011010001111110 << 10) + set_latency
                long    (%0000000000001001000000 << 10) + reg_write 
                long    (%0000000011001011111110 << 10) + set_burst
                long    reconfig 
' Invalid bank jump vectors
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank

'..................................................................................................
' HYPER READS
                                                            ' a b c d e f g

                                                            ' B W L B R L R (a) byte read
                                                            ' Y O O U E O E (b) word read
                                                            ' T R N R S C G (c) long read
                                                            ' E D G S U K R (d) new burst read
                                                            '       T M E E (e) resumed sub-burst
                                                            '         E D A (f) locked sub-burst
                                                            '             D (g) register read


r_flash_burst               getnib  limit, addr1, #0        ' [*]  *d       get first byte index within flash page
                            test    limit, #15 wz           'flash *d       check for special case of zero
                            subr    limit, #16              'cases *d       set first limit to reach end of 16 byte page
            if_z            getword limit, id, #1           'only  *d       restore limit if full page access 
r_burst                     mov     orighubsize, count      '       d       preserve the original transfer count
r_flash_word                andn    addr1, #1               '   b   |       ensure word alignment for flash read
r_flash_long                andn    addr1, #3               '   | c |       ensure long alignment for flash read
r_single                    mov     resume, complete_rmw    ' a b c |       test for read-modify-write after this
                            mov     c, #1 wc                ' a | | |       read a single byte, clear C flag
                            mov     c, #2 wc                ' | b | |       read a single word, clear C flag
                            wrlong  #0, ptrb                ' a b | |       clear upper bits of byte/word mailbox result
                            mov     c, #4 wc                ' | | c |       read a single long, clear C flag
                            tjz     count, #noread_lut      ' | | | d       check for any bytes to send
r_resume_burst              getnib  b, request, #0          ' a b c d e     get bank parameter LUT address
                            rdlut   b, b                    ' a b c d e     get bank limit/mask
                            bmask   mask, b                 ' | | | d e     build mask for addr
r_reg                       getbyte delay, b, #1            ' a b c d e   g get input delay of bank + flags
                            test    delay, #12 wcz          '*a*b*c*d e   g test whether it's protected flash
            if_nc_and_nz    call    #\checkflash_r          '*a*b*c*d e   g if so, go test for allowed cog ID
p0                          shr     b, #17                  ' | | | d e   | scale burst size based on bus rate
                            fle     limit, b                ' | | | d e   | apply any per bank limit to cog limit
                            wrfast  xfreq1, ptrb            ' a b c | |   g setup streamer hub address
r_locked_burst              wrfast  xfreq1, hubdata         ' | | | d e f | setup streamer hub addr
                            mov     c, count                ' | | | d e f | get count of bytes left to read
                            fle     c, limit wc             ' | | | d e f | enforce the burst limit
            if_c            mov     resume, continue_read   ' | | | d e f | burst read will continue
            if_nc           mov     resume, complete_rw     ' | | | d e f | burst read will complete
                            shr     delay, #5 wc            ' a b c d e | g prep delay and test for registered inputs
                            bitnc   regdatabus, #16         ' a b c d e | g setup if data bus is registered or not
compensate                  sub     delay, #1 wc            ' a b c d e | g compensate for unregistered clock @sysclk/1
                            mov     addrhi, addr1           ' a b c d e f | setup address to read from
                            getnib  addrlo, addrhi, #0      ' a b c d e f | get low nibble of address (16 byte half page)
                            shl     addrhi, #4              ' a b c d e f | realign address
                            shr     addrlo, #1 wc           ' a b c d e f | make word address, C flag indicates odd byte
                            setnib  deviceaddr, request, #0 ' a b c d e | | get the bank's pin config address
                            rdlut   pinconfig, deviceaddr   ' a b c d e | | get the pin config for this bank
                            getbyte cspin, pinconfig, #0    ' a b c d e | g byte 0 holds CS pin
                            getbyte clkpin, pinconfig, #1   ' a b c d e | g byte 1 holds CLK pin
                            getbyte rwdspin, pinconfig, #2  ' a b c d e | g byte 2 holds RWDS pin
                            getbyte latency, pinconfig, #3  ' a b c d e | g get latency clock edges for this bank

                            drvl    cspin                   'drop CS pin to start the next transfer
                            fltl    clkpin                  'disable Smartpin clock output mode
                            wxpin   #2, clkpin              '...to resync for 2 clocks between transitions
                            drvl    clkpin                  '...and re-enable Smartpin   
                            drvl    datapins                'enable the data bus
                            setbyte addrhi, rdcommand, #0   'setup burst read command
                            movbyts addrhi, #%%1230         'reverse byte order to be sent on pins
                            movbyts addrlo, #%%3201         'reverse byte order to be sent on pins
                            setword xrecv, c, #0            'setup streamer count for burst
                            testp   rwdspin wz              'check RWDS pin
                            setword ximm, latency, #0       'setup latency edges after command phase
            if_z            add     ximm, latency           'double latency edges if RWDS is high
                            getword clks, ximm, #0          'compute clock transitions from latency
                            addx    clks, #4                'also account for 4 addrhi bytes and any odd byte clock
                            setxfrq xfreq2                  'setup streamer frequency (sysclk/2)
                            waitx   clkdelay                'odd delay shifts clock phase from data
                            xinit   ximm4, addrhi           'send 4 bytes of addrhi data
                            wypin   clks, clkpin            'start memory clock output 
                            testb   c, #0 wz                'test special odd transfer case
                            mov     clks, c                 'reset clock count to byte count
                            xcont   ximm, addrlo            'send 2 bytes of addrlo 
            if_c_ne_z       add     clks, #1                'extra clock to go back to low state
                            waitx   #2                      'delay long enough for DATA bus transfer to complete
                            fltl    datapins                'tri-state DATA bus
                            waitxfi                         'wait for address phase+latency to complete
p1                          wxpin   #2, clkpin              'adjust transition delay to # clocks
p2                          setxfrq xfreq2                  'setup streamer frequency
                            wypin   clks, clkpin            'setup number of transfer clocks
                            wrpin   regdatabus, datapins    'setup data bus inputs as registered or not
                            waitx   delay                   'tuning delay for input data reading
                            xinit   xrecv, #0               'start data transfer and then jump to setup code
                            call    resume                  'go see what we will do next while we are streaming
                            waitxfi                         'wait for streaming to finish
                            wrpin   registered, datapins    'prepare data pins for address phase transfer
            _ret_           drvh    cspin                   'de-assert chip select

'..................................................................................................
' Burst continuation testing

continue_write_lut          skipf   skipseq_write           'customize executed code below for write case
                            mov     resume, resumewrites    ' a (a=skipf sequence for writes)
continue_read_lut           mov     resume, resumereads     ' | setup resume address to execf
                            add     hubdata, c              ' a compute the next hub addr to use
                            sub     count, c                ' a account for the bytes already sent
                            add     c, addr1                ' a compute next external mem address
                            setq    mask                    ' a configure mask for bit muxing
                            muxq    addr1, c                ' a perform address bit muxing
                            testb   id, #LOCKED_BIT wz      ' a check if we can keep sending or need to yield
            if_nz           jmp     #yield                  ' | we have to yield now to other COGs
                            getword limit, id, #1           ' | restore per COG limit for continuing flash reads
                            fle     limit, b                ' | also re-apply per bank limit
            _ret_           push    #continue_read_exec     ' | 
            if_nz           jmp     #yield                  ' a
            _ret_           push    #continue_write_exec    ' a

check_fill_lut              testb   id, #LIST_BIT wc        'test for running from a request list   
                            sub     count, c wz             'account for bytes written
            if_nz           jmp     #continue_fill          'if more filling to go, setup next fill
                            wrlut   #0, ptra[8]             'default is not to resume
            if_nc           jmp     #notify                 'if not a request list then we are done
                            tjns    addr2, #checklist       'if not extended, check next list entry
                            djz     total, #donerepeats     'check for repeats remaining
                            tjs     total, expansion        'check if started with zero repeats (treated as 1)
                            mov     d, orighubsize
                            shl     d, a
                            sub     c, d
                            add     c, offset1
                            mov     count, d                'restore original count
readmask                    getnib  b, request, #0          'get bank parameter LUT address
                            rdlut   b, b                    'get bank limit/mask (in case count=1 above)
                            bmask   mask, b                 'build mask for addr (in case count=1)
continue_fill               add     c, addr1                'add bytes to destination address
                            setq    mask                    'setup bit mask
                            muxq    addr1, c                'setup new external memory address
                            testb   id, #LOCKED_BIT wz      'check if we can keep sending or need to yield
            if_z            execf   lockedfill              'continue next fill operation
                            mov     resume, restorefill
            if_nc           mov     addr2, #0               'clear any left over garbage for non-list requests
            if_nc           call    #yieldfill              'we have to yield now to other COGs
            if_c            call    #yield
                            ret

yield                       wrlut   total, ptra[4]          'save context for next time
                            wrlut   offset1, ptra[5]        'save context for next time
                            wrlut   offset2, ptra[6]        'save context for next time
                            wrlut   link, ptra[7]           'save context for next time
yieldfill                   wrlut   addr1, ptra[0]          'save context for next time
                            wrlut   hubdata, ptra[1]        'save context for next time
                            wrlut   count, ptra[2]          'save context for next time
                            wrlut   addr2, ptra[3]          'save context for next time
                            wrlut   resume, ptra[8]         'save next resume address
                            wrlut   orighubsize, ptra[9]    'save original hub size
            _ret_           push    #poller

apply_bank_limit            getnib  b, request, #0          ' get bank parameter LUT address
                            rdlut   b, b                    ' get bank limit/mask
                            bmask   mask, b                 ' build mask for addr
p3                          shr     b, #17                  ' scale burst size (assuming sysclk/2)
                            fit     $300                    ' we need to patch LUT addresses less than $100 
            _ret_           fle     limit, b                ' apply any per bank limit to cog limit
'..................................................................................................
' Completion of requests

rmw_lut                     rdlong  a, ptrb                 'read back data we just got from external memory
                            not     count                   'invert mask (so 1 bits means new data is written)
                            setq    count                   'make the count the mask
                            muxq    hubdata, a              'select old/new data bits acording to the mask
                            bith    request, #6             'turn the read into write request of same size
                            mov     count, #1               'make it a single item write
                            mov     total, #0               'prevent read-modify-write confusion in lists later
            _ret_           push    #service_request        'return to continue the write service request

complete_rmw_lut            tjnz    count, #rmw_lut         'check for read-modify-write (count is mask)
complete_rw_lut             testb   id, #LIST_BIT wz        'test for running from a request list   
            if_z            skipf   #%10                    'if a request list then skip notification
                            wrlut   #0, ptra[8]             ' a   default is not to resume
            _ret_           push    #notify                 ' |   if not a request list then we are done
                            tjs     addr2, #extendedreq     '     test for special extended request  
checknext                   tjz     addr2, #listcomplete    'not special, check if the list is complete
                            rdlong  pa, ptrb[-1]            'check if list has been aborted by client
                            tjns    pa, #listcomplete       'exit if it has
                            skipf   #%1000                  'do not notify if list is continuing
                            wrlong  addr2, ptrb             ' a  write back next list address
listcomplete                altd    id, #id0                ' a  compute COG's state address
                            bitl    0-0, #LIST_BIT          ' a  clear list flag for this COG
            _ret_           push    #notify                 ' |  we are done with the list
            _ret_           push    #poller                 ' a  we are still continuing the list
extendedreq                 tjz     count, #notransfer_lut  'test for single transfers, do nothing if extd *** 
                            getnib  a, addr2, #7            'check the request type
                            cmp     a, #$F wz               'write burst $F = bank to bank cases (b) or (c)
                            getnib  a, addr1, #6            'get the bank for next operation (assuming case (a))
            if_nz           skipf   skipcase_a              'all other values are hub memory only copies
                                                            ' skipcase (a) gfx copy to/from hub
                                                            ' skipcase (b) gfx copy extmem bank to bank
                                                            ' skipcase (c) linear copy extmem bank to bank
                            getnib  a, addr2, #6            ' |      get the bank for next operation (cases b,c)
                            rdlut   d, a wz                 ' a      load bank information and check if valid
            if_nz           skip    #%1                     ' |      if valid then skip past next instruction
            _ret_           push    #invalidbank            ' |      otherwise bail out after this
                            test    offset1 wz              ' |      check for first offset being zero
            if_z            test    offset2 wz              ' |      ..and the other offset is also zero
            if_z            skipf   skipcase_c              ' |      ..if so, do bank-to-bank copy transfer
                            skipf   skipcase_b              ' |   |  otherwise a graphics copy between banks
                            add     hubdata, c              ' a b c  add bytes just sent to hub address
                            sub     hubdata, orighubsize    ' a b c  rewind by orig hub buffer size
                            add     c, addr1                ' a b c  compute next address to use
                            test    total wz                ' a b |  check for zero tranfers
                            fle     orighubsize, total wz   ' | | c  ensure we don't overwrite
            if_z            jmp     #notransfer_lut         ' a b c  handle the zero length case
                            testb   addr1, #30 wz           ' a b c  check if reading/writing
                            mov     count, orighubsize      ' a b c  reset count to hub buffer size
                            sub     c, orighubsize          ' a b |  rewind to original position
            if_z            add     c, offset1              ' a b |  add any dst scanline offset
            if_nz           add     c, offset2              ' a b |  add any src scanline offset
            if_z            add     hubdata, offset2        ' a | |  add any src scanline offset
            if_nz           add     hubdata, offset1        ' a | |  add any dst scanline offset
                            setq    mask                    ' a b c  configure mask for bit muxing
                            muxq    addr1, c                ' a b c  perform address bit muxing
                            mov     a, addr1                ' | b c  ]
                            mov     addr1, addr2            ' | b c  ]swap read/write addresses
                            mov     addr2, a                ' | b c  ]
                            bitnz   addr1, #30              ' | b c  alternate read/write bursts
                            setnib  addr2, #$F, #7          ' | b c  preserve bank to bank copy
                            sub     total, #1 wz            ' a | |  decrement scanline count
            if_z            sub     total, #1 wz            ' | b |  decrement scanline count after write
            if_z            sub     total, orighubsize wz   ' | | c  decrement bytes sent after write
            if_nz           jmp     #moretransfers          ' a b c  more transfers still to go
                            tjz     link, #listcomplete     ' a b c  test link for next request
                            rdlong  pa, ptrb[-1]            'check if list has been aborted by client
                            tjns    pa, #listcomplete       'will exit if it has
                            wrlong  link, ptrb              'setup list next pointer
                            altd    id, #id0                'compute COG's state address
                            bitl    0-0, #LIST_BIT          'clear list flag for this COG
            _ret_           push    #poller                 'we will return to polling
moretransfers               getbyte request, addr1, #3      'prepare next request
                            testb   d, #FLASH_BIT wz        'test if flash bank is being accessed 
            if_z            jmp     #flashcase              'flash case needs different handling
                            testb   id, #LOCKED_BIT wz      'check if we can keep sending or need to yield
            if_z            skipf   #%1110                  '     skip some code if we are locked
                            testb   addr1, #30 wz           ' a   test if will be reading or writing
            if_z            mov     resume, resumewrites    ' |   resume burst writing
            if_nz           mov     resume, newburstr       ' |   resume burst reading
                            jmp     #yield                  ' |   yield to poller
            if_z            skip    #%1                     '     skip next instruction for writing case
            _ret_           push    #start_read_exec        '(|)  do new read burst next 
            _ret_           push    #start_write_exec       'do new write burst next
flashcase                   testb   addr1, #30 wz           'check if reading/writing next
            if_z            jmp     #noflashwrite           'we can't write to flash this way
                            testb   id, #LOCKED_BIT wz      'check if we can keep sending or need to yield
            if_nz           mov     resume, newflashr       'if yield setup next resume point
            if_nz           jmp     #yield                  '..and save state
            _ret_           push    #start_read_flash_exec  'otherwise continue from here
noflashwrite    _ret_       push    #unsupported   
    
notransfer_lut              skipf   #%11011111              'cancel old skipping, start new sequence
nowrite_lut                                                 '  (a) new skip sequence 
noread_lut                  skipf   #0                      ' | cancel skipping
                            wrlut   #0, ptra[8]             ' | clear resume
                            testb   id, #LIST_BIT wz        ' | test for running from a request list   
            if_nz           jmp     #notify                 ' | if not a request list then we are done
                            testb   addr2, #31 wz           ' | check if extended list item
donerepeats if_z            mov     addr2, link             ' a if so take addr2 from link field
checklist                   call    #checknext              ' | handle running from list
                            ret                             ' | continue processing
            _ret_           push    noread                  'continue end of transfer


'..................................................................................................
' Register accesses
                                                            ' a b

                                                            ' R W  (a) register read
                                                            ' E R  (b) register write
                                                            ' A I 
                                                            ' D T 
                                                            '   E 
reg_write
reg_read                    getnib  b, addr1, #6            ' a b   get bank
                            setnib  deviceaddr, b, #0       ' a b   setup address to read pin config
                            rdlut   pinconfig, deviceaddr wc' a b   get the pin config for this bank
                            setnib  id, addr1, #0           ' a b   get the COG id making the request 
                            getword addrhi, hubdata, #0     ' a b   setup upper 32 bits
                            rolword addrhi, count, #1       ' a b   ..in 48 bit CA field
                            getword addrlo, count, #0       ' a |   setup lower 16 bits of CA field
                            mov     addrlo, hubdata         ' | b   copy data value from high 16 bits
                            setword addrlo, count, #0       ' | b   setup lower 16 bits of CA field
                            bith    addrhi, #31             ' a |   ensure MSB is set for reads!
                            bitl    addrhi, #31             ' | b   ensure MSB is clear for writes
                            rol     addrhi, #8              ' a b   re-arrange order to share code later
            if_nc           execf   regwrites               ' | b   write to register in bank if valid
            if_c            jmp     #invalidbank            ' a b   handle invalid bank case
                            mov     c, #2 wc                ' a     2 byte read, clear C as always aligned
                            getbyte rdcommand, addrhi, #0   ' a     extract type of read command
                            mov     resume, doneregread     ' a     setup return address
                            rdlut   b, b                    ' a     read bank params
                            execf   regreads                ' a     perform the read

doneregread_lut             mov     rdcommand, #$A0         'restore read command
                            rdword  a, ptrb                 'get register result
                            movbyts a, #%%3201              'flip endianness
                            wrlong  a, ptrb                 'clear upper 16 bits of result in mailbox long
            _ret_           push    #notify                 'notify when complete

'..................................................................................................
' HYPER WRITES with latency
                                                            '  a b c d e f g h

                                                            '  B W L F B R L L (a) byte write(s)
                                                            '  Y O O I U E O O (b) word write(s)
                                                            '  T R N L R S C C (c) long write(s)
                                                            '  E D G L S U K K (d) resumed fill
                                                            '          T M E E (e) new burst write
                                                            '            E D D (f) resumed burst
                                                            '              F B (g) locked fill
                                                            '              I U (h) locked burst write
                                                            '              L R 
                                                            '              L S 
                                                            '                T 

w_single                   
w_fill_cont                 mov     xsend, ximm             '  a b c d      
                            mov     a, #1                   '  a | | |          byte size
                            mov     a, #2                   '  | b | |          word size
                            mov     a, #4                   '  | | c |          long size
                            getnib  a, addr1, #7            '  | | | d
                            and     a, #3                   '  | | | d 
                            decod   a, a                    '  | | | d   
                            setword xsend, a, #0            '  a b c d
                            encod   a, a                    '  a b c d
w_burst                     mov     orighubsize, count      '  a b c | e        save original hub size
w_resume_burst              mov     xsend, xhub wz          '  | | | | e f      bursts will stream from hub
w_locked_fill               cmp     count, #1 wz            '  a b c d | | g    optimization for single transfers
                            shl     count, a                '  a b c | | | |    scale into bytes
                            tjz     count, #nowrite_lut     '  a b c d e | |    check for any bytes to write
w_locked_burst              mov     c, count                '  a b c d e f g h  get the number of bytes to write
            if_nz           call    #\apply_bank_limit      '  a b c d e f g h  get per bank limit
                            rdfast  xfreq1, hubdata         '  | | | | e f | h  setup streamer hub addr
                            fle     c, limit wc             '  a b c d e f g h  enforce the burst limit
                            setword xsend, c, #0            '  | | | | e f | h  setup streamer count for burst
                            mov     pb, #1                  '  | | | | e f | h  bursts repeat only once
            if_c            mov     resume, continue_write  '  | | | | e f | h  this burst write will continue
            if_nc           mov     resume, complete_rw     '  | | | | e f | h  this burst write will complete
                            mov     resume, check_fill      '  a b c d | | g |  all fills get tested at end
                            mov     addrhi, addr1           '  a b c d e f g h  assign the next start addr
                            mov     pb, c                   '  a b c d | | g |  get bytes to be sent
                            shr     pb, a                   '  a b c d | | g |  scale back into item count
                            setnib  deviceaddr, request, #0 '  a b c d e f | |  get the pin/configuration lut address
                            rdlut   pinconfig, deviceaddr   '  a b c d e f | |  get the pin config for this bank
                            getbyte cspin, pinconfig, #0    '  a b c d e f | |  byte 0 holds CS pin
                            getbyte clkpin, pinconfig, #1   '  a b c d e f | |  byte 1 holds CLK pin
                            getbyte rwdspin, pinconfig, #2  '  a b c d e f | |  byte 2 holds RWDS pin
                            getbyte latency, pinconfig, #3  '  a b c d e f g h  byte 3 holds latency clock edges

                            drvl    cspin                   'drop CS
                            drvl    datapins                'enable the DATA bus
                            fltl    clkpin                  'disable Smartpin clock output mode
                            wxpin   #2, clkpin              'configure for 2 clocks between transitions
                            drvh    clkpin                  'enable Smartpin   
                            getnib  addrlo, addrhi, #0      'get low nibble of address (16 byte half page)
                            shr     addrlo, #1 wc           'make word address, C flag indicates odd byte
                            shl     addrhi, #4              'realign address
                            setbyte addrhi, #$20, #0        'setup burst write command
                            movbyts addrhi, #%%1230         'reverse byte order to be sent on pins
                            movbyts addrlo, #%%3201         'reverse byte order to be sent on pins
                            testp   rwdspin wz              'check RWDS pin
            if_z            shl     latency, #1             'double latency edges if RWDS is high
                            cmp     resume, check_fill wz   'is this a fill/single write or burst write?
                            push    resume                  'assume single/fill by default
                            setword ximm, latency, #0       'setup latency edges after command phase
                            mov     clks, latency           'compute clock transitions
                            sub     latency, #1             'decrement to compute RWDS one shot values   
                            setword latency, clks, #1       'include original latency value for Smartpin
                            rol     latency, #17            'double to convert to P2 clocks & flip words
                            addx    clks, #4                'also account for 4 addrhi bytes and odd clock
p4          {if_z}          add     clks, c                 'add data transfer size to clocks
                            wrpin   #%0_00100_0, rwdspin    'configure RWDS smartpin for pulse output
                            wxpin   #1, rwdspin             'set the X register to 1 to reload each cycle
                            setxfrq xfreq2                  'setup streamer frequency (sysclk/2)
                            waitx   clkdelay                'odd delay shifts clock phase from data
                            xinit   ximm4, addrhi           'send 4 bytes of addrhi data
                            wypin   clks, clkpin            'start memory clock output 
                            drvh    rwdspin                 'enable RWDS Smartpin
p5          {if_z}          skipf   skip_fastwrites         '(a) skip fast sysclk/1 writes if not enabled
                            xcont   ximm, addrlo            ' a  send addrlo with latency portion
                            wxpin   latency, rwdspin        ' a  setup RWDS delay based on latency
            if_c            xcont   ximm1, #0               ' a  dummy streamer transfer if needed
            if_c            wypin   #1, rwdspin             ' a  issue RWDS high pulse if needed
                            wrpin   #%1_00100_0, rwdspin    ' a  take RWDS smartpin out of tri-state
fastwrite                   waitxfi                         ' | wait for prior sysclk/2 portion to complete
                            wxpin   #1, clkpin              ' | change to transition clock pin on each cycle
                            setxfrq xfreq1                  ' | speed up to sysclk/1 rate transfers
                            xinit   ximm3, #0               ' | dummy streamer command used to align clock
                            xcont   xsend, hubdata          ' | send the data burst at sysclk/1 rate
                            wypin   c, clkpin               ' | trigger the data transfer clocks
p6          {if_z}          rep     #1, pb                  'repeat transfers if filling or for sysclk/2
p7          {if_z}          xcont   xsend, hubdata          'stream the immediate/hub fifo data
                            testb   c, #0 xorc              'set C=1 if we need another final clock
            if_nz           call    resume                  'prepare the next burst transfer
                            waitxfi                         'wait for streaming to finish
            if_c            wrpin   invertrwds, rwdspin     'raise RDWS for final mask
            if_c            wypin   #1, clkpin              'extra clock to get back to low state
                            fltl    datapins                'tri-state DATA bus
                            fltl    rwdspin                 'tri-state RWDS signal
                            drvh    cspin                   'de-assert chip select
            _ret_           wrpin   #0, rwdspin             'remove smartpin mode and return


'..................................................................................................
' HYPER WRITES without latency
                                                            ' a b c

                                                            ' W B R  (a) word write
                                                            ' O U E  (b) burst write
                                                            ' R R G  (c) register write
                                                            ' D S 
                                                            '   T

w_flash_burst               tjz     count, #nowrite_lut     '   b     ensure count is non-zero
                            mov     a, #0-0 wcz             '   b     clear C, set Z, prepare temp reg "a"
                            sets    a, addr1                '   b     get 9 LSBs of flash address
                            subr    a, const512             '   b     compute 512-(addr1 & $1ff)
                            fle     count, a                '   b     limit crossing any 512 byte boundary
                            mov     ximm, ximm2             '   b     sending 2 bytes from addrlo
                            rdfast  xfreq1, hubdata         '   b     setup streamer hub addr
                            setword xhub, count, #0         '   b     setup clocks in data phase
                            add     count, #6               '   b     include command address part
w_flash_word                getnib  b, request, #0          ' a b     get bank being accessed
w_reg                       call    #\checkflash_w          ' a b c   check protection state (flags preserved)
                            mov     ximm, ximm4             ' a | c   sending 4 bytes from addrlo
                            cmp     count, #1 wcz           ' a | |   check if doing a single write
            if_c            jmp     #nowrite_lut            ' a | |   count is zero, so nothing to write
            if_nz           jmp     #unsupported            ' a | |   no word fill allowed for flash, single only
                            mov     count, #8 wz            ' a | c   setup clock count, clear z
                            mov     addrhi, addr1           ' a b |
                            getnib  addrlo, addrhi, #0      ' a b |   get low nibble of address (16 byte half page)
                            shr     addrlo, #1 wc           ' a b |   make word address, C flag indicates odd byte
                            shl     addrhi, #4              ' a b |   realign address
                            setbyte addrhi, #$20, #0        ' a b |   setup linear burst write command
                            setword addrlo, hubdata, #1     ' a b |
                            movbyts addrlo, #%%2310         ' | b c   flip register endianness, burst is don't care
                            setnib  deviceaddr, request, #0 ' a b |   get the pin/configuration lut address
                            rdlut   pinconfig, deviceaddr   ' a b |   get the pin config for this bank
                            getbyte cspin, pinconfig, #0    ' a b c   byte 0 holds CS pin
                            getbyte clkpin, pinconfig, #1   'byte 1 holds CLK pin
                            testb   count, #0 orc           'check if odd number of bytes to write
            if_c            jmp     #alignmenterror         'Note: C is already clear for reg writes
                            movbyts addrhi, #%%1230         'reverse byte order to be sent on pins
                            movbyts addrlo, #%%3201         'reverse byte order to be sent on pins

                            drvl    cspin                   'active chip select
                            drvl    datapins                'enable the DATA bus
                            fltl    clkpin                  'disable Smartpin clock output mode
                            wxpin   #2, clkpin              'configure for 2 clocks between transitions
                            drvh    clkpin                  'enable Smartpin   
                            setxfrq xfreq2                  'setup streamer frequency (sysclk/2)
                            waitx   clkdelay                'odd delay shifts clock phase from data
                            xinit   ximm4, addrhi           'send 4 bytes of addrhi data
                            wypin   count, clkpin           'start memory clock output 
                            xcont   ximm, addrlo            'send 2 or 4 bytes of addrlo + data
            if_z            xcont   xhub, hubdata           'optionally stream burst data from hub
                            waitxfi                         'wait for streamer to end
                            fltl    datapins                'tri-state DATA bus
                            drvh    cspin                   'de-assert chip select
                            wrlut   #0, ptra[8]             'no resuming
                            testb   id, #LIST_BIT wz        'check if running from a list
            if_nz           jmp     #notify                 'notify if not
                            tjns    addr2, #checklist       'reuse existing code to save instructions
                            jmp     #unsupported            'extended list items not supported for these writes
                            
'..................................................................................................
' HyperFlash COG access checks

checkflash_w                rdlut   b, b                    'read bank params
                            getnib  a, b, #2                'get flags 
                            test    a, #$C wcz              'check for protected flash bank
            if_z_or_c       ret     wcz                     'continue request if not protected flash
checkflash_r                getnib  a, b, #4                'get COG ID field
                            xor     a, id                   'compare against allowed COG ID 
                            test    a, #7 wz                'check if it matches
            if_z            setword b, const512, #1         'if so assign a default burst size
            if_z            ret     wcz                     '... and the request can continues
                            mov     rdcommand, #$A0         'restore read command on failed flash reg reads
                            test    id, ##$F000 wz          'check COG polling type
            if_z            jmp     #poller                 'stall RR cogs
                            jmp     #busyerror              'flash is busy, return error


        fit 1024

'--------------------------------------------------------------------------------------------------
        orgh

gfxexpansion
                            'future code intended for expansion of graphics drawing capabilities
                            'drvl #56 
              '             jmp #donerepeats                'just return for now
skipwrite
 
                            cmp     addr1, addr2 wz         'see if we've reached the end
            if_z            jmp     #donerepeats            'nothing more to draw
                            add     total, #1               'restore total after decrement
                            mov     b, offset1              'get error term
                            shl     b, #1                   'compute e2 = 2 x error
                            getword d, offset2, #0          'get dx = abs(x0-x1)
                            sar     offset2, #16            'get dy = -abs(y0-y1)
                            cmps    b, offset2 wc           'compare if e2 >= dy
                            mov     c, #0                   'clear accumulator reg
            if_c            skip    #%1110                  'if not, skip
                            decod   a                       'decode as 1,2,or 4 byte size
                            add     offset1, offset2        'err+=dy 
                            testb   total, #16 wz           'check sign sx   
                            sumz    c, a                    'accumulator +/- size a (x0+=sx)
                            cmps    d, b wc                 'compare if e2 <= dx
            if_c            skip    #%11110                 'if not, skip
                            rolword offset2, d, #0          'restore offset
                            add     offset1, d              'err+=dx
                            testb   total, #17 wz           'check sign sy
                            getword d, total, #0            'get line width
                            sumz    c, d                    'accumulator +/- linewidth (y0+=sy)
                            encod   a wc                    'restore size and set carry
                            mov     count, orighubsize      'reset the fill width
                            shl     count, a                '..for the bit depth
                            jmp     #readmask               'continue filling


    
'--------------------------------------------------------------------------------------------------
{{
LICENSE TERMS
-------------
Copyright 2020,2021 Roger Loh

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
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
THE SOFTWARE.
}}
