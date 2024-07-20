{{
--------------------------------------------------------------------------------------------------

 Propeller 2 PSRAM Driver COG
 ============================
 
 This driver enables P2 COGs to access multiple PSRAM devices sharing a common data bus.

 Features:
 --------
 
 * single COG PSRAM based driver
 * supports 4x4bit PSRAM devices formin a 16 bit data bus, with common clock and chip enable
 * up to 16 banks of memory devices can be mapped on 16MB/32MB/64MB/128MB/256MB boundaries 
 * device selected on the bus will be based on the address bank in the memory request
 * configurable control pins and shared data bus group for the memory devices
 * uses a 3 long mailbox per COG for reading memory requests and for writing results
 * error reporting for all failed requests
 * supports strict priority and round-robin request polling (selectable per COG)
 * optional notification of request completion with the COGATN signal to the requesting COG
 * re-configurable maximum transfer burst size limits setup per COG, and per device
 * automatic fragmentation of transfers exceeding configured burst sizes or page
 * sysclk/2 read/write transfer rates are supported and optionally sysclk/1 transfer rates
 * provides single byte/word/long and burst transfers for reading/writing external memory
 * input delay can be controlled to allow driver to operate with varying P2 clocks/temps/boards
 * graphics copies/fill and other external memory to memory copy operations are supported
 * request lists supported allowing multiple requests with one mailbox transaction (DMA engine)
 * maskable read-modify-write support for atomic memory changes and sub-byte sized pixel writes
 * unserviced COGs can be removed from the polling loop to reduce latency

 Revision history:
 ----------------
   0.9b   22 DEC 2021  rogloh      -general BETA release-

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
' The first long of the structure (operating frequency) gets zeroed when the driver COG has
' completed its initialization so the caller can determine when it can start using the mailbox.
'
' COG startup parameter format (8 consecutive longs)
'   startupParams[0]: P2 operating frequency in Hz (is zeroed after startup)
'   startupParams[1]: configuration flags for driver
'   startupParams[2]: port A reset mask (lower 32 P2 pins)
'   startupParams[3]: port B reset mask (upper 32 P2 pins)
'   startupParams[4]: base P2 pin number of data bus used by driver (0, 8,16,24,32,40,48,56)
'   startupParams[5]: pointer to 32 long device parameter structure in HUB RAM
'   startupParams[6]: pointer to 8 long COG parameter structure in HUB RAM
'   startupParams[7]: mailbox base address for this driver to read in HUB RAM (driver clear the mailbox mem)
'
' 
' Configuration flags:
'
'  bit31 - reserved (should be set to 0)
'  bit30 - reserved (should be set to 0)
'  bit29 - set 1 to enable unregistered clock pin, otherwise 0 for registered clock pins (default)
'  bit28 - set 1 to enable expanded graphics functions using HUB-exec calls, 0 to disable
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
'    This is the burst size allowed for the device in bytes, assuming a sysclk/1 transfer rate.
'    When unlimited.   It should be configured to not exceed the maximum CS low time of 8us. 
'
'  Delay:
'   This nibble is comprised of two fields which create the input delay needed for memory reads.
'   bits
'   15-13 = P2 clock delay cycles when waiting for valid data bus input to be returned
'   12 = set to 0 if bank uses registered data bus inputs for reads, or 1 for unregistered
'  
'  Flags:
'   bit
'   11 = reserved (set to 0)
'   10 = memory type: 0 = RAM, or 1 = ROM (writes get blocked)
'  9-8 = reserved
'   
'   Size:
'    number of valid address bits - 1 used by the device mapped into this bank, e.g.:
'      16MB = 23 
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
' | I |   Reserved    |   Reserved   |    CLK pin    |    CE pin    |
'  -----------------------------------------------------------------
'
'  The "I" bit (bit31) is the "invalid" bit, it must be set to 1 if the bank is not in use.
'
'  The 2 pin fields define the P2 pins attached to the device control pins (and range from 0-63).
'  Both pins are required to be defined and all are used by this driver.
'--------------------------------------------------------------------------------------------------
{{

' Returns the address of this driver's location in hub RAM to start it

PUB getDriverAddr() : r
    return @PSRAM_driver_start
}}

'--------------------------------------------------------------------------------------------------
DAT 
                            orgh
scratch_buffer              long    0[8]    ' 8 scratch longs in hub (one per possible driver COG id)

PSRAM_driver_start
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
'  $00-$17  is init as temporary init code - stage 2 (EXECF vector table init)
' $100-$1FF is uses as temporary init code - stage 1 (does HW setup & majority of driver init)
'..................................................................................................
                            
' Mailbox storage after vector initialization

req0                        call    #.PSRAM_init             'do HW setup/initialization
data0                       rdlut   c, b wz                 'read bank info          
count0                      mov     a, b                    'set COGRAM address low nibble
req1        if_z            mov     ptra, #(no_vect & $1ff) 'set pointer to invalid vectors
data1                       testb   c, #FLASH_BIT wc        'check type: R/O PSRAM (1) or R/W PSRAM (0)
count1      if_nc_and_nz    mov     ptra, #(rw_vect & $1ff) 'set pointer to R/W PSRAM vectors
req2        if_c_and_nz     mov     ptra, #(ro_vect & $1ff) 'set pointer to R/O PSRAM vectors
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
count5                      cmp     ptra, header wc         'check if LUT address range 
req6        if_nc           cmpr    ptra, trailer wc        '...falls in/outside control region
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

.PSRAM_init                        
                            ' get driver scratch long address in hub
                            cogid   hubscratch              'get cogid
                            add     hubscratch, #1          'increase by 1 from 1-8
                            mul     hubscratch, #4          'multiply by 4 to get 4-32
                            subr    hubscratch, ptrb        'get scratch area as one of 8 longs before driver
                    
                            ' read in the additional LUT RAM code
                            add     lutcodeaddr, ptrb       'determine hub address of LUT code   
                            setq2   #511-(hwinit & $1ff)    'read the remaining instructions 
                            rdlong  hwinit & $1ff, lutcodeaddr  '...and load into LUT RAM address $240

                            ' read the startup parameters
                            setq    #8-1                    'read 8 longs from hub
                            rdlong  startupparams, ptra     '.. as the startup parameters 

                            ' setup some of the config flag dependent state and patch LUTRAM
                            testb   .PSRAM_flags, #EXPANSION_BIT wz'test for graphics expansion enabled

            if_z            add     expansion, ptrb         'compensate for HUB address
            if_nz           mov     expansion, ##donerepeats'disable expansion when flag bit clear
                            testb   .PSRAM_flags, #UNREGCLK_BIT wc 'check if we have registered clks
            if_nc           or      clkconfig, registered   'enable this if so
            if_nc           mov     clkdelay, #0            'remove clk delay if registered clock

                            ' setup data pin modes and data bus pin group in streamer commands
                            and     datapins, #%111000      'compute base pin
                            or      datapins, ##(15<<6)     'configure 16 pins total
                            mov     a, datapins             'get data pin base
                            wrpin   registered, datapins    'prepare data pins for address phase transfer
                            shr     a, #3                   'determine data pin group
                            and     a, #7                   'ignore the unwanted bits
                            or      a, #8
                            setnib  ximm8lut, a, #5         'setup bus group in streamer
                            setnib  xrecvlo8, a, #5
                            setnib  xrecvdata, a, #5
                            setnib  xsenddata, a, #5
                            setnib  xsendimm, a, #5
                            add     a, #1
                            setnib  xrecvhi8, a, #5         ' increase port by one
 
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
            if_nc           drvh    cspin                   'setup pins for all banks
            if_nc           getbyte clkpin, pinconfig, #1   'read CLK pin number
            if_nc           fltl    clkpin                  'disable Smartpin clock output mode
            if_nc           wrpin   clkconfig, clkpin       'set clk to Smartpin transition output
            if_nc           wxpin   #1, clkpin              'configure for 1 clocks between transitions
            if_nc           drvl    clkpin                  'set clk state low
pinloop
                            ' generate minimum CE high time before access
                            qdiv    frequency, ##1000000    'convert from Hz to MHz
                            getqx   c                       'get P2 clocks per microsecond
                            mov     a, #MIN_CS_DELAY_US     'get time before active delay in microseconds 
                            mul     a, c                    'convert microseconds to clocks
                            waitx   a                       'delay
                            call    #hwinit                 'setup HW into QSPI mode

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
                            sets    d, #(ctrl_vect & $1ff)
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
                            mov     header, id              'get cog ID
                            mul     header, #10             'multiply by size of state memory per COG
                            add     header, #$20            'add to COG state base address in LUT
                            mov     trailer, header         'determine start/end LUT address
                            add     trailer, #9             '...for control region
                            or      id, initctrl            'set id field for control COG
                            altd    id, #id0
                            mov     0-0, id                 'setup id field for notification
                            mov     ptrb, ptra              'get startup parameter address
                            add     ptrb, #4                'ptrb[-1] will be cleared at notify
                            mov     b, #0                   'prepare b for upcoming loop
                _ret_       push    #notify                 'continue init in mailbox area
 
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

'..................................................................................................
' Variables

ximm8lut        long    $20CF_0008              '8 nibble transfers via LUT to pins
xrecvlo8        long    $E0C6_0001              '1 byte read from lo bus pins
xrecvhi8        long    $E0C6_0001              '1 byte read from hi bus pins
xrecvdata       long    $F0C0_0000              'arbitrary 16 bit reads from 16 bit bus pins
xsenddata       long    $B0C0_0000              'arbitrary 16 bit writes from hub to pins
xsendimm        long    $70C0_0002              'arbitrary 2x16 bit immediate writes from imm to pins

xfreq1          long    $80000000
xfreq2          long    $40000000
delay           long    3

lutcodeaddr                 
startupparams
excludedcogs                                    'careful: shared register use!
frequency       long    lut_code - PSRAM_driver_start 'determine offset of LUT code from base
.PSRAM_flags     long    0
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
registered      long    %100_000_000_00_00000_0 'config pin for clocked input
clkconfig       long    %1_00101_0              'config for Smartpin transition output mode
clkdelay        long    1
regdatabus      long    0

deviceaddr      long    $10
rrcounter
pinmask         long    $ff3f7f7f

' jump addresses for the per COG handlers
cog0_handler    long    cog0
cog1_handler    long    cog1
cog2_handler    long    cog2
cog3_handler    long    cog3
cog4_handler    long    cog4
cog5_handler    long    cog5
cog6_handler    long    cog6
cog7_handler    long    cog7
expansion       long    gfxexpansion - PSRAM_driver_start

' EXECF sequences
newburstr       long    (%0010001010000000011110 << 10) + r_burst
lockedfill      long    (%0000000011101111100110 << 10) + w_locked_fill
restorefill     long    (%0111010000000101111100 << 10) + w_fill_cont
lockedreads     long    (%0000000000111111001000 << 10) + r_locked_burst
lockedwrites    long    (%0000111111100000111100 << 10) + w_resume_burst
resumewrites    long    (%0000111111100000000000 << 10) + w_resume_burst
resumereads     long    (%1000010010001010000000 << 10) + r_resume_burst
'singlewrites    long    (%0000000010011111101000 << 10) + single_write


' SKIPF sequences
skiptable
                long    %11000011000001111110  ' read modify write byte
                long    %110011011100001110    ' read modify write word
                long    0                      ' read modify write long
                long    %1111110               ' single byte read
                long    %11110001110           ' single word read
pattern2        long    0
pattern3        long    0
singlelong      long    %1001110111  
skipcase_a      long    %01101111100000000001000011111101
skipcase_b      long    %00000000010100000001100000010000
skipcase_c      long    %00000000011000000011111000010001
skipseq_write   long    %00000000000000000000111100000010

' LUT RAM address values
complete_rw     long    complete_rw_lut
continue_read   long    continue_read_lut
continue_write  long    continue_write_lut
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

header          long    0
trailer         long    0
cmdaddr         long    0
request         long    0
rrlimit         long    0
pinconfig       long    0
clks            long    0
resume          long    0
orighubsize     long    0
wrclks          long    0

pattern         long    0
hubscratch      long    0
val4k           long    4096

' temporary general purpose regs
a               long    0
b               long    0
c               long    0
d               long    0

                fit     502

'..................................................................................................

            orgh

lut_code
'HW init code up to 80 longs

'..................................................................................................
' Memory layout for LUT RAM once operational:
'
'  LUT RAM address      Usage
'  ---------------      ----
'    $200-$20F          Bank parameters: burst + type + size per bank (16)
'    $210-$21F          Pin parameters : latency + control pins per bank (16)
'    $220-$26F          COG state storage (8 COGs x 10 longs per COG)
'    $270-$3FF          Main PSRAM access code in LUTRAM 
'
' Also during driver COG startup:
' $230-$24F is used for HW init setup
' $250-$26F is used as temporary vector storage 
'..................................................................................................

                org $230    

' routines to (re-)initialize PSRAM chip into QSPI mode from whatever it was before
hwinit                      setxfrq xfreq2
                            pollxfi
                            mov     pa, ##$5555FFFF         '$F5 - exit QSPI mode if we were in this mode
                            call    #sendqspi
                            mov     pa, ##$0FF00FF0         '$66 - reset enable
                            call    #sendspi
                            mov     pa, ##$F00FF00F         '$99 - reset
                            call    #sendspi
                            mov     pa, ##$F0F0FF00         '$35 - enter quad spi mode
                            call    #sendspi 
                            ret

sendqspi                    mov     clks,#4
                            skipf   #%110
                            mov     pb, xsendimm

sendspi                     mov     clks, #16
                            mov     pb, ximm8lut
                            drvl    cspin                   'active low chip select
                            drvl    datapins                'enable the DATA bus
                            xinit   pb, pa                  'send 32 bit immediate data
                            wypin   clks, clkpin            'start memory clock output 
                            waitxfi                         'wait for the completion
                            fltl    datapins                'float data bus
                            drvh    cspin                   'raise chip select
            _ret_           waitx   #200                    'delay before return to ensure CS delay

                long    0[$270-32-$]
    
                fit     $270-32  ' keep room for 32 vector longs
' EXECF vectors only used during bank initialization at startup time, reclaimed later for COG state
rw_vect ' PSRAM jump vectors
                long    (%1110111001011010010100 << 10) + r_single
                long    (%1110111001011010010100 << 10) + r_single
                long    (%1010111001011010010000 << 10) + r_single
                long    (%0010001010000000011110 << 10) + r_burst
                long    (%0111010000000000111000 << 10) + w_single
                long    (%0111010000000000100100 << 10) + w_single
                long    (%0111010000000000011100 << 10) + w_single
                long    (%1111111000000000000110 << 10) + w_burst
ro_vect ' R/O PSRAM jump vectors
                long    (%1110111001011010010100 << 10) + r_single
                long    (%1110111001011010010100 << 10) + r_single
                long    (%1010111001011010010000 << 10) + r_single
                long    (%0010001010000000011110 << 10) + r_burst
                long    unsupported
                long    unsupported
                long    unsupported
                long    unsupported
ctrl_vect ' Control jump vectors
                long    (%0000000000111001111110 << 10) + get_latency
                long    unsupported
                long    (%0000000001111011111110 << 10) + get_burst
                long    (%0000000001111111000000 << 10) + dump_state
                long    (%0000000011010001111110 << 10) + set_latency
                long    unsupported
                long    (%0000000011001011111110 << 10) + set_burst
                long    reconfig 
no_vect ' Invalid bank jump vectors
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank
                long    invalidbank

                fit     $270
'..................................................................................................
' PSRAM READS
                                                            ' a b c d e f
                                                            ' B W L B R L  (a) byte read
                                                            ' Y O O U E O  (b) word read
                                                            ' T R N R S C  (c) long read
                                                            ' E D G S U K  (d) new burst read
                                                            '       T M E  (e) resumed sub-burst
                                                            '         E D  (f) locked sub-burst


r_burst                     mov     orighubsize, count      '       d      preserve the original transfer count
r_single                    test    count wz                ' a b c |      test for RMW (z=1 if not RMW)
                            mov     pattern, #%100110110    ' a b c |      setup future skip pattern
            if_z            andn    pattern, #%100100000    ' | | c |      no need to rearrange long data
                            setword xrecvdata, #2, #0       ' a b c |      2x16 bit transfers to read a long
                            tjz     count, #noread_lut      ' | | | d      check for any bytes to send
r_resume_burst              getnib  b, request, #0          ' a b c d e    get bank parameter LUT address
                            rdlut   b, b                    ' a b c d e    get bank limit/mask
                            bmask   mask, b                 ' | | | d e    build mask for addr
                            getbyte delay, b, #1            ' a b c d e    get input delay of bank + flags
p0                          shr     b, #17                  ' | | | d e    scale burst size based on bus rate
                            fle     limit, b                ' | | | d e    apply any per bank limit to cog limit
                            shr     delay, #5 wc            ' a b c d e    prep delay and test for registered inputs
            _ret_           bitnc   regdatabus, #16         ' | | | | |    setup if data bus is registered or not
                            bitnc   regdatabus, #16         ' a b c d e    setup if data bus is registered or not
                            wrfast  xfreq1, ptrb            ' a b c | |    setup streamer hub address for singles
r_locked_burst              wrfast  xfreq1, hubdata         ' | | | d e f  setup streamer hub address for bursts
                            mov     c, count                ' | | | d e f  get count of bytes left to read
                            fle     c, limit wc             ' | | | d e f  enforce the burst limit
                            mov     clks, #32 wc            ' a b c | | |  16 clock transitions to read a single long
            if_c            mov     resume, continue_read   ' | | | d e f  burst read will continue
            if_nc           mov     resume, complete_rw     ' | | c d e f  burst/long read will complete
                            skipf   #%10000                 ' | | | d | |  extend skipf sequence for burst
                            setnib  deviceaddr, request, #0 ' a b c d e |  get the bank's pin config address
                            rdlut   pinconfig, deviceaddr   ' a b c d e |  get the pin config for this bank
                            getbyte cspin, pinconfig, #0    ' a b c d e |  byte 0 holds CS pin
                            getbyte clkpin, pinconfig, #1   ' a b c d e |  byte 1 holds CLK pin
                            jmp     #readcommon             ' a b c | | |  skip burst transfer setup for single reads

                            ' fall through to read bursts
                        
burst_read                  ' handle the 4k page boundary by splitting any read bursts that cross it 
                            mov     d, addr1                'get start address
                            zerox   d, #11                  'only keep 12 LSBs
                            subr    d, val4k                'figure out how many bytes remain before we hit the boundary
                            fle     c, d wc                 'compare this size to our transfer size and limit it
            if_c            mov     resume, continue_read   'and we will continue with a sub-burst again
                            mov     pattern, #0             'enable all by default
                            testb   addr1, #1 wc            'test if start addr starts in second word
                            bitnc   pattern, #1             'enable delay cycle if so
                            wrc     clks                    'and account for its clock cycle
                            testb   addr1, #0 wc            'test if start addr starts on odd byte
                            bitnc   pattern, #2             'add hi 8 transfer initially
                            mov     d, c                    'get count of bytes to be read into HUB
            if_c            sub     d, #1                   'minus 1 if start addr was odd
                            shr     d, #1 wz                'divide by two bytes to work out 16 bit transfers
                            addx    clks, d                 'account for this in the clock (with extra 8 bit cycle)
                            setword xrecvdata, d, #0        'set the word transfer clocks needed in streamer
                            bitz    pattern, #3             'adjust the pattern to include this
                            testb   c, #0 xorc              'test for end address
                            bitnc   pattern, #4             'include low 8 bit transfer if required
                            addx    clks, #14               'account for 14 address+delay clocks + and low 8 bit transfer
                            add     clks, clks
readcommon
                            mov     cmdaddr, addr1          'get start address of transfer
                            shr     cmdaddr, #2             'align to 32 bit boundary
                            setbyte cmdaddr, #$EB, #3       'add quad read command

                            splitb  cmdaddr                 'reverse nibbles in address to match bus order
                            rev     cmdaddr
                            movbyts cmdaddr, #%%0123
                            mergeb  cmdaddr

                            drvl    cspin                   'activate chip select
                            drvl    datapins                'enable data bus
            '               setxfrq xfreq2                  'setup streamer frequency (sysclk/2)
                            xinit   ximm8lut, cmdaddr       'stream out command+address
                            wypin   clks, clkpin            'start clock output
                            xcont   #0,#0                   '1 dummy transfer to resync to the streamer for timely tri-stating
                            xcont   #6,#0                   '6 clock transfers for bus turnaround delay
                          '  drvh    datapins                'enable this only if validating actual tri-state time on a scope
                            fltl    datapins                'safe to float the data bus, address has been sent by now
                            wrpin   regdatabus, datapins    'setup data bus inputs as registered or not for read timing control
                            setq    xfreq1                  'reconfigure with single cycle xfreq (sysclk/1)
                            xcont   delay, #0               'configurable fine input delay per P2 clock cycle
                            xcont   #6, #0                  'fixed delay offset to expand delay range
                            skipf   pattern                 'choose path below
                                                            'Bursts Bytes Words Longs  RMW FromWrites
                            setq    xfreq2                  '   a     b     c     d     e    f  restore sysclk/2 operation
                            xcont   #1, #0                  '   ?     |     |     |     |    |  skips over LSW
                            xcont   xrecvhi8, #0            '   ?     |     |     |     |    |  1x8 bits on high 8 bit bus
                            xcont   xrecvdata, #0           '   ?     b     c     d     e    f  nx16 bits on 16 bit bus
                            xcont   xrecvlo8, #0            '   ?     |     |     |     |    |  1x8 bits on low 8 bit bus
                            call    resume                  '   a     |     |     d     |    |  chooses what to do next
                            waitxfi                         '   a     b     c     d     e    f  wait for streaming to finish
                            wrpin   registered, datapins    '   a     b     c     d     e    f  restore data pins for next transfer
            _ret_           drvh    cspin                   '   a     |     |     d     |    f  de-assert chip select and return
                            drvh    cspin                   '         b     c           e       deassert chip select and continue
                            getnib  d, request, #1          'get request code value
            if_nz           sub     d, #3                   'offset for table if RMW
                            altd    d, #skiptable-5         'patch next instruction
                            skipf   0-0                     'generate skip sequence
                                                            ' B   W  RMWB RMWW RMLL 
                            rdlong  a, ptrb                 ' a   b   c    d    e   read back data written to mailbox
                            setq    count                   ' |   |   |    |    e   setup bit mux mask
                            muxq    a, hubdata              ' |   |   |    |    e   apply bit mux
                            jmp     #writeback              ' |   |   |    |    e   write back to external memory
                            testb   addr1, #1 wc            ' |   b   |    d        test for odd word address read case
            if_c            getword pb, a, #1               ' |   b   |    d        select hi word in long
            if_nc           getword pb, a, #0               ' |   b   |    d        select lo word in long
                            mov     d, addr1                ' a   |   c    d
                            and     d, #3                   ' a   |   c    |        get LSBs of address
                            altgb   d, #a                   ' a   |   c    |        index into long
                            getbyte pb                      ' a   |   c    |        and extract the byte
                            wrlong  pb, ptrb                ' a   b   c    d        write data back now zeroed and aligned
                            call    #complete_rw_lut        ' a   b   |    |        process any list setup first
                            ret                             ' a   b   |    |        then return
                            setq    count                   '         c    d        setup bit mux mask
                            muxq    pb, hubdata             '         c    d        apply bit mux
                            altsb   d, #a                   '         c    |
                            setbyte 0-0, pb, #0             '         c    |
            if_c            setword a, pb, #1               '         |    d
            if_nc           setword a, pb, #0               '         |    d
writeback                   mov     pattern2, #%110111      'setup next skip pattern to send a single long and resume
                            mov     hubdata, a              'write a to PSRAM
                            mov     wrclks, #20             '20 clocks to write a long
                            mov     resume, complete_rw     'we'll complete the operation after this
                            jmp     #writecommon

'..................................................................................................
' Burst continuation testing

continue_write_lut          skipf   skipseq_write           'customize executed code below for write case
                            mov     resume, resumewrites    ' a (a=skipf sequence for writes)
continue_read_lut          
                            mov     resume, resumereads     ' | setup resume address to execf
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
' Completion of requests

complete_rw_lut             
                            testb   id, #LIST_BIT wz        'test for running from a request list   
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
                            testb   id, #LOCKED_BIT wz      'check if we can keep sending or need to yield
            if_z            skipf   #%1110                  '     skip some code if we are locked
                            testb   addr1, #30 wz           ' a   test if will be reading or writing
            if_z            mov     resume, resumewrites    ' |   resume burst writing
            if_nz           mov     resume, newburstr       ' |   resume burst reading
                            jmp     #yield                  ' |   yield to poller
            if_z            skip    #%1                     '     skip next instruction for writing case
            _ret_           push    #start_read_exec        '(|)  do new read burst next 
            _ret_           push    #start_write_exec       'do new write burst next

'..................................................................................................
' PSRAM WRITES
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
w_fill_cont           
                            getnib  a, addr1, #7            '  a b c d          obtain request
                            and     a, #3                   '  a b c d          extract encoded size (0=B,1=W,2=L)
                            movbyts hubdata, #0             '  a | | |          replicate byte across long
                            movbyts hubdata, #%01000100     '  | b | |          replicate word across long
                            andn    addr1, #1               '  | b | |          align word addresses
                            andn    addr1, #3               '  | | c |          align long addresses
w_burst                     mov     orighubsize, count      '  a b c | e        save original hub size
w_locked_fill               cmp     count, #1 wz            '  a b c d |   g    optimization for single transfers
                            shl     count, a                '  a b c | |   |    scale into bytes
                            tjz     count, #nowrite_lut     '  a b c d e   |    check for any bytes to write
w_resume_burst              mov     c, count                '  a b c d e f g h  get the number of bytes to write
                            call    #\r_resume_burst        '  a b c d e f g h  get per bank limit and read delay info
               ' disable call to r_resume_burst for single longs when z=0
                            setnib  deviceaddr, request, #0 '  a b c d e f | |  get the pin/configuration lut address
                            rdlut   pinconfig, deviceaddr   '  a b c d e f | |  get the pin config for this bank
                            getbyte cspin, pinconfig, #0    '  a b c d e f | |  byte 0 holds CS pin
                            getbyte clkpin, pinconfig, #1   '  a b c d e f | |  byte 1 holds CLK pin
                            mov     pattern2, #%111111 wz   '  | | | | e f | h  setup base skip pattern for bursts
                            fle     c, limit wc             '  a b c d e f g h  enforce the burst limit
            if_c            mov     resume, continue_write  '  | | | | e f | h  this burst write will continue
            if_nc           mov     resume, complete_rw     '  | | | | e f | h  this burst write will complete
                            mov     a, hubdata              '  | | | | e f | h  save streamer hub addr
                            mov     wrclks, #20             '  a b c d | | g |  prepare base clocks
                            testb   a, #1 wc                '  a b c d | | g |  check if longs (c=1) or bytes/words (c=0)
                            mov     pattern2, singlelong    '  a b c d | | g |  setup skip pattern for single long write
            if_z_and_c      jmp     #writecommon            '  a b c d | | g |  optimized single long write
            if_z_and_nc     xor     pattern2, #%1001        '  a b c d | | g |  modify pattern for single byte/word write
            if_z_and_nc     jmp     #single_write           '  a b c d | | g |  optimized single byte/word write
                            mov     pattern2, #%1111        '  a b c d | | g |  setup pattern for fills
        
            'PSRAM write data logic gets rather complex/messy here unfortunately, and multiple cases need to be handled:
            '
            '  At least one of these 3 optional components will be sent
            '     header - first partial long of data, gets aligned to PSRAM long boundary
            '     body - N x full longs of data
            '     trailer - last partial long of data
            '
            '  Both the header and trailer need to first read a long from PSRAM first then mask with new data
            '
            'Case    Type                           Sends
            ' 1)     Single byte/word write         header only (takes its own optimized path)
            ' 2)     Single long write              body only (takes its own optimized path)
            ' 3)     Multiple byte/word fill        optional header, optional body, optional trailer
            ' 4)     Multiple long fill             body only
            ' 5)     Burst write                    optional header, optional body, optional trailer

                            'if not just a single transfer we need to work out how many bytes are left to the 4kB page boundary
                            mov     d, addr1                'get start address
                            zerox   d, #11                  'only keep 12 LSBs
                            subr    d, val4k                'figure out how many bytes remain before we hit the boundary
                            fle     c, d wc                 'compare this size to our transfer size and limit it
            if_c            mov     resume, continue_write  'and we will continue with a sub-burst again (harmless for fills)
                            mov     pattern3, #%10011
                            mov     d, addr1                'get start address position 
                            and     d, #3 wz                'get alignment
                            cmp     c, #4 wc                'test if we have at least 4 bytes to send
                            mov     wrclks, #16             'clocks needed for address phase
                            mov     pb, c                   'get number of bytes to send
                            add     pb, d                   'and increase total to send, including initial re-alignment
            if_z_and_nc     jmp     #header_done            'if aligned and at least 4 bytes, no header to send
                            
                            cmp     request, #%11110000 wc  'test for fill/burst (c=1 if fill, c=0 if burst)
            if_c            skipf   #%11110                 'if fill skip burst write stuff
                            add     wrclks, #4              'we need to include 4 clock transitions for 2x16 bits
                            sub     a, d                    ' |  (bursts only) subtract start address by offset to realign long
                            rdlong  d, a                    ' |  (bursts only) read first long in HUB RAM at this addr
                            add     a, #4                   ' |  (bursts only) increase source address by a long for later
                            skipf   #%100                   ' |  (bursts only) prevent d clobber below
                            sub     pb, #4 wcz              ' subtract a long from the total
                            bitl    pattern2, #0            ' enable transfer of header portion in skip pattern
single_write                mov     d, hubdata              ' (for single/fills only) get fill data 
                            call    #readlong               ' go get the first aligned long from PSRAM into hub RAM
                            callpa  addr1, #getmask         ' compute a suitable mux mask for pa into pa
                            rdlong  header, hubscratch      ' read original external RAM data from hub RAM
                            setq    pa                      ' setup byte mux mask
                            muxq    header, d               ' copy bytes into long
            if_c_or_z       jmp     #writecommon            ' if underflowed or emptied or single transfer we are done

header_done                 cmp     request, #%11110000 wc  'test for fill/burst (c=1 if fill, c=0 if burst)
                            mov     d, pb                   'preserve the count
                            andn    pb, #3 wz               'determine the number of full long bytes left to send
                            tjz     pb, #body_done          'if no full longs, go send the trailing portion
                 
                            add     wrclks, pb              'include this number of bytes as more clock transitions
            if_c            skipf   #%1010                 'for fills we can skip burst stuff
            if_c            andn    pattern2, #$C           'enable rep loop instructions for fills in write pattern
                            bitl    pattern2, #1            ' |  |  enable streamer instruction for bursts in write pattern
                            shr     pb, #1                  ' |  b  compute word count for bursts
                            setword xsenddata, pb, #0       ' |  |  setup streamer count for bursts
                            shr     pb, #1                  ' |  b  compute how many long transfer repeats this is

body_done                   and     d, #3                   'determine if any residual trailing bytes to send (0-3)
                            tjz     d, #trailer_done        'no trailer to send, we exit now
            if_c            cmp     c, count wz             'if a fill, check if fill will be completing
            if_nc           cmp     resume, complete_rw wz  'if a burst, check if this burst is completing
            if_nz           sub     c, d                    'we won't send this trailer if the burst/fill continues
            if_nz           jmp     #trailer_done           '..so the next transfer will become aligned and efficent

                            'we have 1-3 more aligned residual bytes left to send as the trailer
                            or      d, #$1f0                'setup mux mask address
                            rdlut   pa, d                   'read mux mask for this length at offset 0
                            push    addr1                   'save address

' use this code (note: foldover can occur here in PSRAM bank)
                            add     addr1, c                'find last long address in PSRAM
                            sub     addr1, #1               '..to be rewritten
                            call    #readlong               'read data from this external address
            
            if_c            mov     d, hubdata              'get data to be sent for fills
            if_c            skipf   #%11110                 'skip burst code for fills
                            pop     addr1                   'restore address
                            mov     d, pb                   ' | get number of full longs that were sent
                            shl     d, #2                   ' | convert to bytes
                            add     d, a                    ' | add to start adress of longs to stream
                            rdlong  d, d                    ' | read this last long from HUB RAM

                            rdlong  trailer, hubscratch     'read external RAM data value
                            setq    pa                      'setup byte mask
                            muxq    trailer, d              'apply byte mask to data via muxq
                            add     wrclks, #4              'increase by 4 more clocks
                            bitl    pattern2, #5            'enable trailing bytes to be written (bursts)
                            bitl    pattern3, #0            'enable trailing bytes to be written (fills)

                            'trailer is done
trailer_done                rdfast  xfreq1, a               '(bursts, but harmless for fills) setup streamer source address

writecommon                 mov     cmdaddr, addr1          'get start address of transfer
                            shr     cmdaddr, #2             'align to 32 bit boundary
                            setbyte cmdaddr, #$02, #3       'add quad write command

                            splitb  cmdaddr                 'reverse nibbles in address to match bus order
                            rev     cmdaddr                 
                            movbyts cmdaddr, #%%0123
                            mergeb  cmdaddr
                            
                            drvl    cspin                   'activate chip select
                            drvl    datapins                'enable the DATA bus
                            xinit   ximm8lut, cmdaddr       'send 8 nibbles of address and command via LUT translation
                            wypin   wrclks, clkpin          'start memory clock output 
                                                         
                            skipf   pattern2                '   B W L Burst FB FW FL RMW
                            xcont   xsendimm, header        '   a b |   ?    ?  ?  ?  | ' send 32 bit immediate data as 2x16 bits 
                            xcont   xsenddata, #0           '   | | |   ?    |  |  |  | ' send data from hub for bursts as 2nx16 bits
                            rep     #1, pb                  '   | | |   |    ?  ?  ?  | ' repeat for bursts
                            xcont   xsendimm, hubdata       '   | | c   |    ?  ?  ?  h ' send 32 bit fill data as 2x16 bits
                            skipf   pattern3 '%10011/%10010 '   | | |   |    e  f  g  | ' determine if trailer to be sent
                            xcont   xsendimm, trailer       '   | | |   ?    ?  ?  ?  | ' send 32 bit immediate last data as 2x16 bits
                            call    resume                  '   | | |   d    |  |  |  h ' bursts check what to do next while streaming
                            waitxfi                         '   a b c   d    e  f  g  h ' wait for streamer to end
                            fltl    datapins                '   a b c   d    e  f  g  h ' tri-state DATA bus
            _ret_           drvh    cspin                   '   | | |   d    |  |  |  h ' de-assert chip select or fall through
 
                            drvh    cspin
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
                           
getmask               '     rczr    c wcz                   'get 2 LSBs of count in W&C
                      '     rczl    pa                      'rotate left into address offset
                      '     rczl    c wcz                   'restore count and flags
                            testn   c, #3 wz                'set z=1 if less than 4 bytes being sent, z=0 if 4 or more
                            shl     pa, #2
            if_z            setq    #3
            if_z            muxq    pa, c
                            or      pa, #$1f0               'setup LUT address offset
           {_ret_}          rdlut   pa, pa                  'lookup MUX MASK in LUT
                            ret     wcz ' would prefer my earlier _ret_ approach if possible somehow, to save a cycle

readlong                    wrfast  xfreq1, hubscratch      'setup read to hub scratch
                            setword xrecvdata, #2, #0       'read 2x16 words
                            mov     clks, #32               '32 read clock transitions
                            mov     pattern, #%110110       'setup read skip pattern
                            jmp     #readcommon             'read then return directly to caller
        

'..................................................................................................

                fit 1024-32
                long    0[1024-32-$]                'align position to last 32 long boundary in LUTRAM
                org 1024-32

' mapping table from 0-F into 0000-FFFF on output bus (nibble replication)
                long $0000
                long $1111
                long $2222
                long $3333
                long $4444
                long $5555
                long $6666
                long $7777
                long $8888
                long $9999
                long $aaaa
                long $bbbb
                long $cccc
                long $dddd
                long $eeee
                long $ffff

'masks
                long $ffffffff ' 00 aligned 0/4 length
                long $000000ff ' 00 aligned 1 length
                long $0000ffff ' 00 aligned 2 length
                long $00ffffff ' 00 aligned 3 length

                long $ffffff00 ' 01 aligned 0/4 length
                long $0000ff00 ' 01 aligned 1 length
                long $00ffff00 ' 01 aligned 2 length
                long $ffffff00 ' 01 aligned 3 length

                long $ffff0000 ' 10 aligned 0/4 length
                long $00ff0000 ' 10 aligned 1 length
                long $ffff0000 ' 10 aligned 2 length
                long $ffff0000 ' 10 aligned 3 length

                long $ff000000 ' 11 aligned 0/4 length
                long $ff000000 ' 11 aligned 1 length
                long $ff000000 ' 11 aligned 2 length
                long $ff000000 ' 11 aligned 3 length

        fit 1024

'--------------------------------------------------------------------------------------------------
        orgh

gfxexpansion
                            'simple line drawing graphics expansion of memory driver
                            'jmp     #donerepeats                'just return for now

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
                            shl     count, a                '..for the type of transfer
                            jmp     #readmask               'continue filling


'--------------------------------------------------------------------------------------------------
{{
LICENSE TERMS
-------------
Copyright 2020, 2021 Roger Loh

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