{{
'-------------------------------------------------------------------------------
'
' Catalina Full HD VGA HMI Plugin - HDVGA
'
' This plugin is Based on the original 1080p 2bpp Tile Driver
' developed by Raymond Allen 2020..2023
'
' This plugin provides Catalina with access to some basic HMI services: 
'
'   - keyboard
'   - mouse
'   - gamepad
'   - screen
'   - graphics
'
' It is intended to use the P2-ES accessory boards (i.e. the A/V board for
' VGA and the Host Serial board for USB ports). It is configured by setting
' the following values in platform.inc
'
'    _VGA_PIN_BASE : base pin to use for VGA
'    _USB_PIN_BASE : base pin to use for USB ports
'
' This HMI plugin automatically starts the VGA tile driver, VGA line driver,
' VGA color driver and a graphics driver, and either none, one or two USB port
' drivers. If only one USB driver is started, it will use port A (the port 
' closest to the board) but this port can be used for one keyboard, one mouse 
' and up to four gamepads via he use of a suitable USB hub. 
'
' If two USB port drivers are started then either port A or port B can be used
' for the keyboard or mouse, but all gamepads will still have to use the one
' USB port via the use of a suitable USB hub. Do not connect two USB keyboards
' or two USB mice - they will interfere with each other.
'
' Only one USB driver is started if either the NO_MOUSE or NO_KEYBOARD Catalina 
' symbols are defined on the command line. No USB ports are started if both 
' these symbols plus NO_GAMEPAD are ALL defined. Note that the use of these
' symbols is deprecated - use USE_USB_A and/or USE_USB_B instead.
'
' Note that this driver supports up to 4 game pads, which will be identified
' by their port number, which can be 0 .. 7. To check which gamepads are 
' actually connected, use the g_present() service to poll all 8 possible 
' port numbers.
'
' Note that this driver requires MHZ_260 or faster - MHZ_297 is preferred.
'
' The following Catalina symbols affect this plugin:
'
' HD_VGA                        : 1092 x 1080 (i.e. 1080p) Full HD VGA.
'
' MHZ_260                       : Minimum required for HD VGA
'
' MHZ_297                       : Recommended for HD VGA
'
' P2_REV_A                      : Required for Rev A silicon
'
' NO_KEYBOARD                   : Omit keyboard support code and one USB driver
' NO_MOUSE                      : Omit mouse support code and one USB driver
' NO_GAMEPAD                    : Omit gamepad support
'
' NO_CR_TO_LF                   : Do not convert CR to LF (on input)
'
' CR_ON_LF                      : Convert CR to CR LF (on output)
'
' USE_USB_A                     : enable USB port A.
'
' USE_USB_B                     : enable USB port B.
'
' Version 9.0 - Initial version.
'
'-------------------------------------------------------------------
'
'   The Full HD VGA screen is always 1092 x 1080 pixels, and uses tiles of
'   16 pixels wide and 16 pixels high. Characters use two vertical tiles,
'   and so are 16 pixels wide by 32 bixels high. This makes the sceeen a
'   fixed geometry of 33.75 rows by 120 columns. However, usage for text 
'   is limited in software to 33 rows, since the last row cannot be fully 
'   displayed. When text output is set to scroll or wrap, it does so at 
'   text row 33.
'
'   The plugin supports 3 cursors:
'   -  cursor 0 and 1 are character cursors used to identify character calls
'      in the range x (columns) of 0 .. 119 and y (rows) of 0 .. 68
'   -  cursor 2 is a graphics cursor used to identify pixels in the range
'      x of 0 .. 1919 and y of 0 .. 1080
'
'   The cursor modes supported by this plugin (which can be set by the
'   t_mode service) are as follows:
'
'      %xx00 = cursor off (text cursor 1 and graphics cursor only)
'      %xx01 = cursor on (text cursor 1 and graphics cursor)
'      %xx10 = cursor on, blink slow (text cursor 1 only)
'      %xx11 = cursor on, blink fast (tect cursor 1 only)
'      %x0xx = cursor is solid block (text cursor 1 only)
'      %x1xx = cursor is underscore (text cursor 1 only)
'      %0xxx = cursor wraps at end of screen (text cursor 0 or 1)
'      %1xxx = cursor scrolls at end of screen (text cursor 0 or 1)
'
' The cursor visibility/shape bits affect text cursor 1 (the visible cursor)
' and the visibility bit also affects the graphics cursor. Text cursor 0 is 
' always invisible, and by default wraps at the end of the screen. Cursor 1 
' is by default a visible slow blinking block cursor which scrolls at the 
' end of the screen. Cursor 2 is the graphic cursor (an arrow) and is
' used only to identify an x and y position on the screen (up to 11 bits
' each) and is not used for character output. However, either the visible
' or invisible cursor can be set to the current location of the graphics 
' cursor by dividing the cursor x location by 16 or the cursor y location
' by 32.
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
' This plugin supports a fixed palette of 256 color codes (0 .. 255) which
' is set up to use the XTerm color palette. This plugin supports only the
' t_color() service (which specifies both fg and bg color simultaneously).
' It does not support t_color_fg() and t_color_bg() services.
'
' This plugin supports gamepad services. All gamepads must be on the same
' USB port and must use ports 0 .. 7, but only the first 4 gamepads detected
' are supported by the plugin. To detect which gamepads are present, use the 
' g_present() service and poll all 8 possible ports.
'
' This plugin supports a graphics service, which is a long service that
' takes one of the following graphics functions, plus a pointer to the
' arguments accepted by the graphics function:
'
'    1  = setup
'    2  = color 
'    3  = width 
'    4  = plot  
'    5  = line  
'    6  = arc   
'    7  = vec   
'    8  = vecarc
'    9  = pix 
'   10 = pixarc
'   11 = text  
'   12 = textarc
'   13 = textmode
'   14 = fill  
'   15 = loop   
'   16 = v_clear
'   17 = v_copy
'
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
'rslt: cols<<8 + rows

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

'name: t_setpos
'code: 28
'type: short request
'data: curs<<23 + gcurs<<22 + col<<8 + row (if gcurs == 0) 
'  or: xpos<<11 + ypos (if gcurs == 1)
'rslt: 0 = ok

'name: t_getpos
'code: 29
'type: short request
'data: curs<<23 + gcurs<<22
'rslt: col<<8 + row (if gcurs == 0)
'  or: xpos<<11 + ypos (if gcurs == 1)

'name: t_mode
'code: 30
'type: short request
'data: curs<<23 + gcurs<<22 + mode
'rslt: 0 = ok

'name: t_scroll
'code: 31
'type: short request
'data: count<<16 + firstrow<<8 + lastrow
'rslt: 0 = ok

'name: t_color
'code: 32
'type: short request
'data: curs<<22 + color (color = bg<<8 + fg
'rslt: 0 = ok

'name: t_graphics
'code: 35
'type: long request
'data: graphic_function<<24 + argument_ptr
'rslt: 0 = ok

'---------------------------------------------------------
' Gamepad services:
'
'name: g_present
'code: 36
'type: short request
'data: port (0 .. 7)
'rslt: 0 if no gamepad present on the specified port, 1 if present

'name: g_buttons
'code: 37
'type: short request
'data: port (0 .. 7)
'rslt: 16 bits of buttons

'name: g_abs_x
'code: 38
'type: short request
'data: port (0 .. 7)
'rslt: up to 16 bits of x axis value (signed)

'name: g_abs_y
'code: 39
'type: short request
'data: port (0 .. 7)
'rslt: up to 16 bits of y axis value (signed)

'name: g_abs_z
'code: 40
'type: short request
'data: port (0 .. 7)
'rslt: up to 16 bits of z axis value (signed) if supported

'---------------------------------------------------------
}}

' the actual HD VGA tile driver components ...

#if !defined(SMALL)
#include "coghdvga.t"
#include "coghdgra.t"
#include "coghdcol.t"
#include "coghdlin.t"
#endif

' the actual USB driver - note that we can use either port A or port B
' for the keyboard or mouse - but the support code will be omitted if
' -C NO_KEYBOARD and/or -C NO_MOUSE are specified on the command line.
' However, if only one port is to be used, it can now be specified
' by also using USE_USB_A and USE_USB_B.

#if defined(USE_USB_A) || defined(USE_USB_B)

' this is the NEW way to select whether to USE_USB_A and/or USE_USB_B
#if defined(USE_USB_A) && !defined(SMALL)
#include <cogkbma.t2>
#endif
#if defined(USE_USB_B) && !defined(SMALL)
#include <cogkbmb.t2>
#endif

#else

' this is the OLD way to select whether to USE_USB_A and/or USE_USB_B
' i.e. A and B are BOTH used unless NO_KEYBOARD or NO_MOUSE is specified,
'      with only A being used if only one of these is specified
#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
#if !defined(USE_USB_A) && !defined(SMALL)
#define USE_USB_A
#include <cogkbma.t2>
#endif
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#if !defined(USE_USB_B) && !defined(SMALL)
#define USE_USB_B
#include <cogkbmb.t2>
#endif
#endif
#endif

#endif

#if !defined (MHZ_297) 
#if !defined (_CLOCK_XTAL) || !defined(_CLOCK_XDIV) || !defined(_CLOCK_MULT) || !defined (_CLOCK_DIVP) || ((((_CLOCK_XTAL / _CLOCK_XDIV) * _CLOCK_MULT) / _CLOCK_DIVP) < 260000000)
#error CLOCK MUST BE 260MHz OR HIGHER FOR HD VGA - 297MHz RECOMMENDED (E.G. USE -C MHZ_297) 
#endif
#endif

CON

#include "constant.inc"

' setup function for HMI

DAT
        orgh
        alignl

HMI_Setup
 mov     r0, ##@CGI_Info ' initialize ...
 wrlong  r0,##CGI_DATA   ' ... CGI_DATA

 rdlong  r0,##FREE_MEM
 sub     r0,##HDVGA_CELLS*4    ' allocate tiles block
 andn    r0,#$3                  ' FREE_MEM should always be long aligned
 wrlong  r0,##FREE_MEM
 'mov     r0,##@Tiles
 wrlong  r0,##@iTiles            ' save it in startup data
 wrlong  r0,##@itile_addr        ' save it in startup data
 wrlong  r0,##@CGI_Screen        ' save it in startup data
 mov     r1,##HDVGA_CELLS
.loop1
 wrlong  #0,r0
 add     r0,#4
 djnz    r1,#.loop1

 rdlong  r0,##FREE_MEM
 sub     r0,##HDVGA_CELLS*4    ' allocate colors block
 andn    r0,#$3                  ' FREE_MEM should always be long aligned
 wrlong  r0,##FREE_MEM
 'mov     r0,##@TileColors
 wrlong  r0,##@iTileColors       ' save it in startup data
 wrlong  r0,##@CGI_Colors        ' save it in startup data
 wrlong  r0,##@icolor_addr       ' save it in startup data
 mov     r1,##HDVGA_CELLS
.loop2
 wrlong  #0,r0
 add     r0,#4
 djnz    r1,#.loop2

 mov     r6,#16 ' i.e. any cog
 setq    ##@iMouseData
 coginit r6, ##@HD_VGA_LINE_START wc
 wrlong  r6,##@iScanCog
 shl     r6,#2                  ' point to ...
 add     r6,##REGISTRY          ' ... registry entry
 rdlong  r0,r6                  ' register ...
 and     r0,##$FFFFFF           ' ... as ...
 or      r0,##LMM_VGI<<24       ' ... VGI ...
 wrlong  r0,r6                  ' plugin

 mov     r6,#17 ' i.e. any cog PAIR!
 coginit r6, ##@HD_PAIR_START wc
 shl     r6,#2                  ' point to registry entry ...
 add     r6,##REGISTRY          ' ... of first cog
 rdlong  r0,r6                  ' register first cog ...
 and     r0,##$FFFFFF           ' ... as ...
 or      r0,##LMM_VGI<<24       ' ... VGI ...
 wrlong  r0,r6                  ' ... plugin
 add     r6,#4                  ' register ...
 rdlong  r0,r6                  ' ... secong cog ...
 and     r0,##$FFFFFF           ' ... as ...
 or      r0,##LMM_VGI<<24       ' ... VGI ...
 wrlong  r0,r6                  ' ... plugin

#if defined(USE_USB_A)
  drvl #USB_A_BASE_PIN+1
  waitx ##_CLOCKFREQ/20 ' 50 ms ' force hub/gamepad reset
  drvh #USB_A_BASE_PIN+1
 mov     r6,#%10000 ' i.e. any cog
 coginit r6, ##@A_usb_host_start wc
 shl     r6,#2                  ' point to ...
 add     r6,##REGISTRY          ' ... registry entry
 rdlong  r0,r6                  ' register ...
 and     r0,##$FFFFFF           ' ... as ...
 or      r0,##LMM_USB<<24       ' ... USB ...
 wrlong  r0,r6                  ' plugin
#endif

#if defined(USE_USB_B)
  drvl #USB_B_BASE_PIN+1
  waitx ##_CLOCKFREQ/20 ' 50 ms ' force hub/gamepad reset
  drvh #USB_B_BASE_PIN+1
 mov     r6,#%10000 ' i.e. any cog
 coginit r6, ##@B_usb_host_start wc
 shl     r6,#2                  ' point to ...
 add     r6,##REGISTRY          ' ... registry entry
 rdlong  r0,r6                  ' register ...
 and     r0,##$FFFFFF           ' ... as ...
 or      r0,##LMM_USB<<24       ' ... USB ...
 wrlong  r0,r6                  ' plugin
#endif

 mov     r6,#16 ' i.e. any cog
 setq    ##@iRegAddr
 coginit r6, ##@GRAPHICS_START wc

 mov     r0, ##@HMI_Service_Table
 call    #Register_Services
 ret

DAT
 org 0
' start two cogs, who then restart themselves as the color and vga cogs 
' (we have to do this because they must share the LUT)
HD_PAIR_START
 drvl #60
.cog    cogid .cog                  ' get our cog number
 cmp .cog,#1 wz
 if_z drvl #58
 if_nz drvl #59
.color  mov   .color,.cog           ' calculate ...
        or    .color,#1             ' ... second cog of pair
        wrlong .color,##@iColorCog  ' save this as the color cog number  
        test   .cog,#1 wz           ' if we are the first cog ...
   if_z jmp #.vga                   ' ... we must be the vga cog
        setq ##@iTileColors         ' otherwise restart ourselves ...
        coginit .cog, ##@HD_VGA_COLOR_START ' ... as the color cog
        cogstop .cog                ' should never get here!
.vga
        
        setq ##@iColorCog           ' restart ourselves ...
        coginit .cog, ##@HD_VGA_START  ' ... as the vga cog
        cogstop .cog                ' should never get here!
DAT
  orgh
  alignl
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
   byte SVC_T_GRAPHICS, 35
   byte SVC_G_PORT    , 36
#ifndef NO_GAMEPAD
   byte SVC_G_BUTTONS , 37
   byte SVC_G_ABS_X   , 38
   byte SVC_G_ABS_Y   , 39
   byte SVC_G_ABS_Z   , 40
#endif
   byte 0             , 0
 
   alignl

' initialization data for vga, line and color cogs:

iColorCog     long  0             ' initialized during startup
iScanCog      long  0             ' initialized during startup
iMouseData    long  @MouseData    ' 
iTileBuffer   long  @TileBuffer1  '
iCursorSource long  @CursorSource ' one long wide, 16 longs tall
iCursorData   long  @CursorData   ' four longs wide,  32 longs tall
iTiles        long  0'@Tiles      ' now initialized during statup
iTileColors   long  0'@TileColors ' now initialized during startup
iPalette      long  @palette      '
iFont         long  @nFont        '

' initialization data for GRAPHICS_COG:

iRegAddr        long REGISTRY     ' address of REGISTRY
iTxTiles        long MAX_COLS     ' number of horizontal text tiles
iTyTiles        long MAX_ROWS     ' number of vertical text tiles
ifont_addr      long @font        ' the graphics vector font
itile_font_addr long @nFont       ' the text tile font
itile_addr      long 0'@Tiles       ' now initialized on startup
icolor_addr     long 0'@TileColors  ' now initialized on startup
ipalette_addr   long @palette     ' our palette
imouse_addr     long @MouseData   ' the mouse data

DAT
        org     0


