{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - SIMPLE
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - screen
'
' This plugin implements a serial driver intended to allow a terminal emulator
' to be used instead of local devices. It uses smart pins to provide the
' serial interface, which avoids the need to use another cog. It buffers
' serial input and output using the LUT but doesn't use interrupts - it just 
' polls the smart pins periodically. This is fast enough for most uses, such
' as a serial terminal emulator, but it may not be suitable for high speed 
' serial comms applications - use one of the other serial options (e.g. TTY
' for a single HMI port), or the 2 port or 8 port serial libraries for 
' multi-port use).
'
' Version 4.9.4 - initial version.
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

#include <constant.inc>

CON

rxmode     = %0000_0000_000_0000000000000_00_11111_0 'async rx mode, input  enabled for smart input

txmode     = %0000_0000_000_0000000000000_01_11110_0 'async tx mode, output enabled for smart output

baud       = _BAUDRATE

bitrate    = 7 + ((_CLOCKFREQ / baud) << 16)

' size of HMI block (in bytes) to be allocated by startup code (may differ 
' for each type of HMI) - this assumes at most one HMI plugin is included

' Note we allocate 8 longs even though we currently only use the first 4 -
' just in case the cogserial plugin assumes it has all 8 longs allocated
  
' Note the block must be at least 4 bytes, since we use it to send the
' address of the registry to HMI plugins

HMI_BLOCK_SIZE = 4      ' size in bytes

LUT_BUFF_SIZE  = 512    ' rx and tx buffer size (in bytes) - must be <= 512

'-------------------------------------------------------------------------------

DAT
        alignl
        org     0

HMI_START
        call    #simple_setup
loop
        call    #rx_check       ' yes - check/perform rx
        call    #tx_check       ' yes - check/perform tx
        rdlong  rqst,rqstptr wz ' wait ...
  if_z  jmp     #loop           ' ... for a request
        mov     tmp1,rqst
        shr     tmp1,#24
        cmp     tmp1,#32 wcz
  if_a  jmp     #done_bad
        ror     tmp1,#2         ' lookup code address
        add     tmp1,#svctable
        sets    table,tmp1
        rol     tmp1,#2
        shl     tmp1,#3
table   mov     tmp2,0
        shr     tmp2,tmp1
        and     tmp2,#$FF
        jmp     tmp2            ' jump to code routine

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
        byte    done_bad        
        byte    done_bad
        byte    done_bad

'------------------------------------------------------------------
' jump table routines - must be within first 255 longs
'
initialize

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
        call    #rx_size        ' get size of rx buffer
   if_z jmp     #done_ok        ' if no keys, just return
k_get1
        call    #get_rx         ' get key from rx buffer ...
        mov     rslt,tmpch      ' ... and return it ...
        jmp     #k_trans        ' ... transated if required
k_wait
        call    #rx_size        ' get size of rx buffer
  if_nz jmp     #k_get1         ' if keys available, get one
        call    #serial_rx      ' otherwise wait for key
        mov     rslt,tmpch      ' is it ...
k_trans
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz    ' ... CR?
 if_z   mov     rslt,#$0a       ' if so, correct it
#endif
        cmp     rslt,#$04 wz    ' ... EOT?
 if_z   neg     rslt,#1         ' if so, return -1 (EOF)
        jmp     #done

k_new
        mov     rx_head, #0     ' clear ...
        mov     rx_tail, #0     ' ... any buffered keys
        jmp     #k_wait         ' wait for new key

k_ready
        call    #rx_size        ' get size of rx buffer
        mov     rslt,lut_temp   ' return 0 if no keys available
        jmp     #done

k_clear
        mov     rx_head, #0     ' clear ...
        mov     rx_tail, #0     ' ... any buffered keys
        jmp     #done_ok

#endif

'------------------------------------------------------------------
'

t_char
        mov     tmp5,rqst       ' get ...
        and     tmp5,#$ff       ' ... char to write
#ifdef CR_ON_LF
        cmp     tmp5,#$0a wz    ' translate ...
  if_nz jmp     #t_char_1       ' ... lf ...
        mov     tmp5,#$0d       ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     tmp5,#$0a       ' ... lf
t_char_1
#endif
        call    #t_put5         ' write char to tx buffer
        jmp     #done_ok

t_string 
        and     rqst,low23      ' source address is lower 23 bits of request
:t_strloop
        rdbyte  tmp5,rqst wz    ' get char to write
  if_z  jmp     #done_ok        ' finished if null byte
#ifdef CR_ON_LF
        cmp     tmp5,#$0a wz    ' translate ...
  if_nz jmp     #:t_str_1       ' ... lf ...
        mov     tmp5,#$0d       ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     tmp5,#$0a       ' ... lf
:t_str_1
#endif
        call    #t_put5         ' write char to screen
        add     rqst,#1         ' increment string pointer
        jmp     #:t_strloop     ' put more chars

t_int
        call    #t_getnum       ' get number to print
        cmps    rqst,#0 wcz     ' positive?
 if_ae  jmp     #t_uint         ' yes - no sign
        mov     tmp5,#$2d       ' no - prefix number with '-'
        call    #t_put5         ' write char to tx buffer
        abs     rqst,rqst wcz   ' make number positive
t_uint
  if_z  jmp     #:t_int4        ' if zero, just print one digit
        mov     tmp4,maxdec     ' get largest possible decimal divisor
:t_int2
        cmp     rqst,tmp4 wcz   ' is our number larger than that?
 if_ae  jmp     #:t_int3        ' yes - start extracting decimal digits
        mov     tmp0,tmp4           ' no - divide divisor ...
        mov     tmp1,#10        ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     tmp4,tmp0       ' ... try ...
        jmp     #:t_int2        ' ... again
:t_int3
        cmp     tmp4,#10 wcz    ' is this the last digit?
 if_b   jmp     #:t_int4        ' yes - no need to divide any more
        mov     tmp0,rqst       ' no - divide number ...
        mov     tmp1,tmp4       ' ... by  ...
        call    #d32u           ' ... divisor
        mov     tmp5,tmp0       ' convert quotient ...
        add     tmp5,#$30       ' ... to digit char
        mov     rqst,tmp1       ' save remainder for next time
        call    #t_put5         ' write char to tx buffer
        mov     tmp0,tmp4       ' divide divisor ...
        mov     tmp1,#10        ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     tmp4,tmp0       ' ... continue ...
        jmp     #:t_int3        ' ... with next digit
:t_int4
        mov     tmp5,rqst       ' convert last decimal digit ...
        add     tmp5,#$30       ' ... to digit char
        call    #t_put5         ' write char to screen
        jmp     #done_ok

t_unsigned
        call    #t_getnum       ' get number to print
        jmp     #t_uint         ' no sign, just print digits

t_hex
        call    #t_getnum       ' and get number to print
        mov     tmp4,#8         ' print 8 digits
:t_hex1
        rol     rqst,#4         ' convert 4 bits ...
        mov     tmp5,rqst       ' ... to '0' .. '9'
        and     tmp5,#$f        ' ... or ...
        cmp     tmp5,#10 wcz    ' ... 'A' .. 'F' ...
 if_ae  add     tmp5,#($41-$30-10)' ... depending ...
        add     tmp5,#$30       ' ... on the digit value
        call    #t_put5         ' write char to screen
        djnz    tmp4,#:t_hex1   ' continue with next digit
        jmp     #done_ok

t_bin
        call    #t_getnum       ' get number to print
        mov     tmp4,#32        ' print 32 digits
:t_bin1
        rol     rqst,#1         ' convert bit ...
        mov     tmp5,rqst       ' ... to '0' ...
        and     tmp5,#1         ' ... or ...
        add     tmp5,#$30       ' ... '1'
        call    #t_put5         ' write char to screen
        djnz    tmp4,#:t_bin1   ' continue with next digit
        jmp     #done_ok

done_bad
        neg     rslt,#1         ' unknown code specified
        jmp     #done

done_ok
        mov      rslt,#0        ' return zero
done
        wrlong   rslt,rsltptr   ' save result
done_rslt
        mov      rslt,#0        ' indicate ...
        wrlong   rslt,rqstptr   ' ... request complete
        jmp      #loop          ' wait for next request

'------------------------------------------------------------------
' internal routines - can be beyond long 255
'
' simple_setup
' On entry:
'       PTRA = pointer to our HMI block, which will initially contain
'              the registry address as the first long.
'
simple_setup
        cogid   tmp0            ' get our cog id
        mov     tmp6,tmp0       ' save cog id for registering services
        shl     tmp0,#2         ' ... calculate ...
        rdlong  regptr,PTRA     ' ... our ...
        add     tmp0,regptr     ' ... request ...
        rdlong  rqstptr,tmp0    ' ... block ...
        and     rqstptr,low23   ' ... address (only use 23 bits)
        mov     rsltptr,rqstptr ' calculate ...
        add     rsltptr,#4      ' ... our result address
        mov     tmp1,#0         ' zero ...
        wrlong  tmp1,rqstptr    ' ... the request ...
        wrlong  tmp1,rsltptr    ' ... and result
        mov     tmp1,#LMM_HMI   ' register ...
        shl     tmp1,#24        ' ... this cog ...
        or      tmp1,rqstptr    ' ... as a ...
        wrlong  tmp1,tmp0       ' ... HMI cog
        mov     tmpch,##bitrate ' initialize ...
        call    #serial_init    ' ... serial
        ret

'-------[ Serial Initialize (uses SmartPins) ]--------------------------------
' Call Format:
'      call      #serial_init       ' provide addr & baud
' On Entry:
'      tmpch     = bitrate          ' tx & rx bit period + #(bits-1)
'                                   ' = (_clkfreq / _BAUDRATE) << 16 + 7
' On Return:
'      tmpch = #0D

serial_init
        wrpin   ##txmode, txpin      ' set asynchronous tx mode in smart pin tx
        wxpin   tmpch, txpin         ' set tx bit period + #(bits-1)
        dirh    txpin                ' enable smart pin tx

        wrpin   ##rxmode, rxpin      ' set asynchronous rx mode in smart pin rx
        wxpin   tmpch, rxpin         ' set rx bit period + #(bits-1)
        dirh    rxpin                ' enable smart pin rx

        mov     tmpch, #$0D          ' we have to prime send buffer empty flag,
        wypin   tmpch, txpin         ' ... so send <cr> to tx pin
        mov     rxtx_flag,#1         ' enable rx/tx
        ret

'-------[ Transmit Char(s) ]--------------------------------------------------
' Call Format:
'      call    #serial_tx           ' tx 1-4 char(s)
' On Entry:
'      tmpch = char                 ' up to 4 chars; B0 first;
'                                   ' <nul> terminates, but if =$0, tx <nul>
' On Return:
'      tmpch = -lost-

serial_tx
        testp   txpin         wc     ' wait for buffer empty on tx pin
 if_nc  jmp     #serial_tx           '
        wypin   tmpch, txpin         ' send byte (bits7:0) to tx pin

        shr     tmpch, #8     wz     ' any more chars to send?
 if_nz  jmp     #serial_tx           ' (nz = another char in tmpch)
        ret

'-------[ Receive a char ]----------------------------------------------------
' Call Format:
'      call    #serial_rx           ' rx 1 char (waits till char ready)
'      call    #serial_rx1          ' rx 1 char (assumes char ready)
' On Entry:
'      tmpch = -anything-
' On Return:
'      tmpch = char

serial_rx
        testp   rxpin        wc      ' char ready?
  if_c  jmp     #serial_rx1          ' yes - get it
        call    #tx_check            ' no - check for tx
        jmp     #serial_rx           ' keep waiting
serial_rx1
        rdpin   tmpch, rxpin         ' recv byte (bits31:24) from rx pin
  _ret_ shr     tmpch, #24           ' shift rx bits

'-------[ Check if rx char available - if so, put it in rx buffer ]------------
' Call Format:
'      call    #rx_check            ' check if char ready
' On Entry:
'      tmpch = -anything-
' On Return:
'      tmpch = char (if available)

rx_check
        cmp     rxtx_flag,#0 wz      ' rx/tx enabled?
  if_z  ret                          ' no - just return
        testp   rxpin        wc      ' char ready?
  if_nc ret                          ' no - just return
        call    #serial_rx1          ' yes, get it
        call    #put_rx              ' add char to rx buffer
        ret

'-------[ Check if tx ready - if so, tx a char if available ]------------------
' Call Format:
'      call    #tx_check            ' check if char ready
' On Entry:
'      tmpch = -anything-
' On Return:
'      tmpch = char (if sent)

tx_check
        cmp     rxtx_flag,#0 wz      ' rx/tx enabled?
  if_z  ret                          ' no - just return
        testp   txpin        wc      ' ready for tx?
 if_nc  ret                          ' no - just return
        call    #get_tx              ' character waiting?
 if_z   ret                          ' no - just return
 _ret_  wypin   tmpch, txpin         ' send char (bits7:0) to tx pin

'
'
't_getnum - set up for converting and printing numbers
'
t_getnum
        and     rqst,low23      ' source address is lower 23 bits of request
        rdlong  rqst,rqst wz    ' get the actual number in the rquest
        ret

'
' t_put_rqst - write char pointed to by rqst ptr
' On entry
'    rqstptr : address of byte to write
'
t_put_rqst
        rdbyte  tmp5,rqstptr

' t_put5     - write character in t5
' On entry
'    tmp5      : char to write
'
t_put5 
        mov     tmpch,tmp5
        call    #put_tx         ' char added to tx buffer?
  if_nz jmp     #t_put51        ' yes - just check rx
        cmp     rxtx_flag,#0 wz ' no - tx/rx enabled?
  if_z  ret                     ' no - can't do anything
        call    #tx_check       ' yes - check/perform tx ...
        call    #rx_check       ' ... and rx to see if we ... 
        jmp     #t_put5         ' ... free up buffer space
t_put51
        call    #rx_check       ' check for rx
        ret
'
'd32u - Unsigned 32 bit division
' On entry:
'    tmp1 = divisor
'    tmp0 = dividend
' On exit:
'    tmp0 = quotient (i.e. tmp0/tmp1)
'    tmp1 = remainder

d32u
        qdiv  tmp0,tmp1
        getqx tmp0
 _ret_  getqy tmp1

'
' LUT buffer processing. The LUT buffer is LUT_BUFF_SIZE/4 longs, which can 
' store LUT_BUFF_SIZE-1 characters (the buffer is empty if head == tail).
'

' put_rx - put char in tmpch into the rx buffer (if possible), incrementing
'          the buffer head pointer. Return with Z set if buffer is full.

put_rx
           call    #rx_size              ' get size of rx buffer
           cmp     lut_temp, #LUT_BUFF_SIZE-1 wz ' rx buffer full? 
  if_z     ret                           ' yes - can't store another byte   
           mov     lut_addr, rx_addr     ' point to rx buffer
           shl     lut_addr, #2          ' convert to byte addr
           add     lut_addr, rx_head     ' point to head
           mov     lut_indx, lut_addr    ' calc ...
           and     lut_indx, #%11        ' ... index in long to put byte
           shr     lut_addr, #2          ' restore long addr
           rdlut   lut_temp, lut_addr    ' read the long      
           altsb   lut_indx, #lut_temp    ' set ...
           setbyte 0, tmpch, #0          ' ... tmpch as correct byte ...
           wrlut   lut_temp, lut_addr    ' ... in lut buffer
   _ret_   incmod  rx_head, #LUT_BUFF_SIZE-1 ' increment buffer head

' rx_size - return number of bytes in rx buffer (in lut_temp)

rx_size
           mov     lut_temp, rx_head 
           sub     lut_temp, rx_tail wcz
     if_c  add     lut_temp, ##LUT_BUFF_SIZE
           ret

' get_rx - return earliest byte in rx buffer in tmpch, incrementing 
'          the buffer tail pointer. Return with Z set if buffer is empty

get_rx
           call    #rx_size              ' get size of rx buffer
      if_z ret                           ' return Z set if buffer empty
           mov     lut_addr, rx_addr     ' point to rx buffer
           shl     lut_addr, #2          ' convert to byte addr
           add     lut_addr, rx_tail     ' point to tail
           mov     lut_indx, lut_addr    ' calc ...
           and     lut_indx, #%11        ' ... index in long
           shr     lut_addr, #2          ' restore long addr
           rdlut   lut_temp, lut_addr    ' read the long      
           altgb   lut_indx, #lut_temp       ' get ...
           getbyte tmpch, 0, #0      ' ... correct byte into tmpch
   _ret_   incmod  rx_tail, #LUT_BUFF_SIZE-1 ' increment buffer tail

' put_tx - put char in tmpch into the tx buffer (if possible), incrementing
'          the buffer head pointer. Return with Z set if buffer is full.

put_tx
           call    #tx_size              ' get size of tx buffer
           cmp     lut_temp, #LUT_BUFF_SIZE-1 wz ' tx buffer full? 
  if_z     ret                           ' yes - can't store another byte   
           mov     lut_addr, tx_addr     ' point to tx buffer
           shl     lut_addr, #2          ' convert to byte addr
           add     lut_addr, tx_head     ' point to head
           mov     lut_indx, lut_addr    ' calc ...
           and     lut_indx, #%11        ' ... index in long to put byte
           shr     lut_addr, #2          ' restore long addr
           rdlut   lut_temp, lut_addr    ' read the long      
           altsb   lut_indx, #lut_temp    ' set ...
           setbyte 0, tmpch, #0          ' ... tmpch as correct byte ...
           wrlut   lut_temp, lut_addr    ' ... in lut buffer
   _ret_   incmod  tx_head, #LUT_BUFF_SIZE-1 ' increment buffer head

' tx_size - return number of bytes in tx buffer (in lut_temp)

tx_size
           mov     lut_temp, tx_head 
           sub     lut_temp, tx_tail wcz
     if_c  add     lut_temp, ##LUT_BUFF_SIZE
           ret

' get_tx - return earliest byte in tx buffer in tmpch, incrementing 
'          the buffer tail pointer. Return with Z set if buffer is empty

get_tx
           call    #tx_size              ' get size of tx buffer
      if_z ret                           ' return Z set if buffer empty
           mov     lut_addr, tx_addr     ' point to tx buffer
           shl     lut_addr, #2          ' convert to byte addr
           add     lut_addr, tx_tail     ' point to tail
           mov     lut_indx, lut_addr    ' calc ...
           and     lut_indx, #%11        ' ... index in long
           shr     lut_addr, #2          ' restore long addr
           rdlut   lut_temp, lut_addr    ' read the long      
           altgb   lut_indx, #lut_temp       ' get ...
           getbyte tmpch, 0, #0      ' ... correct byte into tmpch
   _ret_   incmod  tx_tail, #LUT_BUFF_SIZE-1 ' increment buffer tail

' common lut buffer registers

lut_addr   long 0                    ' long address of long in LUT buffer
lut_indx   long 0                    ' index of byte in long (0 .. 3)
lut_temp   long 0                    ' temp while adjusting byte in long

' tx lut buffer registers

tx_addr    long 0                    ' long address of tx buffer in LUT
tx_head    long 0                    ' tx buffer head (0 .. LUT_BUFF_SIZE - 1)
tx_tail    long 0                    ' tx buffer tail (0 .. LUT_BUFF_SIZE - 1)

' rx lut buffer registers

rx_addr    long (LUT_BUFF_SIZE+3)/4  ' long address of rx buffer in LUT
rx_head    long 0                    ' rx buffer head (0 .. LUT_BUFF_SIZE - 1)
rx_tail    long 0                    ' rx buffer tail (0 .. LUT_BUFF_SIZE - 1)

' internal registers

regptr   long 0         ' address of registry
rqstptr  long 0         ' address of request block
rsltptr  long 0         ' address to put results
rqst     long 0         ' request being processed
rslt     long 0         ' result to return

' temporary registers

tmp0     long 0
tmp1     long 0
tmp2     long 0
tmp3     long 0
tmp4     long 0
tmp5     long 0
tmp6     long 0

' command variables

rxpin     long _RX_PIN          ' rx pin (typically 63)
txpin     long _TX_PIN          ' tx pin (typically 62)
tmpch     long 0
rxtx_flag long 0                ' set to 1 after initialization

' internal constants

minus1   long -1
minus10  long -10

' initialized data

low23    long $007FFFFF
maxdec   long 1000000000        ' maximum decimal divisor for 32 bit values

         fit   $1f0
  
'=======================================================================

' setup function for HMI

   orgh
   alignl

DAT

HMI_Setup
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
 call    #Register_Services
 ret

' service table for registering HMI services

HMI_Service_Table
  byte SVC_K_PRESENT , 1
  byte SVC_K_GET     , 2
  byte SVC_K_WAIT    , 3
  byte SVC_K_NEW     , 4
  byte SVC_K_READY   , 5
  byte SVC_K_CLEAR   , 6
  byte SVC_K_STATE   , 7
  byte SVC_M_PRESENT , 11
  byte SVC_M_BUTTON  , 12
  byte SVC_M_BUTTONS , 13
  byte SVC_M_ABS_X   , 14
  byte SVC_M_ABS_Y   , 15
  byte SVC_M_ABS_Z   , 16
  byte SVC_M_DELTA_X , 17
  byte SVC_M_DELTA_Y , 18
  byte SVC_M_DELTA_Z , 19
  byte SVC_M_RESET   , 20
  byte SVC_T_GEOMETRY, 21
  byte SVC_T_CHAR    , 22
  byte SVC_T_STRING  , 23
  byte SVC_T_INT     , 24
  byte SVC_T_UNSIGNED, 25
  byte SVC_T_HEX     , 26
  byte SVC_T_BIN     , 27
  byte SVC_T_SETPOS  , 28
  byte SVC_T_GETPOS  , 29
  byte SVC_T_MODE    , 30
  byte SVC_T_SCROLL  , 31
  byte SVC_T_COLOR   , 32
  byte 0             , 0

  alignl ' align long

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
