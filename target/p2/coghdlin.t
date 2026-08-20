{{
PUB Start(cog, argptr)

  coginit(cog,@HD_VGA_LINE_START, argptr)
}}

DAT
              org       0
{
  ptra points to:
    pMousexy
    @TileBuffer1
    @CursorSource 'one long wide, 16 longs tall
    @CursorData 'four longs wide,  32 longs tall
    @Tiles
    @TileColors
    @palette
    @pFont[0]
}
HD_VGA_LINE_START
              rdlong    PA,ptra++
              rdlong    pTileBufferY,ptra++
              rdlong    pCursorSource,ptra++
              rdlong    pCursorData,ptra++
              rdlong    pTilesY,ptra++
              rdlong    pTileColorsY,ptra++
              rdlong    pPaletteY,ptra++
              rdlong    pFontY,ptra++

'this cog builds the next scan line when given atn signal
            'Set mouse pointers
            mov     spmousex,PA
            mov     spmousey,spmousex
            add     spmousey,#4
            mov     spmousevis,spmousex
            add     spmousevis,#28

            'build screen buffer (16 lines tall)
OuterLoop
            rdlong  smousey,spmousey
            mov     smouseyend,smousey
            add     smouseyend,#15

            mov     smouseytile,smousey
            shr     smouseytile,#4 'divide by 16 to get tile #
            mov     smouseytile2,smouseytile
            add     smouseytile2,#1
            rdlong  smousex,spmousex
            mov     smousextile,smousex
            shr     smousextile,#4  'divide by 16 to get tile #

            'precalculate shifts for cursor data
            mov     scursorshift,smousex
            and     scursorshift,#$7
            mov     scursorshift2,#8
            sub     scursorshift2,scursorshift
            shl     scursorshift,#2
            shl     scursorshift2,#2

            'waitx   #200  'have some time here to build cursor pixels
            mov     ptra,pCursorSource'#@CursorSource 'one long wide, 16 longs tall
            mov     ptrb,pCursorData'#@CursorData 'four longs wide,  32 longs tall
            wrfast  #0,ptrb
            mov     s3,smousex
            and     s3,#$F 'overall shift
            mov     s1,#16
CursorLoop
            'read in cursor data for this row, now two longs wide (16 pixels)
            rdlong  s4,ptra++ 'this is the new long of wider cursor
            rdlong  s2,ptra++


CursorShortShift 'shift less than one long
            'Shift right for first long, left for second long
            mov     sc1,s2
            shl     sc1,scursorshift  'shifting left moves data right on screen
            mov     sc2,s2
            shr     sc2,scursorshift2
            'need to or in new wider cursor data
            'now the second cursor long, or first part in
            mov     sc3,s4
            shl     sc3,scursorshift
            or      sc2,sc3
            'This is the last long of 3
            mov     sc4,s4
            shr     sc4,scursorshift2

            'Treat 0 and 8 as special cases
            cmp     s3,#0 wcz'No shift?
    if_e    wflong  s2
    if_e    wflong  s4
    if_e    wflong  #0
    if_e    wflong  #0
    if_e    jmp     #CursorLoopEnd
            cmp     s3,#8 wcz'No shift?
    if_e    wflong  #0
    if_e    wflong  s2
    if_e    wflong  s4
    if_e    wflong  #0
    if_e    jmp     #CursorLoopEnd

            'Now, handle cases if shifts between 1 and 7 and 9 and 15
            cmp     s3,#8 wcz 'More that one long of colors?
    if_b    wflong  sc1 'long #1
    if_ae   wflong  #0

    if_b    wflong  sc2 'long #2
    if_ae   wflong  sc1

    if_b    wflong  sc4 'long #3
    if_ae   wflong  sc2

    if_b    wflong  #0  'long #4
    if_ae   wflong  sc4

CursorLoopEnd
            djnz    s1,#CursorLoop

            rdfast  #0,pCursorData'##@CursorData

            mov     stilerow,#0 'start at tile row #0
            mov     srow,#0 'pixel row #0
            mov     PA,pTilesY

ScreenLoop
            'every 16 lines, need to read in new tiles
            'bring in a row of tile pointers (120 of them) into cog, starting at register #300

            setq    #120-1
            rdlong  300,pa
            'waitx   #300  'seems there is time to do 8x8 tiles...

            'build the tilebuffer
            mov     s4,#16
            mov     s5,#0
            'loc     ptrb,#@TileBuffer1
            mov     ptrb,pTileBufferY

TileLoop
            'Build scan line
            mov     s3,#120

            mov     PB,ptrb 'Save pointer to cursor data
            'save space for cursor data
            add     ptrb,#6*4

ReadLoop
read_1      mov     s2,300-0

            add     read_1,#1  'modify source of above line to get next tile location
            add     s2,s5

            rdlong  s2,s2
            wrlong  s2,ptrb++

            djnz    s3,#ReadLoop

            'waitx   ##900 ''Have about 900 clocks here to mess with the scanline...  Maybe drop 8 pixel wide font on top...

            'mouse cursor data
            'After scan line is built, have the data to construct 4bpp mouse data
            'waitx   #500  'have at least 500 clocks to construct 4bpp cursor data for up to two tiles
            push    ptrb
            mov     ptrb,PB
            cmp     srow,smousey wcz
    if_b    wrlong  #0,ptrb++
    if_b    jmp     #CursorLineDone
            cmp     srow,smouseyend wcz
    if_a    wrlong  #0,ptrb++
    if_a    jmp     #CursorLineDone
            rdlong  vis,spmousevis wz ' is graphics/mouse cursor visible?
    if_z    jmp     #CursorLineDone ' no - done!

            wrlong  #1,ptrb++ 'do one tile of 4bb cursor

            mov     sx1,smousextile'#9 'start tile for cursor
            wrlong  sx1,ptrb++ 'start at tile #4
            wrlong  ##$03030303,ptrb++  'tile #1
            wrlong  ##$03030303,ptrb++
            wrlong  ##$30303030,ptrb++  'Tile #2
            wrlong  ##$30303030,ptrb++

            'looks like we need to copy the first cursor long into the 2bpp stream
            shl     sx1,#2
            add     ptrb,sx1
            'convert one long of 2bpp data into two longs of 4bpp data
            rdlong  sx1,ptrb '2bpp data
            rep     @.end1,#8
            shl     stile2,#2
            rczl    sx1  wcz
            rczl    stile2 'first long of 4bpp data
.end1
            rep     @.end2,#8
            shl     stile1,#2
            rczl    sx1  wcz
            rczl    stile1 'second long of 4bpp data
.end2
            rflong  sc1
            or      stile1,sc1'##$0000FF00
            wrlong  stile1,ptrb'##$0000FFFF,ptrb'##$03030303,ptrb
            mov     ptra,PB
            rflong  sc2
            or      stile2,sc2
            wrlong  stile2,ptra[3]

            'need to do same for second cursor long into the 2bpp stream
            'unless cursor is on last tile of row
            cmp     smousextile,#119 wcz
            rflong  sc1  'need to do these reads before jumping over this
            rflong  sc2
    if_e    jmp     #CursorLineDone
            add     ptrb,#4
            'convert one long of 2bpp data into two longs of 4bpp data
            rdlong  sx1,ptrb '2bpp data
            rep     @.end3,#8
            shl     stile2,#2
            rczl    sx1  wcz
            rczl    stile2 'first long of 4bpp data
.end3
            rep     @.end4,#8
            shl     stile1,#2
            rczl    sx1  wcz
            rczl    stile1 'second long of 4bpp data
.end4

            or      stile1,sc1
            wrlong  stile1,ptrb'##$0000FFFF,ptrb'##$03030303,ptrb
            mov     ptrb,PB
            or      stile2,sc2
            wrlong  stile2,ptrb[4]

CursorLineDone
            pop     ptrb         'restore ptrb

            sets    read_1,#300
            add     s5,#4
            add     srow,#1
            djnz    s4,#TileLoop

            'wait for ATN to start next row of tiles
            add     pa,##120*4
            incmod  stilerow,#67 wc  '68 rows of tiles
    if_c    mov pa, pTilesY 'loc     pa,#@Tiles
            waitatn
    if_c    jmp     #OuterLoop 'start all over
            jmp     #ScreenLoop


s1            long      0
s2            long      0
s3            long      0
s4            long      0
s5            long      0
s6            long      0
sx1           long      0
sy1           long      0
sz            long      0
si            long      0
sj            long      0
stilerow      long      0
srow          long      0
smouseyend    long      0
sct1          long      0
sct2          long      0
vis           long      0

smousex       long      0
smousey       long      0
smousextile   long      0
smouseytile   long      0
smouseytile2  long      0
spmousex      long      0
spmousey      long      0
spmousevis    long      0
stile1        long      0
stile2        long      0
sc1           long      0
sc2           long      0
sc3           long      0 'these two for wider cursor
sc4           long      0
scursorshift  long      0
scursorshift2 long      0

pCursorSource long      0
pCursorData   long      0

pTileBufferY  long      0
pTilesY       long      0
pTileColorsY  long      0
pPaletteY     long      0
pFontY        long      0

              fit       $1f0
