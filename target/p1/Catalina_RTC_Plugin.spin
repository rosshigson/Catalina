{{
''=============================================================================
''
'' Catalina_RTC_Plugin - Implement a Real-Time Clock for use by Catalina.
''
'' This code is intended just as an example - if an accurate RTC is needed,
'' this program should be rewritten to read time from an external source,
'' such as a network clock or an external RTC chip. This version just uses
'' the Propeller crystal, and will not be highly accurate.
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
''            plugin as soon as practical after the propeller frequence is
''            changed.   
''
'' Note that the crystal frequency is set when the plugin is started,
'' and unless the system clock frequency is changed dynamically there
'' is usually no reason to change it. To check the correct frequency
'' has been set, define DEBUG_LED_CLOCK in the CFG file (works on the
'' HYDRA, HYBRID or C3). This will toggle the debug LED once per second.  
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
''
''=============================================================================
}}
CON
'
CLOCKS_PER_SEC = 1_000          ' resolution of clock - if this value
                                ' is changed, also change time.h
'
RTC_First      = 6              ' first valid command
RTC_SetFreq    = 6
RTC_GetClock   = 7
RTC_SetTime    = 8
RTC_GetTime    = 9
RTC_Debug      = 10
RTC_GetTicks   = 11
RTC_Last       = 11             ' last valid command
'
LMM_RTC        = common#LMM_RTC

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

'name: RTC_Debug (only works on Hydra and Hybrid)
'code: 10
'type: long request
'data: 0 = no debug, 1 = toggle debug flag every second
'rslt: none

'name: RTC_GetTicks (new time function also implemented in SD plugin)
'code: 11
'type: short request
'data: address of 2 long buffer to receive seconds and ticks
'rslt: none
CON

#include "Constants.inc"

OBJ
   common : "Catalina_Common"
   
PUB Start : cog | request, parameter

'' start RTC plugin in a new cog
'' returns false (zero) if no cog available, or cog number + 1

  cog := cognew(@entry, Common#REGISTRY) 

  if cog => 0
    ' clock won't start until we tell it the frequency
    ' but we can't do that till we know it has registered
    
    repeat until (long[Common#REGISTRY][cog] & $FF000000) <> $FF000000
      ' loop until clock plugin has registered
 
    request := long[Common#REGISTRY][cog] & $00FFFFFF

    parameter := CLKFREQ
    long[request][0] := RTC_SetFreq<<24 + @parameter
    
    repeat until long[request][0] == 0
      ' wait till frequency set

  cog += 1

DAT
                        org
entry
                        mov     t0,cnt
                        mov     time_cnt_last,t0        ' initialize time
                        mov     clock_cnt_last,t0       ' initialize clock
                        
                        cogid   t1                      ' get ...
                        shl     t1,#2                   ' ... our ...
                        add     t1,par                  ' ... registry block entry
                        rdlong  rqstptr,t1              ' register ...
                        and     rqstptr,Mask24          ' ... this ...
                        wrlong  Zero,rqstptr            ' ... plugin ...
                        mov     t2,#LMM_RTC             ' ... as ...
                        shl     t2,#24                  ' ... the ...
                        or      t2,rqstptr              ' ... appropriate ...
                        wrlong  t2,t1                   ' ... type
get_command
                        rdlong  t4,rqstptr              ' command ?
                        tjnz    t4,#do_command          ' yes - process it
                        tjnz    per_sec,#get_count      ' no - if frequency not set ...
                        mov     t0,cnt                  ' ... just initialize ...
                        mov     time_cnt_last,t0        ' ... time ...
                        mov     clock_cnt_last,t0       ' ... and clock ...
                        jmp     #get_command            ' ... and wait for commands
get_count                        
                        mov     t3,cnt                  ' get latest cnt
do_clock
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
          if_b          jmp     #get_command            ' no - check for command
                        mov     t0,time_incr            ' yes - calculate ...
                        mov     t1,per_sec              ' ... number ...
                        call    #d32u                   ' ... of secs ...
                        add     time,t0                 ' ... to add to time ...
                        mov     time_incr,t1            ' ... save remainder for next round
                        tjz     debug_flag,#get_command ' if not debug, just check for next command
                        cmp     t0,#0                   ' did we increment time?

#ifdef DEBUG_LED_CLOCK                        
                        xor     OUTA,debug_led          ' yes - toggle LED
                        or      DIRA,debug_led          ' set LED pin to output
#endif
                        
                        jmp     #get_command            ' check for command

do_command
                        mov     t5,t4                   ' get ...
                        and     t5,Mask24               ' ... parameters address
                        rdlong  param,t5                ' get parameter
                        mov     rslt,#0                 ' initialize result
                        mov     t1,t4                   ' get ...
                        shr     t1,#24                  ' ... command ...
                        and     t1,#$ff                 ' ... to execute
                        cmp     t1,#RTC_First wc,wz     ' check for valid command
          if_b          jmp     #err_command
                        cmp     t1,#RTC_Last wc,wz      ' check for valid command
          if_a          jmp     #err_command
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
                        call    #_SD_GetTicks
                        jmp     #end_command

err_command             neg     rslt,#1                 ' return -1 on error

end_command             mov     t1,rqstptr              ' return result ...
                        add     t1,#4                   ' ... in request block ... 
                        wrlong  rslt,t1                 ' 
done_command
                        wrlong  Zero,rqstptr            ' clear command status
                        jmp     #get_command            ' check for command

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
' _SD_GetTicks : return current time, as 2 longs, 
'               result = 0 if frequency has been set, -1 otherwise
'
_SD_GetTicks
         tjnz    per_sec,#_SD_GetTicks_ok
         neg     rslt,#1
         jmp     _SD_GetTicks_ret
_SD_GetTicks_ok
         wrlong  time, t5
         add     t5, #4
         mov     t0,time_incr           ' convert ...
         mov     t1,per_clock           ' ... unprocessed time counts ...
         call    #d32u                  ' ... to clock counts ...
         wrlong  t0,t5                  ' ... and return that
         mov     rslt,#0
_SD_GetTicks_ret
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

'-------------------- constant values -----------------------------------------

Zero                    long    0                       ' constants
Mask24                  long    $00FF_FFFF

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
debug_led               long    |<Common#DEBUG_PIN

clock_res               long    CLOCKS_PER_SEC          ' clock resolution (fixed at compile time)

per_sec                 long    0                       ' cnts per sec (system clock frequency)                 
per_clock               long    0                       ' cnts per clock

clock                   long    0                       ' current clock val                       
clock_cnt_last          long    0                       ' last cnt value retrieved
clock_incr              long    0                       ' count as yet unprocessed

time                    long    0                       ' current time val
time_cnt_last           long    0                       ' last cnt value retrieved
time_incr               long    0                       ' count as yet unprocessed

rqstptr                 long    0                       ' my request /reply block address

param                   long    0
rslt                    long    0


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

