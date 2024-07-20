{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - LoRes_VGA
'
' This plugin provides Catalina with access to some basic HMI drivers 
'   - keyboard
'   - mouse
'   - screen
'
' Version 1.0 - initial version by Ross Higson
' Version 1.1 - tidy up to use common definitions
' Version 1.3 - now use comboMouse
' Version 1.4 - implement visible cursor - had to remove t_hex and
'               t_bin to make enough space - these routines are now
'               implemented in the C runtime library.
' Version 1.5 - added proxy support
' Version 2.9 - added ENABLE_VGA for C3
' Version 3.0 - Make minimally ANSI compliant (unless NON_ANSI_HMI defined)
'               CR to CR LF translation on output can be enabled by CR_ON_LF
'               CR to LF translation in input can be disabled by NO_CR_TO_LF
' Version 3.1 - Include NO_KEYBOARD and NO_MOUSE support in a single driver.
'
' Version 3.3 - Tidy up platform depencencies.
'
'-------------------------------------------------------------------
' The LoRes VGA screen data block has the following structure:
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
'                  %xxx0 = cursor visible (cursor 1 only)
'                  %xxx1 = cursor invisible (cursor 1 only)
'                  %0xxx = cursor wraps at end of screen
'                  %1xxx = cursor scrolls at end of screen
'---------------------------------------------------------
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
'rslt: 0 = key off, > 0 = key on

'---------------------------------------------------------
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

'---------------------------------------------------------
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

'name: t_hex (now implemented in C)
'code: 26
'type: short request
'data: curs<<23 + address (max 23 bits)
'rslt: 0 = ok

'name: t_bin (now implemented in C)
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
'rslt: 0 = ok

'name: t_scroll
'code: 31
'type: short request
'data: count<<16 + firstrow<<8 + lastrow
'rslt: 0 = ok

'name: t_color
'code: 32
'type: short request
'data: curs<<23 + color (color = 0 .. 7 from predefined palette)
'rslt: 0 = ok
'
'---------------------------------------------------------
}}
CON
'
#include "Constants.inc"
'
' If defined (either here or on the command line) NON_ANSI_HMI makes control
' character handling non-ANSI compliant (.e. the previous Catalina behaviour 
' is used)
'
#ifndef NON_ANSI_HMI
'#define NON_ANSI_HMI
#endif
'
' Define the default colors - White on Dark Blue.
'                             
DEFAULT_FG = %111111    ' RRGGBB
DEFAULT_BG = %000001    ' RRGGBB
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
'
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
' default screen colors (assigned to palette 0)
'
FGND = DEFAULT_FG
BGND = DEFAULT_BG
'
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
CCHAR    = $0E ' can be anything, but this looks ok
'
OBJ

  common  : "Catalina_Common" 

  count   : "Catalina_CogCount"

#ifndef NO_KEYBOARD
#ifdef PROXY_KEYBOARD
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  kbd    : "Catalina_Proxy_Client"
#else
  kbd    : "Catalina_comboKeyboard"
#endif
#endif

#ifndef NO_MOUSE
#ifdef PROXY_MOUSE
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  mouse  : "Catalina_Proxy_Client"
#else
  mouse  : "Catalina_comboMouse"
#endif
#endif

#ifdef PROXY_SCREEN
#ifndef PROXY_HMI
#define PROXY_HMI
#endif  
  screen  : "Catalina_Proxy_Client"
#else
  screen  : "Catalina_VGA_Text"
#endif  

#ifdef PROXY_HMI
  client  : "Catalina_Proxy_Client"
#endif  
'
' This function is called by the target to start the plugin
'
PUB Start (HMI_BLOCK, io_block, proxy_lock, server_cpu) : cog | i, prqst, fore, back, pkbd, pmouse, pscreen, ptv, px_pkbd, px_pmouse, px_pscreen, px_ptv, px_ioblk, px_lock, px_cpu, freecogs 

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

#ifndef PROXY_SCREEN
  long[pscreen][color] := 0 
  ' set cursor 0 to wrap
  'byte[@sc_block][cm0] := %0000
  ' set cursor 1 to scroll & visible
  byte[pscreen][cm1] := %1001

  ' set up screen color palette
  repeat i from 0 to 7
    fore := byte[@palette][i << 1] << 2
    back := byte[@palette][i << 1 + 1] << 2
    long[pscreen][colors + i << 1]     := fore << 24 + back << 16 + fore << 8 + back
    long[pscreen][colors + i << 1 + 1] := fore << 24 + fore << 16 + back << 8 + back

  ' fill screen with blanks
  repeat i from 0 to chrs/2 - 1
    long[pscreen][buffer + i] := $02200220
#endif

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
  kbd.start(pkbd, common#KBD_PIN)
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
  mouse.start(pmouse, common#MOUSE_PIN)
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
    screen.start(ptv, common#VGA_PIN, @long[pscreen][buffer], @long[pscreen][colors])
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

#ifdef ENABLE_VGA
        or      dira, vga_enable
        andn    outa, vga_enable
#endif

loop
#ifdef PROXY_SCREEN
#else
        call    #ccheck         ' update cursor if required
#endif        
        rdlong  rqst,rqstptr wz ' any requests?
   if_z jmp     #loop           ' no - wait for a request

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
        byte    done_bad        '26 (now implemented in C)
        byte    done_bad        '27 (now implemented in C)
#ifdef PROXY_SCREEN
        byte    done_ok         '28 t_setpos ignored
        byte    done_ok         '29 t_getpos ignored
        byte    done_ok         '30 t_mode ignored
        byte    done_ok         '31 t_scroll ignored
        byte    done_ok         '32 t_color ignored
#else        
        byte    t_setpos        '28
        byte    t_getpos        '29
        byte    t_mode          '30
        byte    t_scroll        '31
        byte    t_color         '32
#endif        

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
#ifdef PROXY_SCREEN        
        add     rqst,#4         ' save pointer to ...
        rdlong  pptv,rqst       ' ... tv parameters
#endif        
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

#ifdef PROXY_KEYBOARD

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
        and     t1,#$f          ' ...
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

#else

k_present
        mov     t0,ppkbd        ' get ...
        add     t0,#8           ' ...
        rdlong  rslt,t0         ' ... par_present
        jmp     #negrslt        ' return -par_present

k_get
        call    #k_load         ' load key pointed to by par_tail
   if_z jmp     #done_ok        ' Z set if no key available
k_consume
        add     t1,#1           ' increment ...
        and     t1,#$f          ' ...
        wrlong  t1,ppkbd        ' ... par_tail
        jmp     #done

k_new   call    #k_setup        ' setup common values
        mov     t0,ppkbd        ' set par_tail ...
        wrlong  t2,t0           ' ... to par_head
                                ' fall through to k_wait

k_wait
#ifdef PROXY_SCREEN
#else
        call    #ccheck         ' check for cursor update
#endif        
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

k_state
        mov     t0,ppkbd        ' point to ...
        add     t0,#12          ' ... par_states
        mov     t1,rqst         ' get ...
        and     t1,#$ff         ' ... key ...
        mov     t2,t1           ' ... to test in t1 & t2
        shr     t1,#5           ' read ...
        add     t1,t0           ' ... long ...
        rdlong  rslt,t1         ' ... containing  bit
        ror     rslt,t2         ' rotate required bit ...
        and     rslt,#1         ' .. into position 0

#endif

negrslt
        neg     rslt,rslt       ' and return -rslt
        jmp     #done

'------------------------------------------------------------------

#ifdef PROXY_MOUSE

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
        and     rslt,#1         ' ...
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

#else

m_present
        mov     t0,ppmouse      ' read ...
        add     t0,#7*4         ' ... par_present ...
        jmp     #m_rett0        ' ... and return it

m_button
        mov     t0,ppmouse      ' read ...
        add     t0,#6*4         ' ... par_buttons ...
        rdlong  rslt,t0         ' .. to get state of buttons
        mov     t1,rqst         ' get ...
        and     t1,#$ff         ' ... button from request
        shr     rslt,t1         ' return ...
        and     rslt,#1         ' ....
        jmp     #negrslt        ' -button

m_buttons
        mov     t0,ppmouse      ' read ...
        add     t0,#6*4         ' ... par_buttons ...
        jmp     #m_rett0        ' ... and return it

m_abs_x
        mov     t0,ppmouse      ' read ...
        add     t0,#3*4         ' ... par_x ...
        jmp     #m_rett0        ' ... and return it

m_abs_y
        mov     t0,ppmouse      ' read ...
        add     t0,#4*4         ' ... par_y ...
        jmp     #m_rett0        ' ... and return it

m_abs_z
        mov     t0,ppmouse      ' read ...
        add     t0,#5*4         ' ... par_z ...
m_rett0
        rdlong  rslt,t0         ' ... and return it
        jmp     #done

m_delta_x
        mov     t0,ppmouse      ' point to old x value
m_delta
        mov     t1,t0           ' point to ...
        add     t1,#3*4         ' ... new val
        rdlong  t3,t1           ' read new
        rdlong  t2,t0           ' read old
        mov     rslt,t3         ' calculate ...
        sub     rslt,t2         ' ... dx = new - old
        wrlong  t3,t0           ' update old = new
        jmp     #done           ' return dx

m_delta_y
        mov     t0,ppmouse      ' point to old ...
        add     t0,#1*4         ' ... y value
        jmp     #m_delta        ' return delta

m_delta_z
        mov     t0,ppmouse      ' point to old ...
        add     t0,#2*4         ' ... z value
        jmp     #m_delta        ' return delta

m_reset
        mov     t0,ppmouse      ' point to oldx
        mov     t1,ppmouse      ' point to ...
        add     t1,#3*4         ' ... par_x
        mov     t3,#3           ' 3 longs to copy
:m_resloop
        rdlong  t2,t1           ' copy ...
        wrlong  t2,t0           ' ... longs ...
        add     t0,#4           ' ... from ...
        add     t1,#4           ' ... t1 ...
        djnz    t3,:m_resloop   ' ... to t0
        jmp     #done_ok        ' done

#endif

'------------------------------------------------------------------
'
#ifdef PROXY_SCREEN

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
  if_nz jmp     #:t_str_1       ' ... lf ...
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

{
' t_bin and t_hex are now implemented in C

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
}

#else

t_geometry
        mov     rslt,scrcols    ' result is ...
        shl     rslt,#8         ' ... cols*256 ...
        add     rslt,scrrows    ' ... plus rows
        jmp     #done
                   
t_char
        call    #t_nocurs      ' set up cursor address
        mov     t5,rqst         ' get ...
        and     t5,#$ff         ' ... char to write
        call    #t_put5         ' write char to screen at cursor
        jmp     #done_ok

t_string
        call    #t_nocurs      ' set up cursor address
        and     rqst,low23      ' source address is lower 23 bits of request
:t_strloop
        rdbyte  t5,rqst wz      ' get char to write
  if_z  jmp     #done_ok        ' finished if null byte
        call    #t_put5         ' write char to screen at cursor
        add     rqst,#1         ' increment string pointer
        jmp     #:t_strloop     ' put more chars

t_int
        call    #t_getnum       ' point to cursor and get number to print
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
        call    #t_put5         ' write char to screen at cursor
        jmp     #done_ok

t_unsigned
        call    #t_getnum       ' point to cursor and get number to print
        jmp     #t_uint         ' no sign, just print digits

{
' t_bin and t_hex are now implemented in C

t_hex
        call    #t_getnum       ' point to cursor and get number to print
        mov     t4,#8           ' print 8 digits
:t_hex1
        rol     rqst,#4         ' convert 4 bits ...
        mov     t5,rqst         ' ... to '0' .. '9'
        and     t5,#$f          ' ... or ...
        cmp     t5,#10 wc,wz    ' ... 'A' .. 'F' ...
 if_ae  add     t5,#($41-$30-10)' ... depending ...
        add     t5,#$30         ' ... on the digit value
        call    #t_put5         ' write char to screen at cursor
        djnz    t4,#:t_hex1     ' continue with next digit
        jmp     #done_ok

t_bin
        call    #t_getnum       ' point to cursor and get number to print
        mov     t4,#32          ' print 32 digits
:t_bin1
        rol     rqst,#1         ' convert bit ...
        mov     t5,rqst         ' ... to '0' ...
        and     t5,#1           ' ... or ...
        add     t5,#$30         ' ... '1'
        call    #t_put5         ' write char to screen at cursor
        djnz    t4,#:t_bin1     ' continue with next digit
        jmp     #done_ok
}

t_mode
        call    #t_nocurs       ' set up cursor address
        add     t3,#2           ' point to cursor mode byte
        mov     t2,rqst         ' save ...
        and     t2,#$ff         ' ... cursor ...
        jmp     #write_t2       ' ... mode byte

t_setpos
        call    #t_nocurs      ' set up cursor address
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
        wrbyte  t1,t3           ' save cols
        add     t3,#1           ' save rows
write_t2
        wrbyte  t2,t3           
        jmp     #done_ok

t_getpos
        call    #t_nocurs      ' set up cursor address
        rdbyte  rslt,t3         ' get cursor cols
        add     t3,#1           ' get ...
        rdbyte  t1,t3           ' ... cursor rows
        shl     rslt,#8         ' return ...
        add     rslt,t1         ' 256*cols + rows
        jmp     #done

t_color
        mov     t0,rqst         ' set ...
        and     t0,#$7          ' ... color as 0 .. 7 ...
        wrlong  t0,scrclrs      ' ... of request 
        jmp     #done_ok
            
t_scroll
        call    #t_nocurs
        mov     t6,rqst         ' get ...
        and     t6,#$ff         ' .... last ...
        cmp     t6,scrrows wz,wc ' ... row ...
 if_a   mov     t6,scrrows      ' ... or use last row ...
        sub     t6,#1           ' ... on screen
        mov     t7,rqst         ' get ...
        shr     t7,#8           ' ... first ...
        and     t7,#$ff         ' ... row ...
        cmp     t7,t3 wz,wc     ' ... or  ...
 if_a   mov     t7,t3           ' ... use last row
        mov     t8,rqst         ' get ...
        shr     t8,#16          ' ... scroll ...
        and     t8,#$ff         ' ... count ...
        cmp     t8,scrrows wz,wc ' ... or ...
 if_a   mov     t8,scrrows      ' ... use number of row on screen
        call    #t_scroll2      ' scroll the screen
        jmp     #done_ok        '

#endif

done_bad
        neg      rslt,#1        ' unknown code specified
        jmp      #done

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
#ifdef PROXY_KEYBOARD

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
        cmp     rslt,#$04 wz    ' EOT?
 if_z   neg     rslt,#1 wz      ' if so, return -1 (EOF) (and Z flag cleared)
k_load_ret
        ret

#else

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
        rdlong  t1,t0           ' ... par_tail
        add     t0,#4           ' get ...
        rdlong  t2,t0           ' ... par_head
        mov     rslt,t1         ' set Z flag ...
        sub     rslt,t2 wz      ' ... and rslt = 0 if par_tail == par_head
k_setup_ret
        ret
'
' k_load - Set up common values and read key indicated by par_tail.
'
'  NOTE : To improve compatibility with a normal keyboard, values for
'         ESC and BS return their ASCII values, and the values for
'         keys in the range $40 to $80 are corrected to their ASCII
'         values, and the control flag is reset.
'         Ctrl+D (EOT) returns -1 (EOF).
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
        add     t0,#40          ' load ...
        mov     rslt,t0         ' ... key ...
        add     rslt,t1         ' ... indicated ...
        add     rslt,t1         ' ... by ...
        rdword  rslt,rslt       ' ... par_tail
        cmp     rslt,#$CB wz    ' ESC?
 if_z   mov     rslt,#$1B       ' if so, correct it     
        cmp     rslt,#$C8 wz    ' BS?
 if_z   mov     rslt,#$08       ' if so, correct it
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz    ' CR?
 if_z   mov     rslt,#$0a       ' if so, correct it
#endif
        test    rslt,ctrl wz    ' control key?
 if_z   jmp     #k_unset_z      ' no - return it
        mov     t0, rslt        ' yes - correct it ...
        and     t0,#$ff         ' ... if in range ...
        cmp     t0,#$40 wz,wc   ' ... $40 ...
 if_b   jmp     #k_unset_z      ' ... to ...
        cmp     t0,#$80 wz,wc   ' ... $80 ...
 if_ae  jmp     #k_unset_z      ' ... otherwise just return it
        cmp     t0,#$60 wz,wc   ' correct ...
 if_ae  sub     t0,#$20         ' ... both upper ...
        sub     t0,#$40         ' ... and lower case
        and     rslt,noctrl     ' mask off control flag ...
        or      rslt,t0         ' ... and substitute corrected key
k_unset_z
        cmp     rslt,#$04 wz    ' EOT?
 if_z   neg     rslt,#1 wz      ' if so, return -1 (EOF) (and Z flag cleared)
k_load_ret
        ret

#endif

#ifdef PROXY_SCREEN

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

#else

'
' ccheck - check if cursor update is required
'
ccheck
        tjz     ppscrn,#ccheck_ret ' return if not yet initialized
        mov     t1,cnt          ' time ...
        sub     t1,last         ' ... to update ...
        cmp     t1,ctime wz,wc  ' ... visible cursor?
  if_be jmp     #ccheck_ret     ' no - just return
        mov     last,cnt        ' yes - update last cursor swap time
'
' cswap - swap visible cursor with screen char
'
cswap
'       mov     dira,#1         ' debug
'       xor     outa,#1         ' debug
        mov     t3,scrcurs      ' get address of cursor 1 ...
        add     t3,#5           ' ... mode byte
        rdbyte  t0,t3           ' read mode byte
        test    t0,#1 wz        ' cursor visible ?
  if_z  jmp     #cswap_ret      ' no - return
        sub     t3,#2           ' yes - point to cursor 1 data 
        call    #t_scrpos       ' point to screen cursor location
        rdword  t1,t0           ' swap char ...
        wrword  schar,t0        ' ... at cursor position ...
        mov     schar,t1        ' ... with cursor char
cswap_ret
ccheck_ret
        ret
'
last    long    0               ' last clock count retrieved
ctime   long    40000000        ' cursor on/off time (~0.5 sec)
schar   long    (CCHAR & 1)<<10 + $200 + (CCHAR & $FE) ' char to swap with screen char
scurs   long    (CCHAR & 1)<<10 + $200 + (CCHAR & $FE) ' char to swap with screen char
'
t_nocurs
        cmp     schar,scurs wz  ' yes - if cursor is on the screen ...
  if_nz call    #cswap          ' ... restore original char

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
t_nocurs_ret
        ret

'
't_getnum - set up for converting and printing numbers
'
t_getnum
        call    #t_nocurs      ' set up cursor address
        and     rqst,low23      ' source address is lower 23 bits of request
        rdlong  rqst,rqst wz    ' get the actual number in the request
t_getnum_ret                                
        ret
'
' t_scrpos - get screen buffer address of cursor
' On entry:
'    t3 = address of cursor data
' On exit:
'    t0 = address in screen buffer
'    t3 = still address of cursor data
'
t_scrpos
        mov     t1,scrcols      ' get cols per row
        add     t3,#1           ' get ...
        rdbyte  t2,t3           ' ... cursor row
        call    #m32            ' mult cursor row by screen cols
        sub     t3,#1           ' get ...
        rdbyte  t2,t3           ' ... cursor col
        add     t0,t2           ' add cursor col
        shl     t0,#1           ' (multiply by two as screen is in words)
        add     t0,scrbuff      ' add screen buffer base
t_scrpos_ret
        ret
'
' t_inccur - increment cursor (with wrap and scroll)
' On entry:
'    t3 = address of cursor data
' On exit:
'    t3 = still address of cursor data
'    cursor incremented (and wrapped and screen scrolled if appropriate)
'
t_inccur
        rdbyte  t1,t3           ' get cursor col
        add     t1,#1           ' increment col
        cmp     t1,scrcols wc   ' past last col?
   if_b jmp     #:t_inccol      ' no - just update col
        add     t3,#1           ' yes - increment ...
        rdbyte  t2,t3           ' ... cursor ...
        add     t2,#1           ' ... row
        cmp     t2,scrrows wc,wz ' past last row?
 if_b   jmp     #:t_setrow      ' no - just update row
        add     t3,#1           ' yes - check ...
        rdbyte  t0,t3           ' ... cursor mode ...
        sub     t3,#1           ' ... for ...
        test    t0,#8 wz        ' ... wrap or scroll
 if_z   jmp     #:t_setrow0     ' wrap - set cursor to row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        sub     t3,#1           ' point back at col pointer
        jmp     #:t_setcol0     ' put cursor on col zero
:t_setrow0
        mov     t2,#0           ' set row to zero
:t_setrow
        wrbyte  t2,t3           ' update row
        sub     t3,#1           ' point back to col
:t_setcol0
        mov     t1,#0           ' reset cursor col to zero
:t_inccol
        wrbyte  t1,t3           ' update cursor col
t_inccur_ret
        ret

'
' t_put5 - write char in t5 to screen, incrementing cursor location (if appropriate)
' On entry
'    t3 : address of cursor to use
'    t5 : char to write
' On exit
'    t0,t1,t2,t5,t6,t7,t8 : lost
'    t3,t4 : unchanged
'
t_put5
        cmp     t5,#$0d wz      ' CR?
  if_z  jmp     #:t_cr          ' yes - process CR
        cmp     t5,#$0a wz      ' no - LF ...
#ifndef NON_ANSI_HMI
  if_nz cmp     t5,#$0b wz      ' ... or VT?
#endif
  if_z  jmp     #:t_lf          ' yes - process LF
        cmp     t5,#$0c wz      ' no - FF?
  if_z  jmp     #:t_ff          ' yes - process FF
        cmp     t5,#$09 wz      ' no - HT?
  if_z  jmp     #:t_ht          ' yes - process HT
#ifndef NON_ANSI_HMI
        cmp     t5,#$08 wz      ' no - BS?
  if_z  jmp     #:t_bs          ' yes - process BS
#endif
        cmp     t5,#$DE wz      ' no - CapsLock?
  if_z  jmp     #t_put5_ret     ' yes - ignore it
        call    #t_scrpos       ' no - get screen pos of cursor
        mov     t1,scrclrs      ' get ...
        rdlong  t1,t1           ' current color data
        shl     t1,#1           ' combine ...
        mov     t2,t5           ' ... character ...
        and     t2,#1           ' ... and ...
        add     t1,t2           ' ... color ...
        shl     t1,#10          ' ... ready ...
        and     t5,#$fe         ' ... for ...
        add     t5,ctrl         ' ... ($200) ...
        add     t5,t1           ' ... writing to screen buffer
        wrword  t5,t0           ' write char to screen buffer
        call    #t_inccur       ' increment cursor
        jmp     #t_put5_ret     ' done
#ifndef NON_ANSI_HMI
:t_bs
        rdbyte  t0,t3 wz        ' BS - get cursor col
 if_nz  sub     t0,#1           ' if not first col, subtract one
        jmp     #:t_setcol      ' set cursor col
#endif
:t_ht
        rdbyte  t0,t3           ' HT - get cursor col
        add     t0,#8           ' move to next ...
        andn    t0,#7           ' multiple of 8
        cmp     t0,scrcols wc   ' past last col?
  if_ae mov     t0,scrcols      ' yes - point to ...                                                                                            
  if_ae sub     t0,#1           ' ... last col
        jmp     #:t_setcol      ' set cursor col
:t_ff
        mov     t6,scrrows      ' scroll ...
        sub     t6,#1           ' ... whole ...
        mov     t7,#0           ' ... screen
        mov     t8,scrrows      ' ... ALL ...
        call    #t_scroll2      ' ... rows up
        add     t3,#1           ' set cursor row
        mov     t0,#0           ' ... and col
        jmp     #:t_setrow      ' ... to zero
:t_lf
        add     t3,#1           ' LF - get ...
        rdbyte  t0,t3           ' ... cursor row ...
        add     t0,#1           ' and increment it
        cmp     t0,scrrows wz,wc 'are we past last row?
  if_b  jmp     #:t_setrow      ' no - just update row
        add     t3,#1           ' yes - check ...
        rdbyte  t0,t3           ' check cursor mode ...
        sub     t3,#1           ' ... for ...
        test    t0,#8 wz        ' ... wrap ...
        mov     t0,#0           ' ... or scroll
 if_z   jmp     #:t_setrow      ' wrap - put cursor on row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        jmp     #:t_setcol0     ' put cursor on col zero
:t_setrow
        wrbyte  t0,t3           ' write updated row
:t_setcol0
        sub     t3,#1           ' point at current cursor col
:t_cr
        mov     t0,#0           ' zero current col
:t_setcol
        wrbyte  t0,t3           ' set current cursor col
t_put5_ret
        ret

' t_scroll2 - scroll screen (currently only scrolls up)
' On entry
'    t6 : last row to scroll
'    t7 : first roll to scroll
'    t8 : number of lines to scroll
' On exit
'    t0,t1,t2,t5, t6,t7,t8 : lost
'    t3,t4 : unchanged
'

t_scroll2
        mov     t1,t7           ' calculate ...
        mov     t2,scrcols      ' ... address ...
        call    #m32            ' ... of ...
        mov     t7,t0           ' ... first ...
        shl     t7,#1           ' (multiply by two as screen is in words)
        add     t7,scrbuff      ' ... byte on screen to scroll
        mov     t1,t6           ' calculate ...
        mov     t2,scrcols      ' ... address ...
        call    #m32            ' ... of ...
        mov     t6,t0           ' ... last ...
        shl     t6,#1           ' (multiply by two as screen is in words)
        add     t6,scrbuff      ' ... byte on screen to scroll (+1)
:scr_loop1
        cmp     t8,#0 wz        ' have we scrolled enough times?
 if_z   jmp     #t_scroll2_ret  ' yes - done
        sub     t8,#1           ' no - must scroll more
        mov     t1,t7           ' dst address for line scroll
        mov     t2,t7           ' src address ...
        add     t2,scrcols      ' ... for line scroll
        add     t2,scrcols      ' ... for line scroll
:scr_loop2
        rdword  t0,t2           ' move ...
        wrword  t0,t1           ' ... screen data ...
        add     t1,#2           ' ... from ...
        add     t2,#2           ' ... src to dst
        cmp     t1,t6 wz,wc     ' moved all data?
 if_b   jmp     #:scr_loop2     ' no - keep moving data
        mov     t0,space        ' yes - fill last line with spaces
        mov     t1,t6           ' point to start of last line
        mov     t5,scrcols      ' number of columns to fill
:scr_loop3
        wrword  t0,t1           ' fill line ...
        add     t1,#2           ' ... with ...
        djnz    t5,#:scr_loop3  ' ... spaces
        jmp     #:scr_loop1     ' scroll more
t_scroll2_ret
        ret

'
' t_up1 - scroll screen up one line
' On entry:
'    none
' On exit:
'    t0,t1,t2,t5, t6,t7,t8 : lost
'    t3,t4 : unchanged
'    screen scrolled (and cursor set to col zero)
'
t_up1
        mov     t6,scrrows      ' scroll ...
        sub     t6,#1           ' ... whole ...
        mov     t7,#0           ' ... screen
        mov     t8,#1           ' ... one ...
        call    #t_scroll2      ' ... row up
t_up1_ret
        ret

#endif

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
#ifdef ENABLE_VGA
vga_enable long 1<<common#VGA_ENABLE   ' explicitly enable VGA
#endif
'
ppkbd   long     0
ppmouse long     0
ppscrn  long     0

#ifdef PROXY_SCREEN
pptv    long     0
#endif

'
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
scrcols res      1      ' screen cols
scrrows res      1      ' screen rows
scrsize res      1      ' screen size
scrbuff res      1      ' pointer to screen buffer
scrclrs res      1      ' current color data
scrpall res      1      ' pointer to screen palette
scrcurs res      1      ' pointer to screen cursors
'-------------------------------------------------------------------
        fit   $1f0

DAT
'------------------------------------------------------------------

                        '        fore   back
                        '         RGB    RGB
palette                 byte    FGND,  BGND     '0    white / dark blue
                        byte    %%330, %%110    '1   yellow / brown
                        byte    %%202, %%000    '2  magenta / black
                        byte    %%111, %%333    '3     grey / white
                        byte    %%033, %%011    '4     cyan / dark cyan
                        byte    %%020, %%232    '5    green / gray-green
                        byte    %%100, %%311    '6      red / pink
                        byte    %%033, %%003    '7     cyan / blue

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
        
