{{
'-------------------------------------------------------------------------------
'
'   Catalina_SD_Plugin - an SD Card plugin for Catalina.
'
'   Modified to be a Catalina plugin (removal of Vars and replacement
'   with registry, add ability to use non-consecutive pins) by
'   Ross Higson, based on:
'
'   sdspi:  SPI interface to a Secure Digital card.
'
'   WARNING: Due to the need to coordinate the enabling and disabling of the
'   SD Card and the XMM RAM on platforms that share pins, this driver can be
'   very fiddly to modify.  
'
'   Original notes by Radical Eye Software are given below ...
'
'-------------------------------------------------------------------------------
'
'   Copyright 2008   Radical Eye Software
'
'   See end of file for terms of use.
'
'   You probably never want to call this; you want to use fsrw
'   instead (which calls this); this is only the lowest layer.
'
'   Assumes SD card is interfaced using four consecutive Propeller
'   pins, as follows (assuming the base pin is pin 0):
'                3.3v
'              ? ? ? ? ? ?
'              ¼ ¼ ¼ ¼ ¼ ¼ 20k
'   p0 ????????????????????????? do
'   p1 ????????????????????????? clk
'   p2 ????????????????????????? di
'   p3 ????????????????????????? cs (dat3)
'         150          ????????? irq (dat1)
'                        ??????? p9 (dat2)
'
'   The 20k resistors
'   are pullups, and should be there on all six lines (even
'   the ones we don't drive).
'
'   This code is not general-purpose SPI code; it's very specific
'   to reading SD cards, although it can be used as an example.
'
'   The code does not use CRC at the moment (this is the default).
'   With some additional effort we can probe the card to see if it
'   supports CRC, and if so, turn it on.   
'
'   All operations are guarded by a watchdog timer, just in case
'   no card is plugged in or something else is wrong.  If an
'   operation does not complete in one second it is aborted.
'
'-------------------------------------------------------------------------------
'
' Version 1.0 - Initial version by Ross Higson.
'
' Version 2.9 - added C3 support, and tidied up shared platform support (i.e.
'               TRIBLADEPROP, RAMBLADE & C3) as much as possible.
'
' Version 3.0 - Retry initialization up to 5 times if not successful.
'
' Version 3.3 - Tidy up platform dependencies by using "Constants.inc".
'               Allow for RTC to be part of SD plugin (if CLOCK defined).
'               Fixed a race condition on initialization.
'               Enabling the debug flag can no longer be done via Setup/Start -
'               define the DEBUG_LED_CLOCK symbol or use the rtc_debug service.
}}
'
CON

#include "Constants.inc"

sectorsize  = 512
sectorshift = 9

SD_Init   = 1
SD_Read   = 2
SD_Write  = 3
SD_ByteIO = 4
SD_StopIO = 5

#ifdef CLOCK
'
CLOCKS_PER_SEC = 1_000          ' resolution of clock - if this value
                                ' is changed, also change time.h
'
RTC_First      = 6              ' first valud command
RTC_SetFreq    = 6
RTC_GetClock   = 7
RTC_SetTime    = 8
RTC_GetTime    = 9
RTC_Debug      = 10
RTC_Last       = 10             ' last valid command

'
#endif

MAX_RETRIES = 5

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
'rslt: (none)
   
'name: SD_ByteIO - Write a sector
'code: 4 
'type: short request
'data: byte to write
'rslt: (none)

'name: SD_StopIO - disable the SD card (required on the TRIBLADEPROP and RAMBLADE)
'code: 5 
'type: short request
'data: byte to write
'rslt: (none)

'
' RTC services:
'
'name: rtc_setfreq
'code: 6
'type: long request
'data: frequency to set (note that the clock will be zeroed)
'rslt: (none)

'name: rtc_getclock
'code: 7
'type: long request
'data: (none)
'rslt: -1, or the current clock value

'name: rtc_settime
'code: 8
'type: long request
'data: the time (in seconds) to set
'rslt: key code

'name: rtc_getttime
'code: 9
'type: long request
'data: (none)
'rslt: the current time (in seconds)

'name: rtc_debug (only works on Hydra and Hybrid)
'code: 10
'type: long request
'data: 0 = no debug, 1 = toggle debug flag every second
'rslt: none
'
   
LMM_FIL     = common#LMM_FIL

obj
   common : "Catalina_Common"
   
pub Start : cog |  retries, request, parameter
'
'   Initialize the card!  Send a whole bunch of
'   clocks (in case the previous program crashed
'   in the middle of a read command or something),
'   then a reset command, and then wait until the
'   card goes idle.
'
  'dira |= $8000
  'outa &= !$8000

  do  := Common#SD_DO_PIN
  clk := Common#SD_CLK_PIN 
  di  := Common#SD_DI_PIN
#ifdef CHANNEL_SELECT_SD
  cs_clr := Common#SD_CS_CLR
  cs_clk := Common#SD_CS_CLK
#else
  cs  := Common#SD_CS_PIN
#endif
  clockfreq := Common#CLOCKFREQ

  cog := cognew(@entry, Common#REGISTRY)
  
  if cog => 0
  
    ' wait till the sd plugin has registered
    repeat until (long[Common#REGISTRY][cog] & $FF000000) <> $FF000000

    ' wait for intialization to complete sucessfully, or MAX_RETRIES reached
    if common.WaitForCompletion(cog) <> 1
      retries := 0
      repeat
        retries++        
        common.SendInitializationData(cog, SD_Init<<24, 0)
      until common.WaitForCompletion(cog) == 1 or (retries > MAX_RETRIES)

#ifdef CLOCK

    request := long[Common#REGISTRY][cog] & $00FFFFFF
    
    parameter := CLKFREQ
    long[request][0] := RTC_SetFreq<<24 + @parameter
    
    repeat until long[request][0] == 0
      ' wait till frequency set
#endif
    
  cog += 1

dat

        org
entry

#ifdef CLOCK
        call    #init_clock
#endif
        cogid   acca                            ' get ...
        shl     acca,#2                         ' ... our ...
        add     acca,par                        ' ... registry block entry
        rdlong  rqstptr,acca                    ' register ...
        and     rqstptr,Mask24                  ' ... this ...
        mov     accb,#LMM_FIL                   ' ... plugin ...
        shl     accb,#24                        ' ... as the ...
        or      accb,rqstptr                    ' ... appropriate ...
        wrlong  accb,acca                       ' ... type
        mov     rsltptr,rqstptr                 ' set up a pointer to ...
        add     rsltptr,#4                      ' ... our result address
        neg     acca,#1                         ' indicate ...
        wrlong  acca,rqstptr                    ' ... initialization in progress

        mov     domask,#1
        shl     domask,do
        mov     dimask,#1
        shl     dimask,di
        mov     clkmask,#1
        shl     clkmask,clk
#ifdef CHANNEL_SELECT_SD
        mov     cs_clrmsk,#1
        shl     cs_clrmsk,cs_clr
        mov     cs_clkmsk,#1
        shl     cs_clkmsk,cs_clk
#else          
        mov     csmask,#1
        shl     csmask,cs
#endif

initialize

        call    #SD_activate

        neg     phsb,#1
        mov     frqb,#0
        mov     acca,nco
        add     acca,clk
        mov     ctra,acca
        mov     acca,nco
        add     acca,di
        mov     ctrb,acca
        mov     ctr2,onek
oneloop        
        call    #sendiohi
        djnz    ctr2,#oneloop
        mov     starttime,cnt
        mov     cmdo,#0
        mov     cmdp,#0
        call    #cmd
        
        call    #SD_deactivate

        call    #sendiohi
initloop       

        call    #SD_activate

        mov     cmdo,#55
        call    #cmd
        mov     cmdo,#41
        call    #cmd
        
        call    #SD_deactivate

        cmp     accb,#1 wz
   if_z jmp     #initloop
        wrlong  accb,rsltptr

' reset frqa and the clock
finished
        mov     frqa,#0

#ifdef CHANNEL_SELECT_SD
        call    #SD_deactivate
        neg     phsb,#1
        call    #sendiohi
        mov     acca,#511                       ' on some platforms, we must not let the 
        add     acca,cnt                        ' kernel resume until we have paused
        waitcnt acca,#0                         ' for a short period after disabling the
        mov     acca,#0                         ' SD card, or the XMM access goes haywire. 
        wrlong  acca,rqstptr                    ' (this should do no harm on other cards).
        jmp     #waitloop
#elseifdef SHARED_XMM
        or      outa,csmask
        neg     phsb,#1
        call    #sendiohi
        call    #SD_deactivate
        mov     acca,#511                       ' on some platforms, we must not let the 
        add     acca,cnt                        ' kernel resume until we have paused
        waitcnt acca,#0                         ' for a short period after disabling the
        mov     acca,#0                         ' SD card, or the XMM access goes haywire. 
        wrlong  acca,rqstptr                    ' (this should do no harm on other cards).
        jmp     #waitloop
#else
        wrlong  frqa,rqstptr
        or      outa,csmask
        neg     phsb,#1
        call    #sendiohi
#endif

pause
        mov     acca,#511
        add     acca,cnt
        waitcnt acca,#0

waitloop
#ifdef CLOCK
        call    #do_clock
#endif
        mov     starttime,cnt
        rdlong  acca,rqstptr wz
   if_z jmp     #pause
        mov     paramptr,acca
        and     paramptr,Mask24
        rdlong  buffptr,paramptr
        add     paramptr,#4
        shr     acca,#24
        cmp     acca,#SD_Init wz
   if_z jmp     #initialize
        cmp     acca,#SD_ByteIO wz
   if_z jmp     #byteio
        mov     ctr2,sector
        cmp     acca,#SD_Read wz
   if_z jmp     #rblock
        cmp     acca,#SD_Write wz
   if_z jmp     #wblock
        cmp     acca,#SD_StopIO wz
   if_z jmp     #finished
        jmp     #pause
  
wblock
#ifdef ACTIVATE_EACH_USE_SD
        call    #SD_activate
#endif
        mov     starttime,cnt
        mov     cmdo,#24
        rdlong  cmdp,paramptr
        call    #cmd
        mov     phsb,#$fe
        call    #sendio
        mov     accb,buffptr
        neg     frqa,#1
wbyte
        rdbyte  phsb,accb
        shl     phsb,#23
        add     accb,#1
        mov     ctr,#8
wbit    mov     phsa,#8
        shl     phsb,#1
        djnz    ctr,#wbit
        djnz    ctr2,#wbyte        
        neg     phsb,#1
        call    #sendiohi
        call    #sendiohi
        call    #readresp
        and     accb,#$1f
        sub     accb,#5
        wrlong  accb,rsltptr
        call    #busy
        jmp     #finished

rblock
#ifdef ACTIVATE_EACH_USE_SD
        call    #SD_activate
#endif
        mov     starttime,cnt
        mov     cmdo,#17
        rdlong  cmdp,paramptr
        call    #cmd
        call    #readresp
        mov     accb,buffptr
        sub     accb,#1
rbyte
        mov     phsa,hifreq
        mov     frqa,freq
        add     accb,#1
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        test    domask,ina wc
        addx    acca,acca
        mov     frqa,#0
        test    domask,ina wc
        addx    acca,acca
        wrbyte  acca,accb
        djnz    ctr2,#rbyte        
        mov     frqa,#0
        neg     phsb,#1
        call    #sendiohi
        call    #sendiohi

#ifndef CHANNEL_SELECT_SD
        or      outa,csmask
#endif        
        wrlong  ctr2,rsltptr
        jmp     #finished

byteio     
#ifdef ACTIVATE_EACH_USE_SD
        call    #SD_activate
#endif
        mov     phsb,buffptr
        call    #sendio
        wrlong  accb,rsltptr
        jmp     #finished

sendio
        rol     phsb,#24
sendiohi
        mov     ctr,#8
        neg     frqa,#1
        mov     accb,#0
bit     mov     phsa,#8
        test    domask,ina wc
        addx    accb,accb        
        rol     phsb,#1
        djnz    ctr,#bit
sendio_ret
sendiohi_ret
        ret

checktime
        mov     duration,cnt
        sub     duration,starttime
        cmp     duration,clockfreq wc
checktime_ret
  if_c  ret
        neg     duration,#13
        wrlong  duration,rsltptr
        jmp     #finished

cmd
#ifndef CHANNEL_SELECT_SD
        andn    outa,csmask
#endif        
        neg     phsb,#1
        call    #sendiohi
        mov     phsb,cmdo
        add     phsb,#$40
        call    #sendio
        mov     phsb,cmdp
        shl     phsb,#9
        call    #sendiohi
        call    #sendiohi
        call    #sendiohi
        call    #sendiohi
        mov     phsb,#$95
        call    #sendio
readresp
        neg     phsb,#1
        call    #sendiohi
        call    #checktime
        cmp     accb,#$ff wz
   if_z jmp     #readresp 
cmd_ret
readresp_ret
        ret

busy
        neg     phsb,#1
        call    #sendiohi
        call    #checktime
        cmp     accb,#$0 wz
   if_z jmp     #busy
busy_ret
        ret
'
' SD_activate - set up control lines for SD Card (and select it)
'
SD_activate 
#ifdef CHANNEL_SELECT_SD
        or    dira,dimask
        or    dira,clkmask
        andn  outa,cs_clkmsk
        or    outa,cs_clrmsk
        or    dira,cs_clkmsk
        or    dira,cs_clrmsk
        andn  outa,cs_clrmsk
        or    outa,cs_clrmsk
        mov   cs_cnt,#Common#SPI_SELECT_SD
:loop                        
        or    outa,cs_clkmsk
        andn  outa,cs_clkmsk
        djnz  cs_cnt,#:loop
#else
#ifdef DISABLE_XMM_SD
        mov   acca,ram_disable
        mov   outa,acca
        mov   dira,acca
#endif
        or    dira,dimask
        or    dira,clkmask
        andn  outa,csmask
        or    dira,csmask
#endif
SD_activate_ret
        ret   
'
' SD_deactivate : De-select SD (and tristate it if TRISTATE_SD is defined)
'
SD_deactivate 
#ifdef TRISTATE_SD
        mov     dira,#0
        mov     outa,#0
#elseifdef CHANNEL_SELECT_SD
        andn    outa,cs_clrmsk
        or      outa,cs_clrmsk
        mov     dira,#0
#else        
        or      outa,csmask
#endif        
SD_deactivate_ret
        ret

'-------------------------------------------------------------------------------

#ifdef CLOCK

init_clock
                        mov     t0,cnt
                        mov     time_cnt_last,t0       ' initialize time
                        mov     clock_cnt_last,t0      ' initialize clock
init_clock_ret
                        ret                        

do_clock
                        rdlong  t4,rqstptr              ' command ?
                        tjnz    t4,#do_command          ' yes - process it
                        tjnz    per_sec,#get_count      ' no - if frequency not set ...
                        mov     t0,cnt                  ' ... just initialize ...
                        mov     time_cnt_last,t0        ' ... time ...
                        mov     clock_cnt_last,t0       ' ... and clock ...
do_clock_ret
                        ret
get_count                        
                        mov     t3,cnt                  ' get latest cnt
                        cmp     t3,clock_cnt_last wc,wz ' compare with last cnt used for clock
          if_ae         jmp     #clock_no_wrap          ' check for wrap                 
                        mov     t2,clock_cnt_last       ' calculate increment ...
                        sub     t2,t3                   ' ... when wrap has occurred
                        jmp     #update_clock                        
clock_no_wrap
                        mov     t2,t3                   ' calculate increment ...
                        sub     t2,clock_cnt_last       ' ... when no wrap has occurred
update_clock

                        mov     clock_cnt_last,t3       ' update last count used for clock
                        add     clock_incr,t2           ' add increment to unprocessed clock
                        cmp     clock_incr,per_clock wc,wz ' increment clock?
          if_b          jmp     #do_time                ' no - go process time
                        mov     t0,clock_incr           ' yes - calculate ...
                        mov     t1,per_clock            ' ... number ...
                        call    #d32u                   ' ... of ticks ...
                        add     clock,t0                ' ... to add to clock ...
                        mov     clock_incr,t1           ' ... save remainder for next round

do_time
                        cmp     t3,time_cnt_last wc,wz  ' compare with last cnt used for clock
          if_ae         jmp     #time_no_wrap           ' check for wrap                 
                        mov     t2,time_cnt_last        ' calculate increment ...
                        sub     t2,t3                   ' ... when wrap has occurred
                        jmp     #update_time                        
time_no_wrap
                        mov     t2,t3                   ' calculate increment ...
                        sub     t2,time_cnt_last        ' ... when no wrap has occurred
update_time
                        mov     time_cnt_last,t3        ' update last count used for time
                        add     time_incr,t2            ' add increment to unprocessed time
                        cmp     time_incr,per_sec wc,wz ' increment time?
          if_b          jmp     #do_clock_ret      ' no - done
                        mov     t0,time_incr            ' yes - calculate ...
                        mov     t1,per_sec              ' ... number ...
                        call    #d32u                   ' ... of secs ...
                        add     time,t0                 ' ... to add to time ...
                        mov     time_incr,t1            ' ... save remainder for next round
                        tjz     debug_flag,#do_clock_ret ' if not debug, just check for next command
                        cmp     t0,#0                   ' did we increment time?

#ifdef DEBUG_LED_CLOCK                        
                        xor     OUTA,debug_led          ' yes - toggle LED
                        or      DIRA,debug_led          ' set LED pin to output
#endif
                        
                        jmp     #do_clock_ret           ' check for command

do_command
                        mov     t5,t4                   ' get ...
                        and     t5,Mask24               ' ... parameters address
                        rdlong  param,t5                ' get parameter
                        mov     rslt,#0                 ' initialize result
                        mov     t1,t4                   ' get ...
                        shr     t1,#24                  ' ... command ...
                        and     t1,#$ff                 ' ... to execute
                        cmp     t1,#RTC_First wc,wz     ' check for valid command
          if_b          jmp     #do_clock_ret
                        cmp     t1,#RTC_Last wc,wz      ' check for valid command
          if_a          jmp     #do_clock_ret
                        sub     t1,#RTC_First
                        shl     t1,#1
                        add     t1,#:cmdTable 
                        jmp     t1                      ' jump to command

:cmdTable               call    #_SetFreq               ' command dispatch table
                        jmp     #end_command
                        call    #_GetClock
                        jmp     #end_command
                        call    #_SetTime
                        jmp     #end_command
                        call    #_GetTime
                        jmp     #end_command
                        call    #_DebugFlag
                        jmp     #end_command

end_command             mov     t1,rqstptr              ' return result ...
                        add     t1,#4                   ' ... in request block ... 
                        wrlong  rslt,t1                 ' 
done_command
                        wrlong  Zero,rqstptr            ' clear command status
                        jmp     #do_clock_ret           ' check for command

'-------------------- Clock Functions -----------------------------------------
'
' Set the frequency, calculate counts per clock tick, and reset the clock counters
'
_SetFreq
                        tjz     param,#_SetFreq_ret
                        mov     per_sec,param
                        mov     t0,per_sec
                        mov     t1,clock_res
                        call    #d32u
                        mov     per_clock,t0
                        mov     clock,#0
                        mov     clock_incr,#0
                        mov     clock_cnt_last,cnt
_SetFreq_ret
                        ret

'
' _GetClock : return current clock, or -1 if frequency not set yet
'
_GetClock
                        tjnz    per_sec,#_GetClock_ok
                        neg     rslt,#1
                        jmp     #_GetClock_ret
_GetClock_ok
                        mov     rslt,clock
_GetClock_ret
                        ret
'
' _SetTime : set the current time, and reset the time counters
'

_SetTime
                        mov     time,param
                        mov     time_incr,#0
                        mov     time_cnt_last,cnt
_SetTime_ret
                        ret

'
' _GetTime : return current time, or -1 if frequency not set yet
'
_GetTime
                        tjnz    per_sec,#_GetTime_ok
                        neg     rslt,#1
                        jmp     #_GetTime_ret
_GetTime_ok
                        mov     rslt,time
_GetTime_ret
                        ret

'
' _DebugFlag : set/reset debug flag (only works on Hydra or Hyubrid)
'
_DebugFlag
                        mov     debug_flag,param
_DebugFlag_ret
                        ret
'
'd32u - Unsigned 32 bit division
'       Divisor  : t1
'       Dividend : t0
'       Result:
'           Quotient in t0
'           Remainder in t1

d32u
        mov ftemp,#32
        mov ftmp2, #0
:up2
        shl t0,#1       WC
        rcl ftmp2,#1    WC
        cmp t1,ftmp2    WC,WZ
 if_a   jmp #:down
        sub ftmp2,t1
        add t0,#1
:down
        sub ftemp, #1   WZ
 if_ne  jmp #:up2
        mov t1,ftmp2
d32u_ret
        ret
'
'
'm32 - multiplication
'      r0 : 1st operand (32 bit)
'      r1 : 2nd operand (32 bit)
'      Result:
'         Product in r0 (<= 32 bit)
'
m32
        mov ftemp,#0
:start
        cmp t0,#0       WZ
 if_e   jmp #:down3
        shr t0,#1       WC
 if_ae  jmp #:down2
        add ftemp,t1    WC
:down2
        shl t1,#1       WC
        jmp #:start
:down3
        mov t0,ftemp
m32_ret
        ret

ftemp   long  0
ftmp2   long  0

'-------------------- local variables -----------------------------------------

t0                      long    0                       ' temporary values
t1                      long    0
t2                      long    0
t3                      long    0
t4                      long    0
t5                      long    0

#ifdef DEBUG_LED_CLOCK
debug_flag              long    1                       ' set to 1 to toggle debug LED every second
#else
debug_flag              long    0                       ' set to 1 to toggle debug LED every second
#endif
debug_led               long    |< Common#DEBUG_PIN

clock_res               long    CLOCKS_PER_SEC          ' clock resolution (fixed at compile time)

per_sec                 long    0                       ' cnts per sec (system clock frequency)                 
per_clock               long    0                       ' cnts per clock

clock                   long    0                       ' current clock val                       
clock_cnt_last          long    0                       ' last cnt value retrieved
clock_incr              long    0                       ' count as yet unprocessed

time                    long    0                       ' current time val
time_cnt_last           long    0                       ' last cnt value retrieved
time_incr               long    0                       ' count as yet unprocessed

param                   long    0
rslt                    long    0

#endif

'-------------------------------------------------------------------------------

di        long 0
do        long 0
clk       long 0

#ifdef CHANNEL_SELECT_SD
cs_clr    long 0
cs_clk    long 0
cs_cnt    long 0
#else
cs        long 0
#endif

#ifdef DISABLE_XMM_SD
ram_disable long    Common#XMM_DISABLE
#endif

clockfreq long 0

rqstptr   long 0
rsltptr   long 0
paramptr  long 0
buffptr   long 0
param2    long 0

nco       long $1000_0000
hifreq    long $e0_00_00_00
freq      long $20_00_00_00

onek      long 1000
sector    long 512

Zero      long 0
Mask24    long $00FF_FFFF

domask    res 1
dimask    res 1
clkmask   res 1

#ifdef CHANNEL_SELECT_SD
cs_clrmsk res 1
cs_clkmsk res 1
#else
csmask    res 1
#endif

acca      res 1
accb      res 1
cmdo      res 1
cmdp      res 1
ctr       res 1
ctr2      res 1
starttime res 1
duration  res 1

{{
'  Permission is hereby granted, free of charge, to any person obtaining
'  a copy of this software and associated documentation files
'  (the "Software"), to deal in the Software without restriction,
'  including without limitation the rights to use, copy, modify, merge,
'  publish, distribute, sublicense, and/or sell copies of the Software,
'  and to permit persons to whom the Software is furnished to do so,
'  subject to the following conditions:
'
'  The above copyright notice and this permission notice shall be included
'  in all copies or substantial portions of the Software.
'
'  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
'  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
'  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
'  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
'  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
'  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
'  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}}
