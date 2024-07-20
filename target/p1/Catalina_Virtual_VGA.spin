''********************************
''*  Virtual VGA Driver v3.8     *
''********************************
''
''REVISION HISTORY
''
'' Rev  Date       Description
'' ---  ---------  -----------------------------------------------------
'' 010   7 Jul 08  First version, based on Parallax VGA Driver v1.0
''                 (supports 2 colour and 4 colour mode)
'' 011  28 Jul 08  Added support for reclaiming RAM
'' 012  02 Aug 08  Improved synchronization with VGA line generators
''                 Fixed timing problem on startup
''
'' 3.8             First Catalina version - remove ramstart/ramend stuff
''
''

CON

  paramcount    = 21
  colortable    = $180          'start of colortable inside cog

  TILE_BITS     = 12            ' virtual VGA uses 12 bits of tile number (instead of the normal 10)
  TILE_MASK     = $0FFF         ' 12 bits of tile number allows for 4096 tiles, necessary for high resolutions
  COLOUR_MASK   = $F000         ' virtual VGA uses 4 bits of colour (instead of the normal 6) for 16 colour combinations

VAR
  ' variables used only during initialization
  long  cogon, cog

OBJ

  common : "Catalina_Common"              ' Common Definitions
  lg   : "Catalina_Virtual_VGA_lg.spin"   'Virtual VGA line generator

PUB Start(vgaptr) : okay

'' Start Virtual VGA driver - starts a cog
'' Returns false if no cog available
''
'' The driver reloads all parameters each refresh,
'' allowing you to make live changes to them.
''
''   vgaptr = pointer to VGA parameters.
''      The color mode is set using bit 3 of the 'vga_mode':
''         0: 2 colour (each pixel is one bit, each tile is 32 x 16 pixels)
''         1  4 colour (each pixel is two bits, each tile is 16 x 16 pixels)
''      The 'vga_screen' parameter now points to an array of 7 longs:
''          screen[0] is the address of the variable indicating which line the driver will display next   
''          screen[1] is the address of the buffer the driver will use next (zero, or the address of one of the buffers 1 - 4)
''          screen[2] is the address of the tile pointer map (tpm)
''          screen[3] is the address of buffer 1 (buffer space 1 for odd lines)
''          screen[4] is the address of buffer 2 (buffer space 2 for odd lines)
''          screen[5] is the address of buffer 3 (buffer space 1 for even lines)
''          screen[6] is the address of buffer 4 (buffer space 2 for even lines)
'' 

{
  stop
}

  'start line generators before starting driver
  'common.Flash_Hex(long[vgaptr][4])
  okay := lg.Start(vgaptr)
  if okay
    okay := cogon := (cog := cognew(@entry,vgaptr)) => 0
    if okay
      common.Register(cog, common#LMM_SCR)

{
PUB stop

'' Stop Virtual VGA driver - frees a cog

  if cogon~
    cogstop(cog)

PUB ramstart
  return @entry

PUB ramend
  return @ram_end

PUB lg_ramstart
  return lg.ramstart

PUB lg_ramend
  return lg.ramend
}

DAT

'****************************************
'* Assembly language Virtual VGA driver *
'****************************************

                        org
'
'
' Entry
'
entry                   mov     vscl,#1                 'ensure deterministic start up ...
                        movi    ctra,#%00001_110        '... of Virtual VGA Driver
                        mov     taskptr,#tasks          'reset tasks

                        mov     x,#5                    'perform task sections initially
:init                   jmpret  taskret,taskptr
                        djnz    x,#:init
'
'
' Superfield
'
superfield              mov     hv,hvbase               'set hv

                        mov     interlace,#0            'reset interlace
 
                        test    _mode,#%100     wz      'get interlace into nz
'
'
' Field
'
field                   wrlong  visible,par             'set status to visible

                        mov     line,#0                 'set line 
                        wrlong  line,line_req_ptr       '... to zero
                        
                        tjz     vb,#:nobl               'do any visible back porch lines
                        mov     x,vb
                        movd    bcolor,#colortable
                        call    #blank_line
:nobl
                        mov     y,_vd                   'set vertical lines (not tiles!)
                        andn    y,#$F                   'display only tile lines
:line                   mov     vx,_vx                  'set vertical expand

:vert   if_nz           xor     interlace,#1            'interlace skip?
        if_nz           tjz     interlace,#:skip

                        tjz     hb,#:nobp               'do any visible back porch pixels
                        mov     vscl,hb
                        waitvid colortable,#0
:nobp
                        rdlong  buff_adr,line_buf_ptr   'get address of line ready for display
                        add     line,#1                 'request ...
                        wrlong  line,line_req_ptr       '... next line

                        mov     x,_ht                   'set horizontal tiles
                        mov     vscl,hx                 'set horizontal expand

                        tjnz    buff_adr,#:do_line      'display line if we have one              
:no_line
                        waitvid colortable, zero        'display blank line (always use color 0)
                        djnz    x,#:no_line             
                        jmp     #:done_line

:do_line
' RJH - implement 4 bits of colour -------------------------------------------------------------- NEW
'
' NOTE : THIS DOESN'T WORK YET - NEED 2 VGA DRIVERS AS WELL AS 2 LINE GENERATORS !!!
'
'                        rdlong  colours,buff_adr        'get colour
'                        add     buff_adr,#4
'                        add     colours,#colortable
'                        movd    :vid_colour,colours
' RJH - implement 4 bits of colour -------------------------------------------------------------- END
                        rdlong  pixels,buff_adr
                        add     buff_adr,#4
                        waitvid colortable, pixels 
                        djnz    x,#:do_line             'another tile?
                        
:done_line
                        tjz     hf,#:nofp               'do any visible front porch pixels
                        mov     vscl,hf
                        waitvid colortable,#0
:nofp

                        mov     x,#1                    'do hsync
                        call    #blank_hsync            '(x=0)

:skip                   djnz    vx,#:vert               'vertical expand?

                        djnz    y,#:line        wc      'another tile line? (c=0)

                        tjz     vf,#:nofl               'do any visible front porch lines
                        mov     x,vf
                        movd    bcolor,#colortable
                        call    #blank_line
:nofl
        if_nz           xor     interlace,#1    wc,wz   'get interlace and field1 into nz (c=0/?)

        if_z            wrlong  invisible,par           'unless interlace and field1, set status to invisible

                        mov     taskptr,#tasks          'reset tasks

                        addx    x,_vf           wc      'do invisible front porch lines (x=0 before, c=0 after)
                        call    #blank_line

                        mov     x,_vs                   'do vsync lines
                        call    #blank_vsync

                        mov     x,_vb                   'do invisible back porch lines, except last
                        call    #blank_vsync

        if_nz           jmp     #field                  'if interlace and field1, display field2
                        jmp     #superfield             'else, new superfield
'
'
' Blank line(s)
'
blank_vsync             cmp     interlace,#2    wc      'vsync (c=1)

blank_line              mov     vscl,h1                 'blank line or vsync-interlace?
        if_nc           add     vscl,h2
        if_c_and_nz     xor     hv,#%01
        if_c            waitvid hv,#0
        if_c            mov     vscl,h2                 'blank line or vsync-normal?
        if_c_and_z      xor     hv,#%01
bcolor                  waitvid hv,#0

        if_nc           jmpret  taskret,taskptr         'call task section (z undisturbed)

blank_hsync             mov     vscl,_hf                'hsync, do invisible front porch pixels
                        waitvid hv,#0

                        mov     vscl,_hs                'do invisble sync pixels
                        xor     hv,#%10
                        waitvid hv,#0

                        mov     vscl,_hb                'do invisible back porch pixels
                        xor     hv,#%10
                        waitvid hv,#0

                        djnz    x,#blank_line   wc      '(c=0)

                        movd    bcolor,#hv
blank_hsync_ret
blank_line_ret
blank_vsync_ret         ret
'
'
' Tasks - performed in sections during invisible back porch lines
'
tasks                   mov     t1,par                  'load parameters
                        movd    :par,#_enable           '(skip _status)
                        mov     t2,#paramcount - 1
:load                   add     t1,#4
:par                    rdlong  0,t1
                        add     :par,d0
                        djnz    t2,#:load               '+164

                        mov     t1,#2                   'set video pins and directions
                        shl     t1,_pins                '(if video disabled, pins will drive low)
                        sub     t1,#1
                        test    _pins,#$20      wc
                        and     _pins,#$38
                        shr     t1,_pins
                        movs    vcfg,t1
                        shl     t1,_pins
                        shr     _pins,#3
                        movd    vcfg,_pins
        if_nc           mov     dira,t1
        if_nc           mov     dirb,#0
        if_c            mov     dira,#0
        if_c            mov     dirb,t1                 '+14

#ifdef ENABLE_VGA
        or      dira, vga_enable
        andn    outa, vga_enable
#endif

                        tjz     _enable,#disabled       '+2, disabled?

                        jmpret  taskptr,taskret         '+1=181, break and return later

                        rdlong  t1,#0                   'make sure CLKFREQ => 16MHz
                        shr     t1,#1
                        cmp     t1,m8           wc
        if_c            jmp     #disabled               '+8

                        min     _rate,pllmin            'limit _rate to pll range
                        max     _rate,pllmax            '+2

                        mov     t1,#%00001_011          'set ctra configuration
:max                    cmp     m8,_rate        wc      'adjust rate to be within 4MHz-8MHz
        if_c            shr     _rate,#1                '(vco will be within 64MHz-128MHz)
        if_c            add     t1,#%00000_001
        if_c            jmp     #:max
:min                    cmp     _rate,m4        wc
        if_c            shl     _rate,#1
        if_c            sub     x,#%00000_001
        if_c            jmp     #:min
                        movi    ctra,t1                 '+22

                        rdlong  t1,#0                   'divide _rate/CLKFREQ and set frqa
                        mov     hvbase,#32+1
:div                    cmpsub  _rate,t1        wc
                        rcl     t2,#1
                        shl     _rate,#1
                        djnz    hvbase,#:div            '(hvbase=0)
                        mov     frqa,t2                 '+136

                        test    _mode,#%001     wc      'make hvbase
                        muxnc   hvbase,vmask
                        test    _mode,#%010     wc
                        muxnc   hvbase,hmask            '+4

                        rdlong  line_req_ptr,_screen
                        add     _screen, #4
                        rdlong  line_buf_ptr,_screen
                        add     _screen, #4

                        jmpret  taskptr,taskret         'break and return later

                        mov     hx,_hx                  'compute horizontal metrics

' RJH - 4 color mode ---------------------------------------------------------------------- OLD
'                        shl     hx,#8                  ' 4 colour
'                        or      hx,_hx
'                        shl     hx,#4
' RJH - 2 color mode ---------------------------------------------------------------------- NEW
'                        shl     hx,#7                  ' 2 colour
'                        or      hx,_hx
'                        shl     hx,#5
' RJH - 2 or 4 color mode ----------------------------------------------------------------- NEW
                        test    _mode,#%1000    wc      ' test for 2 or 4 colour 
              if_c      shl     hx,#8
              if_nc     shl     hx,#7
                        or      hx,_hx
              if_c      shl     hx,#4
              if_nc     shl     hx,#5
' RJH ------------------------------------------------------------------------------------- END

                        mov     hc2x,_ht
                        shl     hc2x,#1

                        mov     h1,_hd
                        neg     h2,_hf
                        sub     h2,_hs
                        sub     h2,_hb
                        sub     h1,h2
                        shr     h1,#1           wc
                        addx    h2,h1

' RJH - 4 color mode ---------------------------------------------------------------------- OLD
'                       mov     t1,_ht                   ' 4 colour
' RJH - 2 color mode ---------------------------------------------------------------------- NEW
'                        mov     t1,hc2x                 ' 2 colour
' RJH - 2 or 4 color mode ----------------------------------------------------------------- NEW
                        test    _mode,#%1000    wc      ' test for 2 or 4 colour
              if_c      mov     t1,_ht          
              if_nc     mov     t1,hc2x
' RJH ------------------------------------------------------------------------------------- END
                        mov     t2,_hx
                        call    #multiply
                        mov     hf,_hd
                        sub     hf,t1
                        shr     hf,#1           wc
                        mov     hb,_ho
                        addx    hb,hf
                        sub     hf,_ho                  '+44

                        mov     t1,_vt                  'compute vertical metrics
                        mov     t2,_vx
                        call    #multiply
                        test    _mode,#%100     wc      'get interlace into nz
        if_c            shr     t1,#1
                        mov     vf,_vd
                        sub     vf,t1
                        shr     vf,#1           wc
                        neg     vb,_vo
                        addx    vb,vf
                        add     vf,_vo                  '+48

' RJH - 4 color mode ---------------------------------------------------------------------- OLD
'                        movi    vcfg,#%001100_000       ' 4 colour
' RJH - 2 color mode ---------------------------------------------------------------------- NEW
'                        movi    vcfg,#%001000_000       ' 2 colour
' RJH - 2 or 4 color mode ----------------------------------------------------------------- NEW
                        test    _mode,#%1000    wc      ' test for 2 or 4 colour
              if_c      movi    vcfg,#%001100_000
              if_nc     movi    vcfg,#%001000_000
' RJH ------------------------------------------------------------------------------------- END

:colors                 jmpret  taskptr,taskret         '+1=94/160, break and return later

                        mov     t1,#8                  'load next 8 colors into colortable
:loop                   mov     t2,:color               '2 times = 16 (all colors loaded)
                        shr     t2,#9-2
                        and     t2,#$FC
                        add     t2,_colors
                        rdlong  t2,t2
                        and     t2,colormask
                        or      t2,hvbase
:color                  mov     colortable,t2
                        add     :color,d0
                        andn    :color,d6
                        djnz    t1,#:loop               '+158

                        jmp     #:colors                '+1, keep loading colors
'
'
' Multiply t1 * t2 * 16 (t1, t2 = bytes)
'
multiply                shl     t2,#8+4-1

                        mov     tile,#8
:loop                   shr     t1,#1           wc
        if_c            add     t1,t2
                        djnz    tile,#:loop

multiply_ret            ret                             '+37
'
'
' Disabled - reset status, nap ~4ms, try again
'
disabled                mov     ctra,#0                 'reset ctra
                        mov     vcfg,#0                 'reset video

                        wrlong  outa,par                'set status to disabled

                        rdlong  t1,#0                   'get CLKFREQ
                        shr     t1,#8                   'nap for ~4ms
                        min     t1,#3
                        add     t1,cnt
                        waitcnt t1,#0

                        jmp     #entry                  'reload parameters
'
'
' Initialized data
'
zero                    long    0
pllmin                  long    500_000                 'pll lowest output frequency
pllmax                  long    128_000_000             'pll highest output frequency
m8                      long    8_000_000               '*16 = 128MHz (pll vco max)
m4                      long    4_000_000               '*16 = 64MHz (pll vco min)
d0                      long    1 << 9 << 0
d6                      long    1 << 9 << 6
invisible               long    1
visible                 long    2
line                    long    0
vmask                   long    $01010101
hmask                   long    $02020202
colormask               long    $FCFCFCFC
h10000                  long    $10000

'
'
' Uninitialized data
'
taskptr                 long    0                       'tasks
taskret                 long    0
t1                      long    0
t2                      long    0

x                       long    0                       'display
y                       long    0
hf                      long    0
hb                      long    0
vf                      long    0
vb                      long    0
hx                      long    0
vx                      long    0
hc2x                    long    0
screen                  long    0
tile                    long    0
pixels                  long    0
colours                 long    0
interlace               long    0
hv                      long    0
hvbase                  long    0
h1                      long    0
h2                      long    0

buff_adr                long    0

line_req_ptr            long    0
line_buf_ptr            long    0
'
'
' Parameter buffer
'
_enable                 long    0       '0/non-0        read-only
_pins                   long    0       '%pppttt        read-only
_mode                   long    0       '%ihv           read-only
_screen                 long    0       '@word          read-only
_colors                 long    0       '@long          read-only
_ht                     long    0       '1+             read-only
_vt                     long    0       '1+             read-only
_hx                     long    0       '1+             read-only
_vx                     long    0       '1+             read-only
_ho                     long    0       '0+-            read-only
_vo                     long    0       '0+-            read-only
_hd                     long    0       '1+             read-only
_hf                     long    0       '1+             read-only
_hs                     long    0       '1+             read-only
_hb                     long    0       '1+             read-only
_vd                     long    0       '1+             read-only
_vf                     long    0       '1+             read-only
_vs                     long    0       '1+             read-only
_vb                     long    0       '2+             read-only
_rate                   long    0       '500_000+       read-only

#ifdef ENABLE_VGA
vga_enable long 1<<common#VGA_ENABLE   ' explicitly enable VGA (for C3)
#endif

ram_end
                        fit     colortable              'fit underneath colortable ($180-$1BF)


''
''___
''VAR                   'VGA parameters - 21 contiguous longs
''
''  long  vga_status    '0/1/2 = off/visible/invisible    read-only
''  long  vga_enable    '0/non-0 = off/on                 write-only
''  long  vga_pins      '%pppttt = pins                   write-only
''  long  vga_mode      '%ihv = interlace,hpol,vpol       write-only
''  long  vga_screen    'pointer to screen (words)        write-only
''  long  vga_colors    'pointer to colors (longs)        write-only            
''  long  vga_ht        'horizontal tiles                 write-only
''  long  vga_vt        'vertical tiles                   write-only
''  long  vga_hx        'horizontal tile expansion        write-only
''  long  vga_vx        'vertical tile expansion          write-only
''  long  vga_ho        'horizontal offset                write-only
''  long  vga_vo        'vertical offset                  write-only
''  long  vga_hd        'horizontal display ticks         write-only
''  long  vga_hf        'horizontal front porch ticks     write-only
''  long  vga_hs        'horizontal sync ticks            write-only
''  long  vga_hb        'horizontal back porch ticks      write-only
''  long  vga_vd        'vertical display lines           write-only
''  long  vga_vf        'vertical front porch lines       write-only
''  long  vga_vs        'vertical sync lines              write-only
''  long  vga_vb        'vertical back porch lines        write-only
''  long  vga_rate      'tick rate (Hz)                   write-only
''
''The preceding VAR section may be copied into your code.
''After setting variables, do start(@vga_status) to start driver.
''
''All parameters are reloaded each superframe, allowing you to make live
''changes. To minimize flicker, correlate changes with vga_status.
''
''Experimentation may be required to optimize some parameters.
''
''Parameter descriptions:
''  __________
''  vga_status
''
''    driver sets this to indicate status:
''      0: driver disabled (vga_enable = 0 or CLKFREQ < 16MHz)
''      1: currently outputting invisible sync data
''      2: currently outputting visible screen data
''  __________
''  vga_enable
''
''        0: disable (pins will be driven low, reduces power)
''    non-0: enable
''  ________
''  vga_pins
''
''    bits 5..3 select pin group:
''      %000: pins 7..0
''      %001: pins 15..8
''      %010: pins 23..16
''      %011: pins 31..24
''      %100: pins 39..32
''      %101: pins 47..40
''      %110: pins 55..48
''      %111: pins 63..56
''
''    bits 2..0 select top pin within group
''    for example: %01111 (15) will use pins %01000-%01111 (8-15)
''  ________
''  vga_mode
''
''    bit 3 controls colour mode:
''      0: 2 colour (each pixel is one bit, each tile is 32 x 16 pixels)
''      1  4 colour (each pixel is two bits, each tile is 16 x 16 pixels)
''
''    bit 2 controls interlace:
''      0: progressive scan (less flicker, good for motion, required for LCD monitors)
''      1: interlaced scan (allows you to double vga_vt, good for text)
''
''    bits 1 and 0 select horizontal and vertical sync polarity, respectively
''      0: active low (negative)
''      1: active high (positive)
''  __________
''  vga_screen
''
''    pointer to 7 longs which define virtual screen:
''
''       screen[0] is the address of the variable indicating which line the driver will display next   
''       screen[1] is the address of the buffer the driver will use next (zero, or the address of one of the buffers 1 - 4)
''       screen[2] is the address of the tile pointer map (tpm)
''       screen[3] is the address of buffer 1 (buffer space 1 for odd lines)
''       screen[4] is the address of buffer 2 (buffer space 2 for odd lines)
''       screen[5] is the address of buffer 3 (buffer space 1 for even lines)
''       screen[6] is the address of buffer 4 (buffer space 2 for even lines)
''  __________
''  vga_colors
''
''    pointer to longs which define colorsets
''      number of longs must be 1..64
''      each long has four 8-bit fields which define colors for 2-bit (four color) pixels
''      first long's bottom color is also used as the screen background color
''      8-bit color fields are as follows:
''        bits 7..2: actual state of pins 7..2 within pin group*
''        bits 1..0: don't care (used within driver for hsync and vsync)
''
''    * it is suggested that:
''        bits/pins 7..6 are used for red
''        bits/pins 5..4 are used for green
''        bits/pins 3..2 are used for blue
''      for each bit/pin set, sum 240 and 470-ohm resistors to form 75-ohm 1V signals
''      connect signal sets to RED, GREEN, and BLUE on VGA connector
''      always connect group pin 1 to HSYNC on VGA connector via 240-ohm resistor
''      always connect group pin 0 to VSYNC on VGA connector via 240-ohm resistor
''  ______
''  vga_ht
''
''    horizontal number of 16*16 or 32*16 pixel tiles - must be at least 1
''  ______
''  vga_vt
''
''    vertical number of 16*16 or 32*16 pixel tiles - must be at least 1
''  ______
''  vga_hx
''
''    horizontal tile expansion factor - must be at least 1
''
''    make sure (tiles per pixel) * vga_ht * vga_hx + ||vga_ho is equal to or at least 16 less than vga_hd
''  ______
''  vga_vx
''
''    vertical tile expansion factor - must be at least 1
''
''    make sure 16 * vga_vt * vga_vx + ||vga_vo does not exceed vga_vd
''      (for interlace, use 8 * vga_vt * vga_vx + ||vga_vo)
''  ______
''  vga_ho
''
''    horizontal offset in ticks - pos/neg value (0 recommended)
''    shifts the display right/left
''  ______
''  vga_vo
''
''    vertical offset in lines - pos/neg value (0 recommended)
''    shifts the display up/down
''  ______
''  vga_hd
''
''    horizontal display ticks
''  ______
''  vga_hf
''
''    horizontal front porch ticks
''  ______
''  vga_hs
''
''    horizontal sync ticks
''  ______
''  vga_hb
''
''    horizontal back porch ticks
''  ______
''  vga_vd
''
''    vertical display lines
''  ______
''  vga_vf
''
''    vertical front porch lines
''  ______
''  vga_vs
''
''    vertical sync lines
''  ______
''  vga_vb
''
''    vertical back porch lines
''  ________
''  vga_rate
''
''    tick rate in Hz
''
''    driver will limit value to be within 500KHz and 128MHz
''    pixel rate (vga_rate / vga_hx) should be no more than CLKFREQ / 4
