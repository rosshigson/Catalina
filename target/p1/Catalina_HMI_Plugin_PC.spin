{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - PC
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - screen
'
' This plugin uses serial drivers intended to allow a PC keyboard
' and screen to be used instead of local devices - the PC must be
' running PropTerminal.exe (or similar). Note that although all
' the normal Catalina HMI functions are supported, they would only
' work if equivalent functions were implmented in the terminal
' emulator running on the PC - and this is emulator specific. While
' a special version of this plugin could be created for a specific
' terminal emulation package, this simple version often just does
' nothing. 
'
' Version 1.0 - initial version by Ross Higson
' Version 1.1 - added proxy support
' Version 3.0 - Make minimally ANSI compliant (unless NON_ANSI_HMI defined)
'               CR to CR LF translation on output can be enabled by CR_ON_LF
'               CR to LF translation in input can be disabled by NO_CR_TO_LF
' Version 3.1 - Include NO_KEYBOARD and NO_MOUSE support in a single driver.
' Version 3.5 - Incorporate Ray's modifiable keyboard buffer size.
'
'-------------------------------------------------------------------------------
' The TV screen data block has the following structure, even though
' most of it is not used by this PC version of a HMI plugin. However
' the ScrnBuff is used as the 512 byte buffer required by the PC TV
' driver, so the rows * cols must be at least 256 words. 
'
'   ScrnCols  : 1 long specifying cols
'   ScrnRows  : 1 long specifying rows
'   ScrnColor : 1 long specifying current color 
'   ScrnBuff    : rows*cols words for the screen data
'   ScrnPalette : 8 * 2 longs for the palette 
'   ScrnCurs  : 6 bytes of cursor data:
'               col,row,mode of cursor 0
'               col,row,mode of cursor 1
'               where mode:
'                  %0xxx = cursor scrolls at end of screen
'                  %1xxx = cursor wraps at end of screen
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
' If defined (either here or on the command line) NON_ANSI_HMI makes control
' character handling non-ANSI compliant (.e. the previous Catalina behaviour 
' is used)
'
#ifndef NON_ANSI_HMI
'#define NON_ANSI_HMI
#endif

CON
'
' screen geometry parameters:
'
cols    = screen#cols
rows    = screen#rows
chrs    = cols * rows
'
' size and offsets into screen data block
'
sc_count = 3 + chrs/2 + 8*2 + 2 

nx       = 0                    ' long offset
ny       = 1                    ' long offset
color    = 2                    ' long offset
buffer   = 3                    ' long offset
colors   = buffer + chrs/2      ' long offset
cx0      = 4*(colors + 8*2)     ' byte offset
cy0      = cx0 + 1              ' byte offset
cm0      = cy0 + 1              ' byte offset 
cx1      = cm0 + 1              ' byte offset
cy1      = cx1 + 1              ' byte offset
cm1      = cy1 + 1              ' byte offset 
'
' calculate total size (in longs) of HMI data block
'
#ifndef NO_KEYBOARD
DATA_LONGS = kbd#kb_count + screen#tv_count +  sc_count
#else
DATA_LONGS = screen#tv_count +  sc_count
#endif
'
OBJ

  common : "Catalina_Common" 

  count   : "Catalina_CogCount"

#ifndef NO_KEYBOARD
#ifdef PROXY_KEYBOARD
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  kbd : "Catalina_Proxy_Client"
#else
  kbd : "Catalina_PC_Keyboard"
#endif
#endif

#ifdef PROXY_SCREEN
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  screen  : "Catalina_Proxy_Client"
#else
  screen : "Catalina_PC_Text"
#endif  

#ifdef PROXY_HMI
  client : "Catalina_Proxy_Client"
#endif  
'
' This function is called by the target to start the plugin
'
PUB Start (HMI_BLOCK, io_block, proxy_lock, server_cpu) : cog | prqst, pkbd, pmouse, pscreen, ptv, px_pkbd, px_pmouse, px_pscreen, px_ptv, px_ioblk, px_lock, px_cpu, freecogs

#ifndef NO_HMI

  ' allocate the data block to the individual drivers
  pkbd    := HMI_BLOCK
  pmouse  := 0
#ifndef NO_KEYBOARD
  pscreen := pkbd    + 4 * kbd#kb_count
#else
  pscreen := pkbd
#endif
  ptv     := pscreen + 4 * sc_count 

#ifdef PROXY_HMI
  px_pkbd    := pkbd
  px_pmouse  := pmouse
  px_pscreen := pscreen
  px_ptv     := ptv
#endif

  ' set up screen data
  long[pscreen][nx] := cols
  long[pscreen][ny] := rows

#ifdef NO_KEYBOARD
  ' tell proxy driver not to emulate keyboard
  px_pkbd := 0
#else
#ifdef PROXY_KEYBOARD
  ' use proxy as keyboard
  client.setup_kbd(px_pkbd)
#else
  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits
  ' start underlying keyboard driver
  kbd.start(pkbd, common#SI_PIN, common#SIO_BAUD)
  ' register any cogs which were free but are now used as keyboard cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_KBD)
  ' tell proxy driver not to emulate keyboard
  px_pkbd := 0
#endif
#endif

#ifdef PROXY_SCREEN  
  ' use proxy as screen driver
  client.setup_screen(px_ptv, @long[pscreen][buffer])
#else
  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits
  ' start underlying screen driver
  screen.start(ptv, common#SO_PIN, common#SIO_BAUD, @long[pscreen][buffer])
  ' register any cogs which were free but are now used as screen cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_SCR)
  ' tell proxy driver not to emulate screen 
  px_pscreen := 0
#endif

#ifdef PROXY_HMI
  ' tell proxy driver not to emulate mouse
  px_pmouse := 0 
  ' start the proxy client driver plugin
  px_ioblk := io_block
  px_lock  := proxy_lock
  px_cpu   := server_cpu
  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits
  client.start(@px_pkbd)
  ' register any cogs which were free but are now used as proxy cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_PRX)
#endif  

  ' start the HMI plugin
  cog := cognew(@HmiStart, Common#REGISTRY)

  if (cog => 0)
    ' plugin started ok - send it configuration data
    common.SendInitializationDataAndWait(cog, @pkbd, 0)
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
        byte    k_state         ' 7 
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
        byte    t_geometry      '21
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
        rdlong  ppkbd,rqst      ' save pointer to keyboard parameters
        add     rqst,#4         ' save pointer to ...
        rdlong  ppmouse,rqst    ' ... mouse params
        add     rqst,#4         ' save pointer to ...
        rdlong  ppscrn,rqst     ' ... screen parameters
        add     rqst,#4         ' save pointer to ...
        rdlong  pptv,rqst       ' ... tv parameters
        mov     t0,ppscrn       ' get ...
        rdlong  t1,t0           ' ... screen ...
        mov     scrcols,t1      ' ... cols
        add     t0,#4           ' get ...
        rdlong  t2,t0           ' ... screen ...
        mov     scrrows,t2      ' ... rows
        call    #m32            ' multiply rows by cols
        mov     scrsize,t0      ' save as acreen size
        mov     scrclrs,ppscrn  ' calculate ...
        add     scrclrs,#8      ' ... screen color address
        mov     scrbuff,ppscrn  ' calculate ...
        add     scrbuff,#12     ' ... screen buffer address
        mov     scrpall,scrbuff ' calculate ...
        add     scrpall,scrsize ' ... palette ...
        add     scrpall,scrsize ' ... address
        mov     scrcurs,scrpall ' calculate ...
        add     scrcurs,#64     ' ... screen cursors address
#ifdef NO_KEYBOARD
        jmp     #done_ok        ' no keybaord to initialize
#else
        jmp     #k_clear        ' initialize keyboard
#endif

#ifdef NO_KEYBOARD

k_present
k_state
k_get
k_consume
k_new   
k_wait
k_ready
k_clear
        mov     rslt,#0         ' not present, or no key
        jmp     #done           ' 

#else

k_present
        mov     rslt,#1         ' presume ...
        jmp     #done           ' ... always present

k_state
        jmp     #done_ok        ' ignore        

k_get
        call    #k_load         ' load key pointed to by par_tail
   if_z jmp     #done_ok        ' Z set if no key available
k_consume
        add     t1,#1           ' increment ...
'       and     t1,#$f          ' ...
        and     t1,#kbd#kb_rxtailmask     'RR20120403 mask bits to wrap tail
        mov     t0,ppkbd        ' ...
        add     t0,#4           ' ...
        wrlong  t1,t0           ' ... par_tail
        jmp     #done

k_new   call    #k_setup        ' setup common values
        mov     t0,ppkbd        ' set par_tail ...
        add     t0,#4           ' ... to ...
        wrlong  t2,t0           ' ... par_head
                                ' fall through to k_wait

k_wait
        call    #k_load         ' load key pointed to by par_tail
 if_z   jmp     #k_wait         ' Z set if no key available
        jmp     #k_consume      ' consume and return the key


k_ready
        call    #k_setup        ' setup common values
  if_z  jmp     #done           ' rslt == 0 if no key ready
        neg     rslt,#1         ' rslt == -1 if a key is ready
        jmp     #done

k_clear
        call    #k_setup        ' setup common values
        mov     t0,ppkbd        ' set par_tail ...
        wrlong  t2,t0           ' .... to par_head
        jmp     #done

#endif

'------------------------------------------------------------------
'
t_geometry
        mov     rslt,scrcols    ' result is ...
        shl     rslt,#8         ' ... cols*256 ...
        add     rslt,scrrows    ' ... plus rows
        jmp     #done
                   
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
'    t0 = @par_head
'    t1 = par_tail
'    t2 = par_head
'    rslt = par_tail - par_head
'    Z flag set if par_tail == par_head
'
k_setup
        mov     t0,ppkbd        ' get ...
        rdlong  t2,t0           ' ... par_head
        add     t0,#4           ' get ...
        rdlong  t1,t0           ' ... par_tail
        mov     rslt,t1         ' set Z flag ...
        sub     rslt,t2 wz      ' ... and rslt = 0 if par_tail == par_head
k_setup_ret
        ret
'
' k_load - Set up common values and read key indicated by par_tail.
'
' On exit:
'    t1 = par_tail
'    t2 = par_head
'    rslt = key indicated by par_tail
'    Z flag set if par_tail == par_head
'
'
k_load
        call    #k_setup        ' setup common values
 if_z   jmp     #k_load_ret     ' Z flag set if no key available
        add     t0,#16          ' get ...
        rdlong  t0,t0           ' ... bufaddr
        mov     rslt,t0         ' load key ...
        add     rslt,t1         ' ... indicated ...
        rdbyte  rslt,rslt       ' ... by par_tail
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
'    t0 = @tx_head
'    t1 = tx_tail
'    t2 = tx_head
'    t3 = (tx_head + 1) & $1ff
'    Z flag set if tx_tail == (tx_head + 1) & $1FF
'
t_setup
        mov     t0,pptv         ' get ...
        rdlong  t2,t0           ' ... tx_head
        add     t0,#4           ' get ...
        rdlong  t1,t0           ' ... tx_tail
        mov     t3,t2           ' set Z flag ...
        add     t3,#1           ' ... if ...
        and     t3,#$1ff        ' ... tx_tail 
        cmp     t1,t3 wz        ' ... == (tx_head + 1) & $1ff
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
 if_z   jmp     #t_put5         ' repeat until (tx_tail <> (tx_head + 1) & $1FF)
        add     t0,#12          ' txbuffer...
        rdlong  t0,t0           ' ...
        add     t0,t2           ' ... [tx_head] ...
        wrbyte  t5,t0           ' ... := t5
        mov     t0,pptv         ' tx_head ...
        wrlong  t3,t0           ' ... := (tx_head + 1) & $1FF
t_put5_ret
        ret

'
'm32 - 32 bit multiplication (CODESAVING version!)
' On entry:
'    t1 = operand 1
'    t2 = operand 2
' On exit:
'    t0 = result
'
m32
        mov t0,#0
        tjz t2,#m32_ret
:m32_loop
        add t0,t1
        djnz t2,#:m32_loop
m32_ret
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
curs_1  long     $00800000
low23   long     $007FFFFF
maxdec  long     1000000000     ' maximum decimal divisor for 32 bit values
ctrl    long     $00000200      ' mask to detect control keys
noctrl  long     $fffffd00      ' mask to correct control keys
space   long     $00000220      ' space used when filling
'
lastcur long     $0
kstat   long     $0
hex200  long     $200
c_snail long     $332           ' control snail should return NUL 
'
'------------------------------------------------------------------
' uninitialized data
'
rqstptr res      1      ' address of my request block
rsltptr res      1      ' address to put results
rqst    res      1      ' request being processed
rslt    res      1      ' result to return
t7      res      1
t8      res      1
d1      res      1      ' used when dividing
d2      res      1      ' used when dividing
ppkbd   res      1
ppmouse res      1
ppscrn  res      1
pptv    res      1
scrcols res      1      ' screen cols
scrrows res      1      ' screen rows
scrsize res      1      ' screen size
scrbuff res      1      ' pointer to screen buffer
scrclrs res      1      ' current color data
scrpall res      1      ' pointer to screen palette
scrcurs res      1      ' pointer to screen cursors
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

