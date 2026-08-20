{{
PUB Start(cog, args)

  coginit(cog, @HD_VGA_START, args)
}}

CON

'NCO setting calculation for VGA pixels
fpix            = 148_500_000

' HD VGA Intensity:
HD_INTENSITY = 80 ' 100    '0..128

DAT
              org 0
{
  ptra points to:
    Color_Cog
    Scan_Cog
    pMousexy
    @TileBuffer1
    @CursorSource 'one long wide, 16 longs tall
    @CursorData 'four longs wide,  32 longs tall
    @Tiles
    @TileColors
    @palette
    @pFont[0]
}
HD_VGA_START
              setluts   #1                      'Let color cog take care of LUT
              rdlong    x99, ptra++       '
              shl       Color_Cog,x99           'set up for cogatn
              rdlong    x99,ptra++
              shl       Scan_Cog,x99            'set up for cogatn
              rdlong    PA,ptra++               'pMousexy (not used)
              rdlong    PB,ptra++               '@TileBuffer1

              rdlong    pa,##@clkfreq            'calculate streamer frequency
              qfrac     ##fpix,pa
              getqx     pa
              shr       pa,#1
              setxfrq   pa

        'the next 4 lines may be commented out to bypass level scaling

            setcy   ##HD_INTENSITY << 24   'r  set colorspace for rgb
            setci   ##HD_INTENSITY << 16   'g
            setcq   ##HD_INTENSITY << 08   'b
            setcmod #%01_0_000_0        'enable colorspace conversion

        'RJA dacmodes changed for real P2
            cogid   x99
            shl     x99, #8
            or      dacmode_s, x99
            or      dacmode_c, x99

        'A/V moved to P8..P15
            wrpin   dacmode_s,#0+_VGA_BASE_PIN      'enable dac modes in pins 0..3
            wrpin   dacmode_c,#1+_VGA_BASE_PIN
            wrpin   dacmode_c,#2+_VGA_BASE_PIN
            wrpin   dacmode_c,#3+_VGA_BASE_PIN
            drvl    #0+_VGA_BASE_PIN
            drvl    #1+_VGA_BASE_PIN
            drvl    #2+_VGA_BASE_PIN
            drvl    #3+_VGA_BASE_PIN
'
'
' fieldx loop
'
fieldx       mov     x99,#36-1                  'back porch, top blanks



            'cogatn  Scan_Cog             'preload the top line
            call    #blank

            'prepare to read in colors
            mov     ptra,PB                     '#@TileBuffer1


            mov     y99,#0

            mov     x99,##1080                  'set visible lines
line

            call    #hsync                      'do horizontal sync


            rdfast  #0,ptra

            'load in mouse data
            rflong  mousen
            rflong  mouses
            rflong  mouset1a
            rflong  mouset1b
            rflong  mouset2a
            rflong  mouset2b

            'precalculate # of lines to skip



            add     ptra,##(120+6)*4  'adjusted for mouse data
            incmod  y99,#15 wc
    if_c    sub     ptra,##(120+6)*4*16   'adjusted for mouse data
            cmp     y99,#8 wcz
    if_e    cogatn  Scan_Cog

            'Cursor?
           tjnz     mousen,#CursorScanLine
            'jmp     #CursorScanLine

NoCursorScanLine
            'Want to start off with xzero to decrease jitter
            cogatn  Color_Cog
            xzero   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            rep     @.end,#(120-8)/4/2
            cogatn  Color_Cog
            xcont   m_rf,#0
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
 .end
            jmp     #NextLine
'{
CursorScanLine
            cogatn  Color_Cog

            'waitx   #300 'have at least 300 clocks to alter code for cursor and then set it back
            'have about 120 long in cog ram to do it

'{
            'calculate address of lines to change, taking into account cogatn lines
            mov     mx,mouses
            'shl     mx,#1 'two lines of xcont for every tile
            add     mx,#CursorScanStart
            mov     my,mouses  'need to add 1 line every 8 lines for cogatn
            shr     my,#3
            add     mx,my
            'add     mx,my
            mov     my,mouses 'calculate color set to use
            and     my,#%111
            setnib  m_rfc,my,#4 'select colorset
            'change color set selection to match
            setnib  DoCursor1a,my,#0
            setnib  DoCursor2a,my,#0
            setnib  DoCursor3a,my,#0


            'do same for second tile (if any)
            add     my,#1
            and     my,#%111
            setnib  m_rfc2,my,#4 'select colorset
            'change color set selection to match
            setnib  DoCursor1b,my,#0
            setnib  DoCursor3b,my,#0


            'mov     mx,#test1 'testing
            'mov     my,mx
            'add     my,#1

            mov     xbackl,mx 'save location that we are about to alter
            alts    mx
            mov     xback,0-0 'save instruction from that location

            altd    mx
            mov     0-0,CursorJump  'change instruction to jump

            'last tile in set of 8?
            mov     j99,mouses
            and     j99,#%111
            cmp     j99,#7 wcz
    if_e    altd    mx
    if_e    mov     0-0,CursorJump3

            'last tile on row?
            cmp     mouses,#119  wcz
    if_e    altd    mx
    if_e    mov     0-0,CursorJump2

            'move that saved instruction and alter it for 4bpp
            'mov     DoCursor1,xback
            'setd    DoCursor1,m_rf1  'change xcont from 2bpp to 4bpp

            'change color set selection to match
            setnib  DoCursor1,xback,#0

            'Alter cursor code, depending on mouses
   '         cmp     mouses,#119 wcz
  '  if_e    mov     CursorLast,JumpLast
  '  if_ne   mov     CursorLast,#0 'nop


            jmp     #CursorScanStart

            'regular set
CursorJump  call    #\DoCursor1      'need absolute jump here
            'xtile=119, last tile
CursorJump2 call    #\DoCursor2      'need absolute jump here
            'last tile in set of 8
CursorJump3 call    #\DoCursor3      'need absolute jump here

Test4       xcont   m_rf1,#1


DoCursor1 'regular xtile
            'first cursor tile
DoCursor1a
            'pop     j
            xcont   m_rf1,#1
            xcont   m_rfc,mouset1b
            'return to next instruction after where we left
            pop     j99
            add     j99,#1
            push    j99

            'restore instruction
            altd    mx
            mov     0-0,xback
            'second cursor tile
            'need to fix colorset here too
DoCursor1b
            xcont   m_rf1,#1
            xcont   m_rfc2,mouset2a

            'restore instruction
   '         altd    mx
   ' _ret_   mov     0-0,xback
            ret

DoCursor2  'last tile in row
            'first cursor tile
DoCursor2a
            xcont   m_rf1,#1
            xcont   m_rfc,mouset1b
            'restore instruction
            altd    mx
            mov     0-0,xback
            ret

DoCursor3 'last tile in set of 8
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            'pop     j
            'first cursor tile
DoCursor3a
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            'pop     j
            xcont   m_rf1,#1
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            xcont   m_rfc,mouset1b


            'return to second next instruction after where we left (missing a cogatn too)
            pop     j99
            cogatn  Color_Cog  'need to do cogatn here since skipping it
            add     j99,#2

            push    j99

            'second cursor tile
            'need to fix colorset here too
DoCursor3b
            xcont   m_rf1,#1
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            xcont   m_rfc2,mouset2a
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            'restore instruction
            altd    mx
   _ret_    mov     0-0,xback
            'cogatn  Color_Cog  'need to do cogatn here since skipping it
            ret



 '}
CursorScanStart
            'set #1
            xzero   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
test1
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #2
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #3
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #4
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #5
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #6
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #7
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #8
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #9
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #10
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #11
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #12
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #13
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #14
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7
            'set #15
            cogatn  Color_Cog
            xcont   m_rf,#0         'visible line
            xcont   m_rf,#1
            xcont   m_rf,#2
            xcont   m_rf,#3
            xcont   m_rf,#4
            xcont   m_rf,#5
            xcont   m_rf,#6
            xcont   m_rf,#7

'}


NextLine
            djnz    x99,#line             'another line?
    '        sub     x,#1 wz
    'if_nz   jmp     #line


            mov     x99,#4+1          'front porch, bottom blanks
            call    #blank

            cogatn  #1<<0   'Tell main cog that vsync in progress

            drvnot  #_VGA_BASE_PIN+4  'sync on
            mov     x99,#5            'sync blanks
            call    #blank

            drvnot  #_VGA_BASE_PIN+4  'sync off
            jmp     #fieldx           'loop
'
'
' Subroutines
'
blank       call    #hsync          'blank lines
            xcont   m_vi,#0
    _ret_   djnz    x99,#blank

hsync
            xcont   m_bs,#0         'horizontal sync
            xcont   m_sn,#1
    _ret_   xcont   m_bv,#0
'
'
' Initialized data
'RJA:  New dacmodes for real P2
dacmode_s   long    %0000_0000_000_1011000000000_01_00000_0         'hsync is 123-ohm, 3.3V
dacmode_c   long    %0000_0000_000_1011100000000_01_00000_0         'R/G/B are 75-ohm, 2.0V

m_bs        long    $7F010000+88  + _VGA_BASE_PIN<<17      'front porch, before sync
m_sn        long    $7F010000+44+ _VGA_BASE_PIN<<17  '48        'sync
m_bv        long    $7F010000+148+ _VGA_BASE_PIN<<17  '+4        'back porch, before visible
m_vi        long    $7F010000+1920+ _VGA_BASE_PIN<<17         'visible

m_rf        long    $7F040000+16+ _VGA_BASE_PIN<<17  '1920       'visible rlong 2bpp lut

m_rf1       long    $7F060000+8+ _VGA_BASE_PIN<<17  '1920       'visible rlong 2bpp lut
m_rfc       long    $2F050000+8 + _VGA_BASE_PIN<<17  'visible immediate 4bpp
m_rfc2      long    $2F050000+8 + _VGA_BASE_PIN<<17  'visible immediate 4bpp

{
  m_bs:=$7F010000 + basepin<<17 + 16*800/640          'before sync
  m_sn:=$7F010000 + basepin<<17 + 96*800/640          'sync
  m_bv:=$7F010000 + basepin<<17 + 48*800/640          'before visible
  m_vi:=$7F010000 + basepin<<17 + 800         'visible
  m_rf:=$7F080000 + basepin<<17 + 800         'visible rfbyte 8bpp LUT->DAC
  }

pXMouse     long    0 'pointer to mouse x value in main cog
pYMouse     long    0 'pointer to moues y value in main cog
pEventPin   long    0 'Pointer to pin to monitor for mouse/kb events

x99         long    0  'Adding"99" to make Spin2 happy with my local variables
y99         long    0
z99         long    0
i99         long    0
j99         long    0

mx          long    0
my          long    0
xback       long    0
xbackl      long    0

mousen      long    0   '#tiles of 4bpp cursor data to draw on this line
mouses      long    0   'Starting column of cursor
mouset1a    long    0   'left data for first cursor tile
mouset1b    long    0   'right data for first cursor tile
mouset2a    long    0   'left data for second cursor tile
mouset2b    long    0   'right data for second cursor tile

Color_Cog   long    1   ' shift left by actual cog number when known
Scan_Cog    long    1   ' shift left by actual cog number when known

              fit       $1F0
