{{
PUB Start(cog, argptr)

  coginit(Cog, @HD_VGA_COLOR_START, argptr)

}}

DAT
              org       0
{
  ptra points to:
    @TileColors
    @palette
}
HD_VGA_COLOR_START

'New scheme is to define colors by one long per tile with each byte selecting a color stored in COG RAM
'So, there will be a 256 color palette that a tile can pick 4 colors from
'Going to use lower COG RAM addresses to make faster.

            rdlong  pTileColorsX,ptra++
            rdlong  pPaletteX,ptra++

            jmp     #ColorStart
            long    0[254] 'space for palette    ' The altd instructions in the main loop directly select the color from here
ColorStart
            mov     c6,#0 'rolling index into palette for loading 16 colors every frame
ColorFrame
            'First, load up the palette
            'loc     ptra,#@palette
            mov     ptra,pPaletteX
            setq    #256-1
            rdlong  0,ptra

            'Load up cursor colors
            'white for color #15
            wrlut   ##$FFFFFF00,#15+32*0
            wrlut   ##$FFFFFF00,#15+32*1
            wrlut   ##$FFFFFF00,#15+32*2
            wrlut   ##$FFFFFF00,#15+32*3
            wrlut   ##$FFFFFF00,#15+32*4
            wrlut   ##$FFFFFF00,#15+32*5
            wrlut   ##$FFFFFF00,#15+32*6
            wrlut   ##$FFFFFF00,#15+32*7
            'blackish for color #7
            wrlut   ##$4F4F4F00,#7+32*0
            wrlut   ##$4F4F4F00,#7+32*1
            wrlut   ##$4F4F4F00,#7+32*2
            wrlut   ##$4F4F4F00,#7+32*3
            wrlut   ##$4F4F4F00,#7+32*4
            wrlut   ##$4F4F4F00,#7+32*5
            wrlut   ##$4F4F4F00,#7+32*6
            wrlut   ##$4F4F4F00,#7+32*7

            'Next, continuously load up LUT
            'loc     ptra,#@TileColors
            mov     ptra,pTileColorsX

            mov     c1,#68 '# tile
ColorTileLoop
            mov     c5,#16 '16 rows per tile, except last tile row on screen
            cmp     c1,#1 wcz
    if_e    mov     c5,#8 'only 8 on last tile row
ColorRowLoop
            'rdfast  #0,ptra  'Moving this to after interrupt section
            mov     c4,#15 '1080p is 120 tiles wide, this is 15 iterations of 8 color sets

'New Interrupt Section Starts------------------------------------------------------

'This is where we can stop and let interrupt take over
            cmp     c7,#0 wcz 'is interrupt enabled (non-zero)?

ColorInterruptOnly
    if_nz   RETI1   'if this is not the first time here, we are done, return

            'If still here, this is the first time through the loop
            'Configure interrupt to go to ColorSetLoop
            mov     IJMP1,#ColorSetLoopStart  'this is where we used to wait for attention
            SETINT1 #14 'set interrupt to trigger on attention
            mov     c7,#1 'note to self that this is not our first time in the loop and interrupts are enabled.


CStop
            jmp #CStop  'for now, just do nothing except respond to ISR
'New Interrupt Section Ends------------------------------------------------------

ColorSetLoopStart
            rdfast  #0,ptra   'RDFast had to be moved down here as hubexec graphics code interferes otherwise
ColorSetLoop

            'Note: Rev.2e:  Reversing order of LUT writes. 3,2,1,0 instead of 0,1,2,3
            '  This will get the fbfb, ffbb order for selecting even/odd 2bpp characters be same as P1
            waitatn       '<----  This is where we used to wait for attention

            'pollatn
            'long %1111_1101011_110_000001110_000100100


            'LUT set #0
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*0
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*0
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*0
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*0
            'LUT set #1
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*1
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*1
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*1
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*1
            'LUT set #2
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*2
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*2
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*2
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*2
            'LUT set #3
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*3
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*3
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*3
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*3
            'LUT set #4
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*4
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*4
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*4
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*4
            'LUT set #5
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*5
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*5
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*5
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*5
            'LUT set #6
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*6
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*6
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*6
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*6
            'LUT set #7
            rfbyte  c3
            altd    c3
            wrlut   0-0,#3+32*7
            rfbyte  c3
            altd    c3
            wrlut   0-0,#2+32*7
            rfbyte  c3
            altd    c3
            wrlut   0-0,#1+32*7
            rfbyte  c3
            altd    c3
            wrlut   0-0,#0+32*7

            'tile set loop
            djnz    c4,#ColorSetLoop
            'row loop
            djnz    c5,#ColorRowLoop
            'tile row loop
            add     ptra,#120*4 'next tile row
            djnz    c1,#ColorTileLoop

            'Start over
            jmp     #ColorFrame

c1            long      0
c2            long      0
c3            long      0
c4            long      0
c5            long      0
c6            long      0
c7            long      0  'this one tells when interrupt is enabled (becomes non-zero)

pTileColorsX  long      0
pPaletteX     long      0

              fit       $1F0
