{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - TTY
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - screen
'
' This plugin uses serial drivers intended to allow a terminal emulator
' to be used instead of local devices. It is really just a "wrapper" to
' provide an interface to the TTY (cogserial.pasm) driver.
'
' Note that this HMI plugin does not currenlty support proxying - if proxy 
' support is required, use the PC or PROPTERMINAL HMI option instead.
'
' Version 3.6 - initial version.
' Version 3.15 - modified to use cogserial.pasm (in place of FullDuplexSerial)
'                on the P2.
' Version 3.16 - remove necessity for image to remain in hub RAM after loading.
'                HMI block must now be passed in on startup- the first long of
'                this block must contain the registry address.
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

rxpin      = _RX_PIN

txpin      = _TX_PIN

rxlutstart = $00

rxlutsize  = $FF

txlutstart = $100

txlutsize  = $FF

rxmode     = %0000_0000_000_0000000000000_00_11111_0 	'async rx mode, input  enabled for smart input

txmode     = %0000_0000_000_0000000000000_01_11110_0 	'async tx mode, output enabled for smart output

baud       = _BAUDRATE

bitrate    = 7 + ((_CLOCKFREQ / baud) << 16)

' size of HMI block (in bytes) to be allocated by startup code (may differ 
' for each type of HMI) - this assumes at most one HMI plugin is included

' Note we allocate 8 longs even though we currently only use the first 4 -
' just in case the cogserial plugin assumes it has all 8 longs allocated
  
' Note the block must be at least 4 bytes, since we use it to send the
' address of the registry to HMI plugins

HMI_BLOCK_SIZE = 8*4

'-------------------------------------------------------------------------------

DAT
        alignl
        org     0

HMI_START
        call    #tty_setup
loop
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
        call    #rx_count
        rdlong  r_tst, r1_paradr
        cmps    r_tst, #0 wcz
   if_z jmp     #done_ok        ' if no key, just return
                                ' otherwise, fall through to k_wait
k_wait
        mov     r_adr, rsltptr
        call    #rx
        rdbyte  rslt, rsltptr 
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz    ' CR?
 if_z   mov     rslt,#$0a       ' if so, correct it
#endif
        cmp     rslt,#$04 wz    ' EOT?
 if_z   neg     rslt,#1         ' if so, return -1 (EOF)
        jmp     #done


k_new
        mov     r_adr, rsltptr
k_new_loop
        call    #rx_count
        rdlong  r_tst, r1_paradr
        cmps    r_tst, #0 wcz
  if_z  jmp     #k_wait
        call    #rx
        jmp     #k_new_loop

k_ready
        call    #rx_count
        rdlong  r_tst, r1_paradr wc
        cmp     r_tst, #0 wcz
  if_nz jmp     #k_is_ready
        mov     rslt,#0         ' rslt == 0 if no key ready
        jmp     #done
k_is_ready
        mov     rslt,#1         ' rslt == 1 if a key is ready
        jmp     #done

k_clear
        mov     r_adr, rsltptr
k_clear_loop
        call    #rx_count
        rdlong  r_tst, r1_paradr
        cmps    r_tst, #0 wcz
  if_z  jmp     #done_ok
        call    #rx
        jmp     #k_clear_loop

#endif

'------------------------------------------------------------------
'

' make sure there is at least 255 bytes available in tx buffer
' (this should be enough to print a whole line!)
ensure_tx_not_full
         call   #tx_check
         rdlong t_tst, t1_paradr
         cmps   t_tst, minus1 wcz
 if_z    jmp    #ensure_tx_not_full
         cmps   t_tst, #255 wcz
 if_b    jmp    #ensure_tx_not_full
         ret

t_char
        call    #ensure_tx_not_full
#ifdef CR_ON_LF
        mov     tmp5,rqst       ' get ...
        and     tmp5,#$ff       ' ... char to write
        cmp     tmp5,#$0a wz    ' translate ...
  if_nz jmp     #t_char_1       ' ... lf ...
        mov     tmp5,#$0d       ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     tmp5,#$0a       ' ... lf
t_char_1
        call    #t_put5         ' write char to screen at cursor
#else
        call    #t_put_rqst     ' write char to screen at cursor
#endif
        jmp     #done_ok

t_string 
        call    #ensure_tx_not_full
        and     rqst,low23      ' source address is lower 23 bits of request
#ifdef CR_ON_LF
:t_strloop
        rdbyte  tmp5,rqst wz    ' get char to write
  if_z  jmp     #done_ok        ' finished if null byte
        cmp     tmp5,#$0a wz    ' translate ...
  if_nz jmp     #:t_str_1       ' ... lf ...
        mov     tmp5,#$0d       ' ... to ...
        call    #t_put5         ' ... cr ...
        mov     tmp5,#$0a       ' ... lf
:t_str_1
        call    #t_put5         ' write char to screen
        add     rqst,#1         ' increment string pointer
        jmp     #:t_strloop     ' put more chars
#else
        mov     t_adr,rqst
        call    #wait_tx_ready
        call    #str
        jmp     #done_ok
#endif

t_int
        call    #ensure_tx_not_full
        call    #t_getnum       ' get number to print
        cmps    rqst,#0 wcz     ' positive?
 if_ae  jmp     #t_uint         ' yes - no sign
        mov     tmp5,#$2d       ' no - prefix number with '-'
        call    #t_put5         ' write char to screen at cursor
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
        call    #t_put5         ' write char to screen at cursor
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
        call    #ensure_tx_not_full
        call    #t_getnum       ' get number to print
        jmp     #t_uint         ' no sign, just print digits

t_hex
        call    #ensure_tx_not_full
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
        call    #ensure_tx_not_full
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
' tty_setup
' On entry:
'       PTRA = pointer to our HMI block, which will initially contain
'              the registry address as the first long.
'
tty_setup
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
        wrlong  PTRA,##@param_block ' put addr of HMI block in parameter block
        mov     r1_cmdadr,PTRA  ' also, save it as our r1 command ptr
        wrlong  #0,PTRA         ' (clear r1_cmd so we can tell when ready)
        add     PTRA,#4         ' set up ...
        mov     r1_paradr,PTRA  ' ... all ..
        add     PTRA,#4         ' ... the ...
        mov     t1_cmdadr,PTRA  ' ... other ...
        add     PTRA,#4         ' ... port 1 ...
        mov     t1_paradr,PTRA  ' ... pointers ...
{
        add     PTRA,#4         ' set ...
        mov     r2_cmdadr,PTRA  ' ... up ...
        add     PTRA,#4         ' ... all ..
        mov     r2_paradr,PTRA  ' ... the ...
        add     PTRA,#4         ' ... port 2 ...
        mov     t2_cmdadr,PTRA  ' ... pointers ..
        add     PTRA,#4         ' ... as ...
        mov     t2_paradr,PTRA  ' ... well
}
        mov     tmp0, #%10000   ' start ...
        setq    ##@param_block  ' new cog ...
        coginit tmp0, ##@cogserial_init wc ' ... with cogserial
  if_c  jmp     #loop           ' not much we can do if there are no free cogs

wait_for_plugin
        rdlong  tmp1,r1_cmdadr wz
  if_z  jmp     #wait_for_plugin

        shl     tmp0,#2         ' calculate new cog's ...
        add     tmp0,regptr     ' ... request ...
        rdlong  tmp1,tmp0       ' ... block ...
        and     tmp1,low23      ' ... address (only use 23 bits)
        mov     tmp2,#LMM_HMI   ' register ...
        shl     tmp2,#24        ' ... it ...
        or      tmp1,tmp2       ' ... as another HMI cog ...
        wrlong  tmp1,tmp0       ' ... so it can be shut down later if required
        ret
'
'
't_getnum - set up for converting and printing numbers
'
t_getnum
        and     rqst,low23      ' source address is lower 23 bits of request
        rdlong  rqst,rqst wz    ' get the actual number in the rquest
t_getnum_ret                                
        ret

'
' t_put_rqst - write char pointed to by rqst ptr to transmit buffer 
'              (will wait till space is available)
' On entry
'    rqstptr : address of byte to write
'
' t_put5     - write character in t5 to transmit buffer
'              (will wait till space is available)
' On entry
'    tmp5      : char to write
'
t_put5 
        wrbyte  tmp5,rqstptr
t_put_rqst
        mov     t_adr, rqstptr
        call    #wait_tx_ready
        call    #tx    
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

'------------------------------------------------------------------------------
'
' wait_rx_ready - waits until rx port cmd = -1, signaling completion 
'                of last cmd or being ready for next cmd
'
wait_rx_ready                 ' set r_tim before calling
        cmps r_tim, #0 wcz    ' check if r_tim < 0
  if_b  jmp  #wait_rxforever
wait_rxloop
        sub  r_tim, #1 wcz
        rdlong r_tst, r1_cmdadr
        cmps r_tst, minus1 wcz
  if_z  mov  r_tim, minus10
  if_z  jmp  #wait_rxdone
        cmps r_tim, #0 wcz
  if_nc jmp  #wait_rxloop        
wait_rxdone
        cmps r_tim, minus10 wcz
  if_a  wrlong minus1, r1_cmdadr
  if_a  wrlong minus1, r1_paradr
        ret
wait_rxforever                  ' caution - waits forever!
        rdlong r_tst, r1_cmdadr
        cmps r_tst, minus1 wcz
  if_nz jmp #wait_rxforever
        ret                     ' result is in rx_par
'
' rx_async - receive a block from serial to memory of given size in bytes 
'            (does not wait for completion - you may need to check rx_cmd 
'            for -1 [done] or not later in your code)
'
rx_async                        ' set r_adr and r_cmd before calling
         call #wait_rx_ready
         wrlong r_adr,r1_paradr
         wrlong r_cmd,r1_cmdadr
         ret
'
' rx_read - receive a block from serial to memory of given size in
'           bytes (waits until done)
'
rx_read                        ' set r_adr and r_cmd before calling
         call #rx_async
         neg  r_tim, #1       ' -1 means
         call #wait_rx_ready
         ret
'
' rx - receive a byte (waits until done)
' returns - received byte
'
rx                              ' set r_adr before calling
         mov r_cmd, #1
         call #rx_read
         ret                    ' result is in rx_par

'
' transmit a string (waits until done)
'
str                             ' set t_adr before calling
         neg  t_cmd, #5         ' -5 means write till zero byte encountered
         call #tx_write
         ret                    ' result is in tx_par
'
' tx_str - transmit a string (does not wait for completion - you may need to
'          check tx1_cmd if done or not later in your code)
'
str_async
         neg  t_cmd, #5         ' -5 means write till zero byte encountered
         call #tx_async
         ret
'
' tx - sends a byte (waits until done)
'
tx                              ' set t_adr before calling
         mov  t_cmd, #1
         call #tx_write
         ret                    ' result is in tx_par
'
' tx_write - sends a block from memory to serial of given 
'            size in bytes (waits until done)
'
tx_write                        ' set t_adr and t_cmd before calling
         call #tx_async
         call #wait_tx_ready
         ret                    ' result is in tx_par
'
' tx_async - sends a byte (does not wait for completion - you may need to 
'            check tx1_cmd if done or not later in your code)
'
tx_async                        ' set t_adr and t_cmd before calling
         call #wait_tx_ready
         wrlong t_adr, t1_paradr ' address to write
         wrlong t_cmd, t1_cmdadr ' command (or size) - result is in tx_par
         ret

'
' wait_tx_ready - waits until tx port cmd = -1, signaling completion of 
'                 last cmd or being ready for next cmd
'
wait_tx_ready                   ' caution - waits forever!
         rdlong t_tst,t1_cmdadr
         cmps   t_tst, minus1 wcz
 if_nz   jmp    #wait_tx_ready
         ret                    ' result is in tx_par

'
' rx_check - check if byte received (never waits)
'            returns -1 if no byte, otherwise byte
'
rx_check
         neg    r_cmd, #2       ' -2 means
         call   #rx_read
         ret
'
' rx_size - returns size of receive buffer in bytes
'
rx_size 
         neg    r_cmd, #4       ' -4 means
         call   #rx_read
         ret
'
' rx_count - returns number of bytes waiting in receive buffer
'
rx_count 
         neg    r_cmd, #3       ' -3 means
         call   #rx_read
         ret
'
' tx_check - check if byte can be send (never waits)
' returns -  -1 if no space in buffer otherwise 
'            number of bytes waiting in send buffer
'
tx_check
         neg    t_cmd, #2       ' -2 means
         call   #tx_write
         ret

' internal registers

regptr   long 0         ' address of registry
rqstptr  long 0         ' address of request block
rsltptr  long 0         ' address to put results
rqst     long 0         ' request being processed
rslt     long 0         ' result to return
'
tmp0     long 0
tmp1     long 0
tmp2     long 0
tmp3     long 0
tmp4     long 0
tmp5     long 0
tmp6     long 0

' command variables

r_adr    long 0                 ' address of rx buffer
r_cmd    long 0                 ' size or command
r_tst    long 0                 ' used to test result
r_tim    long 0                 ' timeout for rx
t_adr    long 0                 ' address of tx buffer
t_cmd    long 0                 ' size or command
t_tst    long 0                 ' used to test result'

' command interface pointers

' port 1

r1_cmdadr long 0                ' size or command
r1_paradr long 0                ' parameter
t1_cmdadr long 0                ' size or command
t1_paradr long 0                ' parameter

' port 2 (not currently used)
{
r2_cmdadr long 0                ' size or command
r2_paradr long 0                ' parameter
t2_cmdadr long 0                ' size or command
t2_paradr long 0                ' parameter
}

' internal constants

minus1   long -1
minus10  long -10
'
' initialized data
'
low23    long $007FFFFF
maxdec   long 1000000000        ' maximum decimal divisor for 32 bit values
'
'
#ifdef DEBUG_LED
         fit    $1eb                  
         orgf   $1eb
         long   |< (_DEBUG_PIN-32)    
         long   $10203040
         long   $0
         long   $0
         long   $0
#endif

         fit   $1f0

         orgh

{

' structure of mailbox for interaction with cogserial - this mailbox 
' must actually be allocated in hub RAM and its address put into the 
' parameter block (above) during initialization

r1_cmd   long 0
r1_par   long 0
t1_cmd   long 0
t1_par   long 0
r2_cmd   long 0
r2_par   long 0
t2_cmd   long 0
t2_par   long 0

}

' configuration parameters for cogserial (used only for initialization)

param_block
         long 0                 ' initialize with address of 8 long mailbox
         long rxpin                                
         long bitrate        
         long rxmode                                
         long rxlutstart                                
         long rxlutsize                                
         long txpin                                
         long bitrate        
         long txmode                                
         long txlutstart                                
         long txlutsize                                
         long -1
         long -1
         long -1
         long -1
         long -1
         long -1
         long -1
         long -1
         long -1
         long -1
         long 100

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

#include "cogs2.t"

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
