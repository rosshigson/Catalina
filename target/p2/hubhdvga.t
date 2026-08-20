'
' Constants for the HD VGI plugin
'
CON

' Define text geometry (in tiles):

HDVGA_COLS  = 120
HDVGA_ROWS  = 68 ' NOTE: this is rows of tiles, not rows of chars!
HDVGA_CELLS = HDVGA_ROWS*HDVGA_COLS

' Define the default colors (ANSI White on ANSI Navy Blue):
'  (see https://jonasjacek.github.io/colors/)

DEFAULT_FG = 15  ' WHITE
DEFAULT_BG = 4   ' NAVY (for consistency between modes, use only 0 .. 7)

' define maximum graphics geometry (in tiles) - the actual geometry
' can be less if desired:

MAX_COLS = 120
MAX_ROWS = 68

VIRT_TILES = MAX_ROWS*MAX_COLS

#if !defined(GRAPHIC_TILES) 
' At least 2 tiles are required to initialize cursors. 
' Additonal tiles can be added at run time (see g_addtiles()). 
' Approx 4400 tiles are required for the larger graphics demos.
GRAPHIC_TILES = 2
#else
#if GRAPHIC_TILES < 2
#error GRAPHIC_TILES MUST BE >= 2
#endif
#endif

' define the graphics primitives:

_setup    = 1
_color    = 2
_width    = 3
_plot     = 4
_line     = 5
_arc      = 6
_vec      = 7
_vecarc   = 8
_pix      = 9
_pixarc   = 10
_text     = 11
_textarc  = 12
_textmode = 13
_fill     = 14
_flush    = 15
_v_clear  = 16
_v_copy   = 17

NUM_GAMEPADS = 2 ' must match graphic2.h

'
' HUB data for the HD VGI plugin
'
DAT
              alignl

CGI_Info
' the CGI_Info address must be written to the CGI_DATA High Hub RAM address 
' when a graphics capable plugin is started. It is used by C functions to find 
' basic information about the graphics window (which may be smaller than the
' actual VGA display). On the Propeller 2 graphics is only supported by the 
' HD_VGA plugin (which are 120 columns by 68 rows). Note that the values here
' are defaults, which may be overridden by the graphics setup function.
CGI_X_Offs   long   0 ' offset of first graphic x tile (updated on setup)
CGI_Y_Offs   long   0 ' offset of first graphic y tile (updated on setup)
CGI_X_Tiles  long   MAX_COLS ' number of graphic x tiles (updated on setup)
CGI_Y_Tiles  long   MAX_ROWS ' number of graphic y tiles (updated on setup)
CGI_X_Total  long   MAX_COLS ' total number of x tiles (not just graphic tiles)
CGI_Y_Total  long   MAX_ROWS ' total number of y tiles (not just graphic tiles)
CGI_PWidth   long   @pixel_width ' (see hubhdgra.t)
CGI_Slices   long   @slices      ' (see hubhdgra.t)
CGI_Palette  long   @palette     ' (see below)
CGI_Colors   long   0 ' TileColors  ' (see below) ' NOW ALLOCATED ON STARTUP
CGI_Screen   long   0 ' Tiles       ' (see below) ' NOW ALLOCATED ON STARTUP

' include the font data:

P1RomFont
' the following include file was made using:
'   bindump p1_font.dat -p " long $" > p1font.inc
#include <p1font.inc>

nFont        long  @P1RomFont[4] ' Note: Currently only use nFont[0]
              

' include the palette data:

palette
' use Ray's modified palette if PALETTE_RAY is defined, 
' otherwise use an XTerm compatible palette:
#if defined(PALETTE_RAY)
#include <palray.inc>
#else
#include <palxterm.inc>
#endif

' mouse data:

MouseData
mousex        long  1920/2
mousey        long  1080/2
MaxX          long  1919
MaxY          long  1079
Mousebuttons  long  0
Kscan1        long  0 ' TBD are these ...
Kscan2        long  0 ' ... used???
mousevis      long  0 ' default is not visible
usb_data_ptr  long  @USB_Data


' THIS IS NOW ALLOCATED FROM FREE_MEM ...
' tiles: 
' this is the map of tiles on display
' 1920x1080 in 16x16 tiles (20 bits tile address, 12 bits color set index)
'              alignl
'Tiles       
'              long    $0[HDVGA_CELLS]
'
'              alignl

' THIS IS NOW ALLOCATED FROM FREE_MEM ...
' tile colors:
' One long for each tile, picks four colors from 256 color palette.
' Note: bytes are read little endian
'              alignl
'TileColors  
'              long    $00_00_00_00[HDVGA_CELLS] 


' cursor data:
' This is 4bpp buffer for cursor on top of 2bpp tiles converted to 4bpp.
              alignl
CursorData  
              long    $07FFF700[32*4]  ' 32 pixels tall (two 2bpp tiles) 
                                       ' by 32 pixels wide (two 2bpp tiles)
' cursor source:
' Right now, this is just 8 pixels wide, but code could be modified 
' to allow up to 16 pixels wide
' Note:  By using the upper two bits of 4bpp pixel data for cursor, 
'        can just do a simple OR to merge 2bpp and cursor data
              alignl
CursorSource  
              long    $00000000,$00000007
              long    $00000000,$00000077
              long    $00000000,$000007F7
              long    $00000000,$00007FF7
              long    $00000000,$0007FFF7
              long    $00000000,$007FFFF7
              long    $00000000,$07FFFFF7
              long    $00000000,$7FFFFFF7
              long    $00000007,$FFFFFFF7
              long    $00000077,$77FFFFF7
              long    $00000000,$07FFFFF7
              long    $00000000,$7FFF77F7
              long    $00000000,$7FF70077
              long    $00000007,$FFF70007
              long    $0000007F,$FF700000
              long    $00000777,$77000000

' tile buffer:
' pixel output buffer.  1920 of 2bpp tile data (16 lines)
' plus extra longs to define mouse cursor data
TileBuffer1 
              long   $FFFFFF00[((HDVGA_COLS+6)*16)]

