{{
''=============================================================================
''
'' Catalina_SD_Plugin.spin2 - Implement SD Card support for the Propeller 2.
''                            Also implements Real-Time Clock functionality
''                            if the Catalina symbol CLOCK is defined.
''
'' Implemented for Catalina by:
''     Ross Higson
''
'' Incorporates code originally written by Ray Rodrick (Cluso99).
''
'' History:
''   Version 1.0 - Initial version.
''   Version 2.0 - Fixed a bug that meant some SD Cards could not be written.
''                 On write failure, now returns data response token.
''   Version 3.0 - Added extra wait times when clock speed is above 200 Mhz,
''                 to keep the bus down to a maximum of 8Mhz.
''                 Fixed a race condition in integration of RTC and SD code.
''   Version 4.0 - Added 8 extra clocks after each operation. Added a new
''                 "ready" check before each operation.
''   Version 5.0 - make delay configurable using Catalina symbol SD_DELAY
''                 (defaults to 10ms if not specified)
''
''=============================================================================
}}
CON

#include <constant.inc>

CON

delay1s       = _CLOCKFREQ                 ' 1s  (xtal * pll)
delay2s       = _CLOCKFREQ * 2             ' 2s  (xtal * pll)
delay5ms      = _CLOCKFREQ / 200           ' 5ms
delay10ms     = _CLOCKFREQ / 100           ' 10ms
delay20ms     = _CLOCKFREQ / 50            ' 20ms
delay1ms      = _CLOCKFREQ / 1_000         ' 1ms
delay5us      = _CLOCKFREQ / 200_000       ' 5us
delay250us    = _CLOCKFREQ / 4_000         ' 250us

#ifndef SD_DELAY
#define SD_DELAY delay10ms
#endif

' FLAG that extra clocks are needed above 200 Mhz (the flag will be 0 for
' any clock frequency less than 200Mh, and 1 for any frequency above that):
EXTRA_FLAG    = ((_CLOCKFREQ+336_870_911)>>29)

' calculate how many extra clocks are required to keep the SPI bus at 8 Mhz:
CLOCK_EXTRA   = EXTRA_FLAG*((_CLOCKFREQ-200_000_000)/8_000_000)

SD_First      = 1
SD_Init       = 1
SD_Read       = 2
SD_Write      = 3
SD_ByteIO     = 4
SD_StopIO     = 5

#ifdef CLOCK
'
SD_CLOCKS_PER_SEC = 1_000       ' resolution of clock - if this value
                                ' is changed, also change time.h
'
SD_RTC_SetFreq    = 6
SD_RTC_GetClock   = 7
SD_RTC_SetTime    = 8
SD_RTC_GetTime    = 9
SD_RTC_Debug      = 10
SD_RTC_GetTicks   = 11
'
#ifdef P2_EVAL
SD_DEBUG_LED   = 56             ' suitable for P2_EVAL
#else
SD_DEBUG_LED   = 38             ' suitable for P2_EDGE
#endif

SD_Last        = 11             ' last valid command if CLOCK defined
#else
SD_Last        = 5              ' last valid command if CLOCK not defined
#endif

' SD services:
'
' The command to perform is encoded in the top 8 bits of the parameter
' The address of a parameter block is encoded in the bottom 24 bits.
' The parameter block is 2 longs:
'    - the buffer adress to use
'    - the sector number to read/write 

'name: SD_Init - Initialize the driver
'code: 1
'type: long request
'data: parameter block address
'rslt: (none)
'
'name: SD_Read - Read a sector
'code: 2
'type: long request
'data: parameter block address
'rslt: (none)
'
'name: SD_Write - Write a sector
'code: 3 
'type: long request
'data: parameter block address
'rslt: 0 on success, data response token on failure (with bit 8 set to ensure not zero!)
   
'name: SD_ByteIO - Write a sector
'code: 4 
'type: short request
'data: byte to write
'rslt: 0 on success, data response token on failure (with bit 8 set to ensure not zero!)

'name: SD_StopIO - disable the SD card (required on the TRIBLADEPROP and RAMBLADE)
'code: 5 
'type: short request
'data: byte to write
'rslt: (none)

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

.t1       cogid   .t1                     ' get ...
.t2       shl     .t1,#2                  ' ... our ...
.rqstptr  add     .t1,PTRA                ' ... registry block entry
.rsltptr  rdlong  .rqstptr,.t1            ' register ...
.t0       and     .rqstptr,Mask24         ' ... this ...
.t3       wrlong  ZeroVal,.rqstptr
.t4       mov     .t2,#LMM_FIL            ' ... plugin ...
.t5       shl     .t2,#24                 ' ... as the ...
.paramptr or      .t2,.rqstptr            ' ... appropriate ...
.param    wrlong  .t2,.t1                 ' ... type
.rslt     mov     .rsltptr,.rqstptr       ' set up a pointer to ...
          add     .rsltptr,#4             ' ... our result address

          call    #_SDCard_Init
#ifdef CLOCK
          call    #.RTC_Init
#endif

.pause 
        waitx   ##delay5us

#ifdef CLOCK
        call    #.RTC_Update             ' update clock counts
#endif
        rdlong  .t1,.rqstptr wz
   if_z jmp     #.pause
        mov     .paramptr,.t1
        and     .paramptr,Mask24
        mov     .t5,.paramptr
        rdlong  .param, .paramptr
        rdlong  bufaddr,.paramptr
        add     .paramptr,#4
        rdlong  blocknr,.paramptr
        shr     .t1,#24                  ' get command ...
        and     .t1,#$ff                 ' ... to execute
        cmp     .t1,#SD_First wcz        ' check for valid command
  if_b  jmp     #.err_command
        cmp     .t1,#SD_Last wcz         ' check for valid command
  if_a  jmp     #.err_command
        mov     .rslt, #0
        sub     .t1,#SD_First
        shl     .t1,#1
        add     .t1,#.cmdTable 
        jmp     .t1                      ' jump to command

.cmdTable
        call    #.SD_Init
        jmp     #.end_command
        call    #.SD_Read
        jmp     #.end_command
        call    #.SD_Write
        jmp     #.end_command
        call    #.SD_ByteIO
        jmp     #.end_command
        call    #.SD_StopIO
        jmp     #.end_command
#ifdef CLOCK
        call    #.RTC_SetFreq
        jmp     #.end_command
        call    #.RTC_GetClock
        jmp     #.end_command
        call    #.RTC_SetTime
        jmp     #.end_command
        call    #.RTC_GetTime
        jmp     #.end_command
        call    #.RTC_DebugFlag
        jmp     #.end_command
        call    #.RTC_GetTicks
        jmp     #.end_command
#endif

.err_command
        neg     .rslt,#1                 ' return -1 on error
        jmp     #.end_command
.end_command
        wrlong  .rslt,.rsltptr           ' return .rslt 
        wrlong  Zeroval,.rqstptr         ' clear command status
        jmp     #.pause                  ' pause before next command

#ifdef CLOCK

'-------------------- Clock Functions -----------------------------------------

'
' RTC_Init : Initialize the Real-Time Clock
'
.RTC_Init
        getct   .t0
        mov     .time_cnt_last,.t0      ' initialize time
  _ret_ mov     .clock_cnt_last,.t0     ' initialize clock

'
' RTC_Update : update the clock and time counters
'
.RTC_Update                        
        tjnz    .per_sec,#.got_freq     ' no - if frequency not set ...
        call    #.RTC_Init              ' .. just re-initialize
        ret                             ' done
.got_freq
        getct   .t3                     ' get latest cnt
        cmp     .t3,.clock_cnt_last wcz ' compare with last cnt used for clock
  if_ae jmp     #.clock_no_wrap         ' check for wrap                 
        mov     .t2,.clock_cnt_last     ' calculate increment ...
        sub     .t2,.t3                 ' ... when wrap has occurred
        jmp     #.update_clock                        
.clock_no_wrap
        mov     .t2,.t3                 ' calculate increment ...
        sub     .t2,.clock_cnt_last     ' ... when no wrap has occurred

.update_clock
        mov     .clock_cnt_last,.t3     ' update last count used for clock
        add     .clock_incr,.t2         ' add increment to unprocessed clock
        cmp     .clock_incr,.per_clock wcz   ' increment clock?
   if_b jmp     #.do_time               ' no - go process time
        mov     .t0,.clock_incr         ' yes - calculate ...
        mov     .t1,.per_clock          ' ... number ...
        call    #.d32u                  ' ... of ticks ...
        add     .clock,.t0              ' ... to add to clock ...
        mov     .clock_incr,.t1         ' ... save remainder for next round
.do_time
        cmp     .t3,.time_cnt_last wcz  ' compare with last cnt used for clock
  if_ae jmp     #.time_no_wrap          ' check for wrap                 
        mov     .t2,.time_cnt_last      ' calculate increment ...
        sub     .t2,.t3                 ' ... when wrap has occurred
        jmp     #.update_time                        
.time_no_wrap
        mov     .t2,.t3                 ' calculate increment ...
        sub     .t2,.time_cnt_last      ' ... when no wrap has occurred

.update_time
        mov     .time_cnt_last,.t3      ' update last count used for time
        add     .time_incr,.t2          ' add increment to unprocessed time
        cmp     .time_incr,.per_sec wcz ' increment time?
  if_b  ret                             ' no - done
        mov     .t0,.time_incr          ' yes - calculate ...
        mov     .t1,.per_sec            ' ... number ...
        call    #.d32u                  ' ... of secs ...
        add     .time,.t0               ' ... to add to time ...
        mov     .time_incr,.t1          ' ... save remainder for next round
        tjz     .debug_flag,#.update_done ' if not debug, done
        cmp     .t0,#0 wz               ' did we increment time?
#ifdef SD_DEBUG_LED_CLOCK                        
        drvnot  #SD_DEBUG_LED           ' toggle SD_DEBUG_LED
#endif
.update_done
        ret

'
' RTC_SetFreq : Set the frequency, calculate counts per clock tick, 
'               and reset the clock counters
'
.RTC_SetFreq
        tjz     .param,#.RTC_SetFreq_ret
        mov     .per_sec,.param
        mov     .t0,.per_sec
        mov     .t1,.clock_res
        call    #.d32u
        mov     .per_clock,.t0
        mov     .clock,#0
        mov     .clock_incr,#0
        getct   .clock_cnt_last
.RTC_SetFreq_ret
        ret

'
' RTC_GetClock : return current clock, or -1 if frequency not set yet
'
.RTC_GetClock
        tjnz    .per_sec,#._GetClock_ok
   _ret_ neg     .rslt,#1
._GetClock_ok
  _ret_ mov     .rslt,.clock

'
' RTC_SetTime : set the current time, and reset the time counters
'
.RTC_SetTime
        mov     .time,.param
        mov     .time_incr,#0
  _ret_ getct   .time_cnt_last

'
' RTC_GetTime : return current time, or -1 if frequency not set yet
'
.RTC_GetTime
        tjnz    .per_sec,#._GetTime_ok
  _ret_ neg     .rslt,#1
._GetTime_ok
  _ret_ mov     .rslt,.time

'
' RTC_DebugFlag : set/reset debug flag (works on P2_EVAL or P2_EDGE)
'
.RTC_DebugFlag
   _ret_ mov     .debug_flag,.param

'
' RTC_GetTicks : return current time, as 2 longs, 
'              result = 0 if frequency has been set, -1 otherwise
'
.RTC_GetTicks
         tjnz    .per_sec,#.RTC_GetTicks_ok
   _ret_ neg     .rslt,#1
.RTC_GetTicks_ok
         wrlong   .time, .t5              ' return ...
         add      .t5, #4                 ' seconds
         mov      .t0,.time_incr          ' convert ...
         mov      .t1,.per_clock          ' ... unprocessed time counts ...
         call      #.d32u                 ' ... to clock counts ...
         wrlong   .t0,.t5                 ' ... and return that
   _ret_ mov     .rslt,#0


'.m32 - 32 bit multiplication
' On entry:
'    .t0 = operand 1
'    .t1 = operand 2
' On exit:
'    .t0 = result
.m32
        qmul     .t0,.t1
  _ret_ getqx    .t0

'.d32u - Unsigned 32 bit division
' On entry:
'    Divisor  : .t1
'    Dividend : .t0
' On exit:
'    Quotient in .t0
'    Remainder in .t1
.d32u
        qdiv     .t0,.t1
        getqx    .t0
  _ret_ getqy    .t1

'-------------------- local variables -----------------------------------------

#ifdef SD_DEBUG_LED_CLOCK
.debug_flag      long    1                       ' set to 1 to toggle debug LED every second
#else
.debug_flag      long    0                       ' set to 1 to toggle debug LED every second
#endif

.clock_res       long    SD_CLOCKS_PER_SEC       ' clock resolution (fixed at compile time)

.per_sec         long    0                       ' cnts per sec (system clock frequency)                 
.per_clock       long    0                       ' cnts per clock

.clock           long    0                       ' current clock val                       
.clock_cnt_last  long    0                       ' last cnt value retrieved
.clock_incr      long    0                       ' count as yet unprocessed

.time            long    0                       ' current time val
.time_cnt_last   long    0                       ' last cnt value retrieved
.time_incr       long    0                       ' count as yet unprocessed

#endif

'-------------------- SD Card Functions -----------------------------------------

.SD_Init
        call    #_SDcard_Init
  if_z  mov     .rslt,#0
  if_nz neg     .rslt,#1
        ret

.SD_Write
        call    #_SD_Ready      ' SD card ready?
  if_nz jmp     #.SD_Result     ' no - return result from card
        call    #_writeSECTOR   ' yes - write sector
        jmp     #.SD_Result     ' return result

.SD_Read
        call    #_SD_Ready      ' SD card ready?
  if_nz jmp     #.SD_Result     ' no - return result from card
        call    #_readSECTOR    ' yes - read sector, return result
.SD_Result
  if_z  mov     .rslt,#0
  if_nz mov     .rslt, reply
        call    #_sendFF
        ret                     ' return data response

.SD_ByteIO
' ??? not implemented ???
        neg     .rslt,#1
        ret

.SD_StopIO
' ??? not implemented - disable SD card ??? 
        neg     .rslt,#1
        ret 

'------------------------------------------------------------------------------------------------

CON

'------------------------------------------------------------------------------------------------
' SD Commands & Responses...
'------------------------------------------------------------------------------------------------
' Command              Argument        Response/Data    Description
  CMD0   = 0  +$40   ' 0               R1       -       GO_IDLE_STATE            *Reqs valid CRC
  CMD1   = 1  +$40   ' 0               R1       -       SEND_OP_COND
  ACMD41 = 41 +$40   ' $4000_0000      R1       -       APP_SEND_OP_COND         *Reqs CMD55 first
  CMD8   = 8  +$40   ' 0               R1+R7    -       SEND_IF_COND             *Reqs valid CRC
  CMD9   = 9  +$40   ' 0               R1       Y       SEND_CSD
  CMD10  = 10 +$40   ' 0               R1       Y       SEND_CID
'  CMD12  = 12 +$40   ' 0               R2       -       STOP_TRANSMISSION
  CMD13  = 13 +$40   ' 0               R2       -       SEND_STATUS
  CMD16  = 16 +$40   ' BlkLen[31:0]    R1       -       SET_BLOCKLEN
  CMD17  = 17 +$40   ' Addr[31:0]      R1       Y       READ_SINGLE_BLOCK
'  CMD18  = 18 +$40   ' Addr[31:0]      R1       Y       READ_MULTIPLE_BLOCK
'  CMD23  = 23 +$40   ' NoBlks[15:0]    R1       -       SET_BLOCK_COUNT
'  ACMD23 = 23 +$40   ' NoBlks[22:0]    R1       -       SET_WR_BLOCK_ERASE_COUNT *Reqs CMD55 first
  CMD24  = 24 +$40   ' Addr[31:0]      R1       Y*      WRITE_BLOCK
'  CMD25  = 25 +$40   ' Addr[31:0]      R1       Y*      WRITE_MULTIPLE_BLOCK
  CMD55  = 55 +$40   ' 0               R1       -       APP_CMD                  *Prefix for ACMD41/ACMD23
  CMD58  = 58 +$40   ' 0               R1+R3    -       READ_OCR


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


DAT

'
' Check pin pull-up
'
check_pullup
        drvl    pa              ' drive pin low
check_pulldn
        waitx   ##300*1         ' wait >1us
        fltl    pa              ' float pin
        waitx   ##300*5         ' wait >5us
  _ret_ testp   pa      wc      ' sample pin

'+-------[ SD Card Initialisation ]--------------------------------------------+ <--- SD initialisation --->
'+ On Entry:                                                                   +
'+ Call Format:                                                                +
'+              CALL    #_SDcard_Init                   '                      + < call: sd initialise >
'+ On Return:                                                                  +
'+      hub $20   = CSD[16] + CID[16]                   ' csd/cid data         +
'+      Returns  "Z" if ok, "NZ" if error                                      +
'+-----------------------------------------------------------------------------+

'+-----------------------------------------------------------------------------+
'+      SD/SDHC/sdxc SPI Initialisation                                        +
'+-----------------------------------------------------------------------------+
'+      Send >74 clocks with /CS=1 & DI=1 starting & ending with CLK=0         +
'+-----------------------------------------------------------------------------+
_SDcard_Init
                mov     _hubdata,         #$20          ' init hub data ptr=$20 
                                                        ' ie. after CLKFREQ ($14), CLKMODE ($18) & BAUDRATE ($1C)
                'callpa  #_SD_CS,          #check_pullup ' check for pull-up on sd_cs
        'if_nc   jmp     #_fail '_pullup                 '

                drvh    #_SD_CS                         ' cs=1 & output
                drvl    #_SD_CK                         ' ck=0 & output
                drvh    #_SD_DI                         ' di=1 & output

                mov     ctr1,             #(96*2)
.count          waitx   ##delay5us                      '\ 5us+5us (ie 100KHz)
                outnot  #_SD_CK                         '| CLK=0-->1-->0
                djnz    ctr1,             #.count       '/
                waitx   ##delay5us                      '  CLK=0 (idle) & /CS=1
'+-----------------------------------------------------------------------------+
'+ Software Reset:                                                             +
'+      CMD0,  PAR=$0,        CRC=$95, REPLY=R1($01)                           +
'+-----------------------------------------------------------------------------+
.Command0       getct   ini_time                        '\ set timeout up to CMD9
                mov     time_out,         ##delay10ms   '/
                mov     ctr1,             #10           ' try a few times
.again0         mov     cmdout,           #CMD0
                mov     cmdpar,           #0
                mov     cmdcrc,           #$95
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc         mov     time_out,         ##delay1s     ' increase timeout to 1s
                                                        '\ $01(idle): SD/MMC, not fully validated
  if_nc         jmp     #.Command8                      '/ $00(good): (dane card response)
'+-----------------------------------------------------------------------------+
                waitx   ##delay5us                      ' delay 5us
                djnz    ctr1,             #.again0      ' n: try again?
                jmp     #_fail '00                      '

'+-----------------------------------------------------------------------------+
'+ _SD_Ready: check SD card is ready (send $FF until $FF received)             +
'+            return Z if ok, NZ and reply on timeout                          +
'+-----------------------------------------------------------------------------+
_SD_Ready       getct   ini_time                        '\ set timeout 
                mov     time_out,         ##delay1s     '/
                outl    #_SD_CS                         ' /CS=0 (enable)
.again1         call    #_recvbyte                      ' read data byte
                cmp     reply,            #$FF wz       ' $FF?
        if_z    jmp     #.ready1
                getct   replyR1                         '\ timeout ?
                sub     replyR1,          ini_time      '|
                cmp     replyR1,          time_out  wc  '| c if < timeout
        if_nc   jmp     #.error1                        '/ n: not ready
                waitx   ##delay5us                      ' delay 5us
                jmp     #.again1                        ' try again
.error1         or      reply,#$100 wz                  ' ensure NZ on error
.ready1 _RET_   outh    #_SD_CS                         ' /CS=1 (disable)

'+=============================================================================+

' we know we now have an SD/MMC card but its not fully validated yet...
'+-----------------------------------------------------------------------------+
'+ Check Voltage:                                                              +
'+      CMD8,  PAR=$1AA,      CRC=$87, REPLY=R1($01)+R7($xx1AA) ($05=try SDV1) +
'+-----------------------------------------------------------------------------+
.Command8       mov     cmdout,           #CMD8
                mov     cmdpar,           #$1AA
                mov     cmdcrc,           #$87
'+-----------------------------------------------------------------------------+
                call    #_cmdR1R7        ' /CS=0, send cmd, recv R1+R7, /CS=1
'+-----------------------------------------------------------------------------+
  if_c_or_z     jmp     #.illegal                       ' j if <> $01 (not idle)
.idle           and     reply,            ##$FFF        '\
                cmp     reply,            #$1AA     wz  '/ R7[11:0]=$1AA ?
                mov     cmdpar2,          ##$40000000   ' preset for SDV2
  if_ne         jmp     #_fail '98                      ' n: unknown R7
                jmp     #.Command55                     ' y: CMD55+ACMD41($4000_0000)

.illegal        cmp     replyR1,          #$05      wz  ' $05(illegal cmd) ?
  if_ne         jmp     #_fail '08                      ' <>$01/$05 (not idle/illegal)
                mov     cmdpar2,          #0            ' try SDV1
                                                        ' CMD55+ACMD41($0) fall thru
'+-----------------------------------------------------------------------------+
'+ Prefix to ACMD41 & ACMD23:                                                  +
'+      CMD55, PAR=$0,        CRC=$xx, REPLY=R1($01)                           +
'+-----------------------------------------------------------------------------+
.Command55      mov     cmdout,           #CMD55        '
                mov     cmdpar,           #0            '
'+-----------------------------------------------------------------------------+
                call    #_cmdRZA41       ' /CS=0, send cmd, recv R1, /CS=0(ena)
'+-----------------------------------------------------------------------------+
  if_c_or_z     jmp     #_fail '55                      ' <>$01 (not idle)
                                                        '              fall thru
'+-----------------------------------------------------------------------------+
'+ Check SDV1/SDV2:  (follows CMD55)                                           +
'+     ACMD41, PAR=$0,        CRC=$xx, REPLY=R1($00) SD-V1                     +
'+     ACMD41, PAR=$40000000, CRC=$xx, REPLY=R1($00) SD-V2                     +
'+-----------------------------------------------------------------------------+
.CommandA41     mov     cmdout,           #ACMD41       '
                mov     cmdpar,           cmdpar2       ' SDV1=0 / SDV2=$40000000
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc_and_nz  jmp     #.Command55                     '  =$01(busy): CMD55+CMD41 again
  if_c          jmp     #_fail '41                      ' <>$00/$01: error

                cmp     cmdpar2,          #0        wz  ' SDV1 ?
        if_z    mov     blocksh,          #9            ' y: #1 SDV1(byte address)
        if_z    jmp     #.Command16                     ' y: SDV1 does not use CMD58
                                                        ' SDV2         fall thru
'+-----------------------------------------------------------------------------+
'+ Check OCR CCS bit:                                                          +
'+      CMD58, PAR=$0,        CRC=$xx, REPLY=R1($00)+R3(b30=1)                 +
'+-----------------------------------------------------------------------------+
.Command58      mov     cmdout,           #CMD58        ' SDHC ?
                mov     cmdpar,           #0            '
'+-----------------------------------------------------------------------------+
                call    #_cmdR1R3        ' /CS=0, send cmd, recv R1+R3, /CS=1
'+-----------------------------------------------------------------------------+
  if_c_or_nz    jmp     #_fail '58                      ' <>$00(good): error
                testbn  reply,            #30       wz  ' bit30=CCS=1? $40000000?
        if_z    mov     blocksh,          #9            ' n: #2 SDV2(byte address)
        if_nz   mov     blocksh,          #0            ' y: #3 SDHC/SDV2(block address)
''      if_nz   jmp     #.Command9x                     ' y: does not req cmd16?                        ?????????
                                                        ' SDV2(byte)   fall thru
'+-----------------------------------------------------------------------------+
'+ Force block size to 512 bytes:                                              +
'+      CMD16, PAR=$200,      CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command16      mov     cmdout,           #CMD16        ' force blocksize=512bytes
                mov     cmdpar,           ##512         ' 512 bytes
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc_and_nz  jmp     #.Command16                     '  =$01(idle): again
  if_c_or_nz    jmp     #_fail '16                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
.Command9x      mov     bufaddr,          _hubdata      ' where to store CSD/CID
'+-----------------------------------------------------------------------------+
'+ Read CSD register (16 bytes):                                               +
'+      CMD9,  PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command9       mov     cmdout,           #CMD9         ' read CSD register
                call    #_readREG                       '
'+-----------------------------------------------------------------------------+
'+ Read CID register (16 bytes):                                               +
'+      CMD10, PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command10      mov     cmdout,           #CMD10        ' read CID register
                call    #_readREG                       '
'+-----------------------------------------------------------------------------+
        _RET_   MODZ    _set                      wz    ' "Z" = success
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+ Read Sector:                                                                +
'+-----------------------------------------------------------------------------+
_readSECTOR
'+-----------------------------------------------------------------------------+
'+ Read Block/Sector:  (512 bytes)                                             +
'+      CMD17, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
.Command17      mov     bytescnt,         ##512         ' read block (no. bytes)
                mov     cmdout,           #CMD17        '
                mov     cmdpar,           blocknr       '
                shl     cmdpar,           blocksh       ' <<0 or <<9
'+-----------------------------------------------------------------------------+
                call    #_readBLOCK                     ' read 512 bytes
'+-----------------------------------------------------------------------------+
                RET                                     ' "Z" = success
'+-----------------------------------------------------------------------------+
'+ Write Sector:                                                               +
'+-----------------------------------------------------------------------------+
_writeSECTOR
'+-----------------------------------------------------------------------------+
'+ Write Block/Sector:  (512 bytes)                                            +
'+      CMD24, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
.Command24      mov     bytescnt,         ##512         ' write block (no. bytes)
                mov     cmdout,           #CMD24        '
                mov     cmdpar,           blocknr       '
                shl     cmdpar,           blocksh       ' <<0 or <<9
'+-----------------------------------------------------------------------------+
                call    #_writeBLOCK                    ' write 512 bytes
'+-----------------------------------------------------------------------------+
                RET                                     ' "Z" = success
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+ Read Block/Sector:  (512 bytes)                                             +
'+      CMD9,  PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+      CMD10, PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+      CMD17, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
_readREG        mov     bytescnt,         #16           ' CMD9,10: CSD,CID register
                mov     cmdpar,           #0            '        PAR=$0,      16 bytes
_readBLOCK                                              ' CMD17: PAR=sector, 512 bytes
                getct   ini_time                        '\ set timeout for cmd9,10,17
                mov     time_out,         ##delay1s     '/
'+-----------------------------------------------------------------------------+
                call    #_cmdRZtoken     ' /CS=0, send cmd, recv R1, /CS=0(ena)
        if_nz   jmp     #_fail '17                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
                call    #_getreply                      ' n*$FF+$FE
                cmp     reply,            #$FE      wz  ' $FE=valid Data Token
        if_z    jmp     #.readbyte
                or      reply,#$100                     ' ensure we don't return 0 on error!
                jmp     #_fail '97                      '
 '+-----------------------------------------------------------------------------+
.readbyte       call    #_recvbyte                      ' read data byte
                wrbyte  reply,            bufaddr       ' save byte
                add     bufaddr,          #1            ' bufaddr++
                djnz    bytescnt,         #.readbyte    ' byte--
                call    #_recvbyte                      ' read CRC16 1/2
                call    #_recvbyte                      ' read CRC16 2/2
' NOTE: CRC16 not checked - do we want to do this?                                         ??????????
                outl    #_SD_CK                         ' CLK=0 (idle)          already=0
                call    #_recvbyte                      ' SEND 8 CLOCKS BEFORE DISABLING CS
                outh    #_SD_CS                         ' /CS=1 (disable)
        _RET_   MODZ    _set                        wz  ' "Z" = success
'+=============================================================================+
'+-----------------------------------------------------------------------------+
'+ Write Block/Sector:  (512 bytes)                                            +
'+      CMD24, PAR=blocknr                                                     +
'+-----------------------------------------------------------------------------+
_writeBLOCK                                             ' CMD24: PAR=sector, 512 bytes
                getct   ini_time                        '\ set timeout for cmd24
                mov     time_out,         ##delay2s     '/
'+-----------------------------------------------------------------------------+
                call    #_cmdRZtoken     ' /CS=0, send cmd, recv R1, /CS=0(ena)
        if_nz   jmp     #_fail '24                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
                mov     dataout,          #$FE          ' start block token
                call    #_sendbyte                      ' write data byte
'+-----------------------------------------------------------------------------+
.writebyte      rdbyte  dataout,          bufaddr       ' load byte
                call    #_sendbyte                      ' write data byte
                add     bufaddr,          #1            ' bufaddr++
                djnz    bytescnt,         #.writebyte   ' byte--
' NOTE: CRC16 is ignored in SPI mode
                call    #_sendFF                        ' CRC16 byte 1/2
                call    #_sendFF                        ' CRC16 byte 2/2
#if SD_DELAY != 0
                waitx   ##SD_DELAY                      ' why is this necessary???
#endif
                call    #_getreply                      ' 
                and     reply,            #$1f
                cmp     reply,            #$5 wz
       if_z     jmp     #.waitdelay
                or      reply,#$100                     ' ensure reply is not zero
                jmp     #_fail
.waitdelay
#if SD_DELAY != 0
                waitx   ##SD_DELAY                      ' why is this necessary???
#endif
.waitbusy
                call    #_recvbyte                      ' get a byte
                cmp     reply,            #$FF      wz  ' reply=$FF=busy ?
        if_nz   jmp     #.writedone                     ' n: done
                getct   replyR1                         '\ y: timeout ?
                sub     replyR1,          ini_time      '|
                cmp     replyR1,          time_out  wc  '| c if < timeout
        if_c    jmp     #.waitbusy                      '| n: try again
                jmp     #_fail '90                      '/ y: timed out
.writedone
        _RET_   MODZ    _set                            ' "Z" = success
'+=============================================================================+
'+-----------------------------------------------------------------------------+
'+      SEND: CMDx, PARx, CRCx, GET REPLY                                      +
'+-----------------------------------------------------------------------------+
_cmdRZA41                                               ' CMD55:       R1 response
_cmdRZtoken                                             ' CMD9,10,17,24: R1+$FE response
                mov     cmdtype,          #1            ' returns w /CS=0(ena)
                jmp     #_cmdxx                         '
_cmdR1R3                                                ' CMD58:    R1+R3 response
_cmdR1R7                                                ' CMD8:     R1+R7 response
_cmdR1                                                  ' CMD0,A41,16: R1 response
                mov     cmdtype,          #0            ' returns w /CS=1(disabled)
_cmdxx                                                  '
'+-----------------------------------------------------------------------------+
                outl    #_SD_CS                         ' /CS=0 (enable)
'+-----------------------------------------------------------------------------+
                call    #_sendFF                        ' send $FF byte first
                mov     dataout,          cmdout        ' CMD
                call    #_sendbyte                      ' send cmd byte
                mov     dataout,          cmdpar        ' Parameter
                call    #_sendlong                      ' send 4 bytes (MSB first)
                mov     dataout,          cmdcrc        ' CRC
                call    #_sendbyte                      ' send crc byte
'+-----------------------------------------------------------------------------+
                call    #_getreply                      ' recv R1/R1+R3/R1+R7/RZ..+Token
'+-----------------------------------------------------------------------------+
                outl    #_SD_CK                         ' CLK=0 (idle)           already=0

                skip    cmdtype                         '\ skips next instr if #1
                outh    #_SD_CS                         '| /CS=1(disable) if reqd
              RET                                       '/ else /CS=0 cmdRZA41/cmdRZtoken
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+      READ REPLY: R1/R1+R3/R1+R7/R1+token                                    +
'+-----------------------------------------------------------------------------+
_getreply       call    #_recvbyte                      ' recv R1 byte
                cmp     reply,            #$FF      wz  ' reply=$FF=busy ?
        if_nz   jmp     #.doneR1                        ' n:

' timeout set in CMD0(for CMD0,8,55,A41,58,16) and CMD9,10,17(readblock)
                getct   replyR1                         '\ timeout ?
                sub     replyR1,          ini_time      '|
                cmp     replyR1,          time_out  wc  '| c if < timeout
        if_c    jmp     #_getreply                      '| n: try again
                jmp     #_fail '90                      '/ timeout:

.doneR1         mov     replyR1,          reply         ' save R1/Token reply
'+-----------------------------------------------------------------------------+
                cmp     cmdout,           #CMD8     wz
        if_nz   cmp     cmdout,           #CMD58    wz
        if_nz   jmp     #.end                           ' ret if not CMD8/CMD58
'+-----------------------------------------------------------------------------+
                call    #_recvlong                      ' R7=CMD8=volts/R3=CMD58=OCR
'+-----------------------------------------------------------------------------+
.end                                                    '\ returns with...
                                                        '| nc+z  replyR1=$00(success)
                test    replyR1,          #1        wz  '| nc+nz replyR1=$01(idle)
        _RET_   cmpr    replyR1,          #$01      wc  '/  c    replyR1>$01(error)

'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+      SD SPI Send/Recv Routines... (write/read byte/long simultaneously)     +
'+              /CS=0 & CLK=0 on both entry and exit                           +
'+-----------------------------------------------------------------------------+
_recvlong       neg     dataout,          #1            ' call here to Recv a Long (+send 1's)
_sendlong       mov     bitscnt,          #32           ' call here to Send a Long (long=32bits)
                jmp     #_sendrecv                      '
_sendFF                                                 ' call here to Send $FF Byte
_recvbyte       neg     dataout,          #1            ' call here to Recv a Byte (+send 1's)
_sendbyte       rol     dataout,          #24           ' call here to Send a Byte (msbit first)
                mov     bitscnt,          #8            '                          (byte=8bits)
_sendrecv       mov     reply,            #0            ' clear reply
' 8+15 low/high clk cycles (8.7MHz@200MHz, 1.3MHz@30MHz)
.nextbit        rol     dataout,          #1        wc  ' \ prepare output bit (DI=0/1)..
                outl    #_SD_CK                         ' | CLK=0  (already 0 first time)
                outc    #_SD_DI                         ' / write output bit: output on CLK falling edge
                waitx   #(2+CLOCK_EXTRA/2)              ' |   setup time to be safe
                outh    #_SD_CK                         ' \ CLK=1
                waitx   #(3+CLOCK_EXTRA/2)              ' |   setup time to be safe
                testp   #_SD_DO                     wc  ' | read input bit:   sample on CLK rising edge
                rcl     reply,            #1            ' / accum DO input bits
                djnz    bitscnt,          #.nextbit     '   8/32 bits?
        _RET_   outl    #_SD_CK                         ' CLK=0 on exit
'+=============================================================================+

'+-----------------------------------------------------------------------------+
_fail           outh    #_SD_CS                         ' /CS=1 (disable)
        _RET_   MODCZ   _set,_clr                   wcz ' C & NZ = fail
'+=============================================================================+

'-------------------------------------------------------------------------------

ZeroVal         long    0
Mask24          long    $FFFFFF
cmdout          long    0                       ' The 8b CMDxx | $40
cmdpar          long    0                       ' The 32b parameters
cmdcrc          long    0                       ' The 8b CRC (must be valid for CMD0 & CMD8)
cmdpar2         long    0                       ' SDV1=$0, SDV2=$40000000
cmdtype         long    0                       ' reply is R1=1, R3=3, R7=7, else 0
reply           long    0                       ' R1 reply (moved to replyR1 when R3/R7 32b reply here)
replyR1         long    0                       ' R1 reply (8b saved when R3/R7 32b reply follows)
replyR2         long    0                       ' R2 reply (32 bits)
dataout         long    0                       ' 8/32 bit data being shifted out
bytescnt        long    0                       ' #bytes to send/recv
bitscnt         long    0                       ' #bits to be shifted in/out
ctr1            long    0
ini_time        long    0                       ' initial time
time_out        long    0                       ' length of timeout
                                                '\ 1=SDV1, 2=SDV2(byte address), 3=SDHC/SDV2(block address)
blocksh         long    0                       '/ block shift 0/9 bits

bufaddr         long    0                       ' ptr sector buffer
blocknr         long    0                       ' sector#
_hubdata        long    0

                fit     $1F0

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

