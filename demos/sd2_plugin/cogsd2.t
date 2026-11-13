{{
''=============================================================================
''
'' cogsd2.t - Implements "smartpin" based SD Card support for the Propeller 2.
''
''            Enable this plugin by defining the Catalina symbol SD2
''            (e.g. adding -C SD2 to a Catalina command).
''
''            Also implements Real-Time Clock functionality
''            if the Catalina symbol CLOCK is defined.
''
''
'' Implemented for Catalina by:
''
''     Ross Higson, based on C/PASM code written by evanh.
''
''   Version 9.3 - Initial version.
''
''=============================================================================
}}
CON

#include <constant.inc>
#include <smartpin.inc>

CON

SD_First          = 1
SD_Init           = 1
SD_Read           = 2
SD_Write          = 3
SD_IOCTL          = 4                       ' was SD_ByteIO, which was never implemented
SD_StopIO         = 5

' current clock freq and mode can be found here:

CLK_FRQ   = $14
CLK_MODE  = $18 

#ifdef CLOCK
'
SD_CLOCKS_PER_SEC = 1_000                   ' resolution of clock - if this value
                                            ' is changed, also change time.h
'
SD_RTC_SetFreq    = 6
SD_RTC_GetClock   = 7
SD_RTC_SetTime    = 8
SD_RTC_GetTime    = 9
SD_RTC_Debug      = 10
SD_RTC_GetTicks   = 11

SD_Last           = 11                      ' last valid command if CLOCK defined

#else

SD_Last           = 5                       ' last valid command if CLOCK not defined

#endif

#if defined(SD_DEBUG_LED_CLOCK)
#if defined(P2_EVAL)
#ifndef SD_DEBUG_LED
' suitable for P2_EVAL
#define SD_DEBUG_LED 56
#endif
#elif defined(P2_EDGE)
#ifndef SD_DEBUG_LED
' suitable for P2_EDGE
#define SD_DEBUG_LED 38                         
#endif
#endif
#endif

' define HEX_LED to enable Flash_Hex etc
'#define HEX_LED 56 

#if defined(HEX_LED)
blip_time  = _CLOCKFREQ/20
hex_time   = _CLOCKFREQ/2
flash_time = _CLOCKFREQ/4
#endif

' SD services:
'
' The command to perform is encoded in the top 8 bits of the parameter
' The address of a parameter block is encoded in the bottom 24 bits.
' 
' To provide compatibility with the existing SD plugin, the parameter 
' block is either 2 or 3 longs, depending on whether bit 24 of the 
' first long (i.e. the buffer address) is set:
'    - the buffer adress to use (bit 24 set if count != 1)
'    - the first (or only) sector number to read/write 
'    - the number of sectors to read/write

'name: SD_Init - Initialize the driver
'code: 1
'type: long request
'data: parameter block address (buffaddr is scratch buffer/CSD address)
'rslt: RES_OK .. RES_PARERR
'
'name: SD_Read - Read a sector
'code: 2
'type: long request
'data: parameter block address (buffaddr, blknum) or (buffaddr|$1000000, blknum, blkcnt}
'rslt: RES_OK .. RES_PARERR
'
'name: SD_Write - Write a sector
'code: 3 
'type: long request
'data: parameter block address (buffaddr, blknum) or (buffaddr|$1000000, blknum, blkcnt}
'rslt: RES_OK .. RES_PARERR if < 128, or error token with top bit set
   
'name: SD_IOCTL - Do an I/O Control request
'code: 4 
'type: short request
'data: command (see IOCTL commands, below)
'rslt: RES_OK .. RES_PARERR if < 128, or block size or sector count

'name: SD_StopIO - disable the SD card
'code: 5 
'type: short request
'data: (none)
'rslt: (none)

' Result values:
RES_OK        = 0 ' Successful
RES_ERROR     = 1 ' R/W Error
RES_WRPRT     = 2 ' Write Protected
RES_NOTRDY    = 3 ' Not Ready
RES_PARERR    = 4 ' Invalid Parameter

' IOCTL commands:
CTRL_SYNC        = 0  ' Complete pending write process (needed at FF_FS_READONLY == 0)
GET_SECTOR_COUNT = 1  ' Get media size (needed at FF_USE_MKFS == 1)
GET_SECTOR_SIZE  = 2  ' Get sector size (needed at FF_MAX_SS != FF_MIN_SS)
GET_BLOCK_SIZE   = 3  ' Get erase block size (needed at FF_USE_MKFS == 1)
CTRL_TRIM        = 4  ' Inform device that the data on the block of sectors is no longer used (needed at FF_USE_TRIM == 1)
MMC_GET_CSD      = 11 ' Get CSD
MMC_GET_SDSTAT   = 14 ' Get SD status

'
' RTC services:
'
'name: SD_RTC_SetFreq
'code: 6
'type: long request
'data: frequency to set (note that the clock will be zeroed)
'rslt: (none)

'name: SD_RTC_GetClock
'code: 7
'type: long request
'data: (none)
'rslt: -1, or the current clock value

'name: SD_RTC_SetTime
'code: 8
'type: long request
'data: the time (in seconds) to set
'rslt: key code

'name: SD_RTC_GetTime
'code: 9
'type: long request
'data: (none)
'rslt: the current time (in seconds)

'name: SD_RTC_Debug (only works on Hydra and Hybrid)
'code: 10
'type: long request
'data: 0 = no debug, 1 = toggle debug flag every second
'rslt: none
   
'name: SD_RTC_GetTicks (new time function also implemented in SD plugin)
'code: 11
'type: short request
'data: address of 2 long buffer to receive seconds and ticks
'rslt: none

DAT
                  alignl
                  org 0

SD_START

' We can re-use the first 13 registers as temporary storage after startup

.r0               cogid   .r0               ' get ...
.r1               shl     .r0,#2            ' ... our ...
.r2               add     .r0,PTRA          ' ... registry block entry
.r3               rdlong  .rqstptr,.r0      ' set up a pointer to ...
.r4               and     .rqstptr,.mask24  ' ... our request address
.r5               wrlong  #0,.rqstptr       ' clear the request long
.r6               mov     .rsltptr,.rqstptr ' set up a pointer to ...
.r7               add     .rsltptr,#4       ' ... our result address 
.r8               call    #.init_plugin     ' load LUT code and initialize delays
.rqst             mov     .r2,#LMM_FIL      ' register this plugin ...
.rslt             shl     .r2,#24           ' ... as the ...
.pptr             or      .r2,.rqstptr      ' ... appropriate ...
.param            wrlong  .r2,.r0           ' ... type                
                  

#ifdef CLOCK
                  call    #.RTC_Init        ' initialize clock
#endif

.loop 
                  rdlong  .rqst,.rqstptr wz

#ifdef CLOCK
    if_nz         jmp     #.process         ' if a command arrived, procvess it
                  waitx   .delay10us        ' otherwise delay a small amount ...
                  call    #.RTC_Update      ' ... update the clock counts ...
                  jmp     #.loop            ' ... and check again
#endif

.process
                  mov     .pptr,.rqst wz
    if_z          jmp     #.loop
                  and     .pptr,.mask24
                  mov     .r5,.pptr         ' for RTC_GetTicks
                  setq    #2                ' read 3 parameters (even if not all used) ... 
                  rdlong  .buffaddr,.pptr   ' ... into buffaddr, blknum & blkcnt
                  mov     .param,.buffaddr  ' copy 1st par to .param (for clock functions)
                  mov     .r0,.rqst         ' get command ...
                  shr     .r0,#24           ' ... from request
                  cmp     .r0,#SD_First wcz ' check for valid command
    if_b          jmp     #.err_command
                  cmp     .r0,#SD_Last wcz  ' check for valid command
    if_a          jmp     #.err_command
                  mov     .rslt,#RES_OK     ' assume result is OK
                  sub     .r0,#SD_First     ' lookup ...
                  alts    .r0,#.cmdTable    ' ... function ...
                  mov     .r0,0-0           ' ... in cmdTable ...
                  call    .r0               ' ... and call it
                  jmp     #.end_command

.cmdTable
                  long    .SD_disk_initialize
                  long    .SD_disk_read
                  long    .SD_disk_write
                  long    .SD_disk_ioctl
                  long    .SD_disk_deinitialize
#ifdef CLOCK
                  long    .RTC_SetFreq
                  long    .RTC_GetClock
                  long    .RTC_SetTime
                  long    .RTC_GetTime
                  long    .RTC_DebugFlag
                  long    .RTC_GetTicks
#endif

.err_command
                  neg     .rslt,#1          ' return -1 on error
.end_command
                  wrlong  .rslt,.rsltptr    ' return .rslt 
                  wrlong  #0,.rqstptr       ' clear command status
                  jmp     #.loop            ' check for next command

'-------------------- Initialize Functions -----------------------------------
'
' init_plugin - initialize the plugin (load the LUT, and set delays 
'               based on clock frequency)
'
' init_delays - just update the delays (e.g. if the clock frequency changes)
'
.init_plugin
                  setq2   #(.LUT_END-.LUT_CODE-1) ' load LUT code ...
                  rdlong  .LUT_CODE, ##@.LUT_CODE ' ... to LUT RAM
.init_delays
                  rdlong  .delay10us,#CLK_FRQ ' get current clock frequency
                  qdiv    .delay10us,##100000 ' dvide it by 100000 ... 
                  getqx   .delay10us        ' ... to get 10us delay
                  qmul    .delay10us,#10
                  getqx   .delay100us
                  qmul    .delay100us,#10
                  getqx   .delay1000us
                  qmul    .delay1000us,#10
    _ret_         getqx   .delay10ms

'-------------------- Debug Functions ----------------------------------------

#if defined(HEX_LED)

' LED_On - turn LED on
'
.LED_On
    _ret_         drvl    #HEX_LED

'
' LED_Off - turn LED off
'
.LED_Off
    _ret_         drvh    #HEX_LED
'
' Flash_LED - flash the LED flash_count times
'
.Flash_LED
                  cmp     .flash_count,#0 wz
    if_z          waitx   ##flash_time
    if_z          jmp     #.done_flash
.flash_loop
                  call    #.LED_On
                  waitx   ##flash_time
                  call    #.LED_Off
                  waitx   ##flash_time
                  djnz    .flash_count,#.flash_loop
.done_flash
                  ret
'
' Blip_LED - flash LED briefly (e.g. used to indicate zero)
'
.Blip_LED
                  call    #.LED_On
                  waitx   ##blip_time
                  call    #.LED_Off
                  waitx   ##flash_time
                  ret
'
' Flash_Hex - flash the LED to display up to 8 hex digits in hex_value
'
.Flash_Hex
                  mov     .hex_count,#8
.digit_loop1
' skip leading zeroes
                  rol     .hex_value,#4
                  mov     .flash_count,.hex_value
                  and     .flash_count,#$f wz
    if_z          djnz    .hex_count,#.digit_loop1
' if all we have are zeroes, do one blip
                  tjnz    .hex_count,#.digit_loop2
                  call    #.Blip_LED
                  jmp     #.done_hex
.digit_loop2
                  tjnz    .flash_count,#.do_flash
' for zero digits, do one blip
                  call    #.Blip_LED
                  jmp     #.do_next
.do_flash
' for non-zero digits, flash the digit count
                  call    #.Flash_LED
.do_next
                  djz     .hex_count,#.done_hex
                  waitx   ##hex_time
                  rol     .hex_value,#4
                  mov     .flash_count,.hex_value
                  and     .flash_count,#$f
                  jmp     #.digit_loop2
.done_hex
                  waitx   ##hex_time*4
                  ret
'
' For example (including saving/restoring flags):
'                 muxc    .flags, #1        ' save C ...
'                 muxnz   .flags, #2        ' ... and Z flags
'                 mov     .hex_value,.r0
'                 call    #.Flash_Hex
'                 shr     .flags, #1 wcz    ' restore flags
'
#endif

'-------------------- Clock Functions -----------------------------------------

#if defined(CLOCK)

'
' RTC_Init - Initialize the Real-Time Clock
'
.RTC_Init
                  getct   .r0
                  mov     .time_last,.r0    ' initialize time
    _ret_         mov     .clock_last,.r0   ' initialize clock

'
' RTC_Update - update the clock and time counters
'
.RTC_Update                        
                  tjnz    .per_sec,#.got_freq ' no - if frequency not set ...
                  call    #.RTC_Init        ' .. just re-initialize
                  ret                       ' done
.got_freq
                  getct   .r3               ' get latest cnt
                  cmp     .r3,.clock_last wcz ' compare with last cnt used for clock
    if_ae         jmp     #.clock_no_wrap   ' check for wrap                 
                  mov     .r2,.clock_last   ' calculate increment ...
                  sub     .r2,.r3           ' ... when wrap has occurred
                  jmp     #.update_clock                        
.clock_no_wrap
                  mov     .r2,.r3           ' calculate increment ...
                  sub     .r2,.clock_last   ' ... when no wrap has occurred

.update_clock
                  mov     .clock_last,.r3   ' update last count used for clock
                  add     .clock_incr,.r2   ' add increment to unprocessed clock
                  cmp     .clock_incr,.per_clock wcz   ' increment clock?
    if_b          jmp     #.do_time         ' no - go process time
                  mov     .r0,.clock_incr   ' yes - calculate ...
                  mov     .r1,.per_clock    ' ... number ...
                  call    #.d32u            ' ... of ticks ...
                  add     .clock,.r0        ' ... to add to clock ...
                  mov     .clock_incr,.r1   ' ... save remainder for next round
.do_time
                  cmp     .r3,.time_last wcz  ' compare with last cnt used for clock
    if_ae         jmp     #.time_no_wrap    ' check for wrap                 
                  mov     .r2,.time_last    ' calculate increment ...
                  sub     .r2,.r3           ' ... when wrap has occurred
                  jmp     #.update_time                        
.time_no_wrap
                  mov     .r2,.r3           ' calculate increment ...
                  sub     .r2,.time_last    ' ... when no wrap has occurred

.update_time
                  mov     .time_last,.r3 ' update last count used for time
                  add     .time_incr,.r2    ' add increment to unprocessed time
                  cmp     .time_incr,.per_sec wcz ' increment time?
    if_b          ret                       ' no - done
                  mov     .r0,.time_incr    ' yes - calculate ...
                  mov     .r1,.per_sec      ' ... number ...
                  call    #.d32u            ' ... of secs ...
                  add     .time,.r0         ' ... to add to time ...
                  mov     .time_incr,.r1    ' ... save remainder for next round
                  tjz     .debug_flag,#.update_done ' if not debug, done
                  cmp     .r0,#0 wz         ' did we increment time?
#ifdef SD_DEBUG_LED
                  drvnot  #SD_DEBUG_LED     ' toggle SD_DEBUG_LED
#endif
.update_done
                  ret

'
' RTC_SetFreq - Set the frequency, calculate counts per clock tick, 
'               and reset the clock counters
'
.RTC_SetFreq
                  tjz     .param,#.RTC_SetFreq_ret
                  mov     .per_sec,.param
                  mov     .r0,.per_sec
                  mov     .r1,.clock_res
                  call    #.d32u
                  mov     .per_clock,.r0
                  mov     .clock,#0
                  mov     .clock_incr,#0
                  getct   .clock_last
.RTC_SetFreq_ret
                  ret

'
' RTC_GetClock - return current clock, or -1 if frequency not set yet
'
.RTC_GetClock
                  tjnz    .per_sec,#._GetClock_ok
    _ret_         neg     .rslt,#1
._GetClock_ok
    _ret_         mov     .rslt,.clock

'
' RTC_SetTime - set the current time, and reset the time counters
'
.RTC_SetTime
                  mov     .time,.param
                  mov     .time_incr,#0
    _ret_         getct   .time_last

'
' RTC_GetTime - return current time, or -1 if frequency not set yet
'
.RTC_GetTime
                  tjnz    .per_sec,#._GetTime_ok
    _ret_         neg     .rslt,#1
._GetTime_ok
    _ret_         mov     .rslt,.time

'
' RTC_DebugFlag - set/reset debug flag (works on P2_EVAL or P2_EDGE)
'
.RTC_DebugFlag
    _ret_ mov     .debug_flag,.param

'
' RTC_GetTicks - return current time, as 2 longs, 
'                result = 0 if frequency has been set, -1 otherwise
'
.RTC_GetTicks
                  tjnz    .per_sec,#.RTC_GetTicks_ok
    _ret_         neg     .rslt,#1
.RTC_GetTicks_ok
                  wrlong  .time,.r5         ' return ...
                  add     .r5, #4           ' seconds
                  mov     .r0,.time_incr    ' convert ...
                  mov     .r1,.per_clock    ' ... unprocessed time counts ...
                  call    #.d32u            ' ... to clock counts ...
                  wrlong  .r0,.r5           ' ... and return that
    _ret_         mov     .rslt,#0


'.m32 - 32 bit multiplication
' On entry:
'    .r0 = operand 1
'    .r1 = operand 2
' On exit:
'    .r0 = result
.m32
                  qmul    .r0,.r1
    _ret_         getqx   .r0

'.d32u - Unsigned 32 bit division
' On entry:
'    Divisor  : .r1
'    Dividend : .r0
' On exit:
'    Quotient in .r0
'    Remainder in .r1
.d32u
                  qdiv    .r0,.r1
                  getqx   .r0
    _ret_         getqy   .r1

'-------------------- local CLOCK variables ----------------------------------

#ifdef SD_DEBUG_LED
.debug_flag       long    1                 ' set to 1 to toggle debug LED every second
#else
.debug_flag       long    0                 ' set to 1 to toggle debug LED every second
#endif

.clock_res        long    SD_CLOCKS_PER_SEC ' clock resolution (fixed at compile time)

.per_sec          long    0                 ' cnts per sec (system clock frequency)                 
.per_clock        long    0                 ' cnts per clock

.clock            long    0                 ' current clock val                       
.clock_last       long    0                 ' last cnt value retrieved
.clock_incr       long    0                 ' count as yet unprocessed

.time             long    0                 ' current time val
.time_last        long    0                 ' last cnt value retrieved
.time_incr        long    0                 ' count as yet unprocessed

#endif

'-------------------- SD Card Functions -----------------------------------------

'------------------------------------------------------------------------------
' xmit_mmc - send up to 512 bytes from HUB RAM
'   Smartpin SPI transmitter using "continuous" mode and 32-bit word size
'   NOTE: data out always has at least a 4 sysclock lag
'
'   On entry: .r3 = pointer to data in HUB
'             .r2  = number of bytes to send
'
'   On exit:  .r0      = 1:OK, 0:Failed
'------------------------------------------------------------------------------
.xmit_mmc
                  dirl    #_SD_DI           ' reset tx smartpin, clears excess data
                  setq    #1
                  rdlong  .r0,.r3     ' fetch first data (2 longs into .r0 & .r1)
                  rev     .r0
                  movbyts .r0, ##%00011011  ' endian swap
                  wypin   .r0, #_SD_DI      ' first data to tx shifter
                  dirh    #_SD_DI           ' liven tx buffer, continuous mode
    
                  mov     .r0,.r2
                  shr     .r2,#2  wz   ' longword count (rounded down)
                  shl     .r0, #3           ' bit count (exact)
                  wypin   .r0, #_SD_CK      ' begin SPI clocks

                  add     .r3, #8
                  rev     .r1
                  movbyts .r1, ##%00011011  ' endian swap
.tx_loop
   if_nz          wypin   .r1, #_SD_DI      ' data to tx buffer
   if_nz          rdlong  .r1,.r3     ' fetch next data
   if_nz          add     .r3,#4
   if_nz          rev     .r1
   if_nz          movbyts .r1, #%00011011   ' endian swap
.tx_wait
   if_nz          testp   #_SD_DI  wc       ' wait for tx buffer empty
   if_nc_and_nz   jmp     #.tx_wait
   if_nz          djnz    .r2,#.tx_loop

' Wait for completion
.tx_wait2
                  testp   #_SD_CK  wc
   if_nc          jmp     #.tx_wait2
    
                  dirl    #_SD_DI           ' reset tx smartpin to clear excess data
                  wypin   ##-1, #_SD_DI     ' TX 0xFF, continuous mode
                  dirh    #_SD_DI
                  ret

'------------------------------------------------------------------------------
' rcvr_mmc - read up to 512 bytes into HUB RAM
'
'   On entry: .r3 = pointer to read buffer in HUB
'             .r2  = number of bytes to receive
'
'   On exit:  .r0      = 1:OK, 0:Failed
'------------------------------------------------------------------------------
.rcvr_mmc
                  dirl	#_SD_DO             ' clear rx buffer
                  mov   .r1, .r2
                  dirh	#_SD_DO             ' clear rx buffer

'32-bit rx
                  shr     .r1, #2  wz       ' number of longwords
  if_z            jmp     #.rx_bytes        ' branch if less than 4 bytes

                  mov     .r0, .r1
                  shl     .r0, #5           ' bit count
                  wypin   .r0, #_SD_CK      ' begin SPI clocks
                  wxpin   #(31|32), #_SD_DO ' 32 bits, sample after rising clock
.rx_loop2
.rx_wait2
                  testp   #_SD_DO  wc       ' wait for received byte
  if_nc           jmp     #.rx_wait2
    
                  rdpin   .r0, #_SD_DO      ' longword from rx buffer
                  rev     .r0
                  movbyts .r0, #%00011011   ' endian swap
                  wrlong  .r0,.r3     ' store longword in HUB
                  add     .r3, #4
                  djnz    .r1, #.rx_loop2

' 8-bit rx
.rx_bytes
                  and     .r2,#3  wz   ' up to 3 bytes
  if_z            jmp     #.rx_exit
    
                  wxpin   #(7|32), #_SD_DO  ' 8 bits, sample after rising clock
.rx_loop1
                  wypin   #8, #_SD_CK       ' begin SPI clocks
.rx_wait1
                  testp   #_SD_DO  wc       ' wait for received byte
  if_nc           jmp     #.rx_wait1
    
                  rdpin   .r0, #_SD_DO      ' byte from rx buffer
                  rev     .r0
                  wrbyte  .r0,.r3      ' store byte
                  add     .r3, #1
                  djnz    .r2,#.rx_loop1
.rx_exit
                  ret

'------------------------------------------------------------------------------
' wait_ready - wait for card ready
'
'   On entry: none
'
'   On exit:  .r0 = /1:OK, 0:Timeout
'------------------------------------------------------------------------------
.wait_ready
                  getct   .r5
                  rdlong  .r4,#CLK_FRQ      ' clock frequency stored here!
                  shr     .r4,#1            ' 500 ms timeout
.wait_loop
                  mov     .r2,#1
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' get 1 byte to scratch buffer
                  rdbyte  .r2,.scratch
                  cmp     .r2,#$FF wz
  if_z            jmp     #.wait_ret1
                  getct   .r2
                  sub     .r2,.r5
                  cmp     .r2,.r4 wcz
  if_b            jmp     #.wait_loop
                  mov     .r0,#0 wz
                  jmp     #.wait_ret2
.wait_ret1        mov     .r0,#1 wz
.wait_ret2        ret

'------------------------------------------------------------------------------
' deselect - Deselect the card and release SPI bus
'   The value 16 below was tested empirically to work at 300 MHz with some cards
'   but it would be nice to have some "reason" for it :)
'
'   On entry: none
'
'   On exit:  none
'------------------------------------------------------------------------------
.deselect
                  drvh    #_SD_CS
                  waitx   #16               ' (NOTE: wait twice as long when using cogexec)
                  mov     .r2,#1
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' Dummy clock (force DO hi-z for multiple slave SPI)
                  ret

'------------------------------------------------------------------------------
' select - Select the card and wait for ready
'
'   On entry: none
'
'   On exit:  .r0 = 1:OK, 0:Timeout
'------------------------------------------------------------------------------
.select
                  drvl    #_SD_CS           ' Set CS# low
                  call    #.wait_ready      ' Wait for card ready
     if_nz        ret
                  call    #.deselect        ' Failed
                  mov     .r0,#0 wz
                  ret

'------------------------------------------------------------------------------
' pinstart - set up and start a spartpin
'
'   On entry: .r5 = pin
'             .r4 = mode
'             .r3 = xval
'             .r2 = yval
'
'   On exit: none
'------------------------------------------------------------------------------
.pinstart
                  dirl    .r5
                  wrpin   .r4, .r5
                  wxpin   .r3, .r5
                  wypin   .r2, .r5
    _ret_         dirh    .r5

'------------------------------------------------------------------------------
' disc_size - calculate size in kilobytes from CSD (which must be in scratch buffer)
'
'   On entry: none
'
'   On exit:  .r0 = RES_ERROR or sector count
'------------------------------------------------------------------------------
.disc_size        mov     .r4,.scratch
                  rdbyte  .r1,.r4           ' i.e. CSD[0] = [127..120]
                  shr     .r1,#6
                  cmp     .r1,#0 wz
    if_z          jmp     #.disc_size_1     ' SDC_Ver 1.00
                  cmp     .r1,#1 wz
    if_z          jmp     #.disc_size_2     ' SDC Ver 2.00
                  cmp     .r1,#2 wz
    if_z          jmp     #.disc_size_3     ' SDC Ver 3.00
                  mov     .r0,#RES_ERROR
                  ret
.disc_size_1
' SDC ver 1.00 - READ_BL_BL_LEN is [83:80], C_SIZE is [73:62], C_SIZE_MULT is [49:47]
                  add     .r4,#6
                  rdbyte  .r1,.r4           ' i.e. CSD[6] = [79..72]
                  and     .r1,#3
                  shl     .r1,#10
                  add     .r4,#1
                  rdbyte  .r2,.r4           ' i.e. CSD[7] = [71..64]
                  shl     .r2,#2
                  add     .r4,#1
                  rdbyte  .r0,.r4           ' i.e. CSD[8] = [63..56]
                  shr     .r0,#6
                  add     .r0,#1
                  add     .r0,.r2
                  add     .r0,.r3           ' = CSIZE + 1
                  sub     .r4,#3
                  rdbyte  .r1,.r4           ' i.e. CSD[5] = [87..80]
                  and     .r1,#15           ' = READ_BL_LEN
                  add     .r4,#4
                  rdbyte  .r2,.r4           ' i.e. CSD[9]  = [55..48]
                  and     .r2,#3
                  shl     .r2,#1
                  add     .r4,#1
                  rdbyte  .r3,.r4           ' i.e. CSD[10] = [47..40]
                  and     .r3,#128
                  shr     .r3,#7
                  add     .r1,.r2
                  add     .r1,.r3
                  add     .r1,#2
                  sub     .r1,#9            ' n
    _ret_         shl     .r0,.r1           ' 32-bit block count
.disc_size_2
' SDC ver 2.00 - C_SIZE is [69:48]
                  add     .r4,#7
                  rdbyte  .r1,.r4           ' i.e. CSD[7] = [71..64]
                  and     .r1,#63
                  shl     .r1,16
                  add     .r4,#1
                  rdbyte  .r2,.r4           ' i.e. CSD[8] = [63..56]
                  shl     .r2,#8
                  add     .r4,#1
                  rdbyte  .r0,.r4           ' i.e. CSD[9] = [55..48]
                  add     .r0,#1
                  add     .r0,.r2
                  add     .r0,.r1
    _ret_         shl     .r0,#9
.disc_size_3
' SDC VER 3.00 - C_SIZE IS [75..48]
                  add     .r4,#6
                  rdbyte  .r3,.r4           ' i.e. CSD[6] = [79..72]
                  and     .r3,#15
                  shl     .r3,#24
                  add     .r4,#1
                  rdbyte  .r2,.r4           ' i.e. CSD[7] = [71..64]
                  shl     .r2,16
                  add     .r4,#1
                  rdbyte  .r1,.r4           ' i.e. CSD[8] = [63..56]
                  shl     .r1,#8
                  add     .r4,#1
                  rdbyte  .r0,.r4           ' i.e. CSD[9] = [55..48]
                  add     .r0,#1
                  add     .r0,.r3
                  add     .r0,.r2
                  add     .r0,.r1
    _ret_         shl     .r0,#9
                  
'------------------local SD variables-----------------------------------------

.delay10us        long    _CLOCKFREQ/100000 ' recalculate as needed
.delay100us       long    _CLOCKFREQ/10000  ' recalculate as needed
.delay1000us      long    _CLOCKFREQ/1000   ' recalculate as needed
.delay10ms        long    _CLOCKFREQ/100    ' recalculate as needed

.mask24           long    $FFFFFF
.rqstptr          long    0
.rsltptr          long    0
.cardtype         long    0
.stat             long    STA_NOINIT
.tx_spmode        long    0
.scratch          long    $20               ' scratch buffer HUB address (default!)
.buffcnt          long    0                 ' number of HUB bytes
.cmd              long    0
.arg              long    0
.oldclkfreq       long    0

' NOTE: the following three variables must appear together and in this order:
.buffaddr         long    0                 ' ptr to HUB (byte ptr)
.blknum           long    0                 ' LBA (i.e. sector#)
.blkcnt           long    0                 ' number of blocks (i.e. sectors)

#if defined(HEX_LED)
.hex_value        long    0
.hex_count        long    0
.flash_count      long    0
.flags            long    0
#endif

                  fit     $1F0
'------------------------------------------------------------------------------------------------
'
' LUT code ...
'
                  orgf    $200
.LUT_CODE

'------------------------------------------------------------------------------
' rcvr_datablock - Receive a data packet from the card
'
'   On entry: .buffcnt   = number of bytes to receive
'             .buffaddr  = HUB address (lost)
'
'   On exit:  .r0      = 1:OK, 0:Failed
'------------------------------------------------------------------------------
.rcvr_datablock
                  getct   .r5
                  rdlong  .r8,#CLK_FRQ      ' clock frequency stored here!
                  shr     .r8,#3            ' 125 ms timeout
.rcvrd_loop
                  mov     .r2,#1
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' get 1 byte to scratch buffer
                  rdbyte  .r2,.scratch
                  and     .r2,#$FF
                  cmp     .r2, #$FF wz
  if_nz           jmp     #.rcvrd_1
                  getct   .r1
                  sub     .r1,.r5
                  cmp     .r1,.r8 wcz
  if_b            jmp     #.rcvrd_loop
.rcvrd_1
                  rdbyte  .r2,.scratch
                  and     .r2,#$FF
                  cmp     .r2,#$FE wz
  if_z            jmp     #.rcvrd_2
                  mov     .r0,#0 wz         ' If not valid data token, return with erro
                  ret
.rcvrd_2
                  mov     .r2,.buffcnt
                  mov     .r3,.buffaddr
                  call    #.rcvr_mmc        ' Receive the data block into buffer
                  mov     .r2,#2
                  mov     .r3,.scratch
                  add     .r3,#16           ' (avoid overwriting CSD, which might be first 16 bytes!)
                  call    #.rcvr_mmc        '  Discard CRC
                  mov     .r0,#1 wz         ' Return with success
                  ret

'------------------------------------------------------------------------------
' xmit_datablock - Send a data packet to the card
'
'   On entry: .buffaddr = 512 byte data block to be transmitted (lost)
'             .r8       = Data/Stop token
'
'   On exit:  .r0      = 1:OK, 0:Failed
'------------------------------------------------------------------------------
.xmit_datablock
                  call    #.wait_ready
    if_z          ret
                  mov     .r2,#1
                  mov     .r3,.scratch
                  wrbyte  .r8,.scratch      ' put token in buffer for xmit
                  call    #.xmit_mmc        ' Xmit a token
                  cmp     .r8, #$FD wz      ' Is it a data token?
  if_z            jmp     #.xmitd_1
                  mov     .r2,##512         ' Xmit 512 bytes ...
                  mov     .r3,.buffaddr
                  call    #.xmit_mmc        ' ... to MMC
                  mov     .r2,#2            ' Xmit dummy CRC (0xFF, 0xFF) ...
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' ... to MMC
                  mov     .r2,#1            ' Receive ...
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' ... data response
                  rdbyte  .r0,.scratch      ' If ...
                  and     .r0,#$1F          ' ... accepted ...
                  cmp     .r0,#$05 wz       ' ... return ...
  if_z            jmp     #.xmitd_1         ' ... with success
                  mov     .r0,#0 wz         ' If not accepted, return with error
                  ret
.xmitd_1
                  mov     .r0,#1 wz         ' Return with success
                  ret
'------------------------------------------------------------------------------
' send_internal - Send a command packet to the card (used by send_cmd)
'
'   On entry: .r6      = command
'             .r7      = argument
'
'   On exit:  .r0      = command response value (bit 7==1:Send failed)
'------------------------------------------------------------------------------
.send_internal
' Select the card and wait for ready except to stop multiple block read
                  cmp     .r6,#CMD12 wz
   if_z           jmp     #.send_int_1
                  call    #.deselect
                  call    #.select
   if_nz          jmp     #.send_int_1
                  mov     .r0,#$FF wz
                  jmp     #.send_int_3
.send_int_1
' Send a command packet
                  mov     .r0,.r6
                  or      .r0,#$40          ' Start + Command index
                  wrbyte  .r0,.scratch
                  movbyts .r7,#%00011011
                  mov     .r0,.scratch
                  add     .r0,#1
                  wrlong  .r7,.r0
                  mov     .r1,#$01          ' Dummy CRC + Stop
                  cmp     .r6,#CMD0 wz
    if_z          mov     .r1,#$95          ' valid CRC for  CMD0(0)
                  cmp     .r6,#CMD8 wz
    if_z          mov     .r1,#$87          ' valid CRC for  CMD0($1AA)
                  mov     .r0,.scratch
                  add     .r0,#5
                  wrbyte  .r1,.r0
                  mov     .r2,#6       ' send ...
                  mov     .r3,.scratch
                  call    #.xmit_mmc        ' ... 6 byte command
                  cmp     .r6,#CMD12 wz
    if_nz         jmp     #.send_int_2
                  mov     .r2,#1
                  mov     .r3,.scratch
                  add     .r3,#6
                  call    #.rcvr_mmc        ' Skip a stuff byte when stop reading
.send_int_2
                  mov     .r8,#10
.send_int_3
                  mov     .r2,#1
                  mov     .r3,.scratch
                  add     .r3,#6
                  call    #.rcvr_mmc
                  mov     .r0,.scratch
                  add     .r0,#6
                  rdbyte  .r0,.r0
                  test    .r0,#$80 wz
    if_z          jmp     #.send_int_4
                  djnz    .r8,#.send_int_3
.send_int_4
                  and     .r0,#$FF wz       ' Return with the response value
                  ret

'------------------------------------------------------------------------------
' send_cmd - Send a command packet to the card
'
'   On entry: .cmd     = command
'             .arg     = argument
'
'   On exit:  .r0      = command response value (bit 7==1:Send failed)
'------------------------------------------------------------------------------
.send_cmd
                  test    .cmd,#$80 wz       ' ACMD<n> is the command sequense of CMD55-CMD<n>
    if_z          jmp     #.send_cmd_1
                  and     .cmd,#$7F
                  mov     .r6,#CMD55
                  mov     .r7,#0
                  call    #.send_internal
                  cmp     .r0,#1 wcz
    if_a          ret
.send_cmd_1
                  mov     .r6,.cmd
                  mov     .r7,.arg
                  call    #.send_internal
                  ret

'------------------------------------------------------------------------------
' set_divider - must be called initially, and if clock frequency changes
'
'   On entry: none
'
'   On exit: none
'------------------------------------------------------------------------------
.set_divider
                  rdlong .oldclkfreq,#CLK_FRQ ' remember for comparison

'    NOTE that the boot pins share with flash EEPROM chip.  
'    The SD slot has a 240 Ohm inline resistor to protect
'    against over-current upon data collisions.  
'    40 MHz clock limit is choosen suit this resistor.

'    spm_tx = tx_spmode

                  mov     .r2,.tx_spmode

'  tmr = _clockfreq() / 1000000;    // MHz granular

                  rdlong  .r0,#CLK_FRQ      ' MHz granular
                  qdiv    .r0,##1000000
                  getqx   .r0

'    ck_div = (tmr + 43) / 45;    // 45 MHz SD clock rate (/4@180 /5@225 /6@270 /7@315 /8@360)

                  mov     .r3,.r0
                  add     .r3,#43
                  qdiv    .r3,#45
                  getqx   .r3

'  if( ck_div < 4 )  ck_div = 4;    // minimum divider of sysclock/4.  /3 also works

                  cmp     .r3,#4 wcz
   if_b           mov     .r3,#4            ' minimum divider of sysclock/4.  /3 also works

'  if( ck_div <= 6 )  spm_tx |= P_INVERT_B;  // falling clock + 1 + 4 lag

                  cmp     .r3,6 wcz
   if_be          or      .r2,##P_INVERT_B ' falling clock + 4 tick lag
   if_be          jmp     #.set_div_1

'  else if( ck_div <= 9 )  spm_tx |= P_INVERT_B | P_SYNC_IO;  // falling clock + 1 + 4 + 1 lag

                  cmp     .r3,9 wcz
   if_be          or      .r2,##P_INVERT_B|P_SYNC_IO ' falling clock + 5 tick lag

'  // else default:  rising clock + 1 + 4 lag

.set_div_1

'  _wxpin( PIN_CLK, ck_div | (ck_div / 2) << 16 );  // update clock smartpin sysclock divider

                  mov     .r0,.r3
                  shr     .r0,#1
                  shl     .r0,#16
                  or      .r3,.r0           
                  wxpin   .r3,#_SD_CK       ' update clock smartpin sysclock divider

'  _wrpin( PIN_DI, spm_tx );  // update tx smartpin clock

    _ret_         wrpin   .r2,#_SD_DI       ' update tx smartpin clock inversion and data registration

'------------------------------------------------------------------------------
' SD_disk_initialize   - Manual initialization (including setting scratch buffer)
'
'   On entry: .buffaddr = scratch buiffer address (at least 16 bytes)
'
'   On exit: .r0  = card status
'
' SD_disk_auto_init - Automatic initialization (use default scratch buffer address)
'
'   On entry: none.
'
'   On exit: .r0  = card status
'------------------------------------------------------------------------------
.SD_disk_initialize
                  cmp     .buffaddr,#0 wz   ' if a non zero address is specified ...
         if_nz    mov     .scratch,.buffaddr ' ... save it as scratch buffer address

.SD_disk_auto_init
                  wrpin   #_SD_CS, #0
                  drvh    #_SD_CS           ' Deselect SD card

' tmr = P_PULSE | P_OE | P_INVERT_OUTPUT | P_SYNC_IO;  // CPOL = 1 (SPI mode 3), P_SYNC_IO for late late rx sampling

                  mov     .r1,##(P_PULSE|P_OE|P_INVERT_OUTPUT|P_SYNC_IO)

' _pinstart(PIN_CLK, tmr, 0x00800100, 0);  // sysclock/256, init speed (400 kHz ideal)

                  mov     .r2,#0
                  mov     .r3,##$00800100
                  mov     .r4,.r1
                  mov     .r5,#_SD_CK
                  call    #.pinstart

'	cmd = PIN_CLK - PIN_DI;  if(abs(cmd) > 3)  return STA_NOINIT;    // clock pin too distant

                  mov     .r6,#(_SD_CK-_SD_DI) wcz
           if_b   neg     .r6
                  cmp     .r6,#3 wcz
           if_a   mov     .r0,#STA_NOINIT
           if_a   ret

' tmr = P_SYNC_TX | P_OE | (cmd & 7) << 24;  // tx smartpin mode and clock pin offset

                  mov     .r4,.r6
                  and     .r4,#7
                  shl     .r4,#24
                  or      .r4,##(P_SYNC_TX|P_OE)

' tx_spmode = tmr;

                  mov     .tx_spmode,.r4

'	_pinstart( PIN_DI, tmr | P_SYNC_IO, 31, -1 );  // rising clock + 4 + 1 ticks lag, 32-bit, continuous mode, initial 0xff

                  neg     .r2,#1
                  mov     .r3,#31
                  or      .r4,##P_SYNC_IO
                  mov     .r5,#_SD_DI
                  call    #.pinstart

' cmd = PIN_CLK - PIN_DO;  if(abs(cmd) > 3)  return STA_NOINIT;    // clock pin too distant

                  mov     .r6,#(_SD_CK-_SD_DO) wcz
           if_b   neg     .r6
                  cmp     .r6,#3 wcz
           if_a   mov     .r0,#STA_NOINIT
           if_a   ret

' tmr = P_SYNC_RX | (cmd & 7) << 24;  // rx smartpin mode and clock pin offset

                  mov     .r4,.r6
                  and     .r4,#7
                  shl     .r4,#24
                  or      .r4,##(P_SYNC_RX)

'	 _pinstart(PIN_DO, tmr, 7 | 32, 0);  // 8-bit, late late sampling, NOTE: also hard coded in pasm rx loop
'  late late sampling helps with achieving reliable sysclock/8 divider across the whole spectrum

                  mov     .r2,#0
                  mov     .r3,#(7|32)
                  mov     .r5,#_SD_DO
                  call    #.pinstart

'  Apply 80 dummy clocks and the card gets ready to receive command

                  mov     .r2,#10
                  mov     .r3,.scratch
                  call    #.rcvr_mmc

'  Enter Idle state

                  mov     .cmd,#CMD0
                  mov     .arg,#0
                  call    #.send_cmd

                  call    #.deselect

'  Apply 80 dummy clocks and the card gets ready to receive command

                  mov     .r2,#10
                  mov     .r3,.scratch
                  call    #.rcvr_mmc

                  mov     .cardtype,#0

'  Enter Idle state

                  mov     .cmd,#CMD0
                  mov     .arg,#0
                  call    #.send_cmd
                  cmp     .r0,#1 wz
    if_nz         jmp     #.disk_init_6

                  mov     .cmd,#CMD8
                  mov     .arg,#$1AA
                  call    #.send_cmd        ' SDv2?
                  cmp     .r0,#1 wz
    if_nz         jmp     #.disk_init_6
                  mov     .r2,#4
                  mov     .r3,.scratch
                  call    #.rcvr_mmc        ' Get trailing return value of R7 resp
                  mov     .r0,.scratch
                  add     .r0,#2
                  rdword  .r0,.r0
                  cmp     .r0,##$AA01 wz
    if_nz         jmp     #.disk_init_3
' The card can work at vdd range of 2.7-3.6V
                  mov     .r8,##1000
.disk_init_1
                  mov     .cmd,#ACMD41
                  mov     .arg,##(1 << 30)
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_z          jmp     #.disk_init_2
                  waitx   .delay1000us
                  djnz    .r8,#.disk_init_1
.disk_init_2      cmp     .r8,#0 wz
    if_z          jmp     #.disk_init_6
                  mov     .cmd,#CMD58
                  mov     .arg,#0
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_nz         jmp     #.disk_init_6
                  mov    .r2,#4         ' Check CCS bit in the OCR
                  mov    .r3,.scratch
                  call   #.rcvr_mmc
                  rdlong .r0,.scratch
                  test   .r0,#$40 wz
' SDv2
    if_nz         mov   .cardtype,#(CT_SD2|CT_BLOCK)
    if_z          mov   .cardtype,#CT_SD2
                  jmp   #.disk_init_6
.disk_init_3
' SDv1 or MMCv3
                  mov     .cmd,#ACMD41
                  mov     .arg,#0
                  call    #.send_cmd
                  cmp     .r0,#1 wcz
     if_be        mov     .cardtype,#CT_SD1
     if_be        mov     .cmd,#ACMD41     ' SDv1
     if_a         mov     .cardtype,#CT_MMC
     if_a         mov     .cmd,#CMD1       ' MMCv3
                  mov     .r0,##1000
.disk_init_4
                  mov     .arg,#0
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_z          jmp     #.disk_init_5
                  waitx   .delay1000us
                  djnz    .r0,#.disk_init_4
.disk_init_5
                  cmp     .r0,#0 wz
    if_nz         jmp     #.disk_init_6
                  mov     .cmd,#CMD16
                  mov     .arg,##512
                  call    #.send_cmd        ' Set R/W block length to 512
                  cmp     .r0,#0 wz
    if_z          jmp     #.disk_init_6
                  mov     .cardtype,#0
.disk_init_6
                  cmp     .cardtype,#0 wz
    if_nz         mov     .stat,#0
    if_z          mov     .stat,#STA_NOINIT
                  call    #.deselect
                  rdlong  .r0,#CLK_FRQ
                  cmp     .r0,.oldclkfreq wz
    if_nz         call    #.init_delays
    if_nz         call    #.set_divider
                  call    #.set_divider
    _ret_         mov     .rslt,.stat wz

'------------------------------------------------------------------------------
' SD_disk_deinitialize - clean up pins if necessary
'
'   On entry: none
'
'   On exit:  none
'------------------------------------------------------------------------------
.SD_disk_deinitialize
                  dirl    #_SD_DO
                  wrpin   #0, #_SD_DO
                  dirl    #_SD_DI
                  wrpin   #0, #_SD_DI
                  dirl    #_SD_CK
                  wrpin   #0, #_SD_CK
                  dirl    #_SD_CS
                  wrpin   #0, #_SD_CS
                  waitx   .delay10ms
                  mov     .rslt,.stat wz
                  ret

'------------------------------------------------------------------------------
' SD_disk_write - write sector(s) from HUB RAM
'
'   On entry: .buffaddr = Pointer to the HUB data buffer to be written
'             .blknum   = Start block number (LBA)
'             .blkcnt   = Sector count (if .buffaddr[24] == 1, otherwise 1)
'
'   On exit:  rslt = RES_OK .. RES_PARERR
'------------------------------------------------------------------------------
.SD_disk_write
                  test    .stat,#STA_NOINIT wz
    if_nz         call    #.SD_disk_auto_init ' if not yet initialized, do so now
    if_nz         mov     .rslt,#RES_NOTRDY
    if_nz         ret
                  test    .cardtype,#CT_BLOCK wz
    if_z          shl     .blknum,#9        ' Convert LBA to byte address if needed
                  rdlong  .r0,#CLK_FRQ
                  cmp     .r0,.oldclkfreq wz
    if_nz         call    #.init_delays
    if_nz         call    #.set_divider
                  test    .buffaddr,##$1000000 wz ' multi-sector write?
    if_z          mov     .blkcnt,#1              ' no - write 1 sector only
                  cmp      .blkcnt,#1 wcz
    if_b          jmp     #.SD_disk_write_4 ' nothing to do!
    if_a          jmp     #.SD_disk_write_1 ' Multiple Block Write
    if_e          mov     .cmd,#CMD24       ' Single Block Write 
                  mov     .arg,.blknum
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_nz         jmp     #.SD_disk_write_4
                  mov     .r8,#$FE          ' WRITE BLOCK
                  call    #.xmit_datablock
                  cmp     .r0,#0 wz
    if_z          jmp     #.SD_disk_write_4
                  mov     .blkcnt,#0
                  jmp     #.SD_disk_write_4
.SD_disk_write_1
                  test    .cardtype,#CT_SDC wz
    if_z          jmp     #.SD_disk_write_2
                  mov     .cmd,#ACMD23
                  mov     .arg,.blkcnt
                  call    #.send_cmd
.SD_disk_write_2
                  mov     .cmd,#CMD25
                  mov     .arg,.blknum
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_nz         jmp     #.SD_disk_write_4
.SD_disk_write_3
                  mov     .r8,#$FC
                  call    #.xmit_datablock
                  cmp     .r0,#0
    if_z          jmp     #.SD_disk_write_4
                  add     .buffaddr,##512
                  djnz    .blkcnt,#.SD_disk_write_3
                  mov     .buffaddr,#0
                  mov     .r8,#$FD          ' STOP_TRANS token
                  call    #.xmit_datablock
      if_z        mov     .blkcnt,#1
.SD_disk_write_4
                  call    #.deselect
                  cmp     .blkcnt,#0 wz
    if_z          mov     .rslt,#RES_OK
    if_nz         mov     .rslt,#RES_ERROR
                  ret

'------------------------------------------------------------------------------
' SD_disk_read - read sector(s) to HUB RAM
'
'   On entry: .buffaddr = Pointer to the HUB data buffer to store read data
'             .blknum   = Start block number (LBA)
'             .blkcnt   = Sector count (if .buffaddr[24] == 1, otherwise 1)
'
'   On exit:  rslt = RES_OK .. RES_PARERR
'------------------------------------------------------------------------------
.SD_disk_read
                  test    .stat,#STA_NOINIT wz
    if_nz         call    #.SD_disk_auto_init ' if not yet initialized, so so now
                  test    .stat,#STA_NOINIT wz
    if_nz         mov     .rslt,#RES_NOTRDY
    if_nz         ret
                  test    .cardtype,#CT_BLOCK wz
    if_z          shl     .blknum,#9        ' Convert LBA to byte address if needed
                  rdlong  .r0,#CLK_FRQ
                  cmp     .r0,.oldclkfreq wz
    if_nz         call    #.init_delays
    if_nz         call    #.set_divider
                  test    .buffaddr,##$1000000 wz ' multi-sector read?
    if_z          mov     .blkcnt,#1              ' no - read 1 sector only
                  cmp      .blkcnt,#1 wcz
    if_b          jmp     #.SD_disk_read_2  ' nothing to do!
    if_a          mov     .cmd,#CMD18        ' READ_MULTIPLE_BLOCK
    if_e          mov     .cmd,#CMD17        ' READ_SINGLE_BLOCK
                  mov     .arg,.blknum
                  call    #.send_cmd
                  cmp     .r0,#0 wz
    if_nz         jmp     #.SD_disk_read_2
.SD_disk_read_1
                  mov     .buffcnt,##512
                  call    #.rcvr_datablock
                  cmp     .r0,#0
    if_z          jmp     #.SD_disk_read_2
                  add     .buffaddr,##512
                  djnz    .blkcnt,#.SD_disk_read_1
                  cmp     .cmd,#CMD18 wz
    if_nz         jmp     #.SD_disk_read_2
                  mov     .cmd,#CMD12        ' STOP_TRANSMISSION
                  mov     .arg,#0
                  call    #.send_cmd
.SD_disk_read_2
                  call    #.deselect
                  cmp     .blkcnt,#0 wz
    if_z          mov     .rslt,#RES_OK
    if_nz         mov     .rslt,#RES_ERROR
                  ret

'
'------------------------------------------------------------------------------
' SD_disk_ioctl - perform ioctl operation
'
'   On entry: .rqst  = IOCTL command (low byte)
'
'   On exit:  .rslt = RES_OK .. RES_PARERR if < 128, or block size or sector count
'------------------------------------------------------------------------------
.SD_disk_ioctl
                  test    .stat,#STA_NOINIT wz ' Check if card is in the socket
    if_nz         mov     .rslt,#RES_NOTRDY
    if_nz         ret
                  rdlong  .r0,#CLK_FRQ
                  cmp     .r0,.oldclkfreq wz
    if_nz         call    #.init_delays
    if_nz         call    #.set_divider
                  mov     .rslt,#RES_ERROR
                  mov     .r0,.rqst         ' get ...
                  and     .r0,#$FF          ' ... IOCTL command
                  cmp     .r0,#CTRL_SYNC wz
    if_z          jmp     #.ioctl_1         ' Make sure that no pending write process
                  cmp     .r0,#MMC_GET_CSD wz
    if_z          jmp     #.ioctl_2         ' Get CSD
                  cmp     .r0,#GET_SECTOR_COUNT wz
    if_z          jmp     #.ioctl_2         ' Get number of sectors on the disk
                  cmp     .r0,#GET_BLOCK_SIZE wz
    if_z          mov     .rslt,#128        ' Get erase block size in unit of sector
                  cmp     .r0,#MMC_GET_SDSTAT wz
    if_z          mov     .rslt,.stat       ' Get SD status
    if_nz         mov     .rslt,#RES_PARERR
                  ret
.ioctl_1          call    #.select
    if_nz         mov     .rslt,#RES_OK
                  ret
.ioctl_2          mov     .cmd,#CMD9
                  mov     .arg,#0
                  call    #.send_cmd
                  mov     .buffaddr,.scratch ' location to put CSD
                  mov     .buffcnt,#16       ' length of CSD
                  call    #.rcvr_datablock
                  cmp     .r0,#0 wz
    if_z          mov     .r0,#RES_ERROR
    if_z          ret
                  mov     .r0,.rqst         ' get ...
                  and     .r0,#$FF wz       ' ... IOCTL command again
                  cmp     .r0,#MMC_GET_CSD wz ' was it get CSD?
         if_z     mov     .r0,#RES_OK       ' if so ...
         if_z     ret                       ' ... done
                  call    #.disc_size       ' otherwise calculate sectors from CSD
                  shl     .r0,#1            ' convert kilobytes back to sectors
                  mov     .rslt,.r0
                  ret

.LUT_END
                  fit   $400

'------------------------------------------------------------------------------------------------
CON

'------------------------------------------------------------------------------------------------
' SD Commands & Responses...
'------------------------------------------------------------------------------------------------
' Command              Argument        Response/Data    Description
  CMD0   = 0         ' 0               R1       -       GO_IDLE_STATE            *Reqs valid CRC
  CMD1   = 1         ' 0               R1       -       SEND_OP_COND
  ACMD41 = 41 +$80   ' $4000_0000      R1       -       APP_SEND_OP_COND         *Reqs CMD55 first
  CMD8   = 8         ' 0               R1+R7    -       SEND_IF_COND             *Reqs valid CRC
  CMD9   = 9         ' 0               R1       Y       SEND_CSD
  CMD10  = 10        ' 0               R1       Y       SEND_CID
  CMD12  = 12        ' 0               R2       -       STOP_TRANSMISSION
  CMD13  = 13        ' 0               R2       -       SEND_STATUS
  ACMD13 = 13 +$80   ' 0               R2       -       SEND_STATUS
  CMD16  = 16        ' BlkLen[31:0]    R1       -       SET_BLOCKLEN
  CMD17  = 17        ' Addr[31:0]      R1       Y       READ_SINGLE_BLOCK
  CMD18  = 18        ' Addr[31:0]      R1       Y       READ_MULTIPLE_BLOCK
  CMD23  = 23        ' NoBlks[15:0]    R1       -       SET_BLOCK_COUNT
  ACMD23 = 23 +$80   ' NoBlks[22:0]    R1       -       SET_WR_BLOCK_ERASE_COUNT *Reqs CMD55 first
  CMD24  = 24        ' Addr[31:0]      R1       Y*      WRITE_BLOCK
  CMD25  = 25        ' Addr[31:0]      R1       Y*      WRITE_MULTIPLE_BLOCK
  CMD32  = 32        ' Addr[31:0]      R1               ERASE_ER_BLK_START
  CMD33  = 33        ' Addr[31:0]      R1               ERASE_ER_BLK_END
  CMD48  = 38        ' Func[31:0]      R1               ERASE
  CMD55  = 55        ' 0               R1       -       APP_CMD                  *Prefix for ACMD41/ACMD23
  CMD58  = 58        ' 0               R1+R3    -       READ_OCR

' R1 response:  $FF = busy/wait (0-8 bytes?)
'               b7: 0 (msb first)
'               b6: Parameter Error
'               b5: Address Error
'               b4: Erase Sequence Error
'               b3: Command CRC Error
'               b2: Illegal Command
'               b1: Erase Reset
'               b0: In Idle State
' R1b response: ???
' R3 response:  R1 + OCR(32b)
' R7 response:  R1($01) + 32b(b11..b0 = $1AA = SDC V2 2V7-3V6, else reject)
'
' DataPacket:   DataToken(1byte) + DataBlock(1-2048bytes) + CRC(2bytes)
'   DataToken:  $FE = CMD17/18/24 (read'1'block/read'n'blocks/write'1'block)
'               $FC = CMD25 (write'n'blocks)
'               $FD = CMD25 StopToken  (Single byte packet without data or CRC)
' ErrorToken:   Single Byte Reply
'               b7-b5: 000
'               b4: Card Locked
'               b3: Out of Range
'               b2: Card ECC failed
'               b1: CC Error
'               b0: Error
' DataResponse:
'               b7-b4: xxx0
'               $x5: Data Accepted
'               $xB: Data Rejected - CRC Error
'               $xD: Data Rejected - Write Error

'------------------------------------------------------------------------------------------------
' MMC card type flags (MMC_GET_TYPE):
'------------------------------------------------------------------------------------------------
  CT_MMC   = $01    ' MMC ver 3
  CT_SD1   = $02    ' SD ver 1
  CT_SD2   = $04    ' SD ver 2
  CT_SDC   = (CT_SD1|CT_SD2)  ' SD
  CT_BLOCK = $08    ' Block addressing

'------------------------------------------------------------------------------------------------
' disk status bits (stored in status)
'------------------------------------------------------------------------------------------------
  STA_NOINIT  = $01 ' Drive not initialized 
  STA_NODISK  = $02 ' No medium in the drive
  STA_PROTECT = $04 ' Write protected

'------------------------------------------------------------------------------------------------

DAT

{{
+------------------------------------------------------------------------------------------------------------------------------+
|                                                   TERMS OF USE: MIT License                                                  |
+------------------------------------------------------------------------------------------------------------------------------+
|Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    |
|files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    |
|modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software|
|is furnished to do so, subject to the following conditions:                                                                   |
|                                                                                                                              |
|The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.|
|                                                                                                                              |
|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          |
|WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         |
|COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   |
|ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         |
+------------------------------------------------------------------------------------------------------------------------------+
}}

