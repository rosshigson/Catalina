{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - PropTerminal
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - screen
'   - mouse
'
' This plugin uses serial drivers intended to allow a PropTerminal
' running on a PC to be used instead of local devices - the PC must
' running PropTerminal.exe.
'
' NOTE THE FOLLOWING WHEN USING THIS PLUGIN:
'
'  1.  You must clear the keyboard - i.e. call k_clear() at the start
'      of your program to avoid getting a spurious first character.
'
'  2.  There appears to be something slightly amiss with the way
'      Propterm scales the mouse (at least on my machine - YMMV).
'      I have to set the mouse scaling to xscale=8,yscale=17 for my
'      mouse to work correctly - i.e. I call m_bound_scales(8, 17, 0).
'      The symptoms of incorrect scaling are apparent when using the
'      program 'test_propterm.c' - pressing the left mouse button and
'      then typing a character should make the character appear where
'      the mouse is pointing - if the character appears elsewhere the
'      scaling is probably not set correctly.
'
'  3.  Propterminal does not implement button 2 (the middle button
'      or scroll wheel) - only buttons 0 and 1 will work correctly.
'
'  4.  When using the mouse, you are limited to screen sizes no larger
'      than 64 cols by 32 rows - this limitation is due to the way
'      propterminal sends mouse events. If you don't need a mouse, you
'      can use larger screen sizes. To set a new screen size, you must
'      modify the file Catalina_PC_Text.spin, and also edit the file
'      propterm.ini and then load this file into propterm.
'
'  5.  Propterm only supports one cursor position. You should use either
'      cursor 0 or cursor 1 - but not both. If you want to write to the
'      screen at a different cursor position, save the current cursor
'      position first, then set the new cursor position, then write, 
'      then restore the original cursor position.

' Version 1.0 - initial version by Ross Higson
' Version 1.1 - fixed a bug in k_wait
' Version 1.2 - added proxy support
' Version 3.0 - Make minimally ANSI compliant (unless NON_ANSI_HMI defined)
'               CR to CR LF translation on output can be enabled by CR_ON_LF
'               CR to LF translation in input can be disabled by NO_CR_TO_LF
' Version 3.1 - Include NO_KEYBOARD and NO_MOUSE support in a single driver.
'
'-------------------------------------------------------------------------------
' The TV screen data block has the following structure, even though
' most of it is not used by this PC version of a HMI plugin. However
' the ScrnBuff is used as the 512 byte buffer required by the PC TV
' driver. 
'
'   ScrnCols  : 1 long specifying cols
'   ScrnRows  : 1 long specifying rows
'   ScrnColor : 1 long specifying current color 
'   ScrnBuff    : 256 words (512 bytes) for the buffer
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
' Mouse services:
'
'name: m_present
'code: 11
'type: short request
'data: (none)
'rslt: 0 = not present, > 0 = present

'name: m_button
'code: 12
'type: short request
'data: button = 0, 1, 2, 3, 4
'rslt: 0 = not pressed, > 0 = pressed

'name: m_buttons
'code: 13
'type: short request
'data: (none)
'rslt: 0 = not pressed, > 0 = pressed

'name: m_abs_x
'code: 14
'type: short request
'data: (none)
'rslt: absolute x value

'name: m_abs_y
'code: 15
'type: short request
'data: (none)
'rslt: absolute y value

'name: m_abs_z
'code: 16
'type: short request
'data: (none)
'rslt: absolute z value

'name: m_delta_x
'code: 17
'type: short request
'data: (none)
'rslt: absolute x value

'name: m_delta_y
'code: 18
'type: short request
'data: (none)
'rslt: absolute y value

'name: m_delta_z
'code: 19
'type: short request
'data: (none)
'rslt: absolute z value

'name: m_reset
'code: 20
'type: short request
'data: (none)
'rslt: 0

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
'rslt: col<<8 + row

'name: t_mode
'code: 30
'type: short request
'data: curs<<23 + mode
'rslt: 0 (i.e. ignored for PropTerminal)

'name: t_scroll
'code: 31
'type: short request
'data: count<<16 + firstrow<<8 + lastrow
'rslt: 0 (i.e. ignored for PropTerminal)

'name: t_color
'code: 32
'type: short request
'data: curs<<23 + color
'rslt: 0 = ok
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
' The PropTerminal TV driver requires a short delay
'
STARTDELAY = 1
'
' screen geometry parameters:
'
cols    = screen#cols
rows    = screen#rows
'
' size and offsets into screen data block
'
sc_count = 3 + screen#BUFFSIZE/4 + 8*2 + 2

nx       = 0                    ' long offset
ny       = 1                    ' long offset
color    = 2                    ' long offset
buffer   = 3                    ' long offset
colors   = buffer + screen#BUFFSIZE/4 ' long offset
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
#ifndef NO_MOUSE
DATA_LONGS = kbd#kb_count + mouse#m_count + screen#tv_count +  sc_count
#else
DATA_LONGS = kbd#kb_count + screen#tv_count +  sc_count
#endif
#else
#ifndef NO_MOUSE
DATA_LONGS = mouse#m_count + screen#tv_count +  sc_count
#else
DATA_LONGS = screen#tv_count +  sc_count
#endif
#endif
'
OBJ

  common : "Catalina_Common" 

  count  : "Catalina_CogCount"

#ifndef NO_KEYBOARD
#ifdef PROXY_KEYBOARD
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  kbd    : "Catalina_Proxy_Client"
#else
  kbd    : "Catalina_PC_Keyboard"
#endif
#endif

#ifndef NO_MOUSE
#ifdef PROXY_MOUSE
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  mouse  : "Catalina_Proxy_Client"
#else
  mouse  : "Catalina_PC_Mouse"
#endif
#endif

#ifdef PROXY_SCREEN
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  screen : "Catalina_Proxy_Client"
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
#ifndef NO_KEYBOARD  
  pmouse  := pkbd    + 4 * kbd#kb_count
#else
  pmouse  := pkbd
#endif
#ifndef NO_MOUSE
  pscreen := pmouse  + 4 * mouse#m_count
#else
  pscreen := pmouse
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

#ifdef NO_MOUSE
  ' tell proxy driver not to emulate mouse 
  px_pmouse := 0
#else
#ifdef PROXY_MOUSE
  ' use proxy as mouse driver
  client.setup_mouse(px_pmouse)
#else    
  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits
  ' start underlying mouse driver
  mouse.start(pmouse, common#SI_PIN, common#SIO_BAUD)
  ' register any cogs which were free but are now used as mouse cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_MOU)
  ' tell proxy driver not to emulate mouse 
  px_pmouse := 0
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
        
  waitcnt(Common#CLOCKFREQ * STARTDELAY + cnt)

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
        byte    m_present       '11
        byte    m_button        '12
        byte    m_buttons       '13
        byte    m_abs_x         '14
        byte    m_abs_y         '15
        byte    m_abs_z         '16
        byte    m_delta_x       '17
        byte    m_delta_y       '18
        byte    m_delta_z       '19
        byte    m_reset         '20
        byte    t_geometry      '21
        byte    t_char          '22
        byte    t_string        '23
        byte    t_int           '24
        byte    t_unsigned      '25
        byte    t_hex           '26
        byte    t_bin           '27
        byte    t_setpos        '28
        byte    t_getpos        '29
        byte    done_ok         '30 t_mode ignored
        byte    done_ok         '31 t_scroll ignored
        byte    t_color         '32

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
        add     scrpall,#$100    ' ... palette ...
        add     scrpall,#$100    ' ... address
        mov     scrcurs,scrpall ' calculate ...
        add     scrcurs,#64     ' ... screen cursors address
#ifdef NO_KEYBOARD
        jmp     #done_ok        ' no keybaord to initialize
#else
        jmp     #k_clear        ' initialize keyboard
#endif

k_present
        mov     rslt,#1         ' presume ...
        jmp     #done           ' ... always present

k_state
        jmp     #done_ok        ' ignore        

k_get
        call    #k_load         ' load key pointed to by par_tail
   if_z jmp     #done_ok        ' Z set if no key available
        call    #k_consume      ' consume key if available
        jmp     #done

k_new   call    #k_setup        ' setup common values
        mov     t0,ppkbd        ' set par_tail ...
        add     t0,#4           ' ... to ...
        wrlong  t2,t0           ' ... par_head
                                ' fall through to k_wait

k_wait
        call    #k_load         ' load key pointed to by par_tail
 if_z   jmp     #k_wait         ' Z set if no key available
        call    #k_consume      ' consume key if available
        jmp     #done


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

negrslt
        neg     rslt,rslt       ' and return -rslt
        jmp     #done

'------------------------------------------------------------------

m_present
        mov     t0,ppmouse      ' read ...
        add     t0,#13*4         ' ... par_present ...
        jmp     #m_rett0        ' ... and return it

m_button
        mov     t0,ppmouse      ' read ...
        add     t0,#12*4        ' ... par_buttons ...
        rdlong  rslt,t0         ' .. to get state of buttons
        mov     t1,rqst         ' get ...
        and     t1,#$ff         ' ... button from request
        shr     rslt,t1         ' return ...
        and     rslt,#1         ' ....
        jmp     #negrslt        ' ... -button

m_buttons
        mov     t0,ppmouse      ' read ...
        add     t0,#12*4        ' ... par_buttons ...
        jmp     #m_rett0        ' ... and return it

m_abs_x
        mov     t0,ppmouse      ' read ...
        add     t0,#9*4        ' ... par_x ...
        jmp     #m_rett0        ' ... and return it

m_abs_y
        mov     t0,ppmouse      ' read ...
        add     t0,#10*4        ' ... par_y ...
        jmp     #m_rett0        ' ... and return it

m_abs_z
        mov     t0,ppmouse      ' read ...
        add     t0,#11*4         ' ... par_z ...
m_rett0
        rdlong  rslt,t0         ' ... and return it
        jmp     #done

m_delta_x
        mov     t0,ppmouse      ' point to old x value
        add     t0,#6*4
m_delta
        mov     t1,t0           ' point to ...
        add     t1,#3*4        ' ... new val
        rdlong  t3,t1           ' read new
        rdlong  t2,t0           ' read old
        mov     rslt,t3         ' calculate ...
        sub     rslt,t2         ' ... dx = new - old
        wrlong  t3,t0           ' update old = new
        jmp     #done           ' return dx

m_delta_y
        mov     t0,ppmouse      ' point to old ...
        add     t0,#7*4         ' ... y value
        jmp     #m_delta        ' return delta

m_delta_z
        mov     t0,ppmouse      ' point to old ...
        add     t0,#8*4        ' ... z value
        jmp     #m_delta        ' return delta

m_reset
        mov     t0,ppmouse      ' point to oldx
        add     t0,#6*4
        mov     t1,ppmouse      ' point to ...
        add     t1,#9*4        ' ... par_x
        mov     t3,#3           ' 3 longs to copy
:m_resloop
        rdlong  t2,t1           ' copy ...
        wrlong  t2,t0           ' ... longs ...
        add     t0,#4           ' ... from ...
        add     t1,#4           ' ... t1 ...
        djnz    t3,:m_resloop   ' ... to t0
        jmp     #done_ok        ' done

'------------------------------------------------------------------
'
t_geometry
        mov     rslt,scrcols    ' result is ...
        shl     rslt,#8         ' ... cols*256 ...
        add     rslt,scrrows    ' ... plus rows
        jmp     #done
                   
t_char
        call    #t_setcurs      ' set up cursor address
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
        call    #t_setcurs      ' set up cursor address
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
        mov     t9,maxdec       ' get largest possible decimal divisor
:t_int2
        cmp     rqst,t9 WC,WZ   ' is our number larger than that?
 if_ae  jmp     #:t_int3        ' yes - start extracting decimal digits
        mov     t0,t9           ' no - divide divisor ...
        mov     t1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     t9,t0           ' ... try ...
        jmp     #:t_int2        ' ... again
:t_int3
        cmp     t9,#10 WC,WZ    ' is this the last digit?
 if_b   jmp     #:t_int4        ' yes - no need to divide any more
        mov     t0,rqst         ' no - divide number ...
        mov     t1,t9           ' ... by  ...
        call    #d32u           ' ... divisor
        mov     t5,t0           ' convert quotient ...
        add     t5,#$30         ' ... to digit char
        mov     rqst,t1         ' save remainder for next time
        call    #t_put5         ' write char to screen at cursor
        mov     t0,t9           ' divide divisor ...
        mov     t1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     t9,t0           ' ... continue ...
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
t_hexx
        mov     t9,#8           ' print 8 digits
:t_hex1
        rol     rqst,#4         ' convert 4 bits ...
        mov     t5,rqst         ' ... to '0' .. '9'
        and     t5,#$f          ' ... or ...
        cmp     t5,#10 wc,wz    ' ... 'A' .. 'F' ...
 if_ae  add     t5,#($41-$30-10)' ... depending ...
        add     t5,#$30         ' ... on the digit value
        call    #t_put5         ' write char to screen
        djnz    t9,#:t_hex1     ' continue with next digit
        jmp     #done_ok

t_bin
        call    #t_getnum       ' get number to print
        mov     t9,#32          ' print 32 digits
:t_bin1
        rol     rqst,#1         ' convert bit ...
        mov     t5,rqst         ' ... to '0' ...
        and     t5,#1           ' ... or ...
        add     t5,#$30         ' ... '1'
        call    #t_put5         ' write char to screen
        djnz    t9,#:t_bin1     ' continue with next digit
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

t_setpos
        mov     t1,rqst         ' extract ...
        shr     t1,#8           ' ... cols ...
        and     t1,#$ff         ' ... from request
        cmp     t1,scrcols wz,wc ' ensure ...
  if_ae mov     t1,scrcols      ' ... cols within bounds ...
  if_ae sub     t1,#1           ' ... or use screen cols - 1
        mov     t2,rqst         ' extract ...
        and     t2,#$ff         ' ... rows from request
        cmp     t2,scrrows wz,wc ' ensure ...
  if_ae mov     t2,scrrows      ' ... rows within bounds ...
  if_ae sub     t2,#1           ' ... or use screen rows - 1
        call    #t_setcurs      ' set up cursor address
        wrbyte  t1,t3           ' save cols
        add     t3,#1           ' save ...
        wrbyte  t2,t3           ' ... rows
        sub     t3,#1
        call    #t_movecurs
        jmp     #done_ok

t_getpos
        call    #t_setcurs      ' set up cursor address
        rdbyte  rslt,t3         ' get cursor cols
        add     t3,#1           ' get ...
        rdbyte  t1,t3           ' ... cursor rows
        shl     rslt,#8         ' return ...
        add     rslt,t1         ' 256*cols + rows
        jmp     #done

t_color
        mov     t7,rqst         ' set ...
        and     t7,#$FF         ' ... color as $00 .. $FF
        mov     t5,#$0c
        call    #t_put
        mov     t5,t7
        call    #t_put
        jmp     #done_ok
            
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
   if_z jmp     #k_setup_ret    ' just return with Z set if no key available
'
' now we must check for keys that should not be returned (caps lock, shift/cntrl on/off)
'
        mov     t4,t0           ' get ...
        add     t4,#16          ' ... the ...
        rdlong  t4,t4           ' ... key ...
        add     t4,t1           ' ... indicated ...
        rdbyte  t4,t4           ' ... by par_tail
        cmp     t4,#$DE wz      ' is it caps lock?
 if_z   jmp     #k_setup_eat    ' yes - just consume it
        cmp     t4,#1 wz        ' is it shift on?
 if_z   or      kstat,#$100     ' yes - set kstat ...
 if_z   jmp     #k_setup_eat    ' ... and consume the key
        cmp     t4,#2 wz        ' is it ctrl on?
 if_z   or      kstat,hex200    ' yes - set kstat ...
 if_z   jmp     #k_setup_eat    ' ... and consume the key
        cmp     t4,#3 wz        ' is it shift off?
 if_z   andn    kstat,#$100     ' yes - reset kstat ...
 if_z   jmp     #k_setup_eat    ' ... and consume the key
        cmp     t4,#4 wz        ' is it ctrl off?
 if_nz  jmp     #k_setup_ret    ' ... no - return the key with Z not set
        andn    kstat,hex200    ' yes - reset kstat ...
k_setup_eat
        call    #k_consume      ' consume the key ...
        jmp     #k_setup        ' ... and try again     
k_setup_ret
        ret
'
' k_load - Set up common values and read key indicated by par_tail.
'
' On exit:
'    t1 = par_tail
'    t2 = par_head
'    rslt = key indicated by par_tail
'    Z flag set if par_tail == par_head (or no key)
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
        cmp     rslt,#$db wz    ' F12?
 if_z   mov     rslt,#$d9       ' yes - map F12->F10
        test    kstat,hex200 wz ' control flag set?
 if_z   jmp     #k_load_set     ' no - just set kstat
        cmp     rslt,#$40 wc,wz ' yes - char >= 'A'?
 if_b   jmp     #k_load_set     ' no
        cmp     rslt,#$7F wc,wz ' yes - char < DEL
 if_ae  jmp     #k_load_set     ' no - just set kstat
        and     rslt,#$1f       ' yes - make it a control char
k_load_set
        cmp     rslt,#$c8 wz    ' correct propterm's incorrect handling ...
 if_z   mov     rslt,#$08       ' ... of backspace 
        cmp     rslt,#$cb wz    ' correct propterm's incorrect handling ...
 if_z   mov     rslt,#$1b       ' ... of escape 

        or      rslt,kstat      ' set ctrl and shift bits
        cmp     rslt,c_snail wz ' correct propterm's incorrect handling ...
 if_z   mov     rslt,kstat      ' ... of control+snail (NUL)
                 
k_load_nz
        mov     t0,#1 wz        ' ensure Z flag not set!
k_load_ret
        ret
'
' k_consume - increment par_tail to remove key from buffer
' On entry:
'    t1 =  par_tail
'
k_consume
        add     t1,#1           ' increment ...
'        and     t1,#$f          ' ...
        and     t1,#kbd#kb_rxtailmask ' RR20120403 mask bits to wrap tail
        mov     t0,ppkbd        ' ...
        add     t0,#4           ' ...
        wrlong  t1,t0           ' ... par_tail
k_consume_ret
        ret
'        
' t_setup - Set up commonly used values for text services.
' On exit:
'    t0 = @tx_head
'    t1 = tx_tail
'    t2 = tx_head
'    t4 = (tx_head + 1) & $1ff
'    Z flag set if tx_tail == (tx_head + 1) & $1FF
'
t_setup
        mov     t0,pptv         ' get ...
        rdlong  t2,t0           ' ... tx_head
        add     t0,#4           ' get ...
        rdlong  t1,t0           ' ... tx_tail
        mov     t4,t2           ' set Z flag ...
        add     t4,#1           ' ... if ...
        and     t4,#$1ff        ' ... tx_tail 
        cmp     t1,t4 wz        ' ... == (tx_head + 1) & $1ff
t_setup_ret
        ret
'
't_setcurs - set up for requests that can address either cursor
' On exit:
'   t3 : cursor address
'
t_setcurs
        mov     t3,scrcurs      ' get address of cursor 0 data
        test    rqst,curs_1 wz  ' request intended for cursor 0 ?
  if_nz add     t3,#3           ' no - add offset for cursor 1 data
t_setcurs_ret
        ret
'
't_getnum - set up for converting and printing numbers
'
t_getnum
        call    #t_setcurs      ' set up cursor address
        and     rqst,low23      ' source address is lower 23 bits of request
        rdlong  rqst,rqst wz    ' get the actual number in the rquest
t_getnum_ret                                
        ret
'
' t_put - write char in t5 to transmit buffer (will wait till space is available)
' On entry
'    t5 : char to write
' On exit
'    t0,t1,t2,t4 : lost
t_put
        call    #t_setup        ' setup common values
 if_z   jmp     #t_put          ' repeat until (tx_tail <> (tx_head + 1) & $1FF)
        add     t0,#12          ' txbuffer...
        rdlong  t0,t0           ' ...
        add     t0,t2           ' ... [tx_head] ...
        wrbyte  t5,t0           ' ... := t5
        mov     t0,pptv         ' tx_head ...
        wrlong  t4,t0           ' ... := (tx_head + 1) & $1FF
t_put_ret
        ret

'
' t_inccur - increment cursor
' On entry:
'    t3 = address of cursor data
' On exit:
'    t3 = still address of cursor data
'    cursor incremented
'
t_inccur
        rdbyte  t1,t3           ' get cursor col
        add     t3,#1           ' get ...
        rdbyte  t2,t3           ' ... cursor ...
        sub     t3,#1           ' row
        add     t1,#1           ' increment col
        cmp     t1,scrcols wc   ' past last col?
   if_b jmp     #:t_inccol      ' no - just update col
        add     t2,#1           ' yes - increment row
        cmp     t2,scrrows wc,wz ' past last row?
 if_ae  jmp     #:t_setcol0     ' yes - set cursor col to zero
        add     t3,#1           ' no - increment row
        wrbyte  t2,t3           ' update row
        sub     t3,#1
:t_setcol0
        mov     t1,#0           ' reset cursor col to zero
:t_inccol
        wrbyte  t1,t3           ' update cursor col
t_inccur_ret
        ret

'
' t_deccur - decrement cursor
' On entry:
'    t3 = address of cursor data
' On exit:
'    t3 = still address of cursor data
'    cursor decremented
'
#ifndef NON_ANSI_HMI
' for ANSI compatibility we only need to support BS in the current line
t_deccur
        rdbyte  t1,t3 wz        ' get cursor col
  if_nz sub     t1,#1           ' decrement col
  if_nz wrbyte  t1,t3           ' update cursor col
t_deccur_ret
        ret
#else
t_deccur
        rdbyte  t1,t3           ' get cursor col
        sub     t1,#1 wc        ' decrement col
  if_ae jmp     #:t_deccol      ' if zero or above just update col
        mov     t1,scrcols      ' otherwise wrap ...
        sub     t1,#1           ' ... to last col
        wrbyte  t1,t3           ' update col 
        add     t3,#1           ' get ...
        rdbyte  t2,t3           ' ... cursor ...
        sub     t3,#1           ' row
        sub     t2,#1 wc        ' decrement row
  if_ae jmp     #:t_setrow      ' if zero or above just update row
        mov     t2,#0           ' otherwise stay on row 0
:t_setrow
        add     t3,#1
        wrbyte  t2,t3           ' update cursor row
        sub     t3,#1
        jmp     #t_deccur_ret        
:t_deccol
        wrbyte  t1,t3           ' update cursor col
t_deccur_ret
        ret
#endif

#ifdef PROXY_SCREEN

'
' TODO : decode more control chars here?
'
' t_put5 - write char in t5 to screen, updating cursor location as appropriate
' On entry
'    t3 : address of cursor to use
'    t5 : char to write
' On exit
'    t0,t1,t2,t5,t6,t7,t8 : lost
'    t3,t4 : unchanged
'
' Note that the following characters must be specially processed, even
' though some of them are passed on to the server:
'     $00 = means clear screen to PropTerm
'     $01 = means home to PropTerm
'     $08 = backspace
'     $09 = tab (8 spaces per)
'     $0A = means set X position (X follows) to PropTerm
'     $0B = means set Y position (Y follows) to PropTerm
'     $0C = means set color (color follows) to PropTerm
'     $0D = return
'
t_put5
        cmp     t5,#$01 wz      ' no - home?
  if_z  jmp     #:t_home        ' yes - process home
        cmp     t5,#$00 wz      ' CLS ...
  if_nz cmp     t5,#$0c wz      ' ... or FF?
  if_z  jmp     #:t_ff          ' yes - process as FF
        cmp     t5,#$08 wz      ' no - BS? 
  if_z  jmp     #:t_bs          ' yes - process BS
        cmp     t5,#$09 wz      ' no - HT?
  if_z  jmp     #:t_ht          ' yes - process HT
        cmp     t5,#$0a wz      ' no - LF ...
#ifndef NON_ANSI_HMI
  if_nz cmp     t5,#$0b wz      ' ... or VT?
  if_z  jmp     #:t_lf          ' yes - process as LF
#else
  if_z  jmp     #:t_lf          ' yes - process as LF
        cmp     t5,#$0b wz      ' is it VT?
  if_z  jmp     #t_put5_ret     ' yes - ignore it
#endif
        cmp     t5,#$0d wz      ' no - CR?
  if_z  jmp     #:t_cr          ' yes - process CR
        call    #t_put          ' no - put the char
        call    #t_inccur       ' increment the cursor
        jmp     #t_put5_ret     ' done
:t_bs
        call    #t_put          ' BS - put the char
        call    #t_deccur       ' decrement the cursor
        jmp     #t_put5_ret     ' done
:t_ht
        call    #t_put          ' HT - put the char
        rdbyte  t0,t3           ' get cursor col
        add     t0,#8           ' move to next ...
        andn    t0,#7           ' multiple of 8
        jmp     #:t_setcol      ' set cursor col
:t_ff
        mov     t5,#0           ' clear ...
        call    #t_put          ' ... the screen
:t_home
        add     t3,#1           ' home - set cursor row
        mov     t0,#0           ' ... and col
        jmp     #:t_setrow      ' ... to zero
:t_lf
        add     t3,#1           ' LF - get ...
        rdbyte  t0,t3           ' ... cursor row ...
        add     t0,#1           ' and increment it
        cmp     t0,scrrows wz,wc 'are we past last row?
  if_ae sub     t0,#1           ' yes - stay on last row
:t_setrow
        wrbyte  t0,t3           ' write updated row
        sub     t3,#1           ' point at current cursor col
:t_cr
        mov     t0,#0           ' CR - zero current col
:t_setcol
        wrbyte  t0,t3           ' set current cursor col
        call    #t_movecurs
t_put5_ret
        ret

#else

'
' TODO : decode more control chars here?
'
' t_put5 - write char in t5 to screen, updating cursor location as appropriate
' On entry
'    t3 : address of cursor to use
'    t5 : char to write
' On exit
'    t0,t1,t2,t5,t6,t7,t8 : lost
'    t3,t4 : unchanged
'
' Note that the following characters must be specially processed:
'     $00 = means clear screen to PropTerm
'     $01 = means home to PropTerm
'     $08 = backspace
'     $09 = tab (8 spaces per)
'     $0A = means set X position (X follows) to PropTerm
'     $0B = means set Y position (Y follows) to PropTerm
'     $0C = means set color (color follows) to PropTerm
'     $0D = return
'
t_put5
        cmp     t5,#$01 wz      ' no - home?
  if_z  jmp     #:t_home        ' yes - process home
        cmp     t5,#$00 wz      ' CLS ...
  if_nz cmp     t5,#$0c wz      ' ... or FF?
  if_z  jmp     #:t_ff          ' yes - process as FF
        cmp     t5,#$08 wz      ' no - BS? 
  if_z  jmp     #:t_bs          ' yes - process BS
        cmp     t5,#$09 wz      ' no - HT?
  if_z  jmp     #:t_ht          ' yes - process HT
        cmp     t5,#$0a wz      ' no - LF ...
#ifndef NON_ANSI_HMI
  if_nz cmp     t5,#$0b wz      ' ... or VT?
  if_z  jmp     #:t_lf          ' yes - process as LF
#else
  if_z  jmp     #:t_lf          ' yes - process as LF
        cmp     t5,#$0b wz      ' is it VT?
  if_z  jmp     #t_put5_ret     ' yes - ignore it
#endif
        cmp     t5,#$0d wz      ' no - CR?
  if_z  jmp     #:t_cr          ' yes - process CR
        call    #t_put          ' no - put the char
        call    #t_inccur       ' increment the cursor
        jmp     #t_put5_ret     ' done
:t_bs
        call    #t_put          ' BS - put the char
        call    #t_deccur       ' decrement the cursor
        jmp     #t_put5_ret     ' done
:t_ht
        rdbyte  t0,t3           ' HT - get cursor col
        add     t0,#8           ' move to next ...
        andn    t0,#7           ' multiple of 8
        jmp     #:t_setcol      ' set cursor col
:t_ff
        mov     t5,#0           ' FF - clear ...
        call    #t_put          ' ... the screen
:t_home
        add     t3,#1           ' home - set cursor row
        mov     t0,#0           ' ... and col
        jmp     #:t_setrow      ' ... to zero
:t_lf
        add     t3,#1           ' LF - get ...
        rdbyte  t0,t3           ' ... cursor row ...
        add     t0,#1           ' and increment it
        cmp     t0,scrrows wz,wc 'are we past last row?
  if_ae sub     t0,#1           ' yes - stay on last row
:t_setrow
        wrbyte  t0,t3           ' write updated row
        sub     t3,#1           ' point at current cursor col
:t_cr
        mov     t0,#0           ' zero current col
:t_setcol
        wrbyte  t0,t3           ' set current cursor col
        call    #t_movecurs
t_put5_ret
        ret

#endif

'
' t_movecurs - move the cursor
' On entry:
'    t3 = address of cursor data
'
t_movecurs
        mov     t5,#$0a
        call    #t_put
        rdbyte  t5,t3
        call    #t_put
        mov     t5,#$0b
        call    #t_put
        add     t3,#1
        rdbyte  t5,t3
        call    #t_put
        sub     t3,#1
t_movecurs_ret
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
t9      res      1
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
        fit   $1d8

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

