{{

+------------------------------------------+
¦ TV_Text_Half_Height V1.0                 ¦
¦ Copyright (c) 2006 Parallax, Inc.        ¦               
¦ See end of file for terms of use.        ¦                
+------------------------------------------+

This is basically Parallax's TV_Text.spin but with a few minor changes by me ( Jim Bagley ) , in setup, to allow not only pin setup, but PAL/NTSC mode, and Tile Width and Height.

added interlace variable in start
added PAL forcing HX to 5 instead of 4 for displays =<40 width
added ink(PEN)   to save having to do out($0c) and out(pen)
added inkblock(X,Y,W,H,PEN) which sets attributes on screen starting at X,Y and width W, height H, setting text in that area to be colour PEN  

'' modified for Catalina by the removal of VAR space and unused SPIN methods -
'' data block, screen and color data must be provided by a higher level object.
'' Also, now uses common definitions. 


}}

''*****************************
''*  TV Text 40x30 v1.3       *
''*  (C) 2009 Parallax, Inc.  *
''*****************************

CON

tv_count = 14


MAXCOLS = 40 ' this is to get a max screen buffer, as it can't be allocated and deallocated on the fly.
MAXROWS = 30 ' this is to get a max screen buffer, as it can't be allocated and deallocated on the fly.
'MAXCOLS_PAL = 54 ' you can change hx to 6
'MAXROWS_PAL = 35
'MAXCOLS_NTSC = 44
'MAXROWS_NTSC = 30
  
{

VAR


  long  col, row, color, flag
  
  word  screen[MAXCOLS * MAXROWS]
  long  colors[8 * 2]

  long  tv_status     '0/1/2 = off/invisible/visible              read-only   (14 longs)
  long  tv_enable     '0/non-0 = off/on                           write-only
  long  tv_pins       '%pppmmmm = pin group, pin group mode       write-only
  long  tv_mode       '%tccip = tile,chroma,interlace,ntsc/pal    write-only
  long  tv_screen     'pointer to screen (words)                  write-only      
  long  tv_colors     'pointer to colors (longs)                  write-only                            
  long  tv_ht         'horizontal tiles                           write-only                            
  long  tv_vt         'vertical tiles                             write-only                            
  long  tv_hx         'horizontal tile expansion                  write-only                            
  long  tv_vx         'vertical tile expansion                    write-only                            
  long  tv_ho         'horizontal offset                          write-only                            
  long  tv_vo         'vertical offset                            write-only                            
  long  tv_broadcast  'broadcast frequency (Hz)                   write-only                            
  long  tv_auralcog   'aural fm cog                               write-only                            

  word  cols
  word  rows

  word  screensize
  word  lastrow

}

  tv_pins = 2
  tv_mode = 3
  tv_screen = 4
  tv_colors = 5
  tv_width = 6
  tv_height = 7
  tv_hx = 8

  cols = MAXCOLS
  rows = MAXROWS

OBJ

  tv : "TV_Half_Height"


PUB start(tv_block,basepin,screen,colors,ntsc_pal,interlaced,width,height) : okay

'' Start terminal - starts a cog
'' returns false if no cog available

  if width>MAXCOLS
    width:=MAXCOLS
  if height>MAXROWS
    height:=MAXROWS

  longmove(tv_block, @tv_params, tv_count)

  long[tv_block][tv_pins] := (basepin & $38) << 1 | (basepin & 4 == 4) & %0101
  long[tv_block][tv_screen] := screen
  long[tv_block][tv_colors] := colors
  long[tv_block][tv_mode]:=%10000+((interlaced&1)<<1)+(ntsc_pal&1) 'set Interlace, PAL or NTSC ( also sets 16x16 full size tile )
  long[tv_block][tv_width]:=width 'set cols
  long[tv_block][tv_height]:=height 'sets rows
  long[tv_block][tv_hx]:=4
  if(ntsc_pal and width=<40)
    long[tv_block][tv_hx]:=5
  okay := tv.start(tv_block)    


DAT

tv_params               long    0               'status
                        long    1               'enable
                        long    0               'pins
                        long    %10010          'mode
                        long    0               'screen
                        long    0               'colors
                        long    40              'hc
                        long    30              'vc
                        long    4               'hx
                        long    1               'vx
                        long    0               'ho
                        long    0               'vo
                        long    0               'broadcast
                        long    0               'auralcog


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

