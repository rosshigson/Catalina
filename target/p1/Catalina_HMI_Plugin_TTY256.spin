{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - TTY256
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - screen
'
' This plugin uses serial drivers intended to allow a terminal emulator
' to be used instead of local devices. It is really just a "wrapper" to
' provide an interface to the TTY256 (FullDuplexSerial256) driver.
'
' Note that this HMI plugin does not currenlty support proxying - if proxy 
' support is required, use the PC or PROPTERMINAL HMI option instead.
'
' Version 6.2.1 - initial version.
'
'-------------------------------------------------------------------------------
' Keyboard services:
'
'name: k_present
'code: 1
'type: short request
'data: (none)           
'rslt: 0 = not present, > 0 = present

'name: k_get
'code: 2
'type: short request
'data: (none)
'rslt: 0 = no key available, > 0 = key code

'name: k_wait
'code: 3
'type: short request
'data: (none)
'rslt: key code

'name: k_new
'code: 4
'type: short request
'data: (none)
'rslt: key code

'name: k_ready
'code: 5
'type: short request
'data: (none)
'rslt: 0 = no key, > 0 = key available

'name: k_clear
'code: 6
'type: short request
'data: (none)
'rslt: (none)

'name: k_state
'code: 7
'type: short request
'data: key code
'rslt: ignored (always zero)

'-------------------------------------------------------------------------------
' Screen/display (text) services:
'
'name: t_geometry
'code: 21
'type: short request
'data: (none)
'rslt: curs<<23 + cols<<8 + rows

'name: t_char
'code: 22
'type: short request
'data: curs<<23 + char
'rslt: 0 = ok

'name: t_string
'code: 23
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_int
'code: 24
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_unsigned
'code: 25
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_hex
'code: 26
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_bin
'code: 27
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_setpos
'code: 28
'type: short request
'data: curs<<23 + col<<8 + row
'rslt: 0 = ok

'name: t_getpos
'code: 29
'type: short request
'data: curs<<23
'rslt: 0 (i.e. request ignored for PC)

'name: t_mode
'code: 30
'type: short request
'data: curs<<23 + mode
'rslt: 0 (i.e. request ignored for PC)

'name: t_scroll
'code: 31
'type: short request
'data: count<<16 + firstrow<<8 + lastrow
'rslt: 0 (i.e. request ignored for PC)

'name: t_color
'code: 32
'type: short request
'data: curs<<23 + cursor
'rslt: 0 (i.e. request ignored for PC)
'
'-------------------------------------------------------------------------------
}}
CON
'
' size (in longs) of HMI data block
'
DATA_LONGS = 0 ' no additional data block required for this driver
cols    = 0 ' no row/col support in this driver
rows    = 0 ' no row/col support in this driver
chrs    = 0 ' no row/col support in this driver

#ifdef PROXY_KEYBOARD
#ifndef PROXY_HMI
#define PROXY_HMI
#endif
#endif

#ifdef PROXY_SCREEN
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
#endif  

#ifdef PROXY_HMI
#error : Proxy not supported for the selected HMI option
#endif  

OBJ

  common : "Catalina_Common" 

  count  : "Catalina_CogCount"

  tty    : "Catalina_FullDuplexSerial256"

'
' This function is called by the target to start the plugin
'
PUB Start (HMI_BLOCK, io_block, proxy_lock, server_cpu) : cog | freecogs

#ifndef NO_HMI

  ' allocate TTY buffers
  tty.Setup

  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits

  ' Start the TTY driver
  tty.Start

  ' register any cogs which were free but are now used as TTY cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_TTY)

  ' start the HMI plugin
  cog := cognew(@HmiStart, Common#REGISTRY)

  if (cog => 0)
    ' plugin started ok - send it configuration data
    common.SendInitializationDataAndWait(cog, tty.Get_Block, 0)
    ' plugin initialzed - register it
    common.Register(cog, common#LMM_HMI)

  cog += 1

#else
  
  cog := 0

#endif
'

DAT
        org     0

HmiStart
'
' The following locations are used as t0 .. t6 after the cog is started:
'
t0      cogid   t0              ' calculate ...
t1      shl     t0,#2           ' ... my ...
t2      add     t0,par          ' ... request ...
t3      rdlong  rqstptr,t0      ' ... block ...
t4      and     rqstptr,low23   ' ... address (only use 23 bits)
t5      mov     rsltptr,rqstptr ' calculate ...
t6      add     rsltptr,#4      ' ... my result address

loop
        rdlong  rqst,rqstptr wz ' wait ...
  if_z  jmp     #loop           ' ... for a request
        
        mov     t1,rqst
        shr     t1,#24
        cmp     t1,#32 wz,wc
  if_a  jmp     #done_bad
        ror     t1,#2           ' lookup code address
        add     t1,#svctable
        movs    :table,t1
        rol     t1,#2
        shl     t1,#3
:table  mov     t2,0
        shr     t2,t1
        and     t2,#$FF
        jmp     t2              ' jump to code routine

svctable
        byte    initialize      ' 0
        byte    k_present       ' 1 
        byte    k_get           ' 2
        byte    k_wait          ' 3
        byte    k_new           ' 4
        byte    k_ready         ' 5
        byte    k_clear         ' 6
        byte    done_ok         ' 7 k_state ignored (always return 0)
        byte    done_bad        ' 8
        byte    done_bad        ' 9
        byte    done_bad        '10
        byte    done_ok         '11 m_present ignored
        byte    done_ok         '12 m_button ignored  
        byte    done_ok         '13 m_buttons ignored 
        byte    done_ok         '14 m_abs_x ignored   
        byte    done_ok         '15 m_abs_y ignored   
        byte    done_ok         '16 m_abs_z ignored   
        byte    done_ok         '17 m_delta_x ignored 
        byte    done_ok         '18 m_delta_y ignored 
        byte    done_ok         '19 m_delta_z ignored 
        byte    done_ok         '20 m_reset ignored   
        byte    done_ok         '21 t_geometry ignored (always return 0)
        byte    t_char          '22
        byte    t_string        '23
        byte    t_int           '24
        byte    t_unsigned      '25
        byte    t_hex           '26
        byte    t_bin           '27
        byte    done_ok         '28 t_setpos ignored
        byte    done_ok         '29 t_getpos ignored
        byte    done_ok         '30 t_mode ignored
        byte    done_ok         '31 t_scroll ignored
        byte    done_ok         '32 t_color ignored

'------------------------------------------------------------------
' jump table routines - must be within first 255 longs
'
        long                    ' align long

initialize
        rdlong  prxhead,rqstptr ' save pointer to rx_head
        mov     prxtail,prxhead ' calculate ...
        add     prxtail,#4      ' ... pointer to rx_tail
        mov     ptxhead,prxtail ' calculate ...
        add     ptxhead,#4      ' ... pointer to tx_head
        mov     ptxtail,ptxhead ' calculate ...
        add     ptxtail,#4      ' ... pointer to tx_tail
        mov     prxbuff,ptxtail ' calculate ...
        add     prxbuff,#20     ' ... 
        rdlong  prxbuff,prxbuff ' ... pointer to rx_buffer
        mov     ptxbuff,prxbuff ' calculate ...
        add     ptxbuff,#256    ' ... pointer to tx_buffer

#ifdef NO_KEYBOARD
        jmp     #done_ok        ' no keyboard to initialize
#else
        jmp     #k_clear        ' initialize keyboard
#endif

#ifdef NO_KEYBOARD

k_present
k_get
k_new   
k_wait
k_ready
k_clear
        jmp     #done_ok        ' 

#else

k_present
        mov     rslt,#1         ' presume ...
        jmp     #done           ' ... always present

k_get
        call    #k_load         ' load key pointed to by tx_tail
   if_z jmp     #done_ok        ' Z set if no key available
k_consume
        add     t1,#1           ' increment ...
        and     t1,#$ff         ' ...
        wrlong  t1,prxtail      ' ... rx_tail
        jmp     #done

k_new   rdlong  t1,prxhead      ' set rx_tail ...
        wrlong  t1,prxtail      ' ... to rx_head
                                ' fall through to k_wait

k_wait
        call    #k_load         ' load key pointed to by rx_tail
 if_z   jmp     #k_wait         ' Z set if no key available
        jmp     #k_consume      ' consume and return the key


k_ready
        call    #k_setup        ' setup common values
  if_z  jmp     #done           ' rslt == 0 if no key ready
        neg     rslt,#1         ' rslt == -1 if a key is ready
        jmp     #done

k_clear
        rdlong  t1,prxhead      ' set rx_tail ...
        wrlong  t1,prxtail      ' .... to rx_head
        jmp     #done

#endif

'------------------------------------------------------------------
'
t_char
        mov     t5,rqst         ' get ...
        and     t5,#$ff         ' ... char to write
#ifdef CR_ON_LF
        cmp     t5,#$0a wz      ' translate ...
  if_nz jmp     #:t_char_1      ' ... lf ...
        mov     t5,#$0d         ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     t5,#$0a         ' ... lf
:t_char_1
#endif
        call    #t_put5         ' write char to screen at cursor
        jmp     #done_ok

t_string 
        and     rqst,low23      ' source address is lower 23 bits of request
:t_strloop
        rdbyte  t5,rqst wz      ' get char to write
  if_z  jmp     #done_ok        ' finished if null byte
#ifdef CR_ON_LF
        cmp     t5,#$0a wz      ' translate ...
  if_nz jmp     #:t_str_1      ' ... lf ...
        mov     t5,#$0d         ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     t5,#$0a         ' ... lf
:t_str_1
#endif
        call    #t_put5         ' write char to screen
        add     rqst,#1         ' increment string pointer
        jmp     #:t_strloop     ' put more chars

t_int
        call    #t_getnum       ' get number to print
        cmps    rqst,#0 WC,WZ   ' positive?
 if_ae  jmp     #t_uint         ' yes - no sign
        mov     t5,#$2d         ' no - prefix number with '-'
        call    #t_put5         ' write char to screen at cursor
        abs     rqst,rqst WC,WZ ' make number positive
t_uint
  if_z  jmp     #:t_int4        ' if zero, just print one digit
        mov     t4,maxdec       ' get largest possible decimal divisor
:t_int2
        cmp     rqst,t4 WC,WZ   ' is our number larger than that?
 if_ae  jmp     #:t_int3        ' yes - start extracting decimal digits
        mov     t0,t4           ' no - divide divisor ...
        mov     t1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     t4,t0           ' ... try ...
        jmp     #:t_int2        ' ... again
:t_int3
        cmp     t4,#10 WC,WZ    ' is this the last digit?
 if_b   jmp     #:t_int4        ' yes - no need to divide any more
        mov     t0,rqst         ' no - divide number ...
        mov     t1,t4           ' ... by  ...
        call    #d32u           ' ... divisor
        mov     t5,t0           ' convert quotient ...
        add     t5,#$30         ' ... to digit char
        mov     rqst,t1         ' save remainder for next time
        call    #t_put5         ' write char to screen at cursor
        mov     t0,t4           ' divide divisor ...
        mov     t1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     t4,t0           ' ... continue ...
        jmp     #:t_int3        ' ... with next digit
:t_int4
        mov     t5,rqst           ' convert last decimal digit ...
        add     t5,#$30         ' ... to digit char
        call    #t_put5         ' write char to screen
        jmp     #done_ok

t_unsigned
        call    #t_getnum       ' get number to print
        jmp     #t_uint         ' no sign, just print digits

t_hex
        call    #t_getnum       ' and get number to print
        mov     t4,#8           ' print 8 digits
:t_hex1
        rol     rqst,#4         ' convert 4 bits ...
        mov     t5,rqst         ' ... to '0' .. '9'
        and     t5,#$f          ' ... or ...
        cmp     t5,#10 wc,wz    ' ... 'A' .. 'F' ...
 if_ae  add     t5,#($41-$30-10)' ... depending ...
        add     t5,#$30         ' ... on the digit value
        call    #t_put5         ' write char to screen
        djnz    t4,#:t_hex1     ' continue with next digit
        jmp     #done_ok

t_bin
        call    #t_getnum       ' get number to print
        mov     t4,#32          ' print 32 digits
:t_bin1
        rol     rqst,#1         ' convert bit ...
        mov     t5,rqst         ' ... to '0' ...
        and     t5,#1           ' ... or ...
        add     t5,#$30         ' ... '1'
        call    #t_put5         ' write char to screen
        djnz    t4,#:t_bin1     ' continue with next digit
        jmp     #done_ok

done_bad
        neg     rslt,#1         ' unknown code specified
        jmp     #done

done_ok
        mov      rslt,#0        ' return zero
done
        wrlong   rslt,rsltptr   ' save result
        mov      rslt,#0        ' indicate ...
        wrlong   rslt,rqstptr   ' ... request complete
        jmp      #loop          ' wait for next request

'------------------------------------------------------------------
' internal routines - can be beyond long 255
'
' k_setup - Set up commonly used values for keyboard services.
' On exit:
'    t1 = rx_tail
'    t2 = rx_head
'    rslt = rx_tail - rx_head
'    Z flag set if rx_tail == rx_head
'
k_setup
        mov     t2,prxhead      ' get ...
        rdlong  t2,t2           ' ... rx_head
        mov     t1,prxtail      ' get ...
        rdlong  t1,t1           ' ... rx_tail
        mov     rslt,t1         ' set Z flag ...
        sub     rslt,t2 wz      ' ... and rslt = 0 if rx_tail == rx_head
k_setup_ret
        ret
'
' k_load - Set up common values and read key indicated by rx_tail.
'
' On exit:
'    t1 = rx_tail
'    t2 = rx_head
'    rslt = key indicated by par_tail
'    Z flag set if rx_tail == rx_head
'
'
k_load
        call    #k_setup        ' setup common values
 if_z   jmp     #k_load_ret     ' Z flag set if no key available
        mov     rslt,prxbuff    ' point to key ...
        add     rslt,t1         ' ... indicated ...
        rdbyte  rslt,rslt       ' ... by rx_tail
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz    ' CR?
 if_z   mov     rslt,#$0a       ' if so, correct it
#endif
        cmp     rslt,#$04 wz    ' EOT?
 if_z   neg     rslt,#1         ' if so, return -1 (EOF)
        mov     t0,#1 wz        ' ensure Z flag not set!
k_load_ret
        ret

' t_setup - Set up commonly used values for text services.
' On exit:
'    t1 = tx_tail
'    t2 = tx_head
'    t3 = (tx_head + 1) & $ff
'    Z flag set if tx_tail == (tx_head + 1) & $ff
'
t_setup
        mov     t2,ptxhead      ' get ...
        rdlong  t2,t2           ' ... tx_head
        mov     t1,ptxtail      ' get ...
        rdlong  t1,t1           ' ... tx_tail
        mov     t3,t2           ' set Z flag ...
        add     t3,#1           ' ... if ...
        and     t3,#$ff         ' ... tx_tail 
        cmp     t1,t3 wz        ' ... == (tx_head + 1) & $ff
t_setup_ret
        ret
'
't_getnum - set up for converting and printing numbers
'
t_getnum
        and     rqst,low23      ' source address is lower 23 bits of request
        rdlong  rqst,rqst wz    ' get the actual number in the rquest
t_getnum_ret                                
        ret

'
' t_put5 - write char in t5 to transmit buffer (will wait till space is available)
' On entry
'    t5 : char to write
' On exit
'    t0,t1,t2,t3 : lost
t_put5
        call    #t_setup        ' setup common values
 if_z   jmp     #t_put5         ' repeat until (tx_tail <> (tx_head + 1) & $ff)
        mov     t0,ptxbuff      ' txbuffer...
        add     t0,t2           ' ... [tx_head] ...
        wrbyte  t5,t0           ' ... := t5
        mov     t0,ptxhead      ' tx_head ...
        wrlong  t3,t0           ' ... := (tx_head + 1) & $ff
t_put5_ret
        ret

'
'd32u - Unsigned 32 bit division
' On entry:
'    t1 = divisor
'    t0 = dividend
' On exit:
'    t0 = quotient (i.e. t0/t1)
'    t1 = remainder

d32u
        mov d1,#32
        mov d2, #0
:d32up
        shl t0,#1    WC
        rcl d2,#1    WC
        cmp t1,d2    WC,WZ
 if_be  sub d2,t1
 if_be  add t0,#1
:d32down
        sub d1, #1   WZ
 if_ne  jmp #:d32up
        mov t1,d2
d32u_ret
        ret

'------------------------------------------------------------------
' initialized data
'
low23   long     $007FFFFF
maxdec  long     1000000000     ' maximum decimal divisor for 32 bit values
'
'------------------------------------------------------------------
' uninitialized data
'
rqstptr long     0      ' address of my request block
rsltptr long     0      ' address to put results
rqst    long     0      ' request being processed
rslt    long     0      ' result to return
d1      long     0      ' used when dividing
d2      long     0      ' used when dividing
prxhead long     0
prxtail long     0
ptxhead long     0
ptxtail long     0
ptxbuff long     0
prxbuff long     0
'-------------------------------------------------------------------

        fit   $1f0

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

