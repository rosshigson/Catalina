''***************************************
''*  TV Text 40x13 v1.0                 *
''*  Author: Chip Gracey                *
''*  Copyright (c) 2006 Parallax, Inc.  *               
''*  See end of file for terms of use.  *               
''***************************************

'' modified for Catalina by the removal of VAR space and unused SPIN methods -
'' data block, screen and color data must be provided by a higher level object 
'' Also, added ntsc_pal & interlaced parameters. 

CON

  cols = 40
  rows = 13

  tv_count = 14

{
VAR
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
}

  tv_pins = 2
  tv_mode = 3
  tv_screen = 4
  tv_colors = 5
  

OBJ

  tv : "TV"


PUB start(tv_block, basepin, screen, colors,ntsc_pal,interlaced) : okay

'' Start terminal - starts a cog
'' returns false if no cog available

  longmove(tv_block, @tv_params, tv_count)
  long[tv_block][tv_pins] := (basepin & $38) << 1 | (basepin & 4 == 4) & %0101
  long[tv_block][tv_mode]:=%10000+((interlaced&1)<<1)+(ntsc_pal&1) 'set Interlace, PAL or NTSC
  long[tv_block][tv_screen] := screen
  long[tv_block][tv_colors] := colors
  
  okay := tv.start(tv_block)

DAT

tv_params               long    0               'status
                        long    1               'enable
                        long    0               'pins
                        long    0               'mode
                        long    0               'screen
                        long    0               'colors
                        long    cols            'hc
                        long    rows            'vc
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

