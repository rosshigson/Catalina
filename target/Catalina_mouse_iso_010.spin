''****************************************
''*  PS/2 Mouse Driver (Isolated) v1.0   *
''*  (C) 2005 Parallax, Inc.             *
''****************************************

' modified for Catalina by removal of unused SPIN methods and inclusion of
' data block (must be provided by higher level object).  
{
VAR

  long  oldx, oldy, oldz        'must be followed by parameters (9 contiguous longs)

  long  par_x           'absolute x             read-only       (6 contiguous longs)
  long  par_y           'absolute y             read-only
  long  par_z           'absolute z             read-only
  long  par_buttons     'button states          read-only
  long  par_present     'mouse present          read-only
  long  par_pingroup    'pin group              write-only
}

  m_count = 9

  par_x = 3
  par_pingroup = 8
  

PUB start(m_block, pingroup) : cog | addr

'' Start mouse driver - starts a cog
'' returns false if no cog available
''
''   pingroup = 4-pin group for PS/2 connector I/O
''     0 = pins 0..3
''     1 = pins 4..7
''     2 = pins 8..11
''     3 = pins 12..15
''     4 = pins 16..19
''     5 = pins 20..23
''     6 = pins 24..27
''     7 = pins 28..31
''
''   1st pin drives NPN base for PS/2 'data' signal pull-down
''   2nd pin reads PS/2 'data' signal
''   3rd pin drives NPN base for PS/2 'clock' signal pull-down
''   4th pin reads PS/2 'clock' signal
''
''   use 2.2K-ohm resistors between 1st/3rd pins and NPN bases
''   use 22K-ohm resistors between 2nd/4th pins and PS/2-side signals
''   use 2.2K-ohm resistors to pull PS/2-side signals to 5V
''   connect PS/2 power to 5V, PS/2 gnd to vss

  long[m_block][par_pingroup] := pingroup
  addr := @long[m_block][par_x]
  cog  := cognew(@entry, addr) + 1


PUB BlockSize : size

   size := 9

DAT

'***************************************
'* Assembly language PS/2 mouse driver *
'***************************************

                        org
'
'
' Entry
'
entry                   mov     x,par                   'load _pingroup input parameter
                        add     x,#5*4
                        rdlong  _pingroup,x

                        shl     _pingroup,#2            'set pin masks
                        mov     mask_dw,#%0001
                        shl     mask_dw,_pingroup
                        mov     mask_dr,#%0010
                        shl     mask_dr,_pingroup
                        mov     mask_cw,#%0100
                        shl     mask_cw,_pingroup
                        mov     mask_cr,#%1000
                        shl     mask_cr,_pingroup

                        test    _pingroup,#$20  wc      'modify port registers within code
                        muxc    _d1,dlsb
                        muxc    _d2,dlsb
                        muxc    _d3,dlsb
                        muxc    _d4,dlsb
                        muxc    _s1,#1
                        muxc    _s2,#1
                        muxc    _s3,#1

        if_nc           or      dira,mask_dw            'set directions
        if_nc           or      dira,mask_cw
        if_c            or      dirb,mask_dw
        if_c            or      dirb,mask_cw

                        movd    :par,#_x                'reset output parameters:
                        mov     x,#5                    '_x/_y/_z/_buttons/_present
:par                    mov     0,#0
                        add     :par,dlsb
                        djnz    x,#:par
'
'
' Reset mouse
'
reset                   mov     outa,#0                 'release any pull-downs
                        mov     outb,#0

                        mov     stat,#1                 'set reset flag
'
'
' Update parameters
'
update                  movd    :par,#_x                'update output parameters:
                        mov     x,par                   '_x/_y/_z/_buttons/_present
                        mov     y,#5
:par                    wrlong  0,x
                        add     :par,dlsb
                        add     x,#4
                        djnz    y,#:par

                        test    stat,#1         wc      'if reset flag, transmit reset command
        if_c            mov     data,#$FF
        if_c            call    #transmit
'
'
' Get data packet
'
                        mov     stat,#0                 'reset state

                        call    #receive                'receive first byte

                        cmp     data,#$AA       wz      'powerup/reset?
        if_z            jmp     #init

                        mov     _buttons,data           'data packet, save buttons

                        call    #receive                'receive second byte

                        test    _buttons,#$10   wc      'adjust _x
                        muxc    data,signext
                        add     _x,data

                        call    #receive                'receive third byte

                        test    _buttons,#$20   wc      'adjust _y
                        muxc    data,signext
                        add     _y,data

                        and     _buttons,#%111          'trim buttons

                        cmp     _present,#2     wc      'if not scrollwheel mouse, update parameters
        if_c            jmp     #update


                        call    #receive                'scrollwheel mouse, receive fourth byte

                        cmp     _present,#3     wz      'if 5-button mouse, handle two extra buttons
        if_z            test    data,#$10       wc
        if_z_and_c      or      _buttons,#%01000
        if_z            test    data,#$20       wc
        if_z_and_c      or      _buttons,#%10000

                        shl     data,#28                'adjust _z
                        sar     data,#28
                        sub     _z,data

                        jmp     #update                 'update parameters
'
'
' Initialize mouse
'
init                    call    #receive                '$AA received, receive id

                        movs    crate,#100              'try to enable 3-button scrollwheel type
                        call    #checktype
                        movs    crate,#200              'try to enable 5-button scrollwheel type
                        call    #checktype
                        shr     data,#1                 'if neither, 3-button type
                        add     data,#1
                        mov     _present,data

                        movs    srate,#200              'set 200 samples per second
                        call    #setrate

                        mov     data,#$F4               'enable data reporting
                        call    #transmit

                        jmp     #update
'
'
' Check mouse type
'
checktype               movs    srate,#200              'perform "knock" sequence to enable
                        call    #setrate                '..scrollwheel and extra buttons

crate                   movs    srate,#200/100
                        call    #setrate

                        movs    srate,#80
                        call    #setrate

                        mov     data,#$F2               'read type
                        call    #transmit
                        call    #receive

checktype_ret           ret
'
'
' Set sample rate
'
setrate                 mov     data,#$F3
                        call    #transmit
srate                   mov     data,#0
                        call    #transmit

setrate_ret             ret
'
'
' Transmit byte to mouse
'
transmit
_d1                     or      outa,mask_cw            'pull clock low
                        movs    napshr,#13              'hold clock for ~128us (must be >100us)
                        call    #nap
_d2                     or      outa,mask_dw            'pull data low
                        movs    napshr,#18              'hold data for ~4us
                        call    #nap
_d3                     xor     outa,mask_cw            'release clock

                        test    data,#$0FF      wc      'append parity and stop bits to byte
                        muxnc   data,#$100
                        or      data,dlsb

                        mov     x,#10                   'ready 10 bits
transmit_bit            call    #wait_c0                'wait until clock low
                        shr     data,#1         wc      'output data bit
_d4                     muxnc   outa,mask_dw
                        mov     wcond,c1                'wait until clock high
                        call    #wait
                        djnz    x,#transmit_bit         'another bit?

                        mov     wcond,c0d0              'wait until clock and data low
                        call    #wait
                        mov     wcond,c1d1              'wait until clock and data high
                        call    #wait

                        call    #receive_ack            'receive ack byte with timed wait
                        cmp     data,#$FA       wz      'if ack error, reset mouse
        if_nz           jmp     #reset

transmit_ret            ret
'
'
' Receive byte from mouse
'
receive                 test    _pingroup,#$20  wc      'wait indefinitely for initial clock low
                        waitpne mask_cr,mask_cr
receive_ack
                        mov     x,#11                   'ready 11 bits
receive_bit             call    #wait_c0                'wait until clock low
                        movs    napshr,#16              'pause ~16us
                        call    #nap
_s1                     test    mask_dr,ina     wc      'input data bit
                        rcr     data,#1
                        mov     wcond,c1                'wait until clock high
                        call    #wait
                        djnz    x,#receive_bit          'another bit?

                        shr     data,#22                'align byte
                        test    data,#$1FF      wc      'if parity error, reset mouse
        if_nc           jmp     #reset
                        and     data,#$FF               'isolate byte

receive_ack_ret
receive_ret             ret
'
'
' Wait for clock/data to be in required state(s)
'
wait_c0                 mov     wcond,c0                '(wait until clock low)

wait                    mov     y,tenms                 'set timeout to 10ms

wloop                   movs    napshr,#18              'nap ~4us
                        call    #nap
_s2                     test    mask_cr,ina     wc      'check required state(s)
_s3                     test    mask_dr,ina     wz      'loop until got state(s) or timeout
wcond   if_never        djnz    y,#wloop                '(replaced with c0/c1/c0d0/c1d1)

                        tjz     y,#reset                'if timeout, reset mouse
wait_ret
wait_c0_ret             ret


c0      if_c            djnz    y,#wloop                '(if_never replacements)
c1      if_nc           djnz    y,#wloop
c0d0    if_c_or_nz      djnz    y,#wloop
c1d1    if_nc_or_z      djnz    y,#wloop
'
'
' Nap
'
nap                     rdlong  t,#0                    'get clkfreq
napshr                  shr     t,#18/16/13             'shr scales time
                        min     t,#3                    'ensure waitcnt won't snag
                        add     t,cnt                   'add cnt to time
                        waitcnt t,#0                    'wait until time elapses (nap)

nap_ret                 ret
'
'
' Initialized data
'
dlsb                    long    1 << 9
tenms                   long    10_000 / 4
signext                 long    $FFFFFF00
'
'
' Uninitialized data
'
mask_dw                 res     1
mask_dr                 res     1
mask_cw                 res     1
mask_cr                 res     1
stat                    res     1
data                    res     1
x                       res     1
y                       res     1
t                       res     1

_x                      res     1       'write-only
_y                      res     1       'write-only
_z                      res     1       'write-only
_buttons                res     1       'write-only
_present                res     1       'write-only
_pingroup               res     1       'read-only

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

