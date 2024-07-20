{{
''=============================================================================
''
'' Catalina_RTC_Plugin - Implement a Real-Time Clock for use by Catalina.
''
'' On the Propeller 1 or 2, this code implements a software clock based 
'' only on the Propeller crysal, and on the P2 it implements support for
'' an external real-time clock based on the P2 RTC add-on card. 
''
'' Propeller 1 or 2 programs can be compiled with -C CLOCK to use the 
'' software clock.
''
'' Propeller 2 programs can be compiled with -C RTC to use the hardware 
'' clock. 
''
'' The base pin for the hardware clock must be configured in the platform 
'' support file (e.g. P2_EVAL.inc, P2_EDGE,inc or P2_CUSTOM.inc).
''
'' For ANSI compatibility, two separate RTC functions are implemented:
''
''    clock - always counts from zero in a resolution of 1/CLOCKS_PER_SEC.
''            If the resolution of the clock is 1/1000s (1ms), clock will
''            wrap after 49 days. The resolution can be adjusted here if
''            required, but don't forget to also change the CLOCKS_PER_SEC
''            value in time.h. The clock is restarted whenever the
''            frequency is set.
''
''    time  - counts seconds, and can be set to any value. Time may count
''            more accurately than the clock function, but will still only
''            be as accurate as the crystal. Time will wrap after 135 years.
''            Time starts counting from zero unless another time value is set.
''            The time is NOT restarted when the frequency is reset - to
''            maintain accuracy, set the frequency to the new value in this
''            plugin as soon as practical after the propeller frequency is
''            changed.   
''
'' Note that the crystal frequency is set when the plugin is started,
'' and unless the system clock frequency is changed dynamically there
'' is usually no reason to change it. To check the correct frequency
'' has been set, define the Catalina symbol DEBUG_LED_CLOCK (works on the
'' P2_EVAL or P2_EDGE). This will toggle the debug LED once per second. 
''
'' Note that the time can be set when either clock is used, but it will
'' not be permanently set - it will only be set till the Propeller is
'' reset. To permanently set the time of the external hardware real-time 
'' clock us the time.c utility program (provided as a Catalyst demo).
''
'' Implemented for Catalina by:
''     Ross Higson
''
'' History:
''   1.0 - Initial version
''   1.1 - disable "debug" mode except on Hydra and Hybrid
''   3.3 - Tidy up platform dependencies.
''         Fixed a race condition on initialization.
''         Enabling the debug flag can no longer be done via Setup/Start -
''         define the DEBUG_LED_CLOCK symbol or use the rtc_debug service.
''   3.15  Modified for P2.
''   5.3.1 Cleaned up, more P2 modifications.
''   6.3   Add Propeller 2 RTC support
''
''=============================================================================
}}

CON

#ifdef RTC

RTC_KHZ   = 400 

' i2c slave id
PCF8523_WR = %1101_000_0
PCF8523_RD = %1101_000_1

PCF8523_DEVICE_ID = PCF8523_WR

' pin offsets
P_SCL    = 0
P_SDA    = 1

' CLKOUT frequency options (Hz)
Hz_32768 = 0
Hz_16384 = 1
Hz_8192  = 2
Hz_4096  = 3
Hz_1024  = 4
Hz_32    = 5
Hz_1     = 6
Hz_0     = 7

' pullup options
P_HIGH_FLOAT = $3800
P_HIGH_1K5   = $800
P_HIGH_15K   = $1000
P_HIGH_1MA   = $2000

' read options
RTC_ACK      = 0
RTC_NAK      = 1

' time registers
R_SC     = $03
R_MN     = $04
R_HR     = $05

'date registers
R_DATE   = $06
R_WKDAY  = $07
R_MON    = $08
R_YR     = $09

#endif

CLOCKS_PER_SEC = 1_000          ' resolution of clock - if this value
                                ' is changed, also change time.h
'
RTC_First      = 6              ' first valid command
RTC_SetFreq    = 6
RTC_GetClock   = 7
RTC_SetTime    = 8
RTC_GetTime    = 9
RTC_Debug      = 10
RTC_Geticks    = 11
RTC_Last       = 11             ' last valid command
'
#ifdef P2_EVAL
DEBUG_LED      = 56             ' suitable for P2_EVAL
#else
DEBUG_LED      = 38             ' suitable for P2_EDGE
#endif
'
' RTC services:
'
'name: RTC_SetFreq
'code: 6
'type: long request
'data: frequency to set (note that the clock will be zeroed)
'rslt: (none)

'name: RTC_GetClock
'code: 7
'type: long request
'data: (none)
'rslt: -1, or the current clock value

'name: RTC_SetTime
'code: 8
'type: long request
'data: the time (in seconds) to set
'rslt: key code

'name: RTC_GettTime
'code: 9
'type: long request
'data: (none)
'rslt: the current time (in seconds)

'name: RTC_Debug (works on P2_EVAL & P2_EDGE)
'code: 10
'type: long request
'data: 0 = no debug, 1 = toggle debug flag every second
'rslt: none

'name: RTC_Geticks (new time function also implemented in SD plugin)
'code: 11
'type: short request
'data: address of 2 long buffer to receive seconds and ticks
'rslt: none

CON

#include <constant.inc>

DAT
         alignl
         org 0
CLOCK_START
         getct   .t0
         mov     .time_cnt_last,.t0       ' initialize time
         mov     .clock_cnt_last,.t0      ' initialize clock
                        
         cogid   .t1                      ' get ...
         shl     .t1,#2                   ' ... our ...
         add     .t1,PTRA                 ' ... registry block entry
         rdlong  .rqstptr,.t1             ' register ...
         and     .rqstptr,.Mask24         ' ... this ...
         wrlong  .Zero,.rqstptr           ' ... plugin ...
         mov     .t2,#LMM_RTC             ' ... as ...
         shl     .t2,#24                  ' ... the ...
         or      .t2,.rqstptr             ' ... appropriate ...
         wrlong  .t2,.t1                  ' ... type
.get_command
         rdlong  .t4,.rqstptr             ' command ?
         tjnz    .t4,#.do_command         ' yes - process it
         tjnz    .per_sec,#.get_count     ' no - if frequency not set ...
         getct   .t0                      ' ... just initialize ...
         mov     .time_cnt_last,.t0       ' ... time ...
         mov     .clock_cnt_last,.t0      ' ... and clock ...
         jmp     #.get_command            ' ... and wait for commands
.get_count                        
         getct   .t3                      ' get latest cnt
.do_clock
         cmp     .t3,.clock_cnt_last wcz  ' compare with last cnt used for clock
  if_ae  jmp     #.clock_no_wrap          ' check for wrap                 
         mov     .t2,.clock_cnt_last      ' calculate increment ...
         sub     .t2,.t3                  ' ... when wrap has occurred
         jmp     #.update_clock                        
.clock_no_wrap
         mov     .t2,.t3                  ' calculate increment ...
         sub     .t2,.clock_cnt_last      ' ... when no wrap has occurred

.update_clock
         mov     .clock_cnt_last,.t3      ' update last count used for clock
         add     .clock_incr,.t2          ' add increment to unprocessed clock
         cmp     .clock_incr,.per_clock wcz   ' increment clock?
  if_b   jmp     #.do_time                ' no - go process time
         mov     .t0,.clock_incr          ' yes - calculate ...
         mov     .t1,.per_clock           ' ... number ...
         call    #.d32u                   ' ... of ticks ...
         add     .clock,.t0               ' ... to add to clock ...
         mov     .clock_incr,.t1          ' ... save remainder for next round

.do_time
         cmp     .t3,.time_cnt_last wcz   ' compare with last cnt used for clock
  if_ae  jmp     #.time_no_wrap           ' check for wrap                 
         mov     .t2,.time_cnt_last       ' calculate increment ...
         sub     .t2,.t3                  ' ... when wrap has occurred
         jmp     #.update_time                        
.time_no_wrap
         mov     .t2,.t3                  ' calculate increment ...
         sub     .t2,.time_cnt_last       ' ... when no wrap has occurred

.update_time
         mov     .time_cnt_last,.t3       ' update last count used for time
         add     .time_incr,.t2           ' add increment to unprocessed time
         cmp     .time_incr,.per_sec wcz  ' increment time?
  if_b   jmp     #.get_command            ' no - check for command
         mov     .t0,.time_incr           ' yes - calculate ...
         mov     .t1,.per_sec             ' ... number ...
         call    #.d32u                   ' ... of secs ...
         add     .time,.t0                ' ... to add to time ...
         mov     .time_incr,.t1           ' ... save remainder for next round
         tjz     .debug_flag,#.get_command ' if not debug, just check for next command
#ifdef DEBUG_LED_CLOCK                        
         drvnot  #DEBUG_LED               ' toggle DEBUG_LED
#endif
                        
         jmp     #.get_command            ' check for command

.do_command
         mov     .t5,.t4                  ' get ...
         and     .t5,.Mask24              ' ... parameters address
         rdlong  .param,.t5               ' get parameter
         mov     .rslt,#0                 ' initialize result
         mov     .t1,.t4                  ' get ...
         shr     .t1,#24                  ' ... command ...
         and     .t1,#$ff                 ' ... to execute
         cmp     .t1,#RTC_First wcz       ' check for valid command
  if_b   jmp     #.err_command
         cmp     .t1,#RTC_Last wcz        ' check for valid command
  if_a   jmp     #.err_command
         sub     .t1,#RTC_First
         shl     .t1,#1
         add     .t1,#.cmdTable 
         jmp     .t1                      ' jump to command

.cmdTable
         call    #._SetFreq               ' command dispatch table
         jmp     #.end_command
         call    #._GetClock
         jmp     #.end_command
         call    #._SetTime
         jmp     #.end_command
         call    #._GetTime
         jmp     #.end_command
         call    #._DebugFlag
         jmp     #.end_command
         call    #._RTC_GetTicks
         jmp     #.end_command

.err_command
         neg     .rslt,#1                 ' return -1 on error
.end_command
         mov     .t1,.rqstptr             ' return result ...
         add     .t1,#4                   ' ... in request block ... 
         wrlong  .rslt,.t1                ' 
.done_command
         wrlong  .Zero,.rqstptr           ' clear command status
         jmp     #.get_command            ' check for command

'-------------------- Clock Functions -----------------------------------------
'
' Set the frequency, calculate counts per clock tick, and reset the clock counters
' Also, start the RTC if requested and RTC present
'
._SetFreq
#if RTC
         call    #.rtc_start              ' start the RTC if present
#endif

         tjz     .param,#._SetFreq_ret
         mov     .per_sec,.param
         mov     .t0,.per_sec
         mov     .t1,.clock_res
         call    #.d32u
         mov     .per_clock,.t0
         mov     .clock,#0
         mov     .clock_incr,#0
         getct   .clock_cnt_last
._SetFreq_ret
         ret

'
' _GetClock : return current clock, or -1 if frequency not set yet
'
._GetClock
         tjnz    .per_sec,#._GetClock_ok
   _ret_ neg     .rslt,#1
._GetClock_ok
   _ret_ mov     .rslt,.clock

'
' _SetTime : set the current time, and reset the time counters
'
._SetTime
#ifdef RTC
         tjz     .active, #.SetTime_without_RTC  ' if no RTC present and active
         call    #.rtc_get_epoch
         mov     .time_offs,.param
         sub     .time_offs,.buf_sc              ' time_offs = desired_time - RTC
         mov     .param, #0
.SetTime_without_RTC
#endif
         mov     .time,.param
         mov     .time_incr,#0
   _ret_ getct   .time_cnt_last

'
' _GetTime : return current time, or -1 if frequency not set yet
'
._GetTime
         tjnz    .per_sec,#._GetTime_ok
   _ret_ neg     .rslt,#1
._GetTime_ok
#ifdef RTC
         tjz     .active, #.GetTime_without_RTC  ' if no RTC present and active
         call    #.rtc_get_epoch
         mov     .time,.buf_sc
         mov     .rslt,.time
   _ret_ add     .rslt,.time_offs                ' time = RTC + time_offs
.GetTime_without_RTC
#endif
   _ret_ mov     .rslt,.time

'
' _DebugFlag : set/reset debug flag (works on P2_EVAL or P2_EDGE)
'
._DebugFlag
   _ret_ mov     .debug_flag,.param

'
' _RTC_GetTicks : return current time, as 2 longs, 
'               result = 0 if frequency has been set, -1 otherwise
'
._RTC_GetTicks
         tjnz    .per_sec,#._RTC_GetTicks_ok
   _ret_ neg     .rslt,#1
._RTC_GetTicks_ok
#ifdef RTC
         tjz     .active, #.GetTicks_without_RTC  ' if no RTC present and active
         call    #.rtc_get_epoch
         mov     .time,.buf_sc
         add     .time,.time_offs                ' time = RTC + time_offs
.GetTicks_without_RTC
#endif
         wrlong   .time, .t5              ' return ...
         add      .t5, #4                 ' seconds
         mov      .t0,.time_incr          ' convert ...
         mov      .t1,.per_clock          ' ... unprocessed time counts ...
         call     #.d32u                  ' ... to clock counts ...
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

#ifdef RTC

'----------------------- RTC routines -----------------------------------------

.rtc_start

'' start the RTC
'' -- active = 1 if started ok
'' -- active = 0 if not started, or oscillator not ready
''
                 mov       .active, #0
                 call      #.rtc_present
                 cmp       .ackbit, #RTC_ACK             wz
           if_nz ret 
                 mov       .active, #1
                 mov       .len, #8                               ' try 8 times  ...
.not_ready
                 waitx     ##_CLOCKFREQ/2
                 call      #.rtc_osc_ready                        ' ... to see if RTC oscillator is ready
           if_z  ret                                              ' RTC ready
                 djnz      .len, #.not_ready
                 call      #.i2c_stop                             ' RTC not ready
                 mov       .active, #0         
                 ret

.rtc_osc_ready

'' return status of RTC oscillator
'' Z flag set if ready

                 mov       .reg, #R_SC
                 call      #.rtc_register_read
                 and       .buf, #%01111111
                 call      #.rtc_register_write
                 call      #.rtc_register_read
           _ret_ and       .buf, #%10000000              wz

.rtc_get_epoch

'' fetch time and date from RTC, and turn it into epoch (seconds since 1/1/11070 00:00:00)
'' -- 32 bit result left in buf_sc
''
                 mov       .len, #7                               ' read 7 ...
                 mov       .reg, #R_SC
                 call      #.rtc_generic_read                     ' ...  RTC registers (time and date)
                 call      #.rtc_bcd2dec                          ' convert all values from BCD to decimal
                 mov       .t0, .buf_hr                           ' convert hours in buf_hr ...
                 mov       .t1, .secs_per_hour
                 call      #.m32
                 add       .buf_sc, .t0
                 mov       .t0, .buf_mn                           ' ... minutes in buf_mn ...
                 mov       .t1, #60
                 call      #.m32
                 add       .buf_sc, .t0                           ' to seconds since midnight in buf_sc

.epoch_year
                 mov       .t1, #0                                ' convert years ...
.epoch_year_loop
                 cmp       .t1, .buf_yr                  wz       ' ... before the current year ...
           if_z  jmp       #.epoch_leap
                 add       .buf_sc, .secs_per_year
                 mov       .t0, .t1
                 call      #.rtc_leap_year                        ' ... and taking leap years into account ...
           if_nz add       .buf_sc, .secs_per_day
                 add       .t1, #1
                 jmp       #.epoch_year_loop                      ' into seconds since 2000 in buf_sc
.epoch_leap
                 mov       .t0, .buf_yr                           ' update ...
                 call      #.rtc_leap_year
           if_z  mov       .month_feb, #28                        ' ... days in february ...
           if_nz mov       .month_feb, #29                        ' ... depending on if this is a leap

.epoch_month
                 mov       .t2, #1
.epoch_month_loop                                                 ' convert months ...
                 cmp       .t2, .buf_mo                  wz
           if_z  jmp       #.epoch_day                            ' ... before the current month ...
                 mov       .t0, #.days_in_month-1
                 add       .t0, .t2
                 alts      .t0
                 mov       .t0, 0-0
                 mov       .t1, .secs_per_day
                 call      #.m32
                 add       .buf_sc, .t0
                 add       .t2, #1
                 jmp       #.epoch_month_loop                      ' into seconds in the month in buf_sc

.epoch_day
                 mov       .t0, .buf_da                           ' convert days ...
                 sub       .t0, #1                                ' ... up to the current day ...
                 mov       .t1, .secs_per_day
                 call      #.m32                                  ' .. into seconds in buf_sc
                 add       .buf_sc, .t0
.epoch_since_2000
                 add       .buf_sc, .secs_till_2000               ' add seconds since 1/1/2000 00:00:00 to buf_sc
                 ret

.secs_per_hour  long      60*60
.secs_per_day   long      60*60*24                  
.secs_per_year  long      60*60*24*365                           ' seconds in a non-leap year
.secs_till_2000 long      946684800                              ' unix epoch of 1/1/2000 00:00:00 

.rtc_present
                 call      #.i2c_setup
                 call      #.i2c_start
                 mov       .i2cbyte, #PCF8523_DEVICE_ID
                 call      #.i2c_write
                 cmp       .ackbit, #RTC_ACK             wz       ' fail if NOT ACK
           if_nz ret
                 call      #.i2c_start
                 mov       .i2cbyte, #$01
                 call      #.i2c_write
                 cmp       .ackbit, #RTC_ACK             wz       ' success if NOT ACK
           if_nz mov       .ackbit, #RTC_ACK                      ' turn NAK into success
           if_z  mov       .ackbit, #RTC_NAK                      ' turn ACK into fail
                 ret

.rtc_register_write

'' write RTC register
'' -- .reg contains RTC register to write
'' -- .buf contains value to write 

                 mov       .len, #1
                 call      #.rtc_generic_write
                 ret

.rtc_register_read

'' read RTC register
'' -- .reg contains RTC register to read
'' -- .buf contains value read 

                 mov       .len, #1
                 call      #.rtc_generic_read
                 ret
                 
.rtc_generic_write

'' Write block of registers to RTC
'' -- .reg is first RTC register to write
'' -- .len is number of registers to write
'' -- .buf contains up to .len values to write

                 call      #.i2c_start
                 mov       .i2cbyte, #PCF8523_WR
                 call      #.i2c_write
                 mov       .i2cbyte, .reg
                 call      #.i2c_write
                 mov       .count, .len
                 call      #.i2c_wr_block
                 call      #.i2c_stop
                 ret

.rtc_generic_read

'' Read block of registers from RTC
'' -- .reg is first RTC register to read
'' -- .len is number of registers to read
'' -- .buf contains up to .len values read

                 call      #.i2c_start
                 mov       .i2cbyte, #PCF8523_WR
                 call      #.i2c_write
                 mov       .i2cbyte, .reg
                 call      #.i2c_write
                 call      #.i2c_start
                 mov       .i2cbyte, #PCF8523_RD
                 call      #.i2c_write
                 mov       .ackbit, #RTC_NAK
                 mov       .count, .len
                 call      #.i2c_rd_block
                 call      #.i2c_stop
                 ret

.rtc_bcd2dec

'' convert 7 registers starting at register .buf from BCD to decimal
'' -- results are left in .buf[0] .. .buf[6]
'' -- .t0, .t1, .t2, .reg, .len lost
                 mov       .reg, #.buf
                 mov       .len, #7
.bcd2dec_loop    alts      .reg
                 mov       .t0, 0-0
                 mov       .t1, .t0
                 and       .t1, #$F0
                 shr       .t1, #4
                 shl       .t1, #1
                 mov       .t2, .t1
                 shl       .t1, #2
                 add       .t2, .t1
                 and       .t0, #$0F
                 add       .t2, .t0
                 altd      .reg
                 mov       0-0, .t2
                 add       .reg, #1
                 djnz      .len, #.bcd2dec_loop
                 ret

.rtc_leap_year

'' return whether year 20xx is a leap year
'' -- xx (0..99) is in register .t0
'' -- result (0 or 1) is in .t0
'' -- Z set if NOT leap year

                 cmp        .t0, #0                        wz    ' 2000 ...
           if_z  jmp       #.leap_year                           ' ... is a leap year
                 and       .t0, #%11                       wz    ' is year evenly divisible by 4?
           if_nz jmp       #.non_leap_year                       ' if false, this is not a leap year
.leap_year
           _ret_ mov       .t0, #1                         wz    ' return with .t0 = 1
.non_leap_year
           _ret_ mov       .t0, #0                         wz    ' return with .t0 = 0

.reg             long      0                                     ' used for register indirection
.len             long      0

.buf                                                             ' we only ever read a maximum of 7 registers
.buf_sc          long      0                                     ' seconds (0 .. 59)
.buf_mn          long      0                                     ' minutes (0 .. 59)
.buf_hr          long      0                                     ' hours (0 .. 23)
.buf_da          long      0                                     ' day (1 .. 31)
.buf_wd          long      0                                     ' weekday (0 .. 6)
.buf_mo          long      0                                     ' month (1 .. 12)
.buf_yr          long      0                                     ' year (0 .. 99)

.days_in_month   
                 long      31
.month_feb       long      28
                 long      31
                 long      30
                 long      31
                 long      30
                 long      31
                 long      31
                 long      30
                 long      31
                 long      30
                 long      31

'----------------------- I2C routines -----------------------------------------

.i2c_setup
                 fltl      .scl                                  ' clear old smart pin setup
                 fltl      .sda
                 wrpin     .pullup, .scl                         ' configure high drive
                 wrpin     .pullup, .sda
                 drvh      .scl                                  ' both high
                 drvh      .sda
                 waitx     .tix
                 waitx     .tix

                 rep       #8, #9                                ' bus clear (if SDA stuck low)
                  testp    .sda                          wc      ' sample sda
     if_c         jmp      #.done                                ' abort loop if sda == 1
                  drvl     .scl                                  ' scl low
                  waitx    .tix
                  waitx    .tix
                  drvh     .scl                                  ' scl high
                  waitx    .tix
                  waitx    .tix
.done
                ret

.i2c_wait
                call      #.i2c_start
                call      #.i2c_write
                cmp       .ackbit, #RTC_ACK             wz
        if_nz   jmp       #.i2c_wait

.i2c_write
                shl       .i2cbyte, #24                         ' align i2cbyte.[7] to i2cbyte.[31]

.wr_byte        rep       #8, #8                                ' output 8 bits, msbfirst
                 shl      .i2cbyte, #1                  wc      ' msb --> c
                 drvc     .sda                                  ' c -- sda
                 waitx    .tix                                  ' let sda settle
                 drvh     .scl                                  ' scl high
                 waitx    .tix
                 waitx    .tix
                 drvl     .scl                                  ' scl low
                 waitx    .tix

.get_ackw       drvh      .sda                                  ' pull-up sda
                waitx     .tix
                drvh      .scl                                  ' scl high
                waitx     .tix
                testp     .sda                          wc      ' sample sda (ack bit)
                muxc      .ackbit, #1                           ' update return value
                waitx     .tix
                drvl      .scl                                  ' scl low
                waitx     .tix
        _ret_   waitx     .tix

.i2c_start
                drvh      .sda                                  ' both high
                drvh      .scl
                waitx     .tix

                drvl      .sda                                  ' start sequence
                waitx     .tix

                drvl      .scl
                waitx     .tix
                ret

.i2c_rd_block
                mov       .p_block, #.buf                       ' we always read to buf
.i2c_rd_block_loop
                drvh      .sda                                  ' pull-up sda
                mov       .i2cbyte, #0                          ' clear workspace

.rd_byte        rep       #9, #8                                ' read 8 bits, msb first
                 waitx    .tix
                 drvh     .scl                                  ' scl high
                 waitx    .tix
                 testp    .sda                          wc      ' sample sda
                 shl      .i2cbyte, #1                          ' make room for new bit
                 muxc     .i2cbyte, #1                          ' sda --> i2cbyte.[0]
                 waitx    .tix
                 drvl     .scl                                  ' scl low
                 waitx    .tix

.put_ack        cmp       .count, #1                    wz      ' last byte?
    if_nz       drvl      .sda                                  ' 0 --> sda (ack) if not last byte
    if_z        testb     .ackbit, #0                   wc      ' last byte, ackbit.[0] --> c
    if_z        drvc      .sda                                  ' last byte, c --> sda
                waitx     .tix                                  ' let sda settle
                drvh      .scl                                  ' scl high
                waitx     .tix
                waitx     .tix
                drvl      .scl                                  ' scl low
                waitx     .tix
                waitx     .tix

.put_byte
                altd      .p_block                              ' write byte ...
                mov       0-0, .i2cbyte                         ' ... to block
                add       .p_block, #1                          ' increment block pointer

                djnz      .count, #.i2c_rd_block_loop
                ret

.i2c_wr_block
                mov       .p_block, #.buf                       ' we always write from buf
.get_byte       alts      .p_block                              ' read ...                      
                mov       .i2cbyte, 0-0                         ' ... from block 
                add       .p_block, #1                          ' increment block pointer
                shl       .i2cbyte, #24                         ' align i2cbyte.[7] to i2cbyte.[31]

.wr_byte        rep       #8, #8                                ' output 8 bits, msbfirst
                 shl      .i2cbyte, #1                  wc      ' msb --> c
                 drvc     .sda                                  ' c -- sda
                 waitx    .tix                                  ' let sda settle
                 drvh     .scl                                  ' scl high
                 waitx    .tix
                 waitx    .tix
                 drvl     .scl                                  ' scl low
                 waitx    .tix

.get_ackr       drvh      .sda                                  ' pull-up sda
                waitx     .tix
                drvh      .scl                                  ' scl high
                waitx     .tix
                testp     .sda                           wc     ' sample sda (ack bit)
    if_c        or        .ackbit, #1                           ' update return value
                waitx     .tix
                drvl      .scl                                  ' scl low
                waitx     .tix
                waitx     .tix

                djnz      .count, #.get_byte
                ret

.i2c_stop
                drvl      .sda                                  ' hold sda low
                drvh      .scl                                  ' release scl
                waitx     .tix
        _ret_   drvh      .sda                                  ' finish stop 

.active         long      0
.pullup         long      P_HIGH_1MA
.scl            long      _RTC_BASE + P_SCL
.sda            long      _RTC_BASE + P_SDA
.tix            long      (_CLOCKFREQ / (RTC_KHZ * 1_000)) >> 2
.i2cbyte        long      0
.p_block        long      0
.count          long      0
.ackbit         long      0

#endif

'-------------------- constant values -----------------------------------------

.Zero                    long    0                       ' constants
.Mask24                  long    $00FF_FFFF

'-------------------- local variables -----------------------------------------

.t0                      long    0                       ' temporary values
.t1                      long    0
.t2                      long    0
.t3                      long    0
.t4                      long    0
.t5                      long    0

#ifdef DEBUG_LED_CLOCK
.debug_flag              long    1                       ' set to 1 to toggle debug LED every second
#else
.debug_flag              long    0                       ' set to 1 to toggle debug LED every second
#endif

.clock_res               long    CLOCKS_PER_SEC          ' clock resolution (fixed at compile time)

.per_sec                 long    0                       ' cnts per sec (system clock frequency)                 
.per_clock               long    0                       ' cnts per clock

.clock                   long    0                       ' current clock val                       
.clock_cnt_last          long    0                       ' last cnt value retrieved
.clock_incr              long    0                       ' count as yet unprocessed

.time                    long    0                       ' current time val
.time_cnt_last           long    0                       ' last cnt value retrieved
.time_incr               long    0                       ' count as yet unprocessed
.time_offs               long    0                       ' offset from RTC time

.rqstptr                 long    0                       ' my request /reply block address

.param                   long    0
.rslt                    long    0


                         fit     $1f0
{{
                            TERMS OF USE: MIT License 

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

