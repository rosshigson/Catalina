{{
'-------------------------------------------------------------------------------
'
' Catalina HMI Plugin - VGA
'
' This plugin provides Catalina with access to some basic HMI drivers: 
'   - keyboard
'   - mouse
'   - screen
'
' It is intended to use the P2-ES accessory boards (i.e. the A/V board for
' VGA and the Host Serial board for USB ports). It is configured by setting
' the following values in platform.inc
'
'    _VGA_PIN_BASE : base pin to use for VGA
'    _USB_PIN_BASE : base pin to use for USB ports
'
' This HMI plugin automatically starts the VGA tile driver, and either none,
' one or two USB port drivers. If only one USB driver is started, it will use
' port A (the port closest to the board) but this port can be used for either
' a keyboard or a mouse. If two USB port drivers are started then either port
' A or port B can be used for keyboard or mouse. However, do not connect two
' USB keyboards or two USB mice - they will interfere with each other.
'
' Only one USB port is started if either the NO_MOUSE or NO_KEYBOARD Catalina 
' symbols are defined on the command line. No USB ports are started if BOTH 
' these symols are defined. 
'
' The following Catalina symbols affect this plugin:
'
' VGA_640 (or VGA or LORES_VGA) :  640 x 480
' VGA_800                       :  800 x 600
' VGA_1024 (or HIRES_VGA)       : 1024 x 768 - also requires MHZ_220 or MHZ_260
'
' MHZ_220                       : Required for 1024 x 768 at 1 or 24 bits per 
'                                 color (see platform.inc)

' MHZ_260                       : Required for 1024 x 768 at 4 or 8 bits per 
'                                 color (see platform.inc)
'
' P2_REV_A                      : Required for Rev A silicon.
'
' COLOR_1 (or MONO)             :  1 bit fg & bg color (i.e. B&W) - default
' COLOR_4                       :  4 bit fg color, 3 bits bg color
' COLOR_8                       :  8 bit fg & bg color
' COLOR_24                      : 24 bit fg & bg color
'
' NO_KEYBOARD                   : Omit keyboard support code and one USB driver
' NO_MOUSE                      : Omit mouse support code and one USB driver
'
' NON_ANSI_HMI                  : Revert to old Catalina behaviour (deprecated)
'
' NO_CR_TO_LF                   : Do not convert CR to LF
'
' USB_MESSAGES                  : Print USB status and error messages 
'                                 (also requires SBRK_AFTER_PLUGINS)
'
' USB_DEBUGGING                 : Just print key codes and mouse positions on
'                                 the screen instead of returning them.
'
' TWEAK_VGA                     : Apply vga timing "tweaks" (this is provided
'                                 as an example of what might be required on
'                                 some monitors).
'
' Version 1.0 - initial P2 version by Ross Higson
'
'-------------------------------------------------------------------
'
' On startup, PTRA should point to sufficient buffer space (size depends on 
' resolution and color depth - see below). This plugin starts the other 
' drivers (vga, keyboard, mouse) as required.
' 
' The VGA screen data block has the following structure:
'
'   RegAddr    : one long containing registry address
'   ScrnBuff   : COL*ROWS*CELLSIZE bytes of screen buffer.
'   ScrnCurs   : 6 bytes for cursor data.
'
'   The cursor modes supported by this plugin (which can be set by the
'   t_mode service) are as follows:
'
'      %xx00 = cursor off
'      %xx01 = cursor on
'      %xx10 = cursor on, blink slow
'      %xx11 = cursor on, blink fast
'      %x0xx = cursor is solid block (not supported for MONO)
'      %x1xx = cursor is underscore
'      %0xxx = cursor wraps at end of screen
'      %1xxx = cursor scrolls at end of screen
'
' The cursor visibility bits only affect cursor 1, which is the visible
' cursor. Cursor 0 is always invisible, and by default wraps at the end
' of the screen. Cursor 1 is by default a visible slow blinking block
' cursor which scrolls at the end of the screen.
'
' The P2 keyboard driver returns the same key codes as the Catalina P1 
' keyboard drivers, which are almost identical to the Parallax key codes:
'
'   HEX      MEANING      NOTE
'   ===      =======      ====
'    08      Backspace    different to Parallax
'    09      Tab
'    0a      Enter        different to Parallax unless NO_CR_TO_LF specified 
'    1B      Esc          different to Parallax
'    20      Space
'    21      !
'    22      "                                                             "
'    23      #
'    24      $
'    25      %
'    26      &
'    27      '
'    28      (
'    29      )
'    2A      *
'    2B      +
'    2C      ,
'    2D      -
'    2E      .
'    2F      /
'    30..39  0..9
'    3A      :
'    3B      ;
'    3C      <
'    3D      =
'    3E      >
'    3F      ?
'    40      @       
'    41..5A  A..Z
'    5B      [
'    5C      \
'    5D      ]
'    5E      ^
'    5F      _
'    60      `
'    61..7A  a..z
'    7B      {
'    7C      |
'    7D      }
'    7E      ~
'
'    C0      Left Arrow
'    C1      Right Arrow
'    C2      Up Arrow
'    C3      Down Arrow
'    C4      Home
'    C5      End
'    C6      Page Up
'    C7      Page Down
'    C9      Delete
'    CA      Insert
'    CC      App
'
'    D0..DB  F1..F12
'    DC      Print Screen
'
'    E0..E9  Keypad 0..9
'    EA      Keypad .
'    EB      Keypad Enter
'    EC      Keypad +
'    ED      Keypad -
'    EE      Keypad *
'    EF      Keypad /
'
' Two new services have been defined for this driver - t_color_fg() and
' t_color_bg(). The existing t_color() function accepts only up to 8 bits of 
' fg and bg color, but t_color_fg() and t_color_bg() accept up to 24 bits for
' color, and so can be used when a color depth of 24 bits is specified. These 
' functions still accept a cursor parameter, but this is not used - the 
' new colors apply to both the visible and the invisible cursors.
'
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
'rslt: 0 = ok

'name: t_scroll
'code: 31
'type: short request
'data: count<<16 + firstrow<<8 + lastrow
'rslt: 0 = ok

'name: t_color
'code: 32
'type: short request
'data: curs<<23 + color (color = bg<<8 + fg, where bg,fg depend on mode**)
'rslt: 0 = ok
'
' ** NOTE: The colours depend on the current mode, and are different from 
'          other Catalina Text drivers because they apply to the current cell, 
'          not the whole row. This service accepts only ANSI colors - for
'          24 bit colors, you need to use the new t_color_fg and t_color_bg 
'          services.
'
'name: t_color_fg
'code: 32
'type: short request
'data: color (24 bit)
'rslt: 0 = ok
'
'name: t_color_bg
'code: 32
'type: short request
'data: color (24 bit)
'rslt: 0 = ok
'
'---------------------------------------------------------
}}

' the actual VGA tile driver ...

#include "cogvga.t"

' the actual USB driver - note that we can use either port A or port B
' for the keyboard or mouse - but the support code will be omitted if
' -C NO_KEYBOARD and/or -C NO_MOUSE are specified on the command line.

#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
'#include <kbmprec.t>
'#include <kbmprea.t>
#include <cogkbma.t>
#define USE_USB_A
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#include <cogkbmb.t>
#define USE_USB_B
#endif
#endif

CON

' the size of buffer (to be allocated from FREE_MEM) for this driver.

HMI_BLOCK_SIZE = COLS*ROWS*CELL_SIZE + 6 ' screen buffer + cursor_buffer

#include "constant.inc"

' If defined either here or on the commandline, USB_MESSAGES makes the
' USB driver print USB status and error messages.

#ifndef USB_MESSAGES
' #define USB_MESSAGES
#endif

' If defined (either here or on the command line) NON_ANSI_HMI makes control
' character handling non-ANSI compliant (.e. the previous Catalina behaviour 
' is used). Now deprecated.

#ifndef NON_ANSI_HMI
'#define NON_ANSI_HMI
#endif

' Define the default colors - ANSI White on ANSI Navy Blue.
' (see https://jonasjacek.github.io/colors/)
                             
DEFAULT_FG = 15    ' WHITE
DEFAULT_BG = 4     ' NAVY (for consistency between modes, use only 0 .. 7)

' Define the number of color bits to use (default is 8)

#if defined(COLOR_1) || defined(COLOUR_1) || defined(MONO)
   CELL_SIZE = 1
#elif defined(COLOR_4) || defined(COLOUR_4)
   CELL_SIZE = 2
#elif defined(COLOR_8) || defined(COLOUR_8)
   CELL_SIZE = 4
#elif defined(COLOR_24) || defined(COLOUR_24)
   CELL_SIZE = 8
#else
   CELL_SIZE = 1
#endif

#if defined(VGA_1024) || defined (HIRES_VGA)

#if !defined (MHZ_260) 
#if !defined (_CLOCK_XTAL) || !defined(_CLOCK_XDIV) || !defined(_CLOCK_MULT) || !defined (_CLOCK_DIVP) || ((((_CLOCK_XTAL / _CLOCK_XDIV) * _CLOCK_MULT) / _CLOCK_DIVP) < 260000000)
#error CLOCK MUST BE 260MHZ OR HIGHER TO USE HIRES VGA (E.G. USE -C MHZ_260) 
#endif
#endif

' VGA_1024 : 128 cols x 48 rows

'' clock frequency settings
'' for 1024x768 we use a 65 MHz pixel clock
'' and clock the P2 to 200 MHz (i.e. add -C MHZ_220 for COLOR_1 or COLOR_24)
''  or clock the P2 to 260 MHz (i.e. add -C MHZ_260 for COLOR_4 or COLOR_8)

CON

   pixel_clock_freq = 65_000_000

   COLS = 128
   ROWS = 48
   CHAR_HEIGHT = 16

DAT
   orgh
   alignl

screen_params
   long _VGA_BASE_PIN   ' see platform.inc
pscrnbuff
   long 0               ' screen buffer (set during initialization)
   long COLS            ' screen columns
   long ROWS            ' screen rows
   long @FONT_TABLE     ' font data
   long 8               ' font width
   long CHAR_HEIGHT     ' font height
pclkscale               ' must be set using calcscale
   long 0               ' pixel clock scaling value
   long 24              ' horizontal front porch
   long 136             ' hsync pulse
   long 160             ' horizontal back porch
#if defined(TWEAK_VGA)
   long 8               ' vertical front porch (standard is 3)
   long 6               ' vertical sync lines (standard is 6)
   long 24              ' vertical back porch (standard is 29)
#else
   long 3               ' vertical front porch (standard is 3)
   long 6               ' vertical sync lines (standard is 6)
   long 29              ' vertical back porch (standard is 29)
#endif
   long %11             ' vertical/horizontal polarity
   long CELL_SIZE
  
#elif defined(VGA_800)

' VGA_800 : 100 cols x 40 rows

'' clock frequency settings
'' for 800x600 we use a 40 MHz pixel clock
'' which x4 gives a 160 MHz system clock
'' or x5 gives a 200 MHz system clock
'' those are probably good choices for running
'' with this

CON

   pixel_clock_freq = 40_000_000

   COLS = 100          ' (8*100 == 800)
   ROWS = 40           ' (40*15 == 600)
   CHAR_HEIGHT = 15    ' note addition of 256 to FONT_TABLE below -
                       ' this is required for a CHAR_HEIGHT of 15

DAT
   orgh
   alignl

screen_params
   long _VGA_BASE_PIN    ' see platform.inc
pscrnbuff
   long 0                ' screen buffer (set during initialization)
   long COLS             ' screen columns
   long ROWS             ' screen rows
   long @FONT_TABLE + 256 ' font data: skip first row
   long 8                ' font width
   long CHAR_HEIGHT      ' font height
pclkscale                ' must be set using calcscale
   long 0                ' pixel clock scaling value
   long 40               ' horizontal front porch
   long 128              ' hsync pulse
   long 88               ' horizontal back porch
#if defined(TWEAK_VGA)
   long 4                ' vertical front porch (standard is 1)
   long 4                ' vertical sync lines (standard is 4)
   long 20               ' vertical back porch (standard is 23)
#else
   long 1                ' vertical front porch (standard is 1)
   long 4                ' vertical sync lines (standard is 4)
   long 23               ' vertical back porch (standard is 23)
#endif
   long %00              ' vertical/horizontal polarity (1 == negative)
   long CELL_SIZE

#elif defined(VGA_640) || defined(LORES_VGA)

' VGA_640 : 80 cols x 30 rows

CON

   pixel_clock_freq = 25_000_000
   COLS = 80
   ROWS = 30
   CHAR_HEIGHT = 16
      
DAT
   orgh
   alignl

screen_params
   long _VGA_BASE_PIN   ' see platform.inc
pscrnbuff
   long 0               ' screen buffer (set during initialization)
   long COLS            ' screen columns
   long ROWS            ' screen rows
   long @FONT_TABLE     ' font data
   long 8               ' font width
   long CHAR_HEIGHT     ' font height
pclkscale               ' must be set using calcscale
   long 0               ' pixel clock scaling value
   long 16              ' horizontal front porch
   long 96              ' hsync pulse
   long 48              ' horizontal back porch
#if defined(TWEAK_VGA)
   long 12              ' vertical front porch (standard is 10)
   long 2               ' vertical sync lines (standard is 2)
   long 31              ' vertical back porch (standard is 33)
#else
   long 10              ' vertical front porch (standard is 10)
   long 2               ' vertical sync lines (standard is 2)
   long 33              ' vertical back porch (standard is 33)
#endif
   long %11             ' vertical/horizontal polarity (1 == negative)
   long CELL_SIZE
  
#else 

' default is same as VGA_640 : 80 cols x 30 rows

CON

   pixel_clock_freq = 25_000_000
   COLS = 80
   ROWS = 30
   CHAR_HEIGHT = 16
      
DAT
   orgh
   alignl

screen_params
   long _VGA_BASE_PIN   ' see platform.inc
pscrnbuff
   long 0               ' screen buffer (set during initialization)
   long COLS            ' screen columns
   long ROWS            ' screen rows
   long @FONT_TABLE     ' font data
   long 8               ' font width
   long CHAR_HEIGHT     ' font height
pclkscale               ' must be set using calcscale
   long 0               ' pixel clock scaling value
   long 16              ' horizontal front porch
   long 96              ' hsync pulse
   long 48              ' horizontal back porch
#if defined(TWEAK_VGA)
   long 12              ' vertical front porch (standard is 10)
   long 2               ' vertical sync lines (standard is 2)
   long 31              ' vertical back porch (standard is 33)
#else
   long 10              ' vertical front porch (standard is 10)
   long 2               ' vertical sync lines (standard is 2)
   long 33              ' vertical back porch (standard is 33)
#endif
   long %11             ' vertical/horizontal polarity (1 == negative)
   long CELL_SIZE
  
#endif

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
#ifndef NO_KEYBOARD
   byte SVC_K_GET     , 2
   byte SVC_K_WAIT    , 3
   byte SVC_K_NEW     , 4
   byte SVC_K_READY   , 5
   byte SVC_K_CLEAR   , 6
   byte SVC_K_STATE   , 7
#endif
   byte SVC_M_PRESENT , 11
#ifndef NO_MOUSE
   byte SVC_M_BUTTON  , 12
   byte SVC_M_BUTTONS , 13
   byte SVC_M_ABS_X   , 14
   byte SVC_M_ABS_Y   , 15
   byte SVC_M_ABS_Z   , 16
   byte SVC_M_DELTA_X , 17
   byte SVC_M_DELTA_Y , 18
   byte SVC_M_DELTA_Z , 19
   byte SVC_M_RESET   , 20
#endif
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
   byte SVC_T_COLOR_FG, 33
   byte SVC_T_COLOR_BG, 34
   byte 0             , 0
 
   alignl

DAT
        org     0

HMI_START
'
' PTRA = pointer to our HMI block, which will contain the registry address as 
' the first long, then enough space for the screen buffer, then the cursor
' data buffer, then the mouse buffer, then the keyboard buffer.
'
' NOTE: The following locations are used as variables once the cog is started:
'
regptr  rdlong  regptr,PTRA     ' set up registry address ...
scrbuff mov     scrbuff,PTRA    ' ... and ...
scrcurs add     scrbuff,#4      ' ... screen buffer
rqstptr mov     scrcurs,scrbuff ' ... and ... 
rsltptr add     scrcurs,##COLS*ROWS*CELL_SIZE ' ... cursor data 
v0      cogid   v0              ' calculate ...
v1      shl     v0,#2           ' ... request ...
v2      add     v0,regptr       ' ... block ...
v3      rdlong  rqstptr,v0      ' ... address ...
v4      and     rqstptr,low23   ' ... (only use 23 bits)
v5      wrlong  #0,rqstptr      ' clear any outstanding request
v6      mov     v1,##LMM_HMI<<24  ' register ...
v7      or      v1,rqstptr      ' ... ourselves ...
v8      wrlong  v1,v0           ' ... as a HMI plugin
        mov     rsltptr,rqstptr ' calculate ...
        add     rsltptr,#4      ' ... result address
	setq2	#(VGA_LUT_LIBRARY_END-VGA_LUT_LIBRARY)-1
	rdlong	0,##@VGA_LUT_LIBRARY
        jmp     #initialize     ' initialize various things
        
loop
        call    #ccheck         ' check for cursor update
#if defined(USE_USB_A)
        call    #process_usb_A    ' process USB A notifications
#endif
#if defined(USE_USB_B)
        call    #process_usb_B    ' process USB B notifications
#endif
        rdlong  rqst,rqstptr wz ' wait ...
  if_z  jmp     #loop           ' ... for a request

        mov     v1,rqst
        shr     v1,#24
        cmp     v1,#34 wcz
  if_a  jmp     #done_bad
        ror     v1,#2           ' lookup code address
        add     v1,#svctable
        sets    .table,v1
        rol     v1,#2
        shl     v1,#3
.table  mov     v2,0
        shr     v2,v1
        and     v2,#$FF
        jmp     v2              ' jump to code routine

svctable
        byte    initialize      ' 0
#ifdef NO_KEYBOARD
        byte    done_ok         ' 1
        byte    done_bad        ' 2
        byte    done_bad        ' 3
        byte    done_bad        ' 4
        byte    done_bad        ' 5
        byte    done_bad        ' 6
        byte    done_bad        ' 7
#else
        byte    k_present       ' 1
        byte    k_get           ' 2
        byte    k_wait          ' 3
        byte    k_new           ' 4
        byte    k_ready         ' 5
        byte    k_clear         ' 6
        byte    k_state         ' 7
#endif
        byte    done_bad        ' 8
        byte    done_bad        ' 9
        byte    done_bad        ' 10
#ifdef NO_MOUSE
        byte    done_ok         ' 11
        byte    done_bad        ' 12
        byte    done_bad        ' 13
        byte    done_bad        ' 14
        byte    done_bad        ' 15
        byte    done_bad        ' 16
        byte    done_bad        ' 17
        byte    done_bad        ' 18
        byte    done_bad        ' 19
        byte    done_bad        ' 20
#else
        byte    m_present       ' 11
        byte    m_button        ' 12
        byte    m_buttons       ' 13
        byte    m_abs_x         ' 14
        byte    m_abs_y         ' 15
        byte    m_abs_z         ' 16
        byte    m_delta_x       ' 17
        byte    m_delta_y       ' 18
        byte    m_delta_z       ' 19
        byte    m_reset         ' 20
#endif
        byte    t_geometry      ' 21
        byte    t_char          ' 22
        byte    t_string        ' 23
        byte    t_int           ' 24
        byte    t_unsigned      ' 25
        byte    done_bad        ' 26 (now implemented in C)
        byte    done_bad        ' 27 (now implemented in C)
        byte    t_setpos        ' 28
        byte    t_getpos        ' 29
        byte    t_mode          ' 30
        byte    t_scroll        ' 31
        byte    t_color         ' 32
        byte    t_color_fg      ' 33
        byte    t_color_bg      ' 34

'------------------------------------------------------------------
' jump table routines - must be within first 255 longs
'
        alignl

initialize
        wrlong  scrbuff,##@pscrnbuff ' set up screen buffer address
        call    #init_screen
        call    #start_vga
#if defined(USE_USB_A)
        call    #start_usb_A
#endif
#if defined (USE_USB_B)
        call    #start_usb_B
#endif
#ifdef NO_KEYBOARD
        jmp     #done_ok        ' no keyboard to initialize
#else
        jmp     #k_clear        ' initialize keyboard
#endif

#ifndef NO_KEYBOARD

k_present
        mov     rslt,km_connected_A ' If kbd connected on port A ...
        or      rslt,km_connected_B ' ... or on port B ...
        and     rslt,#1             ' ... then return 1
        jmp     #done

k_get
        call    #k_load             ' load key pointed to by ckbd_tail
   if_z jmp     #done_ok            ' Z set if no key available
k_consume
        incmod  ckbd_tail, #KBD_BUFFMASK
        wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
        jmp     #done

k_new   mov     ckbd_tail,ckbd_head      ' set ckbd_tail to ckbd_head
        wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub

k_wait
        call    #ccheck             ' check for cursor update
#if defined(USE_USB_A)
        call    #process_usb_A      ' process USB A notifications
#endif
#if defined(USE_USB_B)
        call    #process_usb_B      ' process USB B notifications
#endif
        call    #k_load             ' load key pointed to by par_tail
 if_z   jmp     #k_wait             ' Z set if no key available
        jmp     #k_consume          ' consume and return the key

k_ready
        loc     ptra, #@kbd_head
        rdlong  ckbd_head, ptra
        cmp     ckbd_tail,ckbd_head wz ' ckbd_tail = ckbd_head?
  if_z  jmp     #done_ok            ' rslt == 0 if no key ready
        neg     rslt,#1             ' rslt == -1 if a key is ready
        jmp     #done

k_clear 
        mov     ckbd_tail,ckbd_head      ' set ckbd_tail to ckbd_head
        wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
        jmp     #done

k_state
        jmp     #done_ok            ' return zero (not supported)

#endif

'------------------------------------------------------------------

#ifndef NO_MOUSE

m_present
        mov     rslt,km_connected_A ' If mouse connected on port A ...
        or      rslt,km_connected_B ' ... or on port B ...
        shr     rslt,#1             ' ... then return 1
        jmp     #done               '

m_button
        mov     rslt,mouse_buttons  ' get state of buttons
        mov     v1,rqst             ' get ...
        and     v1,#$ff             ' ... button from request
        shr     rslt,v1             ' return ...
        and     rslt,#1             ' ...
        neg     rslt,rslt           ' ... -button
        jmp     #done

m_buttons
        mov     rslt,mouse_buttons  ' get state of all buttons
        jmp     #done               '

m_abs_x
        mov     rslt,mouse_x_abs    ' current absolute x value
        jmp     #done               '

m_abs_y
        mov     rslt,mouse_y_abs    ' current absolute y value
        jmp     #done               '

m_abs_z
m_delta_z
        jmp     #done_ok            ' return zero (not supported)

m_delta_x
        mov     rslt,mouse_x_del    ' get delta x value
        mov     mouse_x_del,#0      ' clear delta x
        jmp     #done               ' return delta x

m_delta_y
        mov     rslt,mouse_y_del    ' get delta y value
        mov     mouse_y_del,#0      ' clear delta y
        jmp     #done               ' return delta y

m_reset
        mov     mouse_x_abs,#0      '
        mov     mouse_y_abs,#0      '
        mov     mouse_x_del,#0      '
        mov     mouse_y_del,#0      '
        jmp     #done_ok            ' done

#endif

'------------------------------------------------------------------

t_geometry
        mov     rslt,##(COLS<<8)+ROWS ' result is cols * 256 + rows
        jmp     #done
                   
t_char
        call    #t_nocurs       ' set up cursor address
        mov     v5,rqst         ' get ...
        and     v5,#$ff         ' ... char to write
        call    #t_put5         ' write char to screen at cursor
        jmp     #done_ok

t_string
        call    #t_nocurs       ' set up cursor address
        and     rqst,low23      ' source address is lower 23 bits of request
        call    #print_str      ' print string
        jmp     #done_ok

t_int 
        call    #t_getnum       ' point to cursor and get number to print
        call    #print_int
        jmp     #done_ok

t_unsigned
        call    #t_getnum       ' point to cursor and get number to print
        call    #print_uint     ' no sign, just print digits
        jmp     #done_ok

{
' t_bin and t_hex are now implemented in C

t_hex
        call    #t_getnum       ' point to cursor and get number to print
        mov     v4,#8           ' print 8 digits
.t_hex1
        rol     rqst,#4         ' convert 4 bits ...
        mov     v5,rqst         ' ... to '0' .. '9'
        and     v5,#$f          ' ... or ...
        cmp     v5,#10 wcz      ' ... 'A' .. 'F' ...
 if_ae  add     v5,#($41-$30-10)' ... depending ...
        add     v5,#$30         ' ... on the digit value
        call    #t_put5         ' write char to screen at cursor
        djnz    v4,#.t_hex1     ' continue with next digit
        jmp     #done_ok

t_bin
        call    #t_getnum       ' point to cursor and get number to print
        mov     v4,#32          ' print 32 digits
.t_bin1
        rol     rqst,#1         ' convert bit ...
        mov     v5,rqst         ' ... to '0' ...
        and     v5,#1           ' ... or ...
        add     v5,#$30         ' ... '1'
        call    #t_put5         ' write char to screen at cursor
        djnz    v4,#.t_bin1     ' continue with next digit
        jmp     #done_ok
}

t_mode
        call    #t_nocurs       ' set up cursor address
        add     v3,#2           ' point to cursor mode byte
        mov     v0,rqst         ' save ...
        and     v0,#$ff         ' ... cursor ...
        wrbyte  v0,v3           ' ... mode byte
        and     v0,#3           ' fast blink?
        cmp     v0,#2 wz
  if_z  mov     ctime,##_CLOCKFREQ/2 ' no - 1/2 sec
        cmp     v0,#3 wz
  if_z  mov     ctime,##_CLOCKFREQ/4 ' yes - 1/4 sec
        jmp     #done_ok

t_setpos
        call    #t_nocurs       ' set up cursor address
        mov     v1,rqst         ' extract ...
        shr     v1,#8           ' ... cols ...
        and     v1,#$ff         ' ... from request
        cmp     v1,scrcols wcz  ' ensure ...
  if_ae mov     v1,scrcols      ' ... cols within bounds ...
  if_ae sub     v1,#1           ' ... or use screen cols - 1
        mov     v2,rqst         ' extract ...
        and     v2,#$ff         ' ... rows from request
        cmp     v2,scrrows wcz  ' ensure ...
  if_ae mov     v2,scrrows      ' ... rows within bounds ...
  if_ae sub     v2,#1           ' ... or use screen rows - 1
        call    #t_setcurs      ' set up cursor address
        wrbyte  v1,v3           ' save cols
        add     v3,#1           ' save ...
        wrbyte  v2,v3           ' ... rows
        jmp     #done_ok

t_getpos
        call    #t_nocurs       ' set up cursor address
        rdbyte  rslt,v3         ' get cursor cols
        add     v3,#1           ' get ...
        rdbyte  v1,v3           ' ... cursor rows
        shl     rslt,#8         ' return ...
        add     rslt,v1         ' 256*cols + rows
        jmp     #done

t_color call    #t_nocurs       ' set up cursor address
        mov     v7,rqst         ' get ...
        and     v7,#$FF         ' ... new fg color
        mov     v8,rqst         ' get ...
        shr     v8,#8           ' ....new bg ...
        and     v8,#$FF         ' ... color
#if defined(COLOR_24)
        shl     v7,#2               ' convert ...
        add     v7,##@color_palette ' ... ANSI fg color ...
        rdlong  v7,v7               ' ... to actual fg color
        shl     v8,#2               ' convert ...
        add     v8,##@color_palette ' ... ANSI bg color ...
        rdlong  v8,v8               ' ... to actual bg color
#endif
        mov     scr_fg,v7       ' update current fg color
        mov     scr_bg,v8       ' update current bg color
        jmp     #done_ok

t_color_fg
        mov     v7,rqst         ' get ...
#if defined(COLOR_24)
        shl     v7,#8           ' ... new fg color (24 bit)
#elif defined(COLOR_8)
        and     v7,#$FF         ' ... new fg color (8 bit)
#else
        and     v7,#$F          ' ... new fg color (4 bit)
#endif
        mov     scr_fg,v7       ' set as fg color
        jmp     #done_ok

t_color_bg
        mov     v8,rqst         ' get ...
#if defined(COLOR_24)
        shl     v8,#8           ' ... new bg color (24 bit)
#elif defined(COLOR_8)
        and     v8,#$FF         ' ... new bg color (8 bit)
#else
        and     v8,#$7          ' ... new bg color (3 bit)
#endif
        mov     scr_bg,v8       ' set as bg color
        jmp     #done_ok

t_scroll
        call    #t_nocurs       ' set up cursor address
        mov     v6,rqst         ' get ...
        and     v6,#$ff         ' .... last ...
        cmp     v6,scrrows wcz  ' ... row ...
 if_a   mov     v6,scrrows      ' ... or use last row ...
        sub     v6,#1           ' ... on screen
        mov     v7,rqst         ' get ...
        shr     v7,#8           ' ... first ...
        and     v7,#$ff         ' ... row ...
        cmp     v7,v3 wcz       ' ... or  ...
 if_a   mov     v7,v3           ' ... use last row
        mov     v8,rqst         ' get ...
        shr     v8,#16          ' ... scroll ...
        and     v8,#$ff         ' ... count ...
        cmp     v8,scrrows wcz  ' ... or ...
 if_a   mov     v8,scrrows      ' ... use number of row on screen
        call    #t_scroll2      ' scroll the screen
        jmp     #done_ok        '

done_bad
        neg     rslt,#1         ' unknown code specified
        jmp     #done

' ensure the above code fits into the first 255 longs
' (note that 'done' and 'done_ok' do not need to because
' they are not used in svctable.

        fit      $100

done_ok
        mov      rslt,#0        ' return zero

done
        wrlong   rslt,rsltptr   ' save result
        mov      rslt,#0        ' indicate ...
        wrlong   rslt,rqstptr   ' ... request complete
        jmp      #loop          ' wait for next request

'------------------------------------------------------------------
' internal code - can be beyond long 255
'

#ifndef NO_KEYBOARD

' k_load - Load key indicated by ckbd_tail.
'
'  NOTE : To improve compatibility with a normal keyboard, values for
'         ESC and BS return their ASCII values, and the values for
'         keys in the range $40 to $80 are corrected to their ASCII
'         values, and the control flag is reset.
'         Ctrl+D (EOT) returns -1 (EOF).
'
' On exit:
'    rslt = key indicated by ckbd_tail
'    Z flag set if ckbd_head == ckbd_tail
'
'
k_load
        loc     ptra, #@kbd_head
        rdlong  ckbd_head, ptra
        cmp     ckbd_head, ckbd_tail wz
  if_z  ret                              ' Keypress buffer empty
        mov     ctmp, ckbd_tail
        shl     ctmp, #2
        loc     pa, #@kbd_buffer         ' Head/tail are buffer address offsets 
        add     pa, ctmp
        rdlong  ctmp, pa
        getbyte ckbd_keypress, ctmp, #0
        getbyte ckbd_scancode, ctmp, #1
        getbyte ckbd_modkeys, ctmp, #2
        getbyte ckbd_ledstate, ctmp, #3
        mov     rslt,ckbd_keypress
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz             ' CR?
 if_z   mov     rslt,#$0a                ' if so, correct it
#endif
        test    ckbd_modkeys, #KEY_ALTMOD wz ' Either ALT key down?
  if_nz jmp     #.alt
        test    ckbd_modkeys, #KEY_CTRLMOD wz ' either CTRL key down?
  if_nz jmp     #.ctrl
 _ret_  mov     v0,#1 wz                 ' ensure Z flag not set!

' Check for modifier keys

.ctrl
        cmp     rslt,#$40 wcz            ' ... $40 ...
 if_b   jmp     #.chk_ctrl_d             ' ... to ...
        cmp     rslt,#$80 wcz            ' ... $80 ...
 if_ae  jmp     #.chk_ctrl_d             ' ... otherwise just return it
        cmp     rslt,#$60 wcz            ' correct ...
 if_ae  sub     rslt,#$20                ' ... both upper ...
        sub     rslt,#$40                ' ... and lower case
.chk_ctrl_d
        cmp     rslt,#$04 wz             ' EOT?
 if_z   neg     rslt,#1                  ' if so, return -1 (EOF)
 _ret_  mov     v0,#1 wz                 ' ensure Z flag not set!
.alt
' TODO ...
        call    #t_nocurs                  ' for debugging
        mov     v3,scrcurs                 ' for debugging
        add     v3,#3                      ' for debugging
        mov     rqst,ckbd_keypress         ' for debugging
        call    #print_int
        mov     rslt,#0
 _ret_  mov     v0,#1 wz               ' ensure Z flag not set!

#endif

'
' ccheck - check if cursor update is required
'
ccheck
        mov     v3,scrcurs      ' get address of visible cursor ...
        add     v3,#5           ' ... mode byte
        rdbyte  v6,v3           ' read mode byte
        and     v6,#%11         ' is visible cursor ...
        cmp     v6,#%01 wz      ' ... supposed to be always visible?
  if_nz jmp     #chk_time       ' no - check if time has come to make it so
        test    scurs,#%01 wz   ' yes - is cursor on the screen ?
  if_z  jmp     #cswap_do       ' no - put it on the screen
        ret
chk_time
        getct   v1              ' time ...
        sub     v1,clast        ' ... to update ...
        cmp     v1,ctime wcz    ' ... visible cursor visibility bit?
  if_be jmp     #cswap          ' no - make sure cursor is in correct state
        xor     scurs,#%10      ' yes - toggle visibility bit
        getct   clast           ' update last cursor swap time
        
'
' cswap - swap visible cursor with screen char
'
cswap
        cmp     scurs,#%10 wz   ' swap?
  if_z  jmp     #cswap_do       ' yes
        cmp     scurs,#%01 wz   ' swap?
  if_nz ret                     ' no
cswap_do   
        mov     v3,scrcurs      ' get address of cursor 1 ...
        add     v3,#5           ' ... mode byte
        rdbyte  v6,v3           ' read mode byte
        test    v6,#3 wz        ' cursor visible ?
  if_z  ret                     ' no - return
        sub     v3,#2           ' yes - point to cursor 1 data 
        call    #t_scrpos       ' point to screen cursor location
        call    #get_cell       ' get current character and colors
        mov     v1,v5           ' swap ...
        mov     v5,schar        ' ... cell character ...
        mov     schar,v1        ' ... with cursor character
        test    v6,#4 wz        ' cursor is block ?
  if_nz mov     v1,v7           ' swap ...
  if_nz mov     v7,scolor       ' ... cell fg color ...
  if_nz mov     scolor,v1       ' ... with cursor color
  if_z  mov     v1,v8           ' swap ...
  if_z  mov     v8,scolor       ' ... cell bg color ...
  if_z  mov     scolor,v1       ' ... with cursor color
        call    #put_char       ' put cursor character
        xor     scurs,#%01      ' toggle whether cursor is on screen
        ret
'
't_nocurs - set up for requests that can address either cursor, 
'           and remove the cursor if it is on the screen
' On exit:
'   v3 : cursor address
'
t_nocurs
        test    scurs,#%01 wz   ' if cursor is on the screen ...
  if_nz call    #cswap_do       ' ... restore original char ...
        andn    scurs,#%01      ' ... and set it to not on screen

'
't_setcurs - set up for requests that can address either cursor
' On exit:
'   v3 : cursor address
'
t_setcurs
        mov     v3,scrcurs      ' get address of cursor 0 data
        test    rqst,curs_1 wz  ' request intended for cursor 0 ?
  if_nz add     v3,#3           ' no - add offset for cursor 1 data
        ret

'
't_getnum - set up for converting and printing numbers
'
t_getnum
        call    #t_nocurs       ' set up cursor address
        and     rqst,low23      ' source address is lower 23 bits of request
  _ret_ rdlong  rqst,rqst wz    ' get the actual number in the rquest
'
' t_scrpos - get screen buffer address of cursor
' On entry:
'    v3 = address of cursor data
' On exit:
'    v0 = address in screen buffer
'    v3 = still address of cursor data
'
t_scrpos
        mov     v1,scrcols      ' get cols per row
        add     v3,#1           ' get ...
        rdbyte  v2,v3           ' ... cursor row
        call    #m32            ' mult cursor row by screen cols
        sub     v3,#1           ' get ...
        rdbyte  v1,v3           ' ... cursor col
        add     v1,v0           ' add cursor col
        mov     v2,scrcell      ' multiply ...
        call    #m32            ' ... by cell size
  _ret_ add     v0,scrbuff      ' add screen buffer base
'
' t_inccur - increment cursor (with wrap and scroll)
' On entry:
'    v3 = address of cursor data
' On exit:
'    v3 = still address of cursor data
'    cursor incremented (and wrapped and screen scrolled if appropriate)
'
t_inccur
        rdbyte  v1,v3           ' get cursor col
        add     v1,#1           ' increment col
        cmp     v1,scrcols wc   ' past last col?
   if_b jmp     #.t_inccol      ' no - just update col
        add     v3,#1           ' yes - increment ...
        rdbyte  v2,v3           ' ... cursor ...
        add     v2,#1           ' ... row
        cmp     v2,scrrows wcz   ' past last row?
 if_b   jmp     #.t_setrow1     ' no - just update row
        add     v3,#1           ' yes - check ...
        rdbyte  v0,v3           ' ... cursor mode ...
        sub     v3,#1           ' ... for ...
        test    v0,#8 wz        ' ... wrap or scroll
 if_z   jmp     #.t_setrow0     ' wrap - set cursor to row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        sub     v3,#1           ' point back at col pointer
        jmp     #.t_setcol0     ' put cursor on col zero
.t_setrow0
        mov     v2,#0           ' set row to zero
.t_setrow1
        wrbyte  v2,v3           ' update row
        sub     v3,#1           ' point back to col
.t_setcol0
        mov     v1,#0           ' reset cursor col to zero
.t_inccol
  _ret_ wrbyte  v1,v3           ' update cursor col

'
' t_put5 - write char in v5 to screen, incrementing cursor location (if appropriate)
' On entry
'    v3 : address of cursor to use
'    v5 : char to write
' On exit
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v3,v4 : unchanged
'
' NOTE: We use the current fg, bg color and effects - this is different to the
'       existing (P1) text drivers
'
t_put5
        cmp     v5,#$0d wz      ' CR?
  if_z  jmp     #.t_cr          ' yes - process CR
        cmp     v5,#$0a wz      ' no - LF ...
#ifndef NON_ANSI_HMI
  if_nz cmp     v5,#$0b wz      ' ... or VT?
#endif
  if_z  jmp     #.t_lf          ' yes - process LF
        cmp     v5,#$0c wz      ' no - FF?
  if_z  jmp     #.t_ff          ' yes - process FF
        cmp     v5,#$09 wz      ' no - HT?
  if_z  jmp     #.t_ht          ' yes - process HT
#ifndef NON_ANSI_HMI
        cmp     v5,#$08 wz      ' no - BS?
  if_z  jmp     #.t_bs          ' yes - process BS
#endif
        cmp     v5,#$DE wz      ' no - CapsLock?
  if_z  ret                     ' yes - ignore it
        call    #t_scrpos       ' no - get screen pos of cursor
        call    #put_cell       ' put char in that cell
        call    #t_inccur       ' increment cursor
        ret                     ' done
#ifndef NON_ANSI_HMI
.t_bs
        rdbyte  v0,v3 wz        ' BS - get cursor col
 if_nz  sub     v0,#1           ' if not first col, subtract one
        jmp     #.t_setcol      ' set cursor col
#endif
.t_ht
        rdbyte  v0,v3           ' HT - get cursor col
        add     v0,#8           ' move to next ...
        andn    v0,#7           ' multiple of 8
        cmp     v0,scrcols wcz
  if_ae mov     v0,scrcols
  if_ae sub     v0,#1
        jmp     #.t_setcol      ' set cursor col
.t_ff
        mov     v6,scrrows      ' scroll ...
        sub     v6,#1           ' ... whole ...
        mov     v7,#0           ' ... screen
        mov     v8,scrrows      ' ... ALL ...
        call    #t_scroll2      ' ... rows up
        add     v3,#1           ' set cursor row
        mov     v0,#0           ' ... and col
        jmp     #.t_setrow      ' ... to zero
.t_lf
        add     v3,#1           ' LF - get ...
        rdbyte  v0,v3           ' ... cursor row ...
        add     v0,#1           ' and increment it
        cmp     v0,scrrows wcz  'are we past last row?
  if_b  jmp     #.t_setrow      ' no - just update row
        add     v3,#1           ' yes - check ...
        rdbyte  v0,v3           ' check cursor mode ...
        sub     v3,#1           ' ... for ...
        test    v0,#8 wz        ' ... wrap ...
        mov     v0,#0           ' ... or scroll
 if_z   jmp     #.t_setrow      ' wrap - put cursor on row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        sub     v3,#1           ' point back at col pointer
        jmp     #.t_cr          ' put cursor on col zero
.t_setrow
        wrbyte  v0,v3           ' write updated row
        sub     v3,#1           ' point at current cursor col
.t_cr
        mov     v0,#0           ' zero current col
.t_setcol
  _ret_ wrbyte  v0,v3           ' set current cursor col

' t_scroll2 - scroll screen (currently only scrolls up)
' On entry
'    v6 : last row to scroll
'    v7 : first row to scroll
'    v8 : number of lines to scroll
' On exit
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v3,v4 : unchanged
'

t_scroll2
        mov     v1,v7           ' calculate ...
        mov     v2,scrcols      ' ... address ...
        call    #m32            ' ... of ...
        mov     v1,v0           ' ... (multiplying ...
        mov     v2,scrcell      ' ...  by ...
        call    #m32            ' ...  cell size) ...
        mov     v7,v0           ' ... first ...
        add     v7,scrbuff      ' ... byte on screen to scroll
        mov     v1,v6           ' calculate ...
        mov     v2,scrcols      ' ... address ...
        call    #m32            ' ... of ...
        mov     v1,v0           ' ... (multiplying ...
        mov     v2,scrcell      ' ...  by
        call    #m32            ' ...  cell size) ...
        mov     v6,v0           ' ... last ...
        add     v6,scrbuff      ' ... byte on screen to scroll (+1)
.scr_loop1
        cmp     v8,#0 wz        ' have we scrolled enough times?
 if_z   ret                     ' yes - done
        sub     v8,#1           ' no - must scroll more
        mov     v1,v7           ' dst address for line scroll
        mov     v2,v7           ' src address ...
        add     v2,scrline      ' ... for line scroll
.scr_loop2
        rdbyte  v0,v2           ' move ...
        wrbyte  v0,v1           ' ... screen data ...
        add     v1,#1           ' ... from ...
        add     v2,#1           ' ... src to dst
        cmp     v1,v6 wcz       ' moved all data?
 if_b   jmp     #.scr_loop2     ' no - keep moving data
        mov     v1,v6           ' point to start of last line
        mov     v5,scrcols      ' number of columns to fill
#if defined(COLOR_24)
        mov     v2,scr_bg       ' get current bg color
        mov     v0,scr_fg       ' get current fg color
        or      v0,#$20         ' add space char
.scr_loop3
        wrlong  v0,v1           ' put fg color and char in cell
        add     v1,#4           ' put bg color ...
        wrlong  v2,v1           ' ... in cell
        sub     v1,#4           ' restore v0
#elif defined(COLOR_8)
        mov     v0,#$20         ' combine space char ...
        shl     v0,#8           ' ... with ...
        or      v0,scr_bg       ' ... current bg ...
        shl     v0,#8           ' ... and ...
        or      v0,scr_fg       ' ... current fg
.scr_loop3
        wrlong  v0,v1           ' put colors and char in cell
#elif defined(COLOR_4)
        mov     v0,scr_bg       ' combine current bg ...
        shl     v0,#4           ' ... with ...
        or      v0,scr_fg       ' ... current fg ...
        shl     v0,#8           ' and ...
        or      v0,#$20         ' ... space char
.scr_loop3
        wrword  v0,v1           ' put colors and char in cell
#else
        mov     v0,#$20         ' space
.scr_loop3
        wrbyte  v0,v1           ' put char in cell
#endif
        add     v1,scrcell      ' next cell
        djnz    v5,#.scr_loop3  ' continue till row is complete
        jmp     #.scr_loop1     ' scroll more

'
' t_up1 - scroll screen up one line
' On entry:
'    none
' On exit:
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v3,v4 : unchanged
'    screen scrolled (and cursor set to col zero)
'
t_up1
        mov     v6,scrrows      ' scroll ...
        sub     v6,#1           ' ... whole ...
        mov     v7,#0           ' ... screen
        mov     v8,#1           ' ... one ...
        call    #t_scroll2      ' ... row up
        ret

'------------------------------------------------------------------
' initialized data
'
curs_1  long     $00800000
low23   long     $007FFFFF
maxdec  long     1000000000     ' maximum decimal divisor for 32 bit values
ctrl    long     $00000200      ' mask to detect control keys
noctrl  long     $fffffd00      ' mask to correct control keys
scrcols long     COLS           ' screen cols
scrrows long     ROWS           ' screen rows
scrsize long     COLS*ROWS      ' cols * rows
scrcell long     CELL_SIZE      ' cell size (bytes)
scrline long     COLS*CELL_SIZE ' line size (bytes)
scr_fg  long     DEFAULT_FG     ' current fg color
scr_bg  long     DEFAULT_BG     ' current bg color
rqst    long     0              ' request being processed
rslt    long     0              ' result to return

scale_a long     pixel_clock_freq
scale_b long     _CLOCKFREQ
scale_c long     0
'
clast   long     0              ' last clock count retrieved
ctime   long     _CLOCKFREQ/2   ' cursor on/off time (~0.5 sec)
schar   long     $5F            ' char to swap with screen char
#if defined(COLOR_24)
scolor  long     $ffffff00      ' color for screen cursor
#else
scolor  long     15             ' color for screen cursor
#endif
scurs   long     0              ' bit 0 = 1 when cursor is on screen
                                ' bit 1 = 1 when cursor should be on screen
'
' USB Client registers
'
ctmp            long    0
cnotify         long    0
' devices connected
km_connected_A  long    0       ' bit 0 = kbd connected, bit 1 = mouse connected
km_connected_B  long    0       ' bit 0 = kbd connected, bit 1 = mouse connected
' Mouse data registers
mouse_buttons   long    0       ' Button 1..3 state flags
mouse_x_abs     long    0       ' mouse X absolute position
mouse_y_abs     long    0       ' mouse Y absolute position
mouse_x_del     long    0       ' mouse X delta (since last m_delta)
mouse_y_del     long    0       ' mouse Y delta (since last m_delta)
cmouse_x        long    0       ' raw X-axis direction and velocity (0..-127, 0..127)
cmouse_y        long    0       ' raw Y-axis direction and velocity (0..-127, 0..127)
' Keyboard data registers, in the same order as the hub interface locations
ckbd_head       long    0
ckbd_tail       long    0
ckbd_scancode   long    0       ' USB HID keyboard scancode of the key
ckbd_modkeys    long    0       ' See the hub interface constants for usage
ckbd_keypress   long    0       ' The ASCII character associated with this scancode
ckbd_ledstate   long    0       ' See the hub interface constants for usage


'
'-------------------------------------------------------------------
        fit   $1f0

'
' VGA library routines - must be loaded into LUT RAM ...
'
 org $200

VGA_LUT_LIBRARY

'm32 - 32 bit multiplication (CODESAVING version!)
' On entry:
'    v1 = operand 1
'    v2 = operand 2
' On exit:
'    v0 = result

m32
        qmul  v1,v2
  _ret_ getqx v0

'd32u - Unsigned 32 bit division
' On entry:
'    v1 = divisor
'    v0 = dividend
' On exit:
'    v0 = quotient (i.e. v0/v1)
'    v1 = remainder

d32u
        qdiv  v0,v1
        getqx v0
  _ret_ getqy v1

'
' print_str
'
print_str
.strloop
        rdbyte  v5,rqst wz      ' get char to write
  if_z  ret                     ' finished if null byte
        call    #t_put5         ' write char to screen at cursor
        add     rqst,#1         ' increment string pointer
        jmp     #.strloop       ' put more chars

'
' print_int an integer at the current cursor position
'
print_int
        cmps    rqst,#0 wcz     ' positive?
 if_ae  jmp     #print_uint     ' yes - no sign
        mov     v5,#$2d         ' no - prefix number with '-'
        call    #t_put5         ' write char to screen at cursor
        abs     rqst,rqst wcz   ' make number positive
print_uint
  if_z  jmp     #.t_int4        ' if zero, just print one digit
        mov     v4,maxdec       ' get largest possible decimal divisor
.t_int2
        cmp     rqst,v4 wcz     ' is our number larger than that?
 if_ae  jmp     #.t_int3        ' yes - start extracting decimal digits
        mov     v0,v4           ' no - divide divisor ...
        mov     v1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     v4,v0           ' ... try ...
        jmp     #.t_int2        ' ... again
.t_int3
        cmp     v4,#10 wcz      ' is this the last digit?
 if_b   jmp     #.t_int4        ' yes - no need to divide any more
        mov     v0,rqst         ' no - divide number ...
        mov     v1,v4           ' ... by  ...
        call    #d32u           ' ... divisor
        mov     v5,v0           ' convert quotient ...
        add     v5,#$30         ' ... to digit char
        mov     rqst,v1         ' save remainder for next time
        call    #t_put5         ' write char to screen at cursor
        mov     v0,v4           ' divide divisor ...
        mov     v1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     v4,v0           ' ... continue ...
        jmp     #.t_int3        ' ... with next digit
.t_int4
        mov     v5,rqst           ' convert last decimal digit ...
        add     v5,#$30         ' ... to digit char
        call    #t_put5         ' write char to screen at cursor
        ret
'
' init_screen : initialize default colors and clear screen buffer
' 
init_screen
        mov     v0,scrbuff         ' point to screen buffer
        mov     v1,scrsize         ' get number of cells
        mov     v5,#$20            ' fill screen with spaces
#if defined(COLOR_24)
        shl     scr_bg,#2               ' convert ...
        add     scr_bg,##@color_palette ' ... ANSI bg color ...
        rdlong  scr_bg,scr_bg           ' ... to actual bg color
        shl     scr_fg,#2               ' convert ...
        add     scr_fg,##@color_palette ' ... ANSI fg color ...
        rdlong  scr_fg,scr_fg           ' to actual fg color
#endif
init_cell
        call    #put_cell
        add     v0,scrcell
        djnz    v1,#init_cell
        mov     v0,scrcurs        ' initialize ...
        wrword  #0,v0             ' ... cursor 0 ...
        add     v0,#2             ' ... position ...
        wrbyte  #%1000,v0         ' ... and scroll
        add     v0,#1             ' initialize ...
        wrword  #0,v0             ' ... cursor 1 ...
        add     v0,#2             ' ... position ...
        wrbyte  #%1010,v0         ' ... and scroll and visible slow block
        ret
'
' get_cell - get char and current colors in cell
' On entry:
'    v0 = points to cell
' On exit:
'    v5 = char in cell
'    v7 = fg color of cell
'    v8 = bg color of cell
'    v0 : unchanged
'
get_cell
#if defined(COLOR_24)
        rdlong  v7,v0           ' get fg color and char in cell
        mov     v5,v7           ' get ...
        and     v5,#$FF         ' ... char 
        andn    v7,#$FF         ' remove char from fg color
        add     v0,#4           ' get ...
        rdlong  v8,v0           ' ... bg color
  _ret_ sub     v0,#4           ' restore v0
#elif defined(COLOR_8)
        rdlong  v8,v0           ' get colors and char in cell
        mov     v5,v8           ' put char ...
        shr     v5,#16          ' ...
        and     v5,#$FF         ' ... in v5
        mov     v7,v8           ' put fg color ...
        and     v7,#$FF         ' ... in v7
        shr     v8,#8           ' put bg color ...
  _ret_ and     v8,#$FF         ' ...  in v8
#elif defined(COLOR_4)
        rdword  v8,v0           ' get colors and char in cell
        mov     v5,v8           ' put char ...
        and     v5,#$FF         ' ... in v5
        mov     v7,v8           ' put bg color ...
        shr     v8,#12          ' ... in ...
        and     v8,#$7          ' ... position
        shr     v7,#8           ' put fg color ...
  _ret_ and     v7,#$F          ' ... in position
#else
        mov     v7,#15          ' for MONO, fg color is always white ...
        mov     v8,#0           ' ... and bg color is always black
  _ret_ rdbyte  v5,v0           ' get char in cell
#endif
        
'
' put_cell - put char in cell, with current colors
' On entry:
'    v0 = points to cell
'    v5 = char to put
' On exit:
'    v7,v8 : lost
'    v0,v5 : unchanged
'
' put_char - put char in cell, with specfied colors
' On entry:
'    v0 = points to cell
'    v5 = char to put
'    v7 = fg color to put
'    v8 = bg color to put
' On exit:
'    v7,v8 : lost
'    v0,v5 : unchanged
'
put_cell
        mov     v7,scr_fg       ' get fg color
        mov     v8,scr_bg       ' get bg color
put_char
#if defined(COLOR_24)
        or      v7,v5           ' combine fg color with char
        wrlong  v7,v0           ' put fg color and char in cell
        add     v0,#4           ' put ...
        wrlong  v8,v0           ' ... in cell
  _ret_ sub     v0,#4           ' restore v0
#elif defined(COLOR_8)
        shl     v5,#8           ' put char and bg color ...
        or      v5,v8           ' ... in position
        shl     v5,#8           ' put fg color ...
        or      v5,v7           ' .. in position
        wrlong  v5,v0           ' put colors and char in cell
  _ret_ shr     v5,#16          ' restore v5
#elif defined(COLOR_4)
        shl     v8,#12          ' put bg color in position
        shl     v7,#8           ' put fg in position
        or      v8,v7           ' combine colors ...
        or      v8,v5           ' ... with char
  _ret_ wrword  v8,v0           ' put colors and char in cell
#else
  _ret_ wrbyte  v5,v0           ' put char in cell
#endif

'
' start_vga : start vga driver, register as HMI cog, register our services
' 
start_vga
        call    #calcscale                 ' set up ...
        wrlong  scale_c,##@pclkscale       ' ... pixel clock scale
        mov     v0, #%10000                ' in any cog ...
        setq    ##@screen_params           ' ... start ...
        coginit v0, ##@VGA_DRIVER_START wc ' ... VGA driver
  if_c  ret                   ' not much we can do if there are no free cogs

register_hmi
        shl     v0,#2         ' calculate new cog's ...
        add     v0,regptr     ' ... request ...
        rdlong  v1,v0         ' ... block ...
        and     v1,low23      ' ... address (only use 23 bits)
        mov     v2,#LMM_HMI   ' register ...
        shl     v2,#24        ' ... it ...
        or      v1,v2         ' ... as another HMI cog ...
        wrlong  v1,v0         ' ... so it can be shut down later if required
        ret

#if defined(USE_USB_A)
'
' start_usb_A : start usb driver on port A, register as HMI cog, 
'               register our services
' 
start_usb_A

' configure the "long repository" smart pin that the USB cog 
' will write to when a notable USB event occurs.
' DIR bit low puts smart pin in reset mode
        dirl    #USB_A_EVENT_REPO

' Set "long repository" mode to act as an event mailbox
        wrpin   ##SP_REPO1_MODE, #USB_A_EVENT_REPO

' Enable the event mailbox smart pin (will raise IN)
        dirh    #USB_A_EVENT_REPO

' start the USB cog
        mov     v0, #%10000              ' in any cog ...
        coginit v0, ##@A_usb_host_start wc ' ... start USB driver

  if_c  ret                   ' not much we can do if there are no free cogs
        jmp     #register_hmi ' register it as another HMI cog
'
' process_usb_A : must be called at least every 4ms to process usb events
'
process_usb_A
        testp   #USB_A_EVENT_REPO wc
  if_c  rdpin   cnotify, #USB_A_EVENT_REPO
  if_c  call    #usb_event_A
        ret

'
' usb_event_A : Handler for an event posted to the repository smart pin 
'             by the USB cog.

usb_event_A
        cmp     cnotify, #USB_ERROR wcz
  if_a  jmp     #.skip             ' Message notification skip pattern
        jmprel  cnotify            ' Handler routines for ... 
        jmp     #cmouse_update     ' ... mouse ...
#ifdef USB_DEBUGGING
        jmp     #ckbd_key_update   ' ... keyboard (print key) ...
#else
        nop                        ' ... keyboard (nothing) ...
#endif
        jmp     #ckbd_tgl_update   ' ... toggle keys ...
        jmp     #cusb_error_A      ' ... and error events

.skip
#if defined(USB_MESSAGES)
        skipf   cnotify
' The following code must be in the same order as the DEV_UNKNOWN..USB_NO_COG
' skip values in the "Boot Protocol Mouse/Keyboard Hub Interface" CON region.
        loc     ptra, #@sz_dev_unknown   ' Strings describing the USB event
        loc     ptra, #@sz_kb_ready
        loc     ptra, #@sz_m_ready
        loc     ptra, #@sz_kbm_ready
        nop
        loc     ptra, #@sz_disconnect
        loc     ptra, #@sz_usb_started
        loc     ptra, #@sz_usb_no_cog
        jmp     #tx_asciiz_nl            ' Not part of the SKIPF list
#else
        skipf   cnotify
' The following code must be in the same order as the DEV_UNKNOWN..USB_NO_COG
' skip values in the "Boot Protocol Mouse/Keyboard Hub Interface" CON region.
        nop
        or      km_connected_A,#1        
        or      km_connected_A,#2
        or      km_connected_A,#3
        nop
        andn    km_connected_A,#3
        nop
        nop
        ret                              ' Not part of the SKIPF list
#endif

'
' cusb_error_A : Handler for a USB error event
'
cusb_error_A
#if defined(USB_MESSAGES)
        loc     ptra, #@sz_usb_error
        call    #tx_nl_asciiz
        rdlong  rqst, ##A_usb_error_code
        call    #print_int
        ret

#endif

#endif

#if defined(USE_USB_B)
'
' start_usb_B : start usb driver on port B, register as HMI cog, 
'               register our services
' 
start_usb_B

' configure the "long repository" smart pin that the USB cog 
' will write to when a notable USB event occurs.
' DIR bit low puts smart pin in reset mode
        dirl    #USB_B_EVENT_REPO

' Set "long repository" mode to act as an event mailbox
        wrpin   ##SP_REPO1_MODE, #USB_B_EVENT_REPO

' Enable the event mailbox smart pin (will raise IN)
        dirh    #USB_B_EVENT_REPO

' start the USB cog
        mov     v0, #%10000              ' in any cog ...
        coginit v0, ##@B_usb_host_start wc ' ... start USB driver

  if_c  ret                   ' not much we can do if there are no free cogs
        jmp     #register_hmi ' register it as another HMI cog
'
' process_usb_B : must be called at least every 4ms to process usb events
'
process_usb_B
        testp   #USB_B_EVENT_REPO wc
  if_c  rdpin   cnotify, #USB_B_EVENT_REPO
  if_c  call    #usb_event_B
        ret

'
' usb_event_B : Handler for an event posted to the repository smart pin 
'             by the USB cog.

usb_event_B
        cmp     cnotify, #USB_ERROR wcz
  if_a  jmp     #.skip             ' Message notification skip pattern
        jmprel  cnotify            ' Handler routines for ... 
        jmp     #cmouse_update     ' ... mouse ...
#ifdef USB_DEBUGGING
        jmp     #ckbd_key_update   ' ... keyboard (print key) ...
#else
        nop                        ' ... keyboard (nothing) ...
#endif
        jmp     #ckbd_tgl_update   ' ... toggle keys ...
        jmp     #cusb_error_B      ' ... and error events

.skip
#if defined(USB_MESSAGES)
        skipf   cnotify
' The following code must be in the same order as the DEV_UNKNOWN..USB_NO_COG
' skip values in the "Boot Protocol Mouse/Keyboard Hub Interface" CON region.
        loc     ptra, #@sz_dev_unknown   ' Strings describing the USB event
        loc     ptra, #@sz_kb_ready
        loc     ptra, #@sz_m_ready
        loc     ptra, #@sz_kbm_ready
        nop
        loc     ptra, #@sz_disconnect
        loc     ptra, #@sz_usb_started
        loc     ptra, #@sz_usb_no_cog
        jmp     #tx_asciiz_nl            ' Not part of the SKIPF list
#else
        skipf   cnotify
' The following code must be in the same order as the DEV_UNKNOWN..USB_NO_COG
' skip values in the "Boot Protocol Mouse/Keyboard Hub Interface" CON region.
        nop
        or      km_connected_B,#1        
        or      km_connected_B,#2
        or      km_connected_B,#3
        nop
        andn    km_connected_B,#3
        nop
        nop
        ret                              ' Not part of the SKIPF list
#endif

'
' cusb_error_B : Handler for a USB error event
'
cusb_error_B
#if defined(USB_MESSAGES)
        loc     ptra, #@sz_usb_error
        call    #tx_nl_asciiz
        rdlong  rqst, ##B_usb_error_code
        call    #print_int
        ret
#endif

#endif

#ifdef USB_DEBUGGING
'
' ckbd_key_update : Handler for keyboard keypress changes
'
ckbd_key_update
        loc     ptra, #@kbd_head
        rdlong  ckbd_head, ptra
.getkey
        cmp     ckbd_head, ckbd_tail wz
  if_z  ret                              ' Keypress buffer empty
        mov     ctmp, ckbd_tail
        shl     ctmp, #2
        loc     pa, #@kbd_buffer         ' Head/tail are buffer address offsets 
        add     pa, ctmp
        rdlong  ctmp, pa
        getbyte ckbd_keypress, ctmp, #0
        getbyte ckbd_scancode, ctmp, #1
        getbyte ckbd_modkeys, ctmp, #2
        getbyte ckbd_ledstate, ctmp, #3
        call    #tx_keypress
        incmod  ckbd_tail, #KBD_BUFFMASK
        wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
        jmp     #.getkey                 ' Next buffered key, if any
'
' tx_keypress : Keyboard keypress handler.
'
' On entry:
'   ckbd_keypress - ASCII table character value or scancode if non-ASCII key.
'   ckbd_scancode - USB HID key scancode.
'   ckbd_modkeys - state flags for modifier keys (shift/ctrl/alt/gui).
'   ckbd_ledstate - state flage for toggle keys (CapsLock/NumLock/ScrollLock).
'
tx_keypress
' Check for pressed modifier keys
        test    ckbd_modkeys, #KEY_ALTMOD wz ' Either ALT key down?
  if_nz jmp     #.alt
        test    ckbd_modkeys, #KEY_CTRLMOD wz
  if_nz jmp     #.ctrl


        call    #t_nocurs           ' for debugging
        mov     v3,scrcurs          ' for debugging
        add     v3,#3               ' for debugging
        mov     v5,ckbd_keypress    ' for debugging
        call    #t_put5             ' for debugging
        mov     v5,#$3C             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,ckbd_scancode  ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$2C             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,ckbd_keypress  ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$3E             ' for debugging
        call    #t_put5             ' for debugging
        ret
' Modifier key handling
.ctrl
.alt
        call    #t_nocurs           ' for debugging
        mov     v3,scrcurs          ' for debugging
        add     v3,#3               ' for debugging
        mov     v5,#$3C             ' for debugging
        call    #t_put5             ' for debugging
        mov     v5,#$3C             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,ckbd_scancode  ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$2C             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,ckbd_keypress  ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$3E             ' for debugging
        call    #t_put5             ' for debugging
        mov     v5,#$3E             ' for debugging
        call    #t_put5             ' for debugging
        ret
#endif
'
' cmouse_update : Handler for mouse position/button state changes.
'
#ifndef NO_MOUSE
cmouse_update
        loc     ptra, #@mouse_data  ' Packed mouse data
        rdlong  ctmp, ptra
        getbyte mouse_buttons, ctmp, #0  ' Button flags
        getbyte cmouse_x, ctmp, #1  ' X direction/velocity
        getbyte cmouse_y, ctmp, #2  ' Y direction/velocity
        shl     cmouse_x,#24        ' sign extend ...
        sar     cmouse_x,#24        ' ... x value
        shl     cmouse_y,#24        ' sign extend ...
        sar     cmouse_y,#24        ' ... y value
        add     mouse_x_abs,cmouse_x
        sub     mouse_y_abs,cmouse_y
        add     mouse_x_del,cmouse_x
        sub     mouse_y_del,cmouse_y

#ifdef USB_DEBUGGING
        call    #t_nocurs           ' for debugging
        mov     v3,scrcurs          ' for debugging
        add     v3,#3               ' for debugging
        mov     rqst,mouse_buttons  ' for debugging
        mov     v5,#$3C             ' for debugging
        call    #t_put5             ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$20             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,cmouse_x       ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$20             ' for debugging
        call    #t_put5             ' for debugging
        mov     rqst,cmouse_y       ' for debugging
        call    #print_int          ' for debugging
        mov     v5,#$3E             ' for debugging
        call    #t_put5             ' for debugging
#endif
        ret
#else
cmouse_update
        ret
#endif
'
' ckbd_tgl_update : Handler for keyboard toggle key state changes
'
ckbd_tgl_update
#if defined(USB_DEBUGGING)
        drvnot #59                 ' for debugging
#endif
        ret

#if defined(USB_MESSAGES)
'
' tx_nl_asciiz, tx_asciiz, tx_asciiz_nl : Output an ASCIIZ string to the terminal
'
'   PTRA - address of first byte of the string
'
tx_nl_asciiz
        mov     v3,scrcurs      ' get address of cursor 0 data
        mov     v5, #$0d        ' CR
        call    #t_put5
tx_asciiz
        mov     rqst, ptra
        jmp     #print_str
tx_asciiz_nl
        mov     rqst, ptra
        mov     v3,scrcurs      ' get address of cursor 0 data
        call    #print_str
        mov     v5, #$0d        ' CR
        jmp     #t_put5
#endif
'
' calcscale: calculate scale_c = ($8000_0000 * scale_a) / (scale_b)
' Note that scale_a and scale_b are set to appropriate default values
'
calcscale
        qmul  scale_a,##$8000_0000
        getqy scale_c         ' upper
        getqx scale_a         ' lower
        setq  scale_c         ' upper
        qdiv  scale_a,scale_b ' upper:lower / scale_b
 _ret_  getqx scale_c         ' put result in scale_c
'
VGA_LUT_LIBRARY_END

        fit $400

#if defined(USB_MESSAGES)
DAT
        orgh
'
' Text strings for event notifications from the USB cog
'
sz_usb_error    byte    "USB error: ", 0
sz_dev_unknown  byte    "Keyboard/mouse boot protocol not supported", 0
sz_kb_ready     byte    "Keyboard interface configured", 0
sz_m_ready      byte    "Mouse interface configured", 0
sz_kbm_ready    byte    "Keyboard and mouse interfaces configured", 0
sz_disconnect   byte    "Device disconnected", 0
sz_usb_started  byte    "USB low/full speed keyboard/mouse cogs started", 0
sz_usb_no_cog   byte    "No cog available for USB", 0
   alignl
#endif

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

