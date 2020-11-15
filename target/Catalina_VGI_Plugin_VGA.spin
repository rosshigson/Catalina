{{
'-------------------------------------------------------------------------------
'
' Catalina VGI Plugin - Virual VGA
'
' This plugin provides Catalina with access to some basic VGI drivers: 
'   - virtual_vga
'   - graphics
'
' Version 3.8 - initial version by Ross Higson
'
'-------------------------------------------------------------------------------
}}
CON
'
' Location to store address of VGI Data Block, and X & Y tile size
'
   CGI_DATA   = common#CGI_DATA

'
' VGA Pins and Colour mode (define symbol VGA_4_COLOUR for 4 color mode)
'
  VGA_PIN     = common#VGA_PIN

#ifdef VGA_4_COLOUR
  COLOUR_MODE = 1
#elseifdef VGA_4_COLOR
  COLOUR_MODE = 1
#else
  COLOUR_MODE = 0
#endif

'
' VGA Constants (define symbol VGA_800, VGA_1024 or VGA_1152 - otherwise 480)
'
#ifdef VGA_800

' 800 x 600

  mode = COLOUR_MODE << 3 + %011
  hd = 800
  hf = 40
  hs = 128
  hb = 88
  vd = 600
  vf = 1
  vs = 4
  vb = 23
  px = $2625A00 '40_000_000

#elseifdef VGA_1024

' 1024 x 768 

  mode = COLOUR_MODE << 3 + %000
  hd = 1024
  hf = 24
  hs = 136
  hb = 160
  vd = 768
  vf = 3
  vs = 6
  vb = 29
  px = 64_000_000      'reduces jitter - correct value is 65_000_000 

#elseifdef VGA_1152

' 1152 x 864 

  mode = COLOUR_MODE << 3 + %001
  hd = 1152
  hf = 64
  hs = 112
  hb = 256
  vd = 864
  vf = 6
  vs = 5
  vb = 41
  px = 80_000_000

#else

' 640 x 480 

  mode = COLOUR_MODE << 3 + %000
  '    72Hz       60Hz
  hd = 640        '640
  hf = 24         '16
  hs = 40         '96
  hb = 128        '48
  vd = 480        '480
  vf = 9          '10
  vs = 3          '4
  vb = 28         '33
  px = 31_500_000 '25_000_000

#endif

'
' Screen Geometry (calculated from COLOUR and VGA modes):
'
  X_TILES      = hd / (32>>COLOUR_MODE) 
  Y_TILES      = vd / 16 

  vga_count    = vga#paramcount ' size of vga_data (LONGs)

  map_bytes    = 2 * x_tiles * y_tiles ' size of tile map in bytes

  map_padded   = 4 * ((map_bytes + 3) / 4) ' pad to longs (for alignment)

'
' Offsets into VGI Data Block - note that the order of these is
' very significant - we must not overwrite the early parts of the
' datablock from Spin, since the datablock may overlay the Spin
' startup code. Therefore, we put the parts that must be initialized
' in Spin LAST, after the parts that remain uninitialized till C starts.
'
#ifdef DOUBLE_BUFFER

  vgi_onscrn   = 0                                    ' x*y words 

  vgi_offscrn  = vgi_onscrn  + map_padded             ' x*y words (padded)

#else

  vgi_offscrn  = 0                                    ' x*y words (padded)

#endif

  vgi_map      = vgi_offscrn  + map_padded            ' x*y words (padded)

  vgi_mode     = vgi_map      + map_padded            ' 1 long

  vgi_vga_data = vgi_mode     + 4                     ' vga_count longs

  vgi_clrs     = vgi_vga_data + 4 * vga_count         ' 16 longs (only one used)

  vgi_line_1   = vgi_clrs     + 4 * 16                ' x longs   

  vgi_line_2   = vgi_line_1   + 4 * x_tiles           ' x longs

  vgi_line_3   = vgi_line_2   + 4 * x_tiles           ' x longs

  vgi_line_4   = vgi_line_3   + 4 * x_tiles           ' x longs

  vgi_scrn     = vgi_line_4   + 4 * x_tiles           ' 8 longs

  vgi_line_req = vgi_scrn     + 4 * 8                 ' 1 long

  vgi_line_buf = vgi_line_req + 4                     ' 1 long

  BYTE_SIZE    = vgi_line_buf + 4


'
' Offsets into vgi_vga_data (vga_params)
'
  vga_pins   = 2
  vga_mode   = 3
  vga_screen = 4
  vga_colors = 5

OBJ

  common : "Catalina_Common"
  vga    : "Catalina_Virtual_VGA"
  gr     : "Catalina_Virtual_Graphics"

PUB Start (data) : cog | okay, i, dx, dy 
 
  ' NOTE : data must be aligned on a 128 byte boundary!

  ' store the VGI block address and the X, Y tiles sizes (for later use).
  ' note that we store the 'vgi_offscrn' address - if double buffering is
  ' in use, then from C the 'vgi_offscrn' buffer will be a negative offset 
  ' from this value.
  long[CGI_DATA] := (x_tiles << 24) + (y_tiles << 16) + data + vgi_offscrn

  long[data + vgi_mode]     := COLOUR_MODE
  long[data + vgi_line_req] := 0
  long[data + vgi_line_buf] := 0

  ' init screen
  long[data + vgi_scrn][0]  := data + vgi_line_req
  long[data + vgi_scrn][1]  := data + vgi_line_buf
#ifdef DOUBLE_BUFFER
  long[data + vgi_scrn][2]  := data + vgi_onscrn
#else
  long[data + vgi_scrn][2]  := data + vgi_offscrn
#endif
  long[data + vgi_scrn][3]  := data + vgi_line_1
  long[data + vgi_scrn][4]  := data + vgi_line_2
  long[data + vgi_scrn][5]  := data + vgi_line_3
  long[data + vgi_scrn][6]  := data + vgi_line_4
  long[data + vgi_scrn][7]  := data + vgi_map

  'init colours - colour 1 is white so it can be used in 2 or 4 colour mode
  repeat i from 0 to 15
    long[data + vgi_clrs][i] := %11000000_00110000_11111100_00000100
  
  ' start the Virtual VGA driver
  longmove(data + vgi_vga_data, @vga_params, vga_count)
  long[data + vgi_vga_data][vga_screen] := data + vgi_scrn
  long[data + vgi_vga_data][vga_colors] := data + vgi_clrs

  okay := vga.start(data + vgi_vga_data)

  ' start the VGI plugin - note that the "setup" service must be called from C!
  if okay
    cog := gr.Start

DAT

vga_params              long    0               'status
                        long    0               'enable (we start disabled)
                        long    VGA_PIN | %000_111 'pins
                        long    mode
                        long    0               'screen
                        long    0               'colors
                        long    x_tiles         'hc
                        long    y_tiles         'vc
                        long    1               'hx
                        long    1               'vx
                        long    0               'ho
                        long    0               'vo
                        long    hd
                        long    hf
                        long    hs
                        long    hb
                        long    vd
                        long    vf
                        long    vs
                        long    vb
                        long    px


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

