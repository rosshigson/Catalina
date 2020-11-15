{{
'-------------------------------------------------------------------------------
'
' Catalina CGI Plugin - TV
'
' This plugin provides Catalina with access to some basic CGI drivers: 
'   - tv
'   - graphics
'
' Version 2.8 - initial version by Ross Higson
'
'-------------------------------------------------------------------------------
}}
CON
'
' Location to store address of CGI Data Block, and X & Y tile size
'
   CGI_DATA   = common#CGI_DATA

'
' PAL/Interlace flags & TV Pins
'
  NTSC_PAL    = common#NTSC_PAL
  INTERLACE   = common#INTERLACE
  TV_PIN      = common#TV_PIN
'
' Screen Geometry:
'
  x_tiles     = common#X_TILES
  y_tiles     = common#Y_TILES

  tv_count    = tv#paramcount ' size of tv_data (LONGs)
'
' Offsets into CGI Data Block
'
  cgi_base    = 0 ' offset of display bitmap

#ifdef DOUBLE_BUFFER
  cgi_dbit    = cgi_base + ((x_tiles * y_tiles) * 16 * 16 * 2) / 8 ' offset of double buffer bitmap
#else
  cgi_dbit    = cgi_base ' double buffer bitmap not required
#endif

  cgi_scrn    = cgi_dbit + ((x_tiles * y_tiles) * 16 * 16 * 2) / 8 ' offset of screen
  
  cgi_clrs    = cgi_scrn + (x_tiles * y_tiles * 2) ' offset of colors

  cgi_tv_data = cgi_clrs + 64 * 4 ' offset of tv_data

'
' Offsets into tv_data (tv_params)
'
  tv_pins = 2
  tv_mode = 3
  tv_screen = 4
  tv_colors = 5
'
' CGI Data Block Size (Bytes)
'
  BYTE_SIZE = cgi_tv_data + 4 * tv_count
                                            

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

OBJ

  common : "Catalina_Common"
  count  : "Catalina_CogCount"
  tv     : "TV"
  gr     : "Catalina_Graphics"

PUB Start (data) : cog | freecogs, i, dx, dy 
 
  ' NOTE : data must be aligned on a 128 byte boundary!

  ' store the CGI block address and the X, Y tiles sizes (for later use)
  long[CGI_DATA] := (x_tiles << 24) + (y_tiles << 16) + data
  
  ' start the TV driver

  longmove(data + cgi_tv_data, @tv_params, tv_count)
  long[data + cgi_tv_data][tv_pins] := (TV_PIN & $38) << 1 | (TV_PIN & 4 == 4) & %0101
  long[data + cgi_tv_data][tv_mode] := ((INTERLACE&1)<<1)+(NTSC_PAL&1) 'set Interlace, PAL or NTSC
  long[data + cgi_tv_data][tv_screen] := data + cgi_scrn
  long[data + cgi_tv_data][tv_colors] := data + cgi_clrs
  
  ' identify currently free cogs
  freecogs := count.Free_Cog_Bits
  ' start underlying keyboard driver
  cog := tv.start(data + cgi_tv_data)
  ' register any cogs which were free but are now used as screen cogs
  common.Multiple_Register(freecogs & !count.Free_Cog_Bits, common#LMM_SCR)
  
  'init colors (to defaults)
  repeat i from 0 to 63
    long[data + cgi_clrs][i] := $00001010 * (i+4) & $F + $2B060C02

  'init tile screen
  repeat dx from 0 to x_tiles - 1
    repeat dy from 0 to y_tiles - 1
      word[data + cgi_scrn][dy * x_tiles + dx] := (data + cgi_base) >> 6 + dy + dx * y_tiles + ((dy & $3F) << 10)

  ' start the CGI driver - note that the "setup" service must be called from C!
  if cog 
    cog := gr.Start(Common#REGISTRY)
  
    if (cog => 0)

      ' plugin ready - register it
      common.Register(cog, common#LMM_CGI)

    cog += 1

DAT

tv_params               long    0               'status
                        long    1               'enable
                        long    0               'pins
                        long    0               'mode
                        long    0               'screen
                        long    0               'colors
                        long    x_tiles         'hc
                        long    y_tiles         'vc
                        long    10              'hx
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

