'RJA modifying for P2, 30Jan20
'Ross Higson modified for virtual graphics 2026
'
'    hubhdgra.t - the hub code (hubexec) and data of the driver
'                 this must be BEFORE the C sbrk
'
'    coghdgra.t - the cog code and data of the driver
'                 this can be AFTER the C sbrk

' THIS FILE CONTAINS IS THE COG CODE, AND HAS THE HUB CODE COMMENTED OUT!

{{ ' commented out of this file - see hubhdgra.t
CON

  ' Vector font primitives

  xa0   = %000 << 0             'x line start / arc center
  xa1   = %001 << 0
  xa2   = %010 << 0
  xa3   = %011 << 0
  xa4   = %100 << 0
  xa5   = %101 << 0
  xa6   = %110 << 0
  xa7   = %111 << 0

  ya0   = %0000 << 3            'y line start / arc center
  ya1   = %0001 << 3
  ya2   = %0010 << 3
  ya3   = %0011 << 3
  ya4   = %0100 << 3
  ya5   = %0101 << 3
  ya6   = %0110 << 3
  ya7   = %0111 << 3
  ya8   = %1000 << 3
  ya9   = %1001 << 3
  yaA   = %1010 << 3
  yaB   = %1011 << 3
  yaC   = %1100 << 3
  yaD   = %1101 << 3
  yaE   = %1110 << 3
  yaF   = %1111 << 3

  xb0   = %000 << 7             'x line end
  xb1   = %001 << 7
  xb2   = %010 << 7
  xb3   = %011 << 7
  xb4   = %100 << 7
  xb5   = %101 << 7
  xb6   = %110 << 7
  xb7   = %111 << 7

  yb0   = %0000 << 10           'y line end
  yb1   = %0001 << 10
  yb2   = %0010 << 10
  yb3   = %0011 << 10
  yb4   = %0100 << 10
  yb5   = %0101 << 10
  yb6   = %0110 << 10
  yb7   = %0111 << 10
  yb8   = %1000 << 10
  yb9   = %1001 << 10
  ybA   = %1010 << 10
  ybB   = %1011 << 10
  ybC   = %1100 << 10
  ybD   = %1101 << 10
  ybE   = %1110 << 10
  ybF   = %1111 << 10

  ax1   = %0 << 7               'x arc radius
  ax2   = %1 << 7

  ay1   = %00 << 8              'y arc radius
  ay2   = %01 << 8
  ay3   = %10 << 8
  ay4   = %11 << 8

  a0    = %0000 << 10           'arc start/length
  a1    = %0001 << 10           'bits[1..0] = start (0..3 = 0, 90, 180, 270)
  a2    = %0010 << 10           'bits[3..2] = length (0..3 = 360, 270, 180, 90)
  a3    = %0011 << 10
  a4    = %0100 << 10
  a5    = %0101 << 10
  a6    = %0110 << 10
  a7    = %0111 << 10
  a8    = %1000 << 10
  a9    = %1001 << 10
  aA    = %1010 << 10
  aB    = %1011 << 10
  aC    = %1100 << 10
  aD    = %1101 << 10
  aE    = %1110 << 10
  aF    = %1111 << 10

  fline = %0 << 14              'line command
  farc  = %1 << 14              'arc command

  more  = %1 << 15              'another arc/line


' Catalina Init

DAT ' initialized data segment

              alignl

              orgh
bases         long      0[MAX_COLS]  'RJA:expanding this to max x tiles on 1080p screen
vbases        long      0[MAX_COLS] ' virtual bases
pixel_width   long      0
slices        long      0[8]

TileMap       long      0[VIRT_TILES]      ' virtual tile map
TileData      long      0[16*GRAPHIC_TILES] ' physical tile data
TileList      long      0                  ' linked list of unused physical tiles
Tile0         long      0[16]              ' special 'all 0' tile

' Color codes

colors        long      %%0000000000000000
              long      %%1111111111111111
              long      %%2222222222222222
              long      %%3333333333333333

' Round pixel recipes

pixels  byte    %00000000,%00000000,%00000000,%00000000         '0,1,2,3
        byte    %00000000,%00000000,%00000010,%00000101         '4,5,6,7
        byte    %00001010,%00001010,%00011010,%00011010         '8,9,A,B
        byte    %00110100,%00111010,%01110100,%01110100         'C,D,E,F

' Vector font - standard ascii characters ($21-$7E)

font    word    fline + xa2 + yaC + xb2 + yb7 + more            '!
        word    fline + xa2 + ya5 + xb2 + yb4

        word    fline + xa1 + yaD + xb1 + ybC + more            'double-quote
        word    fline + xa3 + yaD + xb3 + ybC

        word    fline + xa1 + yaA + xb1 + yb6 + more            '#
        word    fline + xa3 + yaA + xb3 + yb6 + more
        word    fline + xa0 + ya9 + xb4 + yb9 + more
        word    fline + xa0 + ya7 + xb4 + yb7

        word    farc + xa2 + ya9 + a9 + ax2 + ay1 + more        '$
        word    farc + xa2 + ya7 + aB + ax2 + ay1 + more
        word    fline + xa0 + ya6 + xb2 + yb6 + more
        word    fline + xa2 + yaA + xb4 + ybA + more
        word    fline + xa2 + yaA + xb2 + ybB + more
        word    fline + xa2 + ya6 + xb2 + yb5

        word    farc + xa1 + yaA + a0 + ax1 + ay1 + more        '%
        word    farc + xa3 + ya6 + a0 + ax1 + ay1 + more
        word    fline + xa0 + ya6 + xb4 + ybA

        word    farc + xa2 + yaA + a7 + ax1 + ay1 + more        '&
        word    farc + xa2 + ya7 + a5 + ax2 + ay2 + more
        word    fline + xa1 + yaA + xb4 + yb5

        word    fline + xa2 + yaD + xb2 + ybC                   ' '

        word    farc + xa3 + ya9 + aD + ax1 + ay4 + more        '(
        word    farc + xa3 + ya7 + aE + ax1 + ay4 + more
        word    fline + xa2 + ya7 + xb2 + yb9

        word    farc + xa1 + ya9 + aC + ax1 + ay4 + more        ')
        word    farc + xa1 + ya7 + aF + ax1 + ay4 + more
        word    fline + xa2 + ya7 + xb2 + yb9

        word    fline + xa4 + ya6 + xb0 + ybA + more            '*
        word    fline + xa0 + ya6 + xb4 + ybA + more
        word    fline + xa2 + yaB + xb2 + yb5

        word    fline + xa0 + ya8 + xb4 + yb8 + more            '+
        word    fline + xa2 + yaA + xb2 + yb6

        word    fline + xa2 + ya4 + xb1 + yb3                   ',

        word    fline + xa0 + ya8 + xb4 + yb8                   '-

        word    fline + xa2 + ya5 + xb2 + yb4                   '.

        word    fline + xa0 + ya4 + xb4 + ybC                   '/

        word    farc + xa2 + ya8 + a0 + ax2 + ay4               '0

        word    fline + xa0 + ya4 + xb4 + yb4 + more            '1
        word    fline + xa2 + ya4 + xb2 + ybC + more
        word    fline + xa0 + yaA + xb2 + ybC

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        '2
        word    farc + xa2 + yaA + aF + ax2 + ay3 + more
        word    farc + xa2 + ya4 + aD + ax2 + ay3 + more
        word    fline + xa0 + ya4 + xb4 + yb4

        word    farc + xa2 + yaA + a7 + ax2 + ay2 + more        '3
        word    farc + xa2 + ya6 + a6 + ax2 + ay2

        word    fline + xa2 + yaC + xb0 + yb7 + more            '4
        word    fline + xa0 + ya7 + xb4 + yb7 + more
        word    fline + xa3 + ya4 + xb3 + yb8

        word    farc + xa2 + ya6 + aB + ax2 + ay2 + more        '5
        word    fline + xa4 + yaC + xb0 + ybC + more
        word    fline + xa0 + yaC + xb0 + yb8 + more
        word    fline + xa0 + ya8 + xb2 + yb8 + more
        word    fline + xa0 + ya4 + xb2 + yb4

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        '6
        word    farc + xa2 + ya8 + aD + ax2 + ay4 + more
        word    fline + xa0 + ya6 + xb0 + yb8 + more
        word    fline + xa2 + yaC + xb3 + ybC

        word    fline + xa0 + yaC + xb4 + ybC + more            '7
        word    fline + xa1 + ya4 + xb4 + ybC

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        '8
        word    farc + xa2 + yaA + a0 + ax2 + ay2

        word    farc + xa2 + yaA + a0 + ax2 + ay2 + more        '9
        word    farc + xa2 + ya8 + aF + ax2 + ay4 + more
        word    fline + xa4 + ya8 + xb4 + ybA + more
        word    fline + xa1 + ya4 + xb2 + yb4

        word    fline + xa2 + ya6 + xb2 + yb7 + more            ':
        word    fline + xa2 + yaA + xb2 + yb9

        word    fline + xa2 + ya4 + xb1 + yb3 + more            ';
        word    fline + xa2 + ya8 + xb2 + yb7

        word    fline + xa0 + ya8 + xb4 + ybA + more            '<
        word    fline + xa0 + ya8 + xb4 + yb6

        word    fline + xa0 + yaA + xb4 + ybA + more            '=
        word    fline + xa0 + ya6 + xb4 + yb6

        word    fline + xa4 + ya8 + xb0 + ybA + more            '>
        word    fline + xa4 + ya8 + xb0 + yb6

        word    farc + xa2 + yaB + a8 + ax2 + ay1 + more        '?
        word    farc + xa3 + yaB + aF + ax1 + ay2 + more
        word    farc + xa3 + ya7 + aD + ax1 + ay2 + more
        word    fline + xa2 + ya5 + xb2 + yb4

        word    farc + xa2 + ya8 + a0 + ax1 + ay1 + more        '@
        word    farc + xa2 + ya8 + a4 + ax2 + ay3 + more
        word    farc + xa3 + ya8 + aF + ax1 + ay1 + more
        word    farc + xa2 + ya6 + aF + ax2 + ay1 + more
        word    fline + xa3 + ya7 + xb3 + yb9

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        'A
        word    fline + xa0 + ya4 + xb0 + ybA + more
        word    fline + xa4 + ya4 + xb4 + ybA + more
        word    fline + xa0 + ya8 + xb4 + yb8

        word    farc + xa2 + yaA + aB + ax2 + ay2 + more        'B
        word    farc + xa2 + ya6 + aB + ax2 + ay2 + more
        word    fline + xa0 + ya4 + xb0 + ybC + more
        word    fline + xa0 + ya4 + xb2 + yb4 + more
        word    fline + xa0 + ya8 + xb2 + yb8 + more
        word    fline + xa0 + yaC + xb2 + ybC

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        'C
        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more
        word    fline + xa0 + ya6 + xb0 + ybA

        word    farc + xa2 + yaA + aC + ax2 + ay2 + more        'D
        word    farc + xa2 + ya6 + aF + ax2 + ay2 + more
        word    fline + xa0 + ya4 + xb0 + ybC + more
        word    fline + xa4 + ya6 + xb4 + ybA + more
        word    fline + xa0 + ya4 + xb2 + yb4 + more
        word    fline + xa0 + yaC + xb2 + ybC

        word    fline + xa0 + ya4 + xb0 + ybC + more            'E
        word    fline + xa0 + ya4 + xb4 + yb4 + more
        word    fline + xa0 + ya8 + xb3 + yb8 + more
        word    fline + xa0 + yaC + xb4 + ybC

        word    fline + xa0 + ya4 + xb0 + ybC + more            'F
        word    fline + xa0 + ya8 + xb3 + yb8 + more
        word    fline + xa0 + yaC + xb4 + ybC

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        'G
        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more
        word    fline + xa0 + ya6 + xb0 + ybA + more
        word    fline + xa4 + ya4 + xb4 + yb7 + more
        word    fline + xa3 + ya7 + xb4 + yb7

        word    fline + xa0 + ya4 + xb0 + ybC + more            'H
        word    fline + xa4 + ya4 + xb4 + ybC + more
        word    fline + xa0 + ya8 + xb4 + yb8

        word    fline + xa2 + ya4 + xb2 + ybC + more            'I
        word    fline + xa0 + ya4 + xb4 + yb4 + more
        word    fline + xa0 + yaC + xb4 + ybC

        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more        'J
        word    fline + xa4 + ya6 + xb4 + ybC

        word    fline + xa0 + ya4 + xb0 + ybC + more            'K
        word    fline + xa4 + yaC + xb0 + yb8 + more
        word    fline + xa4 + ya4 + xb0 + yb8

        word    fline + xa0 + ya4 + xb0 + ybC + more            'L
        word    fline + xa0 + ya4 + xb4 + yb4

        word    fline + xa0 + ya4 + xb0 + ybC + more            'M
        word    fline + xa4 + ya4 + xb4 + ybC + more
        word    fline + xa2 + ya8 + xb0 + ybC + more
        word    fline + xa2 + ya8 + xb4 + ybC

        word    fline + xa0 + ya4 + xb0 + ybC + more            'N
        word    fline + xa4 + ya4 + xb4 + ybC + more
        word    fline + xa4 + ya4 + xb0 + ybC

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        '0
        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more
        word    fline + xa0 + ya6 + xb0 + ybA + more
        word    fline + xa4 + ya6 + xb4 + ybA

        word    farc + xa2 + yaA + aB + ax2 + ay2 + more        'P
        word    fline + xa0 + ya4 + xb0 + ybC + more
        word    fline + xa0 + ya8 + xb2 + yb8 + more
        word    fline + xa0 + yaC + xb2 + ybC

        word    farc + xa2 + yaA + a8 + ax2 + ay2 + more        'Q
        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more
        word    fline + xa0 + ya6 + xb0 + ybA + more
        word    fline + xa4 + ya6 + xb4 + ybA + more
        word    fline + xa2 + ya6 + xb4 + yb3

        word    farc + xa2 + yaA + aB + ax2 + ay2 + more        'R
        word    fline + xa0 + ya4 + xb0 + ybC + more
        word    fline + xa0 + ya8 + xb2 + yb8 + more
        word    fline + xa0 + yaC + xb2 + ybC + more
        word    fline + xa4 + ya4 + xb2 + yb8

        word    farc + xa2 + yaA + a4 + ax2 + ay2 + more        'S
        word    farc + xa2 + ya6 + a6 + ax2 + ay2

        word    fline + xa2 + ya4 + xb2 + ybC + more            'T
        word    fline + xa0 + yaC + xb4 + ybC

        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more        'U
        word    fline + xa0 + ya6 + xb0 + ybC + more
        word    fline + xa4 + ya6 + xb4 + ybC

        word    fline + xa2 + ya4 + xb0 + ybC + more            'V
        word    fline + xa2 + ya4 + xb4 + ybC

        word    fline + xa0 + yaC + xb0 + yb4 + more            'W
        word    fline + xa4 + yaC + xb4 + yb4 + more
        word    fline + xa2 + ya8 + xb0 + yb4 + more
        word    fline + xa2 + ya8 + xb4 + yb4

        word    fline + xa4 + ya4 + xb0 + ybC + more            'X
        word    fline + xa0 + ya4 + xb4 + ybC

        word    fline + xa0 + yaC + xb2 + yb8 + more            'Y
        word    fline + xa4 + yaC + xb2 + yb8 + more
        word    fline + xa2 + ya4 + xb2 + yb8

        word    fline + xa0 + yaC + xb4 + ybC + more            'Z
        word    fline + xa0 + ya4 + xb4 + ybC + more
        word    fline + xa0 + ya4 + xb4 + yb4

        word    fline + xa2 + yaD + xb2 + yb3 + more            '[
        word    fline + xa2 + yaD + xb4 + ybD + more
        word    fline + xa2 + ya3 + xb4 + yb3

        word    fline + xa4 + ya4 + xb0 + ybC                   '\

        word    fline + xa2 + yaD + xb2 + yb3 + more            '[
        word    fline + xa2 + yaD + xb0 + ybD + more
        word    fline + xa2 + ya3 + xb0 + yb3

        word    fline + xa2 + yaA + xb0 + yb6 + more            '^
        word    fline + xa2 + yaA + xb4 + yb6

        word    fline + xa0 + ya1 + xa4 + yb1                   '_

        word    fline + xa1 + ya9 + xb3 + yb7                   '`

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'a
        word    fline + xa4 + ya4 + xb4 + yb8

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'b
        word    fline + xa0 + ya4 + xb0 + ybC

        word    farc + xa2 + ya6 + a9 + ax2 + ay2 + more        'c
        word    fline + xa2 + ya4 + xb4 + yb4 + more
        word    fline + xa2 + ya8 + xb4 + yb8

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'd
        word    fline + xa4 + ya4 + xb4 + ybC

        word    farc + xa2 + ya6 + a4 + ax2 + ay2 + more        'e
        word    fline + xa0 + ya6 + xb4 + yb6 + more
        word    fline + xa2 + ya4 + xb4 + yb4

        word    farc + xa4 + yaA + aD + ax2 + ay2 + more        'f
        word    fline + xa0 + ya8 + xb4 + yb8 + more
        word    fline + xa2 + ya4 + xb2 + ybA

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'g
        word    farc + xa2 + ya3 + aF + ax2 + ay2 + more
        word    fline + xa4 + ya3 + xb4 + yb8 + more
        word    fline + xa1 + ya1 + xb2 + yb1

        word    farc + xa2 + ya6 + a8 + ax2 + ay2 + more        'h
        word    fline + xa0 + ya4 + xb0 + ybC + more
        word    fline + xa4 + ya4 + xb4 + yb6

        word    fline + xa1 + ya4 + xb3 + yb4 + more            'i
        word    fline + xa2 + ya4 + xb2 + yb8 + more
        word    fline + xa1 + ya8 + xb2 + yb8 + more
        word    fline + xa2 + yaB + xb2 + ybA

        word    farc + xa0 + ya3 + aF + ax2 + ay2 + more        'j
        word    fline + xa2 + ya3 + xb2 + yb8 + more
        word    fline + xa1 + ya8 + xb2 + yb8 + more
        word    fline + xa2 + yaB + xb2 + ybA

        word    fline + xa0 + ya4 + xb0 + ybC + more            'k
        word    fline + xa0 + ya6 + xb2 + yb6 + more
        word    fline + xa2 + ya6 + xb4 + yb8 + more
        word    fline + xa2 + ya6 + xb4 + yb4

        word    fline + xa1 + ya4 + xb3 + yb4 + more            'l
        word    fline + xa2 + ya4 + xb2 + ybC + more
        word    fline + xa1 + yaC + xb2 + ybC

        word    farc + xa1 + ya7 + a8 + ax1 + ay1 + more        'm
        word    farc + xa3 + ya7 + a8 + ax1 + ay1 + more
        word    fline + xa0 + ya4 + xb0 + yb8 + more
        word    fline + xa2 + ya4 + xb2 + yb7 + more
        word    fline + xa4 + ya4 + xb4 + yb7

        word    farc + xa2 + ya6 + a8 + ax2 + ay2 + more        'n
        word    fline + xa0 + ya4 + xb0 + yb8 + more
        word    fline + xa4 + ya4 + xb4 + yb6

        word    farc + xa2 + ya6 + a0 + ax2 + ay2               'o

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'p
        word    fline + xa0 + ya1 + xb0 + yb8

        word    farc + xa2 + ya6 + a0 + ax2 + ay2 + more        'q
        word    fline + xa4 + ya1 + xb4 + yb8

        word    farc + xa2 + ya7 + a8 + ax2 + ay1 + more        'r
        word    fline + xa0 + ya4 + xb0 + yb8

        word    farc + xa2 + ya7 + a9 + ax2 + ay1 + more        's
        word    farc + xa2 + ya5 + aB + ax2 + ay1 + more
        word    fline + xa0 + ya4 + xb2 + yb4 + more
        word    fline + xa2 + ya8 + xb4 + yb8

        word    farc + xa4 + ya6 + aE + ax2 + ay2 + more        't
        word    fline + xa0 + ya8 + xb4 + yb8 + more
        word    fline + xa2 + ya6 + xb2 + ybA

        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more        'u
        word    fline + xa0 + ya6 + xb0 + yb8 + more
        word    fline + xa4 + ya4 + xb4 + yb8

        word    fline + xa0 + ya8 + xb2 + yb4 + more            'v
        word    fline + xa4 + ya8 + xb2 + yb4

        word    farc + xa1 + ya5 + aA + ax1 + ay1 + more        'w
        word    farc + xa3 + ya5 + aA + ax1 + ay1 + more
        word    fline + xa0 + ya5 + xb0 + yb8 + more
        word    fline + xa2 + ya5 + xb2 + yb6 + more
        word    fline + xa4 + ya5 + xb4 + yb8

        word    fline + xa0 + ya8 + xb4 + yb4 + more            'x
        word    fline + xa0 + ya4 + xb4 + yb8

        word    farc + xa2 + ya6 + aA + ax2 + ay2 + more        'y
        word    farc + xa2 + ya3 + aF + ax2 + ay2 + more
        word    fline + xa4 + ya3 + xb4 + yb8 + more
        word    fline + xa0 + ya6 + xb0 + yb8 + more
        word    fline + xa1 + ya1 + xb2 + yb1

        word    fline + xa0 + ya8 + xb4 + yb8 + more            'z
        word    fline + xa4 + ya8 + xb0 + yb4 + more
        word    fline + xa0 + ya4 + xb4 + yb4

        word    farc + xa3 + yaA + aD + ax1 + ay3 + more        'open-curly-brace
        word    farc + xa1 + ya6 + aC + ax1 + ay2 + more
        word    farc + xa1 + yaA + aF + ax1 + ay2 + more
        word    farc + xa3 + ya6 + aE + ax1 + ay3

        word    fline + xa2 + ya3 + xb2 + ybD                   '|

        word    farc + xa1 + yaA + aC + ax1 + ay3 + more        'close-curly-brace
        word    farc + xa3 + ya6 + aD + ax1 + ay2 + more
        word    farc + xa3 + yaA + aE + ax1 + ay2 + more
        word    farc + xa1 + ya6 + aF + ax1 + ay3

        word    farc + xa1 + ya8 + a8 + ax1 + ay1 + more        '~
        word    farc + xa3 + ya8 + aA + ax1 + ay1

' Vector font - custom characters ($7F+)

        word    fline + xa2 + ya9 + xb0 + yb4 + more            'delta
        word    fline + xa2 + ya9 + xb4 + yb4 + more
        word    fline + xa0 + ya4 + xb4 + yb4

        word    farc + xa2 + ya7 + a8 + ax2 + ay2 + more        'omega
        word    farc + xa1 + ya7 + aE + ax1 + ay2 + more
        word    farc + xa3 + ya7 + aF + ax1 + ay2 + more
        word    fline + xa1 + ya5 + xb1 + yb4 + more
        word    fline + xa3 + ya5 + xb3 + yb4 + more
        word    fline + xa0 + ya4 + xb1 + yb4 + more
        word    fline + xa4 + ya4 + xb3 + yb4

        word    farc + xa2 + ya8 + a0 + ax1 + ay1               'bullet
        alignl

CON     fx = 3  'number of custom characters
}}

DAT
                        org     0
'*************************************
'* Assembly language graphics driver *
'*************************************
GRAPHICS_START
' we re-use the first 28 longs as variables after start-up!
regptr                  rdlong  regptr,ptra++
v0                      cogid   v0              ' calculate ...
v1                      shl     v0,#2           ' ... request ...
v2                      add     v0,regptr       ' ... block ...
v3                      rdlong  rqstptr,v0      ' ... address ...
v4                      and     rqstptr,low23   ' ... (only use 23 bits)
v5                      wrlong  #0,rqstptr      ' clear any outstanding request
v6                      mov     v1,##LMM_HMI<<24  ' register ...
v7                      or      v1,rqstptr      ' ... ourselves ...
v8                      wrlong  v1,v0           ' ... as a HMI plugin
v9                      mov     rsltptr,rqstptr ' calculate ...
txtiles                 add     rsltptr,#4       ' ... result address
tytiles                 rdlong  txtiles,ptra++
fontptr                 rdlong  tytiles,ptra++
tilefontptr             rdlong  fontptr,ptra++
tileptr                 rdlong  tilefontptr,ptra++
colorptr                rdlong  tileptr,ptra++
paletteptr              rdlong  colorptr,ptra++
mouseptr                rdlong  paletteptr,ptra++
gylongs                 rdlong  mouseptr,ptra++
ckbd_tailp              setq2   #(LUT_END-LUT_START-1)  ' load LUT code ...
ckbd_headp              rdlong  0,##@LUT_START          ' ... to LUT RAM
ckbd_tail               mov     ckbd_tailp, ##@USB_Data ' point to ...
ckbd_head               add     ckbd_tailp,#4           ' ... to kb_tail
gxtiles                 mov     ckbd_headp,ckbd_tailp   ' point to ...
gytiles                 add     ckbd_headp,#4           ' ... kb_head
                        call    #dsetup                 ' do default graphic setup
                        call    #init_cursor
                        
' Graphics driver - main loop
' Note that we are interpreting service requests here, not graphics requests.
' We have to use the service SVC_GRAPHIC for requesting graphics requests.

loop

                        call    #ccheck                 ' check for cursor update 
                        call    #ucheck                 ' check for usb (keyboard/mouse/gamepad) update
                        call    #mcheck                 ' check for mouse update
                        rdlong  rqst,rqstptr  wz        ' wait for request
        if_z            jmp     #loop
                        mov     rslt,#0                 ' clear old result
                        getbyte v2,rqst,#3              ' get service from request
                        cmp     v2,#40 wcz
        if_a            jmp     #done_bad
                        altgw   v2,#svctable
'                        getword v2 ' p2asm needs S & #N
                        getword v2,0,#0
                        jmp     v2

svctable
                        word    done_ok    ' 0 ' initialize not required (just return ok!)
                        word    k_present  ' 1
                        word    k_get      ' 2
                        word    k_wait     ' 3
                        word    k_new      ' 4
                        word    k_ready    ' 5
                        word    k_clear    ' 6
                        word    done_ok    ' 7 ' k_state not supported (but must not return -1!)
                        word    done_bad   ' 8
                        word    done_bad   ' 9
                        word    done_bad   '10
                        word    m_present  '11
                        word    m_button   '12
                        word    m_buttons  '13
                        word    m_abs_x    '14
                        word    m_abs_y    '15
                        word    done_bad   '16 ' m_abs_z not supported
                        word    m_delta_x  '17
                        word    m_delta_y  '18
                        word    done_bad   '19 ' m_delta_z not supported
                        word    m_reset    '20
                        word    t_geometry '21
                        word    t_char     '22
                        word    t_string   '23
                        word    t_int      '24 
                        word    t_unsigned '25 
                        word    done_bad   '26 ' t_hex to be implemented in C
                        word    done_bad   '27 ' t_bin ro be implemented in C
                        word    t_setpos   '28
                        word    t_getpos   '29
                        word    t_mode     '30
                        word    t_scroll   '31
                        word    t_color    '32
                        word    done_bad   '33 ' t_color_fg not supported
                        word    done_bad   '34 ' t_color_bg not supported
                        word    t_graphics '35
                        word    g_port     '36
                        word    g_buttons  '37
                        word    g_abs_x    '38
                        word    g_abs_y    '39
                        word    g_abs_z    '40

                        alignl ' force long alignment
done_bad
                        neg     rslt,#1 ' unknown service specified
                        jmp    #done
done_ok
                        mov    rslt, #0 ' successful completion
done
                        wrlong  rslt,rsltptr ' save result
                        wrlong  #0,rqstptr ' indicate request complete
                        jmp     #loop ' wait for next request


ucheck

' this is clumsy, but is required in case we use the OLD method of specifying the USB port:
#if !defined(USE_USB_A) && !defined(USE_USB_B)
#if !(defined(NO_KEYBOARD) && defined(NO_MOUSE))
#define USE_USB_A
#endif
#if (!defined(NO_KEYBOARD) && !defined(NO_MOUSE))
#define USE_USB_B
#endif
#endif

#if defined(USE_USB_A)
                        testp   #USB_A_EVENT_REPO wc
              if_c      rdpin   cnotify, #USB_A_EVENT_REPO
              if_nc     jmp     #.ucheck_B
                        call    #usb_event
#endif
.ucheck_B 
#if defined(USE_USB_B)
                        testp   #USB_B_EVENT_REPO wc
              if_c      rdpin   cnotify, #USB_B_EVENT_REPO
              if_nc     ret
                        call    #usb_event
#endif
                        ret


t_graphics
                        rdlong  v1,rqst
                        mov     gcommand,v1
                        shr     gcommand,#24             'get command (upper 8 bits)
                        setq    #8 - 1            'get command and up to 8 arguments (not all needed by all commands)
                        rdlong  arg0,v1
release

                        call    #setd2             'set dx,dy from arg0,arg1 (works for many commands)

                        'Trying new approach to jump table (suggested by Wuerfel_21)
                        'ALTGW D, S will select word #D from table starting at S
                        'Getword D brings that word into D
                        'JMP to that D (and not #D) takes you where you need to go.

                        altgw   gcommand,#jumps
'                        getword gcommand ' p2asm needs S & #N
                        getword gcommand,0,#0
                        jmp     gcommand

jumps                   word    0                       '0
                        word    setup_                  '1
                        word    color_                  '2
                        word    width_                  '3
                        word    plot_                   '4
                        word    line_                   '5
                        word    arc_                    '6
                        word    vec_                    '7
                        word    vecarc_                 '8
                        word    pix_                    '9
                        word    pixarc_                 'A
                        word    text_                   'B
                        word    textarc_                'C
                        word    textmode_               'D
                        word    fill_                   'E
                        word    done_ok                 'F
                        word    v_clear_                '$10
                        word    v_copy_                 '$11
                        word    add_ram_                '$12
                        alignl ' force long alignment

'
' setup(gx_offs, gy_offs, gx_tiles, gy_tiles, x_origin, y_origin) bases_ptr, vbases_ptr, slices_ptr, tmap_ptr, tlist_ptr, t0_ptr
'

setup_
                        call    #t_nocurs              ' remove cursor if on display
                        mov     curs_1_mode,#0         ' turn visible cursor off
                        call    #hsetup                ' process setup arguments
                        mov     vinit,#0
                        cmp     cinit,#0 wz
         if_z           call    #init_cursor
                        jmp     #done_ok

'
' color(c)
'
color_                  mov     pcolor,arg0             'set pixel color

                        jmp     #done_ok
'
' width(w)  pixel_passes
'
width_                  mov     pwidth,arg0             'set pixel width
                        mov     passes,arg1             'set pixel passes
                        jmp     #done_ok
'
' plot(x, y)
'
plot_                   call    #plotd

                        jmp     #done_ok
'
' line(x, y)
'
line_                   call    #linepd

                        jmp     #done_ok
'
' arc(x, y, xr, yr, angle, anglestep, iterations, mode)
'
arc_                    and     arg7,#3                 'limit mode

.loop                   call    #arca                   'get arc dx,dy

                        cmp     arg7,#1         wz      'if not mode 1, set px,py
        if_nz           mov     px,dx
        if_nz           mov     py,dy

                        tjz     arg6,#done_ok              'if no points exit with new px,py

                        cmp     arg7,#3         wz      'if mode 3, set center
        if_z            call    #setd2

                        test    arg7,#1         wz      'if mode 0 or 2, plot point
        if_z            call    #plotp

                        test    arg7,#1         wz      'if mode 1 or 3, plot line
        if_nz           call    #linepd

                        cmp     arg7,#2         wz      'if mode 2, set mode 1
        if_z            mov     arg7,#1

                        add     arg4,arg5               'step angle
                        djnz    arg6,#.loop             'loop if more iterations

                        jmp     #done_ok
'
' vec(x, y, vecscale, vecangle, vecdef_ptr)
' vecarc(x, y, xr, yr, angle, vecscale, vecangle, vecdef_ptr)
'
' vecdef:       word    $8000/$4000+angle       'vector mode + 13-bit angle (mode: $4000=plot, $8000=line)
'               word    length                  'vector length
'               ...                             'more vectors
'               ...
'               word    0                       'end of definition
'
vecarc_                 call    #arcmod

vec_                    tjz     arg2,#done_ok              'if scale 0, exit

.loop                   rdword  v7,arg4         wz      'get vector mode+angle
                        add     arg4,#2

        if_z            jmp     #done_ok                   'if mode+angle 0, exit

                        rdword  v1,arg4                 'get vector length
                        add     arg4,#2

                        abs     v2,arg2         wc      'add/sub vector angle to/from angle
                        mov     v6,arg3
                        sumc    v6,v7

                        call    #multiply               'multiply length by scale
                        add     v1,#$80                 'round up 1/2 lsb
                        shr     v1,#8

                        mov     v4,v1                   'get arc dx,dy
                        mov     v5,v1
                        call    #arcd

                        test    v7,h8000        wc      'plot pixel or draw line?
        if_nc           call    #plotd
                        test    v7,h8000        wc
        if_c            call    #linepd

                        jmp     #.loop                  'get next vector
'
' pix(x, y, pixrot, pixdef_ptr)
' pixarc(x, y, xr, yr, angle, pixrot, pixdef_ptr)
'
' pixdef:       word
'               byte    xwords, ywords, xorigin, yorigin
'               word    %%xxxxxxxx,%%xxxxxxxx
'               word    %%xxxxxxxx,%%xxxxxxxx
'               word    %%xxxxxxxx,%%xxxxxxxx
'               ...
'
pixarc_                 call    #arcmod

pix_                    mov     v6,pcolor               'save color

                        mov     px,dx                   'get center into px,py
                        mov     py,dy

                        mov     sy,pwidth               'get actual pixel width
                        add     sy,#1

                        rdbyte  dx,arg3                 'get dimensions into dx,dy
                        add     arg3,#1
                        rdbyte  dy,arg3
                        add     arg3,#1

                        rdbyte  v1,arg3                 'get origin and adjust px,py
                        add     arg3,#1
                        rdbyte  v2,arg3
                        add     arg3,#1
                        neg     v2,v2
                        sub     v2,#1
                        add     v2,dy
                        mov     v3,sy
.adjust                 test    arg2,#%001      wz
                        test    arg2,#%110      wc
        if_z            sumnc   px,v1
        if_nz           sumc    py,v1
                        test    arg2,#%010      wc
        if_nz           sumnc   px,v2
        if_z            sumnc   py,v2
                        djnz    v3,#.adjust

.yline                  mov     sx,#0                   'plot entire pix
                        mov     v3,dx
.xword                  rdword  v4,arg3                 'read next pix word
                        add     arg3,#2
                        shl     v4,#16
                        mov     v5,#8
.xpixel                 rol     v4,#2                   'plot pixel within word
                        test    v4,#1           wc      'set color
                        muxc    pcolor,color1
                        test    v4,#2           wc
                        muxc    pcolor,color2   wz      '(z=1 if color=0)
        if_nz           call    #plotp
                        test    arg2,#%001      wz      'update px,py for next x
                        test    arg2,#%110      wc
        if_z            sumc    px,sy
        if_nz           sumnc   py,sy
                        add     sx,sy
                        djnz    v5,#.xpixel             'another x pixel?
                        djnz    v3,#.xword              'another x word?
        if_z            sumnc   px,sx                   'update px,py for next y
        if_nz           sumc    py,sx
                        test    arg2,#%010      wc
        if_nz           sumc    px,sy
        if_z            sumc    py,sy
                        djnz    dy,#.yline              'another y line?

                        mov     pcolor,v6               'restore color

                        jmp     #done_ok
'
' textmode(x_scale, y_scale, spacing, justification)
'
textmode_               mov     textsx,arg0             'set text x scale
                        mov     textsy,arg1             'set text y scale
                        mov     textsp,arg2             'set text spacing

                        jmp     #done_ok
'
' Plot line from px,py to dx,dy
'
linepd

                        subs    dx,px           wc', wr  'get x difference
                        negc    sx,#1                   'set x direction

                        subs    dy,py           wc', wr  'get y difference
                        negc    sy,#1                   'set y direction

                        abs     dx,dx                   'make differences absolute
                        abs     dy,dy

                        cmp     dx,dy           wc      'determine dominant axis
        if_nc           tjz     dx,#.last               'if both differences 0, plot single pixel
        if_nc           mov     pixelcount,dx           'set pixel count
        if_c            mov     pixelcount,dy

                        mov     ratio,pixelcount        'set initial ratio
                        shr     ratio,#1
        if_c            jmp     #.yloop                 'x or y dominant?

.xloop                  call    #plotp                  'dominant x line
                        add     px,sx
                        sub     ratio,dy        wc
        if_c            add     ratio,dx
        if_c            add     py,sy
                        djnz    pixelcount,#.xloop

                        jmp     #.last                  'plot last pixel

.yloop                  call    #plotp                  'dominant y line
                        add     py,sy
                        sub     ratio,dx        wc
        if_c            add     ratio,dy
        if_c            add     px,sx
                        djnz    pixelcount,#.yloop

.last                   call    #plotp                  'plot last pixel
                        ret

'
' Plot pixel at px,py
'
plotd
                        mov     px,dx                   'set px,py to dx,dy
                        mov     py,dy
plotp                   tjnz    pwidth,#wplot           'if width > 0, do wide plot

                        mov     v1,px                   'compute pixel mask
                        shl     v1,#1
                        mov     mask0,#%11
                        shl     mask0,v1
                        shr     v1,#5

                        cmp     v1,gxtiles       wc      'if x or y out of bounds, exit
        if_c            cmp     py,gylongs       wc
        if_nc           ret

                        mov     bits0,pcolor            'compute pixel bits
                        and     bits0,mask0
 ' save v1 and do physical update ...

                        shl     v1,#2'1                   'get address of pixel long
                        add     v1,basesptr
                        mov     v2,py   'RJA:  Changing to long bases
                        rdlong  v1,v1
                        shl     v2,#2
                        add     v1,v2

' RJH - virtual update -------------------------------------------------------------------- OLD
'                        rdlong  v2,v1                   'write pixel
'                        andn    v2,mask0
'                        or      v2,bits0
'                        wrlong  v2,v1
' RJH - virtual update -------------------------------------------------------------------- NEW
                        mov     addr,v1
'                        sub     addr,baseptr
                        sets    bitmask,#mask0
                        sets    bits,#bits0
                        call    #rdwrsparse
' RJH - virtual update -------------------------------------------------------------------- END
                        ret

'
' Plot wide pixel
'
wplot                   mov     v1,py                   'if y out of bounds, exit
                        add     v1,#7
                        mov     v2,gylongs
                        add     v2,#7+8
                        cmp     v1,v2           wc
        if_nc           ret

                        mov     v1,px                   'determine x long pair
                        sub     v1,#8
                        sar     v1,#4
                        cmp     v1,gxtiles       wc
                        muxc    jumps,#%01              '(use jumps[1..0] to store writes)
                        add     v1,#1
                        cmp     v1,gxtiles       wc
                        muxc    jumps,#%10

                        test    jumps,#%11      wz      'if x out of bounds, exit
        if_z            ret

                        shl     v1,#2                   'get base pair
                        add     v1,basesptr
                        rdlong  base1,v1  'RJA changing to long bases
                        sub     v1,#4
                        rdlong  base0,v1

                        mov     v1,px                   'determine pair shifts
                        shl     v1,#1
                        sets    .shift1,v1
                        xor     .shift1,#7<<1
                        add     v1,#9<<1
                        sets    .shift0,v1
                        test    v1,#$F<<1       wz      '(account for special case)
        if_z            andn    jumps,#%01

                        mov     pass,#0                 'ready to plot slices
                        mov     slice,slicesptr

.loop                   rdlong  mask0,slice             'get next slice
                        mov     mask1,mask0

.shift0                 shl     mask0,#0                'position slice
.shift1                 shr     mask1,#0

                        mov     bits0,pcolor            'colorize slice
                        and     bits0,mask0
                        mov     bits1,pcolor
                        and     bits1,mask1

                        mov     v1,py                   'plot lower slice
                        add     v1,pass
                        cmp     v1,gylongs       wc
        if_c            call    #wslice

                        mov     v1,py                   'plot upper slice
                        test    pwidth,#1       wc
                        subx    v1,pass
                        cmp     v1,gylongs       wc
        if_c            call    #wslice

                        add     slice,#4                'next slice
                        add     pass,#1
                        cmp     pass,passes     wz
        if_nz           jmp     #.loop

                        ret

'
' Plot wide pixel slice
'
wslice                  shl     v1,#2                   'ready long offset

                        add     base0,v1                'plot left slice
                        test    jumps,#%01      wc
' RJH - virtual update -------------------------------------------------------------------- OLD
'       if_c            rdlong  v2,base0
'       if_c            andn    v2,mask0
'       if_c            or      v2,bits0
'       if_c            wrlong  v2,base0
' RJH ------------------------------------------------------------------------------------- END
        if_c            mov     addr,base0
'        if_c            sub     addr,baseptr
        if_c            sets    bitmask,#mask0
        if_c            sets    bits,#bits0
        if_c            call    #rdwrsparse
' RJH - virtual update -------------------------------------------------------------------- END

                        add     base1,v1                'plot right slice
                        test    jumps,#%10      wc

' RJH - virtual update -------------------------------------------------------------------- OLD
'       if_c            rdlong  v2,base1
'       if_c            andn    v2,mask1
'       if_c            or      v2,bits1
'       if_c            wrlong  v2,base1
' RJH - virtual update -------------------------------------------------------------------- NEW
        if_c            mov     addr,base1
'        if_c            sub     addr,baseptr
        if_c            sets    bitmask,#mask1
        if_c            sets    bits,#bits1
        if_c            call    #rdwrsparse
' RJH ------------------------------------------------------------------------------------- END

                        sub     base0,v1                'restore bases
                        sub     base1,v1

                        ret
'

sine_90                 long    $0800                   '90 bit
sine_180                long    $1000                   '180 bit

'
' Multiply
'
'   in:         v1 = 16-bit multiplicand (v1[31..16] must be 0)
'               v2 = 16-bit multiplier
'
'   out:        v1 = 32-bit product
'
multiply
                        mul     v1,v2
                        ret

' this code has to be in cog RAM since the code is self-modifying.

have_addr
' if_z  ret
                 rdlong tmp,realaddr    ' write ...
bitmask          andn    tmp,0-0                 ' ... if not ...
bits             or      tmp,0-0                 ' ... the 'all 0' ...
                 wrlong  tmp,realaddr            ' tile
                 ret

t_geometry
        mov     rslt,textcols
        shl     rslt,#8
        or      rslt,textrows ' result is cols*256 + rows
        jmp     #done



h8000                   long    $8000
hFFFFFFFF               long    $FFFFFFFF
color1                  long    %%1111111111111111
color2                  long    %%2222222222222222

pcolor                  long    %%1111111111111111      'pixel color
pwidth                  long    0                       'pixel width
passes                  long    1                       'pixel passes
textsx                  long    1                       'text scale x
textsy                  long    1                       'text scale y
textsp                  long    6                       'text spacing
'
low23                   long    $007FFFFF
maxdec                  long     1000000000     ' maximum decimal divisor for 32 bit values

ctmp                    long    0

px                      long    0
py                      long    0

sx                      long    0       'line
sy                      long    0
pixelcount              long    0
ratio                   long    0

pass                    long    0       'plot
slice                   long    0
base0                   long    0
base1                   long    0
mask0                   long    0
mask1                   long    0
bits0                   long    0
bits1                   long    0

' RJH - virtual driver ----------------------------------------------------- NEW
tmask                   long    $000FFFFF ' 20 bits of tile number

addr                    long    0
prevaddr                long    0
prevtile                long    -1
realaddr                long    0
tileaddr                long    0
tilecolor               long    0
tpmaddr                 long    0
tmp                     long    0
tmpaddr                 long    0

gxoffs                  long    0
gyoffs                  long    0
xorigin                 long    0
yorigin                 long    0
textcols                long    0
textrows                long    0
maplinelen              long    0
basesptr                long    0       'pointers
slicesptr               long    0
tmapptr                 long    0       ' address of tile map
vbasesptr               long    0
t0ptr                   long    0       'address of the special 'all 0' tile
tlistptr                long    0       'address of free tile list
tdataptr                long    0       'address of tile data
vinit                   long    0
cinit                   long    0
finit                   long    0
curs_2_test             long    $00400000 ' mask to test for cursor 2
curs_1_test             long    $00800000 ' mask to test for cursor 0 or 1 (if not curs_2)
mode                    long    0
col                     long    0
row                     long    0
curs_0_mode             long    %1000 ' scroll
curs_0_col              long    0
curs_0_row              long    0
curs_1_mode             long    %1010 ' scroll,visible, block, and ...
                                      ' ... slow, since fast cannot be set here
curs_1_col              long    0
curs_1_row              long    0
clast                   long    0               ' last clock count retrieved
ctime                   long    _CLOCKFREQ/2                   ' cursor on/off time (~0.5 sec)
schar                   long    $5F                   ' char to swap with screen char (underscore)
scolor                  long    15              ' color for screen cursor
scurs                   long    0               ' bit 0 = 1 when cursor is on screen
                                                ' bit 1 = 1 when cursor should be on screen

upper_tile              long    0
lower_tile              long    0
upper_color             long    0
lower_color             long    0
curs_upper_tile         long    0
curs_lower_tile         long    0
curs_upper_color        long    0
curs_lower_color        long    0
block_upper_tile        long    0
block_lower_tile        long    0
block_upper_color       long    0
block_lower_color       long    0

scr_fg                  long    DEFAULT_FG ' ansi color number
scr_bg                  long    DEFAULT_BG ' ansi color number

dx                      long    0       'line/plot coordinates
dy                      long    0

rqstptr                 long    0
rsltptr                 long    0
rqst                    long    0
rslt                    long    0

gcommand                long    0
arg0                    long    0               'up to 8 arguments passed from high-level
arg1                    long    0
arg2                    long    0
arg3                    long    0
arg4                    long    0
arg5                    long    0
arg6                    long    0
arg7                    long    0

km_connected            long    0

cnotify                 long    0
cmouse_buttons          long    0
cmouse_x                long    0
cmouse_y                long    0
ckbd_scancode           long    0       ' USB HID keyboard scancode of the key
ckbd_modkeys            long    0       ' See the hub interface constants for usage
ckbd_keypress           long    0       ' The ASCII character associated with this scancode
ckbd_ledstate           long    0       ' See the hub interface constants for usage
cgpd_head               long    0
cgpd_tail               long    0
cgpd_port               long    0
cgpd_type               long    0
cgpd_data               long    0

' curent mouse data
ms_buttons              long    0       ' Button 1..3 state flags
ms_x_raw                long    0       ' mouse X absolute position
ms_y_raw                long    0       ' mouse Y absolute position
ms_x_max                long    0       ' mouse X maximum position
ms_y_max                long    0       ' mouse Y maximum position
ms_x_abs                long    0
ms_y_abs                long    0
ms_x_del                long    0       ' mouse X delta (since last m_delta)
ms_y_del                long    0       ' mouse Y delta (since last m_delta)
kb_scan1                long    0
kb_scan2                long    0
ms_vis                  long    0

' updated mouse data
msu_buttons             long    0       ' Button 1..3 state flags
msu_x_raw               long    0       ' mouse X absolute position
msu_y_raw               long    0       ' mouse Y absolute position
msu_x_max               long    0       ' mouse X maximum position
msu_y_max               long    0       ' mouse Y maximum position
kbu_scan1               long    0
kbu_scan2               long    0
msu_vis                 long    0

' support up to NUM_GAMEPADS gamepads (but must all be on same USB port!)
gamepad_data            word    $FFFF[6*NUM_GAMEPADS]   ' port, buttons, x_abs, y_abs, z_abs, unused

'                       fit     $1c0
' have 48 longs available
                        fit     $1f0

DAT ' LUT code

                        orgh

                        alignl ' align long

                        org     $200
LUT_START

' k_setup - set up ckbd_tail and ckbd_head
k_setup
                        rdlong  ckbd_tail, ckbd_tailp
        _ret_           rdlong  ckbd_head, ckbd_headp

g_port
                        mov     v2,#GPD_PORT
                        jmp     #g_fetch

g_buttons
                        mov     v2,#GPD_BUTTONS
                        jmp     #g_fetch

g_abs_x
                        mov     v2,#GPD_X_AXIS
                        jmp     #g_fetch
g_abs_y
                        mov     v2,#GPD_Y_AXIS
                        jmp     #g_fetch
g_abs_z
                        mov     v2,#GPD_Z_AXIS
g_fetch
                        mov     v0,rqst
                        and     v0,#$F ' max 16 gamepads should be enough!
                        mul     v0,#3
                        add     v0,#gamepad_data
                        altgw   v2,v0
'                        getword rslt ' p2asm needs S & #N
                        getword rslt,0,#0
                        signx   rslt,#15 ' sign extend 16 bit values
                        jmp     #done


k_present
                        mov     rslt,km_connected   ' if kbd connected ...
                        and     rslt,#1             ' ... then return 1
                        jmp     #done

k_get
                        call    #k_load                ' load key pointed to by ckbd_tail
        if_z            jmp     #done                            ' Z set if no key available
k_consume
                        incmod  ckbd_tail, #KBD_BUFFMASK
                        'wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
                        wrlong  ckbd_tail,ckbd_tailp
                        jmp     #done

k_new
                        call    #k_setup
                        mov     ckbd_tail,ckbd_head      ' set ckbd_tail to ckbd_head
                        'wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
                        wrlong  ckbd_tail,ckbd_tailp

k_wait
                        call    #ccheck                 ' check for cursor update
                        call    #ucheck                 ' process USB notifications
                        call    #k_load
        if_z            jmp     #k_wait             ' Z set if no key available
                        jmp     #k_consume          ' consume and return the key

k_ready
                        call    #k_setup
                        cmp     ckbd_tail,ckbd_head wz ' ckbd_tail = ckbd_head?
        if_z            mov     rslt,#0             ' rslt == 0 if no key ready
        if_nz           neg     rslt,#1             ' rslt == -1 if a key is ready
                        jmp     #done

k_clear
                        call    #k_setup
                        mov     ckbd_tail,ckbd_head      ' set ckbd_tail to ckbd_head
                        'wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
                        wrlong  ckbd_tail,ckbd_tailp
                        jmp     #done

m_present
                        mov     rslt,km_connected   ' if mouse connected ...
                        shr     rslt,#1             ' ... then return 1
                        jmp     #done
m_buttons
                        mov     rslt,ms_buttons     ' get all buttons states
                        jmp     #done
m_button
                        mov     rslt,ms_buttons     ' get all buttons states
                        mov     v1,rqst
                        and     v1,#$FF
                        shr     rslt,v1
                        and     rslt,#$1 wz
                        jmp     #done
m_abs_x
                        mov     rslt,ms_x_abs       ' get abs x value
                        jmp     #done               ' return delta x
m_abs_y
                        mov     rslt,ms_y_abs       ' get abs x value
                        jmp     #done               ' return delta x
m_delta_x
                        mov     rslt,ms_x_del       ' get delta x value
                        mov     ms_x_del,#0         ' clear delta x
                        jmp     #done               ' return delta x
m_delta_y
                        mov     rslt,ms_y_del       ' get delta x value
                        mov     ms_y_del,#0         ' clear delta x
                        jmp     #done               ' return delta x
m_reset
                        mov     ptra,mouseptr
                        rdlong  ms_x_raw,ptra++
                        rdlong  ms_y_raw,ptra++
                        mov     msu_x_raw,ms_x_raw         '
                        mov     msu_y_raw,ms_x_raw         '
                        mov     ms_x_abs,#0         '
                        mov     ms_y_abs,#0
                        mov     ms_x_del,#0         '
                        mov     ms_y_del,#0
                        jmp     #done_ok

'
' fill(x, y, da, db, db2, linechange, lines_minus_1)
'
fill_                   shl     dx,#16                  'get left and right fractions
                        or      dx,h8000
                        mov     v1,dx

                        mov     v2,gxtiles               'get x pixels
                        shl     v2,#4

                        add     arg6,#1                 'pre-increment line counter

.yloop                  add     dx,arg2                 'adjust left and right fractions
                        add     v1,arg3

                        cmps    dx,v1           wc      'get left and right integers
        if_c            mov     base0,dx
        if_c            mov     base1,v1
        if_nc           mov     base0,v1
        if_nc           mov     base1,dx
                        sar     base0,#16
                        sar     base1,#16

                        cmps    base0,v2        wc      'left out of range?
        if_c            cmps    hFFFFFFFF,base1 wc      'right out of range?
        if_c            cmp     dy,gylongs       wc      'y out of range?
        if_nc           jmp     #.skip                  'if any, skip

                        FGES    base0,#0                'limit left and right
                        FLES    base1,v2        wc
        if_nc           sub     base1,#1

                        shl     base0,#1                'make left mask
                        neg     mask0,#1
                        shl     mask0,base0
                        shr     base0,#5

                        shl     base1,#1                'make right mask
                        xor     base1,#$1E
                        neg     mask1,#1
                        shr     mask1,base1
                        shr     base1,#5

                        sub     base1,base0     wz      'ready long count
                        add     base1,#1

        if_z            and     mask0,mask1             'if single long, merge masks

                        shl     base0,#2'1                'get long base
                        add     base0,basesptr  'RJA: change from word to long?
                        'rdword  base0,base0
                        rdlong  base0,base0
                        shl     dy,#2
                        add     base0,dy
                        shr     dy,#2

                        mov     bits0,mask0             'ready left mask
.xloop                  mov     bits1,pcolor            'make color mask
                        and     bits1,bits0

' RJH - virtual update -------------------------------------------------------------------- OLD
                        'rdlong  pass,base0              'read-modify-write long
                        'andn    pass,bits0
                        'or      pass,bits1
                        'wrlong  pass,base0
' RJH - virtual update -------------------------------------------------------------------- NEW
                        mov     addr,base0
'                        sub     addr,baseptr
                        sets    bitmask,#bits0
                        sets    bits,#bits1
                        call    #rdwrsparse
' RJH ------------------------------------------------------------------------------------- END

                        shl     gylongs,#2               'advance to next long
                        add     base0,gylongs
                        shr     gylongs,#2
                        cmp     base1,#2        wz      'one more?
        if_nz           neg     bits0,#1                'if not, ready full mask
        if_z            mov     bits0,mask1             'if one more, ready right mask
                        djnz    base1,#.xloop           'loop if more longs

.skip                   sub     arg5,#1         wc      'delta change?
        if_c            mov     arg3,arg4               'if so, set new deltas
.same
                        add     dy,#1                   'adjust y
                        djnz    arg6,#.yloop            'another y?

                        jmp     #done_ok

' text(x, y, @string) justx, justy
' textarc(x, y, xr, yr, angle, @string) justx, justy
'
textarc_                call    #arcmod

text_                   add     arg3,arg0               'add x into justx
                        add     arg4,arg1               'add y into justy
.chr                    rdbyte  v1,arg2         wz      'get chr
                        add     arg2,#1
        if_z            jmp     #done_ok                   'if 0, done
                        sub     v1,#$21                 'if chr out of range, skip
                        cmp     v1,#$7F-$21+fx  wc
        if_nc           jmp     #.skip

                        mov     arg5,fontptr            'scan font for chr definition
.scan                   tjz     v1,#.def
                        rdword  v2,arg5
                        add     arg5,#2
                        test    v2,h8000        wc
        if_nc           sub     v1,#1
                        jmp     #.scan

.def                    rdword  v7,arg5                 'get font definition word
                        add     arg5,#2

                        call    #fontxy                 'extract initial x,y

                        test    v7,#$80         wc      'arc or line?
        if_nc           jmp     #.line


                        mov     v2,textsx               'arc, extract x radius
                        mov     v3,#%0001_0001_1
                        call    #fontb
                        mov     v4,v1

                        mov     v2,textsy               'extract y radius
                        mov     v3,#%0010_0011_1
                        call    #fontb
                        mov     v5,v1

                        mov     v2,#1                   'extract starting angle
                        mov     v3,#%0010_0011_0
                        call    #fontb
                        shl     v1,#11

                        mov     v6,v1                   'extract angle sweep
                        mov     v3,#%0010_0011_0
                        call    #fontb
                        neg     arg6,v1
                        shl     arg6,#4
                        add     arg6,#65

                        call    #arcd                   'plot initial arc point
                        call    #plotd

.arc                    call    #arcd                   'connect subsequent arc points with lines
                        call    #linepd
                        add     v6,#$80
                        djnz    arg6,#.arc

                        jmp     #.more


.line                   call    #plotd                  'line, plot initial x,y

                        call    #fontxy                 'extract terminal x,y

                        call    #linepd                 'draw line

.more                   test    v7,#$02         wc      'more font definition?
        if_c            jmp     #.def

.skip                   mov     v1,textsp               'advance x to next chr position
                        mov     v2,textsx
                        call    #multiply
                        add     arg3,v1

                        jmp     #.chr                   'get next chr


fontxy                  mov     v2,textsx               'extract x
                        mov     v3,#%0011_0111_0
                        call    #fontb
                        mov     arg0,v1
                        add     arg0,arg3

                        mov     v2,textsy               'extract y
                        mov     v3,#%0100_1111_0
                        call    #fontb
                        mov     arg1,v1
                        add     arg1,arg4

setd2                   mov     dx,xorigin              'set dx,dy from arg0,arg1
                        add     dx,arg0
                        mov     dy,yorigin
              _ret_     sub     dy,arg1

fontb                   mov     v1,v7                   'extract bitrange from font word
                        shr     v3,#1           wc
                        and     v1,v3
        if_c            add     v1,#1
                        shr     v3,#4
                        shr     v7,v3

                        shl     v1,#32-4                'multiply v1[3..0] by v2
                        mov     v3,#4
.loop                   shl     v1,#1           wc
        if_c            add     v1,v2
                        djnz    v3,#.loop

                       ret

'
' Get arc point from args and then move args 5..7 to 2..4
'
arcmod                  call    #arca                   'get arc using first 5 args

                        mov     arg0,dx                 'set arg0,arg1
                        sub     arg0,xorigin
                        mov     arg1,yorigin
                        sub     arg1,dy

                        mov     arg2,arg5               'move args 5..7 to 2..4
                        mov     arg3,arg6
                        mov     arg4,arg7

                        ret

'
' Get arc dx,dy from arg0,arg1
'
'   in:         arg0,arg1 = center x,y
'               arg2/v4 = x length
'               arg3/v5 = y length
'               arg4/v6 = 13-bit angle
'
'   out:        dx,dy = arc point
'
arca                    mov     v4,arg2                 'use args
                        mov     v5,arg3
                        mov     v6,arg4

arcd                    call    #setd2                   'reset dx,dy to arg0,arg1

                        mov     v1,v6                   'get arc dx
                        mov     v2,v4
                        call    #polarx
                        add     dx,v1

                        mov     v1,v6                   'get arc dy
                        mov     v2,v5
                        call    #polary
                        sub     dy,v1
                        ret

'
' Polar to cartesian
'
'   in:         v1 = 13-bit angle
'               v2 = 16-bit length
'
'   out:        v1 = x|y
'
polarx                  add     v1,sine_90              'cosine, add 90 for sine lookup
polary                  test    v1,sine_180     wz      'get sine quadrant 3|4 into nz
                        test    v1,sine_90      wc      'get sine quadrant 2|4 into c

                        'RJA:  Use QRot instead...
                        shl     v1,#32-13
                        QROTATE v2,v1
                        getqy   v1

                        ret

'
' RJH - virtual update -------------------------------------------------------------------- NEW
'
' RJH: perform virtual update instead of real update
'  old code typically looks like:
'                       rdlong  xxx,long_addr
'                       andn    xxx,maskx
'                       or      xxx,bitsx
'                       wrlong  xxx,long_addr
'
'  new code typically looks like:
'                       mov     addr,long_addr
''                       sub     v1, baseptr
'                       sets    bitmask,#maskx
'                       sets    bits,#bitsx
'                       call    #rdwrsparse
'
'  pseudo code of replacement:
'    find tile that contains addr
'    if tile is dummy tile_0, replace with real tile
'    if no tile available, replace with tile_0
'
rdwrsparse
                        cmp     addr,prevaddr    wz     ' same virtual addr as last time?
        if_z            jmp     #have_addr              ' yes - still have real addr
                        mov     prevaddr,addr           ' no - save virtual addr for next time
                        mov     tmp,addr                ' get ...
                        and     tmp,tmask               ' ... virtual tile address
                        shr     tmp,#6
                        cmp     tmp,prevtile    wz      ' same tile as last time?
        if_z            jmp     #.have_tile_1           ' yes - already have the real tile address
                        mov     prevtile,tmp            ' no - save tile for next time
                        mov     tpmaddr,tmp             ' get ...
                        shl     tpmaddr,#2
                        add     tpmaddr,tmapptr
                        rdlong  tileaddr,tpmaddr
                        mov     tilecolor,tileaddr      ' ... separating ...
                        and     tileaddr,tmask          ' ... tile ...
                        andn    tilecolor,tmask         ' ... from color
                        cmp     tileaddr,t0ptr  wz      ' is this the special 'all 0' tile?
        if_nz           jmp     #.have_tile_2           ' no - we already have a tile to write on
                        rdlong  tileaddr,tlistptr       ' yes - get address of first tile on free list
                        tjz     tileaddr,#.only_tile_0  ' if no tiles left
                        rdlong  tmp,tileaddr            ' yes - take tile off ...
                        wrlong  tmp,tlistptr            ' ... free ...
                        wrlong  #0,tileaddr           ' ... list
                        mov     tmpaddr,tileaddr
                        mov     tmp,#16
.zero                   wrlong  #0,tmpaddr
                        add     tmpaddr,#4
                        djnz    tmp,#.zero
                        jmp     #.save_tile
.only_tile_0
                        ret                             ' do not use special 'all 0' tile!
.save_tile
                        mov     tmp,tileaddr            ' save tile ...
                        and     tmp,tmask               ' ... in ...
                        or      tmp,tilecolor           ' ... tile ...
                        wrlong  tmp,tpmaddr             ' ... pointer map
.have_tile_1
                        cmp     tileaddr,t0ptr wz       ' is the tile we have is the 'all 0' tile?
              if_nz     jmp     #.have_tile_2
                        ret
.have_tile_2
                        mov     realaddr,addr           ' calculate
                        and     realaddr,#$3f           ' ... real ...
                        add     realaddr,tileaddr       ' ... address
                        jmp     #have_addr              ' execute write (cannot be done from LUT!)

'                      '
' v_clear(tiles)
'
v_clear_
                        mov     v1,#0            ' v1 := 0
                        mov     v2,#0            ' repeat v2 from 0 to COLS-1
.col                    cmp     v2,gxtiles wcz
              if_ae     jmp     #.clear_done
                        mov     v4,v2            '   v4:=v2+gxoffs
                        add     v4,gxoffs
                        mov     v3,#0            '   repeat v3 from 0 to ROWS-1
.row                    cmp     v3,gytiles wcz
              if_ae     jmp     #.next_col
                        mov     v5,v3            '     v5:=(v3+gyoffs)*txtiles + v4
                        add     v5,gyoffs
                        mul     v5,txtiles
                        add     v5,v4
                        mov     v6,v1            '     long[@TileMap][v1] := @Tile0
                        shl     v6,#2
                        add     v6,tmapptr
                        wrlong  t0ptr,v6
                        cmp     vinit,#0 wz      '     if vinit == 0
              if_nz     jmp     #.next_row
                        shl     v5,#2            '       long[arg0][v5] := @Tile0
                        add     v5,arg0
                        wrlong  t0ptr,v5
.next_row               add     v1,#1            '     v1++
                        add     v3,#1
                        jmp     #.row
.next_col               add     v2,#1
                        jmp     #.col
.clear_done             mov     vinit,#1         ' vinit := 1
                        jmp     #done_ok


'
' v_copy(tiles)
'
v_copy_
                        tjz     vinit,#.copy_done ' if vinit <> 0
                        mov     v1,#0            ' n(v1) := 0
                        mov     v2,#0            ' repeat dxs(v2) from 0 to COLS-1
.col                    cmp     v2,gxtiles wcz
              if_ae     jmp     #.copy_done
                        mov     v4,v2            '  dxo(v4) :=dxs(v2)+gxoffs
                        add     v4,gxoffs
                        mov     v3,#0            '  repeat dys(v3) from 0 to ROWS-1
.row                    cmp     v3,gytiles wcz
              if_ae     jmp     #.next_col
                        mov     v5,v3            '    dyo(v5):=(dys(v3)+gyoffs)*txtiles + dxo(v4)
                        add     v5,gyoffs
                        mul     v5,txtiles
                        add     v5,v4
                        mov     v8,v5
                        shl     v8,#2
                        add     v8,arg0
                        rdlong  v6,v8            '    tmp1(v6) := long[tiles(arg0)][dyo(v5)]                
                        mov     v9,v1
                        shl     v9,#2
                        add     v9,tmapptr
                        rdlong  v7,v9            '    tmp2(v7) = long[@TileMap][n(v1)]
                        wrlong  t0ptr,v9         '      long[@TileMap][v1] := @Tile0
                        wrlong  v7,v8            '      long[tiles(arg0)][dyo(v5)] := tmp2(v7)
                        cmp     v6,t0ptr wz      '      if tmp1(v6) <> @Tile0
             if_z       jmp     #.next_row
                        rdlong  v7,tlistptr      
                        wrlong  v7,v6            '        long[tmp1(v6)] := long[@TileList]
                        wrlong  v6,tlistptr      '        long[@TileList] := tmp1(v6)
.next_row               add     v1,#1            '    add n(v1),#1
                        add     v3,#1
                        jmp     #.row
.next_col               add     v2,#1
                        jmp     #.col
.copy_done              jmp     #done_ok

add_ram_
                        mov     v1,arg0          ' pointer to new tile data
                        mov     v2,arg1          ' number of bytes of new tile data
                        call    #hadd_ram        ' add new tiles to the free tile list
                        jmp     #done_ok                   

t_mode
        call    #t_nocurs
        getbyte v0,rqst,#0      ' get mode from request
        test    rqst,curs_2_test wz  ' request intended for cursor 2?
  if_nz jmp     #.for_curs_2
        test    rqst,curs_1_test wz  ' request intended for cursor 0?
  if_z  mov     curs_0_mode,v0
  if_nz mov     curs_1_mode,v0
        and     v0,#3           ' fast blink?
        cmp     v0,#2 wz
  if_z  mov     ctime,##_CLOCKFREQ/2 ' ##_CLOCKFREQ/2 ' no - 1/2 sec
        cmp     v0,#3 wz
  if_z  mov     ctime,##_CLOCKFREQ/4 ' yes - 1/4 sec
        call    #init_cursor
        jmp     #done_ok
.for_curs_2
        mov     v1,mouseptr  ' point to ...
        add     v1,#28       ' ... mousevis
        wrlong  v0,v1
        jmp     #done_ok

t_color
        'call    #t_nocurs
        getbyte scr_fg,rqst,#0      ' get new fg color
        getbyte scr_bg,rqst,#1      ' get new bg color
        jmp     #done_ok

t_setpos
        call    #t_nocurs
        test    rqst,curs_2_test wz  ' use graphics cursor (cursor 2)?
  if_nz jmp     #.for_mouse_curs ' yes
        mov     v1,rqst         ' get ...
  if_z  shr     v1,#8           ' no - get text cols ...
  if_z  and     v1,##$ff        ' ... from request
        cmp     v1,textcols wcz ' ensure ...
  if_ae mov     v1,textcols     ' ... cols within bounds ...
  if_ae sub     v1,#1           ' ... or use screen cols - 1
        mov     v2,rqst         ' get text rows ...
        and     v2,##$ff        ' ... from request
        cmp     v2,textrows wcz ' ensure ...
  if_ae mov     v2,textrows     ' ... rows within bounds ...
  if_ae sub     v2,#1           ' ... or use screen rows - 1
        shl     v2,#1           ' (note: 2 rows per character)
        call    #t_setcurs      ' update cursor position
        jmp     #done_ok
.for_mouse_curs
        mov     v1,rqst         ' get ...
        shr     v1,#11          ' no - get x ...
        and     v1,##$7ff       ' ... from request
        cmp     v1,##1920 wcz   ' ensure x within bounds
  if_ae mov     v1,##1919       ' ... or use max x
        mov     v2,rqst         ' get y ...
        and     v2,##$7ff       ' ... from request
        cmp     v2,##1080  wcz  ' ensure y within bounds
  if_ae mov     v2,##1079       ' ... or use max y
        mov     v0,mouseptr     ' point to mouse data
        wrlong  v1,v0           ' update mouse x
        add     v0,#4           ' update ...
        wrlong  v2,v0           ' ... mouse y
        mov     ms_x_abs,v1
        mov     ms_y_abs,v2
        mov     ms_x_del,#0         '
        mov     ms_y_del,#0
        jmp     #done_ok

t_setcurs
        test    rqst,curs_1_test wz  ' request intended for cursor 0?
  if_nz jmp     #.setvis             ' no - visible cursor (cursor 1)
  if_z  mov     curs_0_col,v1        ' yes - update ...
  if_z  mov     curs_0_row,v2        ' ... cursor 0
        ret
.setvis
        mov     v8,v1
        mov     v9,v2
'        call    #t_nocurs              ' ensure visible cursor is not on display
        mov     curs_1_col,v8
        mov     curs_1_row,v9
        ret

t_getpos
        test    rqst,curs_2_test wz  ' request intended for cursor 2?
  if_nz jmp     #.for_mouse_curs
        call    #t_getcursdata    ' set up row and column based on cursor in rqst
        mov     rslt,col
        shl     rslt,#8
        shr     row,#1            ' (note: two rows per character)
        or      rslt,row
        jmp     #done
.for_mouse_curs
        mov     v0,mouseptr       ' get mouse cursor position
        rdlong  rslt,v0
        shl     rslt,#11
        add     v0,#4
        rdlong  v0,v0
        or      rslt,v0
        jmp     #done

' t_inccur - increment cursor (with wrap and scroll)
' On entry:
'    rqst indicates cursor 0 or 1
' On exit:
'    cursor incremented (and wrapped and screen scrolled if appropriate)
'
t_inccur
        call    #t_getcursdata  ' set up row, column and mode based on cursor in rqst
        add     col,#1          ' increment col
        cmp     col,textcols wc ' past last col?
   if_b jmp     #.t_incsave     ' no - save updated col
        add     row,#2          ' yes - increment row (2 tiles per character!)
        mov     v2,row
        shr     v2,#1
        cmp     v2,textrows wc  ' past last row?
   if_b jmp     #.t_setcol0     ' no - update row, set col to 0
        test    mode,#%1000 wz  ' yes - check cursor mode for wrap or scroll
   if_z jmp     #.t_setrow0     ' wrap - set cursor to row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        sub     row,#2          ' put cursor back on same line
        jmp     #.t_setcol0     ' put cursor on col zero
.t_setrow0
        mov     row,#0          ' set row to zero
.t_setcol0
        mov     col,#0          ' set col to zero
.t_incsave
        call    #t_saverowcol   ' save updated row and column
        ret

t_char
        call    #t_nocurs
        getbyte v5,rqst,#0       ' get char to write
        cmp     v5,#$ff wz       ' detect 0xff
  if_z  jmp     #.blank
        call    #t_put5          ' write char to screen at cursor (if not 0xff)
        jmp     #done_ok
.blank  call    #blankscreen     ' fast blank of the whole screen
        jmp     #done_ok
t_string
        call    #t_nocurs
        call    #print_str       ' print string
        jmp     #done_ok

t_int 
        call    #t_nocurs
        call    #t_getnum       ' point to cursor and get number to print
        call    #print_int
        jmp     #done_ok

t_unsigned
        call    #t_nocurs
        call    #t_getnum       ' point to cursor and get number to print
        call    #print_uint     ' no sign, just print digits
        jmp     #done_ok

t_scroll
        call    #t_nocurs       ' remove cursor if on display
        getbyte v6,rqst,#0      ' get last row to scroll ...
        cmp     v6,textrows wcz ' ... or ...
 if_a   mov     v6,textrows     ' ... or use last row
        getbyte v7,rqst,#1      ' get first row to scroll ...
        getbyte v8,rqst,#2      ' get scroll count ...
        cmp     v8,textrows wcz ' ... or ...
 if_a   mov     v8,textrows     ' ... use number of rows on screen ...
 if_a   add     v8,#1           ' ... (to include incomplete last row)
        call    #t_scroll2      ' scroll the screen
        jmp     #done_ok        '






'm32 - 32 bit multiplication
' On entry:
'    v1 = operand 1
'    v2 = operand 2
' On exit:
'    v0 = result

m32
        qmul  v1,v2
  _ret_ getqx v0

'd32u - Unsigned 32 bit division
' On entry:
'    v1 = divisor
'    v0 = dividend
' On exit:
'    v0 = quotient (i.e. v0/v1)
'    v1 = remainder

d32u
        qdiv  v0,v1
        getqx v0
  _ret_ getqy v1

'                       fit     $38e

' have 72 longs available

                        fit     $400
LUT_END

{{

' Catalina Code

DAT ' code segment (USB Host HUB execution)
                orgh
                alignl
'------------------------------------------------------------------------------
' Routines called from cog space.
'------------------------------------------------------------------------------
'
' set up the initial cursor by writing both a space (for the block cursor) and
' an schar to a screen cell, saving the results, and then erasing the cell again
'
init_cursor
              mov       rqst,#0                 ' force use of visible cursor
              mov       v5,#$20                 ' get space character
              mov       v7,scolor               ' get default cursor fg color
              mov       v8,#0                   ' use black as cursor bg color
              call      #put_char               ' put cursor into cell
              mov       block_upper_tile,upper_tile   ' now save ...
              mov       block_lower_tile,lower_tile   ' ... the block cursor ...
              mov       block_upper_color,upper_color ' ... data ...
              mov       block_lower_color,lower_color ' ... ... for use when swapping
              mov       v5,schar                ' get default cursor character
              mov       v7,scolor               ' get default cursor fg color
              mov       v8,#0                   ' use black as cursor bg color
              call      #put_char               ' put cursor into cell
              mov       curs_upper_tile,upper_tile   ' now save ...
              mov       curs_lower_tile,lower_tile   ' ... the schar cursor ...
              mov       curs_upper_color,upper_color ' ... data ...
              mov       curs_lower_color,lower_color ' ... for use when swapping
              mov       v5,#$20                 ' get space character
              mov       v7,#0                   ' use black as fg color
              mov       v8,#0                   ' and bg color
              call      #put_char               ' put space into cell
       _ret_  mov       cinit,#1

't_nocurs - set up for requests that can address either cursor,
'           and also remove the cursor if it is on the screen
' On exit:
'   row,col,mode set according to cursor indicated in rqst
'
t_nocurs
        cmp     cinit,#0 wz     ' if cursor has not been initialized
  if_z  ret                     ' do nothing
        test    scurs,#%01 wz   ' if cursor is on the screen ...
  if_nz call    #cswap_do       ' ... restore original char ...
        andn    scurs,#%01      ' ... and set it to not on screen
                                ' fall through to ...

't_getcursdata - set up for requests that can address either cursor 0 or 1,
' On exit:
'   row,col,mode set according to cursor indicated in rqst
'
t_getcursdata
        test    rqst,curs_1_test wz   ' using cursor 0?
  if_nz jmp     #t_viscursdata   ' no - get cursor 1 data
t_invcursdata
        mov     col,curs_0_col   ' yes - get ...
        mov     row,curs_0_row   ' ... cursor 0 (invisible) ...
  _ret_ mov     mode,curs_0_mode ' data
t_viscursdata
        mov     col,curs_1_col   ' no - get ...
        mov     row,curs_1_row   ' ... cursor 1 (visible) ...
  _ret_ mov     mode,curs_1_mode ' data

't_saverowcol - save row and col for cursor 0 or 1,
' On entry:
'   row,col,mode set according to cursor indicated in rqst
'
t_saverowcol
        test    rqst,curs_1_test wz   ' using cursor 0?
  if_z  mov     curs_0_col,col
  if_z  mov     curs_0_row,row
  if_nz mov     curs_1_col,col
  if_nz mov     curs_1_row,row
        ret

'
't_getnum - set up for converting and printing numbers
'
t_getnum
        call    #t_nocurs       ' set up cursor address
  _ret_ rdlong  ctmp,rqst wz    ' get the actual number in the request

'
' print_int - print signed integer in ctmp at the current cursor position
' print_uint - print unsigned integer in ctmp at the current curspor position
'
print_int
        cmps    ctmp,#0 wcz     ' positive?
 if_ae  jmp     #print_uint     ' yes - no sign
        mov     v5,#$2d         ' no - prefix number with '-'
        call    #t_put5         ' write char to screen at cursor
        abs     ctmp,ctmp wcz   ' make number positive
print_uint
  if_z  jmp     #.t_int4        ' if zero, just print one digit
        mov     v4,maxdec       ' get largest possible decimal divisor
.t_int2
        cmp     ctmp,v4 wcz     ' is our number larger than that?
 if_ae  jmp     #.t_int3        ' yes - start extracting decimal digits
        mov     v0,v4           ' no - divide divisor ...
        mov     v1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     v4,v0           ' ... try ...
        jmp     #.t_int2        ' ... again
.t_int3
        cmp     v4,#10 wcz      ' is this the last digit?
 if_b   jmp     #.t_int4        ' yes - no need to divide any more
        mov     v0,ctmp         ' no - divide number ...
        mov     v1,v4           ' ... by  ...
        call    #d32u           ' ... divisor
        mov     v5,v0           ' convert quotient ...
        add     v5,#$30         ' ... to digit char
        mov     ctmp,v1         ' save remainder for next time
        call    #t_put5         ' write char to screen at cursor
        mov     v0,v4           ' divide divisor ...
        mov     v1,#10          ' ... by 10 ...
        call    #d32u           ' ... and ...
        mov     v4,v0           ' ... continue ...
        jmp     #.t_int3        ' ... with next digit
.t_int4
        mov     v5,ctmp           ' convert last decimal digit ...
        add     v5,#$30         ' ... to digit char
        call    #t_put5         ' write char to screen at cursor
        ret

'
' t_scroffs - calculate long offset based on cursor in rqst
'
' On entry:
'    cursor data set
' On exit:
'    v1 = long offset indicated by cursor
'
t_scroffs
        mov     v1,textcols       ' get cols per row
        mov     v2,row           ' get cursor row
        call    #m32             ' mult cursor row by screen cols
        mov     v1,col           ' get cursor col
        add     v1,v0            ' add cursor col
  _ret_ shl     v1,#2            ' calculate long offset

' t_scrtile - get text tile address of cursor tile
' On entry:
'    cursor data set
' On exit:
'    v1 = address of text tile indicated by cursor
'
t_scrtile
        call    #t_scroffs        ' calculate address ...
  _ret_ add     v1,tileptr      ' ... of text tile indicated by cursor
'
' t_scrcolor - get text color address of cursor tile
' On entry:
'    cursor data set
' On exit:
'    v1 = address of txt color indicated by cursor
'
t_scrcolor
        call    #t_scroffs        ' calculate address ...
  _ret_ add     v1,colorptr     ' ... of text color indicated by cursor

'
' print_str
'
print_str
.strloop
        rdbyte  v5,rqst wz      ' get char to write
  if_z  ret                     ' finished if null byte
        call    #t_put5         ' write char to screen at cursor
        add     rqst,#1         ' increment string pointer
        jmp     #.strloop       ' put more chars

' get_cell - get two tiles and colors that make up a character from a cell
' On entry:
'    row, col = indicates cell to get
' On exit:
'    upper_tile  = tile pointer to top half of char
'    lower_tile  = tile pointer to lower half of char
'    upper_color = color long of top half of char
'    lower_color = color long of top half of char
'
get_cell
              call      #t_scrtile              ' long[pTiles][row * cols + col] := upper_tile
              rdlong    upper_tile,v1
              add       row,#1                  ' long[pTiles][(row + 1) * cols + col] := lower_tile
              call      #t_scrtile
              rdlong    lower_tile,v1
              call      #t_scrcolor             'long[pColors][(row + 1) * cols + col] := lower_color
              rdlong    lower_color,v1
              sub       row,#1
              call      #t_scrcolor             ' long[pColors][row * cols + col] := upper_color
              rdlong    upper_color,v1
              ret

' put_cell - put two tiles and colors that make up a character into a cell
' On entry:
'    row, col = indicates cell to put
' On exit:
'    upper_tile  = tile pointer to top half of char
'    lower_tile  = tile pointer to lower half of char
'    upper_color = color long of top half of char
'    lower_color = color long of top half of char
'
put_cell
              call      #t_scrtile              ' long[pTiles][row * cols + col] := upper_tile
              wrlong    upper_tile,v1
              add       row,#1                  ' long[pTiles][(row + 1) * cols + col] := lower_tile
              call      #t_scrtile
              wrlong    lower_tile,v1
              call      #t_scrcolor             'long[pColors][(row + 1) * cols + col] := lower_color
              wrlong    lower_color,v1
              sub       row,#1
              call      #t_scrcolor             ' long[pColors][row * cols + col] := upper_color
       _ret_  wrlong    upper_color,v1


' put_char - put char in character cell at cursor, with specfied colors
' On entry:
'    v5 = char to put
'    v7 = fg color to put
'    v8 = bg color to put
' On exit:
'    v7,v8 : lost
'    v0,v5 : unchanged
'
put_char
              call      #t_getcursdata   ' set up row and column based on cursor in rqst
              mov       v6,v5                   ' i := pFont[nFont] + (c & $FE) << 6
              and       v6,#$FE
              shl       v6,#6
              mov       v0,tilefontptr
              rdlong    v0,v0
              add       v6,v0                   ' (assume nFont == 0!)
              mov       upper_tile,v6
              add       v6,#$40
              mov       lower_tile,v6
              test      v5,#1 wz                ' if (c&1)==0
        if_nz jmp       #.put_char1
              setbyte   upper_color,v8,#3       '   i:=backcolor<<24+forecolor<<16+backcolor<<8+forecolor
              setbyte   upper_color,v7,#2
              setbyte   upper_color,v8,#1
              setbyte   upper_color,v7,#0
              jmp       #.put_char2
.put_char1                                      ' else
              setbyte   upper_color,v8,#3                '   i:=backcolor<<24+backcolor<<16+forecolor<<8+forecolor
              setbyte   upper_color,v8,#2
              setbyte   upper_color,v7,#1
              setbyte   upper_color,v7,#0
.put_char2
              mov       lower_color,upper_color ' use same color for upper and lower
              setbyte   lower_tile,v5,#3        ' this is a bit of a KLUDGE! - we store the character in ...
              setbyte   upper_tile,v5,#3        ' ... the top tile pointer byte (which is otherwise unused)
              call      #put_cell               ' put character in cell
              ret

'
' t_put5 - write char in v5 to screen, incrementing cursor location (if appropriate)
' On entry
'    v5 : char to write
' On exit
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v4 : unchanged
'
' NOTE: We use the current fg, bg color and effects - this is different to the
'       existing (P1) text drivers
'
t_put5
        mov     v7,scr_fg
        mov     v8,scr_bg
        cmp     v5,#$0d wz      ' CR?
  if_z  jmp     #.t_cr          ' yes - process CR
        cmp     v5,#$0a wz      ' no - LF ...
#ifndef NON_ANSI_HMI
  if_nz cmp     v5,#$0b wz      ' ... or VT?
#endif
  if_z  jmp     #.t_lf          ' yes - process LF
        cmp     v5,#$0c wz      ' no - FF?
  if_z  jmp     #.t_ff          ' yes - process FF
        cmp     v5,#$09 wz      ' no - HT?
  if_z  jmp     #.t_ht          ' yes - process HT
#ifndef NON_ANSI_HMI
        cmp     v5,#$08 wz      ' no - BS?
  if_z  jmp     #.t_bs          ' yes - process BS
#endif
        cmp     v5,#$DE wz      ' no - CapsLock?
  if_z  ret                     ' yes - ignore it
        call    #put_char       ' put char in that cell
        call    #t_inccur       ' increment cursor
        ret                     ' done
#ifndef NON_ANSI_HMI
.t_bs
        mov     v0,col wz       ' BS - get cursor col
 if_nz  sub     v0,#1           ' if not first col, subtract one
        jmp     #.t_setcol      ' set cursor col
#endif
.t_ht
        mov     v0,col          ' HT - get cursor col
        add     v0,#8           ' move to next ...
        andn    v0,#7           ' multiple of 8
        cmp     v0,textcols wcz
  if_ae mov     v0,textcols
  if_ae sub     v0,#1
        jmp     #.t_setcol      ' set cursor col
.t_ff
        mov     v6,textrows      ' scroll ...
        sub     v6,#1           ' ... whole ...
        mov     v7,#0           ' ... screen
        mov     v8,textrows      ' ... ALL ...
        call    #t_scroll2      ' ... rows up
        mov     v0,#0           ' set cursor row and col
        jmp     #.t_setrow      ' ... to zero
.t_lf
        mov     v0,row          ' LF - get cursor row ...
        add     v0,#2           ' and increment it
        mov     v1,textrows     ' are ...
        shl     v1,#1           ' ... we ...
        cmp     v0,v1 wcz        '... past last row?
  if_b  jmp     #.t_setrow      ' no - just update row
        test    mode,#%1000 wz  ' check cursor mode ...
        mov     v0,#0           ' ... for wrap or scroll
 if_z   jmp     #.t_setrow      ' wrap - put cursor on row zero
        call    #t_up1          ' scroll - scroll screen up 1 line
        jmp     #.t_cr          ' put cursor on col zero
.t_setrow
        mov     row,v0          ' write updated row
#ifndef CR_ON_LF
        jmp     #.t_samecol     ' do not change column
#endif
.t_cr
        mov     v0,#0           ' zero current col
.t_setcol
        mov     col,v0          ' set current cursor col
.t_samecol
        mov     v1,col
        mov     v2,row
        call    #t_setcurs
        ret

' t_scroll2 - scroll screen (currently only scrolls up)
' On entry
'    v6 : last row to scroll
'    v7 : first row to scroll
'    v8 : number of lines to scroll
' On exit
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v3,v4 : unchanged
'

t_scroll2
        shl     v6,#1           ' (note: 2 rows per character)
        mov     v3,v6
        shl     v7,#1           ' (note: 2 rows per character)
        mov     v4,v7
        shl     v8,#1           ' (note: 2 rows per character)
        mov     v1,v7           ' calculate address ...
        mov     v2,maplinelen      ' ... of ...
        call    #m32
        mov     v7,v0           ' ... first ...
        add     v7,tileptr      ' ... text tile to scroll

        mov     v1,v4
        mov     v2,maplinelen
        call    #m32
        mov     v9,v0
        add     v9,colorptr     ' first color to scroll

        mov     v1,v6           ' calculate address ...
        add     v1,#2           ' ...
        mov     v2,maplinelen      ' ... of ...
        call    #m32            ' ...
        mov     v6,v0           ' ... last ...
        add     v6,tileptr      ' ... text tile to scroll

        mov     v1,v3           '
        add     v1,#2           '
        mov     v2,maplinelen      '
        call    #m32            '
        mov     v3,v0           '
        add     v3,colorptr     ' last color to scroll


.scr_loop1
        cmp     v8,#0 wz        ' have we scrolled enough times?
 if_z   ret                     ' yes - done
        sub     v8,#1           ' no - must scroll more
        mov     v1,v7           ' dst address for line scroll
        mov     v2,v7           ' src address ...
        add     v2,maplinelen  ' ... for text tile scroll
        mov     v3,v9
        mov     v4,v9           ' src address ...
        add     v4,maplinelen  ' ... for color scroll
.scr_loop2
        rdlong  v0,v2           ' move ...
        wrlong  v0,v1           ' ... tile data ...
        add     v1,#4           ' ... from ...
        add     v2,#4           ' ... src to dst
        rdlong  v0,v4           ' move ...
        wrlong  v0,v3           ' ... color data ...
        add     v3,#4           ' ... from ...
        add     v4,#4           ' ... src to dst
        cmp     v1,v6 wcz       ' moved all data?
 if_b   jmp     #.scr_loop2     ' no - keep moving data
        mov     v1,v6           ' point to start of last line
        sub     v1,maplinelen
        mov     v2,v3           ' point to start of last color
        sub     v2,maplinelen
        call    #blankline
        jmp     #.scr_loop1     ' scroll more

' v1 - start of line in tile data
' v2 - start of line in color data
blankline
        mov     v5,textcols     ' number of columns to fill
        mov     v0,t0ptr        ' blank tile (should be space?)
        setbyte v3,scr_bg,#3    ' backcolor<<24+forecolor<<16+backcolor<<8+forecolor
        setbyte v3,scr_fg,#2
        setbyte v3,scr_bg,#1
        setbyte v3,scr_fg,#0
.blank_loop
        wrlong  v0,v1           ' put char in cell (top half)
        wrlong  v3,v2           ' set color to current bg color
        add     v1,#4           ' next tile entry
        add     v2,#4           ' next color entry
        djnz    v5,#.blank_loop ' continue till row is complete
        ret


' blank all rows on the screen ...
blankscreen
        mov     v1,tileptr      ' start at this text entry
        mov     v2,colorptr
        mov     v8,textrows     ' 
        shl     v8,#1           ' (note: 2 rows per character)
.blank_loop
        call    #blankline
        djnz    v8,#.blank_loop
        ret
'
' t_up1 - scroll screen up one line
' On entry:
'    none
' On exit:
'    v0,v1,v2,v5,v6,v7,v8 : lost
'    v3,v4 : unchanged
'    screen scrolled (and cursor set to col zero)
'
t_up1
        mov     v6,textrows      ' scroll ...
        sub     v6,#1           ' ... whole ...
        mov     v7,#0           ' ... screen
        mov     v8,#1           ' ... one ...
        call    #t_scroll2      ' ... row up
        ret

' k_load - Load key indicated by ckbd_tail.
'
'  NOTE : To improve compatibility with a normal keyboard, values for
'         ESC and BS return their ASCII values, and the values for
'         keys in the range $40 to $80 are corrected to their ASCII
'         values, and the control flag is reset.
'         Ctrl+D (EOT) returns -1 (EOF).
'
' On exit:
'    rslt = key indicated by ckbd_tail
'    Z flag set if ckbd_head == ckbd_tail
'
'
k_load
        call    #k_setup
        cmp     ckbd_head, ckbd_tail wz
  if_z  ret                              ' Keypress buffer empty
        mov     ctmp, ckbd_tail
        shl     ctmp, #2
        add     ctmp,ckbd_headp
        add     ctmp,#4
        rdlong  ctmp,ctmp
        getbyte ckbd_keypress, ctmp, #0
        getbyte ckbd_scancode, ctmp, #1
        getbyte ckbd_modkeys, ctmp, #2
        getbyte ckbd_ledstate, ctmp, #3
        mov     rslt,ckbd_keypress
#ifndef NO_CR_TO_LF
        cmp     rslt,#$0d wz             ' CR?
 if_z   mov     rslt,#$0a                ' if so, correct it
#endif
        test    ckbd_modkeys, #KEY_ALTMOD wz ' Either ALT key down?
  if_nz jmp     #.alt
        test    ckbd_modkeys, #KEY_CTRLMOD wz ' either CTRL key down?
  if_nz jmp     #.ctrl
 _ret_  mov     v0,#1 wz                 ' ensure Z flag not set!

' Check for modifier keys

.ctrl
        cmp     rslt,#$40 wcz            ' ... $40 ...
 if_b   jmp     #.chk_ctrl_d             ' ... to ...
        cmp     rslt,#$80 wcz            ' ... $80 ...
 if_ae  jmp     #.chk_ctrl_d             ' ... otherwise just return it
        cmp     rslt,#$60 wcz            ' correct ...
 if_ae  sub     rslt,#$20                ' ... both upper ...
        sub     rslt,#$40                ' ... and lower case
.chk_ctrl_d
        cmp     rslt,#$04 wz             ' EOT?
 if_z   neg     rslt,#1                  ' if so, return -1 (EOF)
 _ret_  mov     v0,#1 wz                 ' ensure Z flag not set!
.alt
' TODO ...
        mov     rslt,#0
 _ret_  mov     v0,#1 wz               ' ensure Z flag not set!

'
' ccheck - check if cursor update is required
'
ccheck
        cmp     cinit,#0 wz     ' don't update if cursor not yet initialized
 if_z   ret
'call #get_cell
        mov     mode,curs_1_mode ' get mode of cursor 1
        and     mode,#%0011  wz  ' is cursor 1 supposed to be visible?
  if_z  ret                     ' no - nothing to do
  if_nz jmp     #chk_time       ' no - check if time has come to make it so
        test    scurs,#%01 wz   ' is cursor on the screen ?
  if_z  jmp     #cswap_do       ' no - put it on the screen
        ret
chk_time
        getct   v1              ' time ...
        mov     v2,v1
        sub     v1,clast        ' ... to update ...
        cmp     v1,ctime wcz    ' ... cursor 1 visibility bit?
  if_be jmp     #cswap          ' no - make sure cursor is in correct state
        xor     scurs,#%10      ' yes - toggle cursor supposed to be on screen
        add     clast,ctime     ' update last cursor swap time

'
' cswap - swap cursor 1 with screen char
'
cswap
        cmp     scurs,#%10 wz   ' is cursor 1 supposed to on the screen?
  if_z  jmp     #cswap_do       ' yes
        cmp     scurs,#%01 wz   ' is cursor 1 on the screen?
  if_nz ret                     ' no
cswap_do
        mov     v6,curs_1_mode  ' get mode byte of cursor 1
        and     v6,#%0011 wz    ' is cursor 1 supposed to be visible?
  if_z  ret                     ' no - return
        call    #t_viscursdata  ' yes - get cursor 1 row and col
        call    #get_cell       ' get character and color at visible cursor
'     'Set the top and bottom tile color selection for the cursor.
'     This is how the colors are encoded:
'     if (c&1)==0
'       backcolor<<24+forecolor<<16+backcolor<<8+forecolor
'     else
'       backcolor<<24+backcolor<<16+forecolor<<8+forecolor

        test    curs_1_mode,#%0100 wz    ' is the cursor a block?
  if_nz jmp     #.schar                  ' no - use cursor character (e.g. underscore)
        cmp     upper_tile,#0 wz         ' yes - is the cell in use?
  if_nz jmp #.cell_used                  ' yes - use cell data
        mov curs_upper_tile, block_upper_tile ' no - use pre-prepared block cursor data
        mov curs_lower_tile, block_lower_tile
        mov curs_upper_color, block_upper_color
        mov curs_lower_color, block_lower_color
        mov upper_tile, block_upper_tile
        mov lower_tile, block_lower_tile
        mov upper_color, block_upper_color
        mov lower_color, block_lower_color
.cell_used
        test    scurs,#%01 wz            ' is cursor 1 on the screen?
  if_nz jmp     #.update                 ' yes - just restore the original character
        cmp     upper_tile,#0 wz         ' is the cell in use?
  if_nz getbyte v0,lower_tile,#3         ' yes - get the current cells char
  if_z  mov v0,#$20                      ' no -- use space character
        getbyte v1,upper_color,#0        ' get the current cell's fg color ...
        getbyte v2,upper_color,#3        ' .... and bg color (can use upper or lower)
        mov     curs_upper_tile,upper_tile ' use the same character (not schar)
        mov     curs_lower_tile,lower_tile '
        test    v0,#$1 wz
  if_nz jmp     #.block2
        setbyte curs_upper_color,v2,#0          '
        setbyte curs_upper_color,scolor,#1      '
        setbyte curs_upper_color,v2,#2          '
        setbyte curs_upper_color,scolor,#3      '
        setbyte curs_lower_color,v2,#0          '
        setbyte curs_lower_color,scolor,#1      '
        setbyte curs_lower_color,v2,#2          '
        setbyte curs_lower_color,scolor,#3      '
        jmp   #.update
.block2
        setbyte curs_upper_color,v2,#0          '
        setbyte curs_upper_color,v2,#1          '
        setbyte curs_upper_color,scolor,#2      '
        setbyte curs_upper_color,scolor,#3      '
        setbyte curs_lower_color,v2,#0          '
        setbyte curs_lower_color,v2,#1          '
        setbyte curs_lower_color,scolor,#2      '
        setbyte curs_lower_color,scolor,#3      '
        jmp     #.update
.schar
        getbyte v2,upper_color,#3        ' get the current cell bg color (can use upper or lower)
        test    schar,#$1 wz             ' set replacement bg to match cell bg
  if_nz jmp     #.schar2
        setbyte curs_upper_color,v2,#1   '
        setbyte curs_upper_color,v2,#3   '
        setbyte curs_lower_color,v2,#1   '
        setbyte curs_lower_color,v2,#3   '
        jmp   #.update
.schar2
        setbyte curs_upper_color,v2,#2   '
        setbyte curs_upper_color,v2,#3   '
        setbyte curs_lower_color,v2,#2   '
        setbyte curs_lower_color,v2,#3   '
.update
' swap current cell tiles and colors with cursor tiles and colors
        mov     v0,upper_tile
        mov     upper_tile,curs_upper_tile
        mov     curs_upper_tile,v0
        mov     v0,lower_tile
        mov     lower_tile,curs_lower_tile
        mov     curs_lower_tile,v0
        mov     v0,upper_color  ' swap cell colors with cursor colors
        mov     upper_color,curs_upper_color
        mov     curs_upper_color,v0
        mov     v0,lower_color
        mov     lower_color,curs_lower_color
        mov     curs_lower_color,v0
        call    #put_cell       '
  _ret_ xor     scurs,#%01      ' toggle whether cursor is on screen

usb_event
                        cmp    cnotify, #M_DATA wz
              if_z      jmp    #cmouse_update
                        cmp    cnotify, #GP_DATA wz
              if_z      jmp    #cgame_update
                        cmp    cnotify, #KB_READY wz
              if_z      or     km_connected,#1
                        cmp    cnotify, #M_READY wz
              if_z      or     km_connected,#2
                        cmp    cnotify, #KBM_READY wz
              if_z      or     km_connected,#3
                        cmp    cnotify, #DEV_DISCONNECT wz
              if_z      andn   km_connected,#3
                        ret
'
' cmouse_update : Handler for mouse position/button state changes.
'
cmouse_update
                        mov     v0, mouseptr        ' get ...
                        add     v0,#32              ' ... usb ...
                        rdlong  v0,v0               ' ... data pointer
                        rdlong  ctmp, v0            ' get packed mouse data
                        getbyte cmouse_buttons, ctmp, #0  ' Button flags
                        getbyte cmouse_x, ctmp, #1  ' X direction/velocity
                        getbyte cmouse_y, ctmp, #2  ' Y direction/velocity
                        shl     cmouse_x,#24        ' sign extend ...
                        sar     cmouse_x,#24        ' ... x value
                        shl     cmouse_y,#24        ' sign extend ...
                        sar     cmouse_y,#24        ' ... y value
                        mov     v0,mouseptr
                        rdlong  v1,v0 ' mousex
                        add     v0,#4
                        rdlong  v2,v0 ' mousey
                        add     v0,#4
                        rdlong  v3,v0 ' maxx
                        add     v0,#4
                        rdlong  v4,v0 ' maxy
                        adds    v1,cmouse_x
                        fges    v1,#0
                        fles    v1,v3
                        adds    v2,cmouse_y
                        fges    v2,#0
                        fles    v2,v4
                        mov     v0,mouseptr
                        wrlong  v1,v0
                        add     v0,#4
                        wrlong  v2,v0
                        add     v0,#12
        _ret_           wrlong  cmouse_buttons,v0

'
' cgame_update : Handler for gamepad changes
'
cgame_update
                        mov     v0, mouseptr        ' get ...
                        add     v0,#32              ' ... usb ...
                        rdlong  v0,v0               ' ... data pointer
                        add     v0,##(4*(KBD_BUFFMASK + 4)) ' point to A_gpd_tail
                        call    #do_gamepad         ' process USB A gamepads
                        add     v0,##(4*(GPD_BUFFMASK + 3)) ' point to B_gpd_tail
                        call    #do_gamepad         ' process USB B gamepads
                        ret

' on entry - v0 points to A_gpd_tail or B_gpd_tail
do_gamepad
                        rdlong  cgpd_tail, v0
                        mov     v1,v0               ' point to ...
                        add     v1,#4               ' ... gpd_head
                        rdlong  cgpd_head, v1
.getpad
                        cmp     cgpd_head, cgpd_tail wz
        if_z            ret                              ' Gamepad buffer empty
                        mov     ctmp, cgpd_tail
                        shl     ctmp, #2
                        mov     v2,v1               ' point to ...
                        add     v2,#4               ' ... gpd_buffer 
                        add     v2, ctmp
                        rdlong  ctmp, v2
                        getbyte cgpd_port, ctmp, #3
                        getbyte cgpd_type, ctmp, #2
                        getword cgpd_data, ctmp, #0
                        incmod  cgpd_tail, #GPD_BUFFMASK
                        'wrlong  ckbd_tail, ##kbd_tail    ' Update tail location to hub
                        wrlong  cgpd_tail, v0             ' Update tail location to hub
                        mov     v3,#gamepad_data        ' check up to  ...
                        mov     v2,#NUM_GAMEPADS+1      ' ... NUM_GAMEPAD entries ...
.loop                   djz     v2,#.done               ' ... to find ...
                        mov     v4,#0                   ' ... gamepad ...
                        altgw   v4,v3                   ' ... with ...
                        getword v5,0,#0                 ' ... this ...
                        cmp     v5,cgpd_port wz         ' ... cog/port
              if_z      jmp     #.found                 ' if found, use this entry
                        cmp     v5,##$FFFF wz           ' if not empty entry ...
              if_nz     jmp     #.next                  ' ... try next
                        altd    v3                      ' clear ...
                        mov     0-0,#0                  '
                        add     v3,#1                   '
                        altd    v3                      ' 
                        mov     0-0,#0                  ' ... 3 longs (6 words) of the entry ...
                        add     v3,#1                   '
                        altd    v3                      ' 
                        mov     0-0,#0                  '
                        sub     v3,#2                   ' ... restore base                        
.found                                                  ' if we found the cog/port or an an empty entry ...
                        mov     v4,#0                   ' ... use ...
                        altsw   v4,v3                   ' ... this entry
                        'setword #1 ' p2asm needs D and #N
                        setword 0, cgpd_port, #0
                        altsw   cgpd_type,v3
                        'setword cgpd_data ' p2asm needs D and #N
                        setword 0, cgpd_data, #0
.done
                        jmp    #.getpad                 ' process next gamepad entry
.next                   add    v3,#3                    ' try next entry
                        jmp    #.loop

dsetup
                        mov     arg0,#0                 ' set up ...
                        mov     arg1,#0                 '
                        mov     arg2,#MAX_COLS          ' ... default ...
                        mov     arg3,#MAX_ROWS          ' ... graphics ...
                        mov     arg4,##MAX_COLS*8       '
                        mov     arg5,##MAX_ROWS*8       ' ... values
hsetup
                        mov     gxoffs,arg0             ' set up offset ...
                        mov     gyoffs,arg1             ' ... of graphics in screen tiles
                        mov     gxtiles,arg2            'set up gxtiles, gytiles, gylongs
                        mov     gytiles,arg3
                        mov     gylongs,arg3            '(note: gylongs is (number of horizontal tiles)<<4)
                        shl     gylongs,#4
                        mov     textrows,gytiles        'set ...
                        shr     textrows,#1             ' ... usable rows (half vertical tiles - 1)
                        sub     textrows,#1
                        mov     textcols,gxtiles        'set usable cols
                        mov     maplinelen,arg2         'set ...
                        shl     maplinelen,#2           '... length of row in tile or color map (in longs)
                        mov     xorigin,arg4            'set xorigin, yorigin
                        mov     yorigin,arg5
                        cmp     arg6,#0 wz              ' if reset, force initialization ...
                if_nz   mov     finit,#0                ' ... of free list pointer and tile data
                        mov     basesptr,##@bases       'set pointers
                        mov     vbasesptr,##@vbases
                        mov     slicesptr,##@slices
                        mov     tmapptr,##@TileMap
                        mov     tlistptr,##@TileList
                        mov     tdataptr,##@TileData
                        mov     t0ptr,##@Tile0
                        cmp     finit,#0 wz            ' initialize free list pointer  ...
                if_nz   jmp     #.init_map             ' ... and tile data ... 
                        mov     finit,#1               ' ... on first call (or reset) only


'
' ' clear physical tile data (in case we are re-initializing after some use)
' longfill(@TileData, 0, 16*GRAPHIC_TILES)
'
                        mov     v1,tdataptr
                        mov     v0,##GRAPHIC_TILES*16
                        mov     v2,#0
.init_tiles
                        wrlong  v2,v1
                        add     v1,#4
                        djnz    v0,#.init_tiles
'
' ' create linked list of physical tiles
' TileList := 0
' repeat n from 0 to GRAPHIC_TILES - 1                  ' put all tiles ...
'    long[@TileData][n * 16] := TileList                ' ... in a linked list ...
'    TileList := @TileData + (n * 64)                   ' ... of free tiles
'

                        mov     v0,#0
                        wrlong  v0,tlistptr
.init_list
                        mov     v1,v0
                        shl     v1,#6
                        add     v1,tdataptr
                        rdlong  v2,tlistptr
                        wrlong  v2,v1
                        wrlong  v1,tlistptr
                        add     v0,#1
                        cmp     v0,##GRAPHIC_TILES wz
          if_nz         jmp     #.init_list
.init_map
'
' ' initialize tile map (used to map virtual address to tile addresses)
' repeat x from 0 to gx_tiles - 1
'   repeat y from 0 to gy_tiles -1
'     long[@TileMap][x*gy_tiles + y] := @Tile0
'

                        mov     v1,#0           ' x = 0
                        mov     v2,#0           ' y = 0
.do_x                   cmp     v1,gxtiles wz
              if_z      jmp     #.done_xy
.do_y                   cmp     v2,gytiles wz
              if_z      jmp     #.next_x
                        mov     v4,v1           ' x
                        mul     v4,gytiles      ' x*gytiles
                        add     v4,v2           ' x*gytiles+y
                        shl     v4,#2           '
                        add     v4,tmapptr
                        mov     v5,t0ptr
                        wrlong  v5,v4
.next_y                 add     v2,#1
                        jmp     #.do_y
.next_x                 add     v1,#1
                        jmp     #.do_x
.done_xy

'
' ' write bases
' repeat bases_ptr from 0 to gx_tiles - 1
'   bases[bases_ptr] := bases_ptr * gy_tiles << 6
'
                        mov     v0,#0
.do_bases               cmp     v0,gxtiles wz
              if_z      jmp     #.done_bases
                        mov     v1,gytiles
                        shl     v1,#6
                        mul     v1,v0
                        mov     v2,v0
                        shl     v2,#2
                        add     v2,basesptr
                        wrlong  v1,v2
                        add     v0,#1
                        jmp     #.do_bases
.done_bases
'
'' write virtual bases'
' repeat bases_ptr from 0 to gx_tiles - 1
'   vbases[bases_ptr] := bases_ptr * gy_tiles
'

                        mov     v0,#0
.do_vbases              cmp     v0,gxtiles wz
              if_z      jmp     #.done_vbases
                        mov     v1,gytiles
                        mul     v1,v0
                        mov     v2,v0
                        shl     v2,#2
                        add     v2,vbasesptr
                        wrlong  v1,v2
                        add     v0,#1
                        jmp     #.do_vbases
.done_vbases
'
' update CGI_Info (address of CGI_Info is stored in the upper HUB RAM location CGI_DATA)
'
                        rdlong ptra,##CGI_DATA
                        wrlong gxoffs,ptra++
                        wrlong gyoffs,ptra++
                        wrlong gxtiles,ptra++
                        wrlong gytiles,ptra++
                        ret

hadd_ram                mov     v4,v1 ' point to new tile data
                        mov     v3,v2 ' convert number of bytes ...
                        shr     v3,#2 ' ... to number of longs
' zero the new tile data
.init_tiles
                        cmp     v3,#0 wz
               if_z     jmp     #.add_tiles
                        wrlong  #0,v4
                        add     v4,#4
                        sub     v3,#1
                        jmp     #.init_tiles
' now add the tiles to the free list
.add_tiles
                        mov     v3,v2       ' convert number of bytes ...
                        shr     v3,#6       ' ... to number of tiles
                        rdlong  v0,tlistptr ' get current free list pointer
.init_list              cmp     v3,#0 wz    ' finished?
               if_z     jmp     #.done_add  ' yes
                        sub     v3,#1       ' no - decrement tile count
                        wrlong  v0,v1       ' write current free list link to tile
                        mov     v0,v1       ' this tile is now the new free list pointer
                        add     v1,#64      ' point to next tile
                        jmp     #.init_list ' continue until all tiles linked
.done_add               wrlong  v0,tlistptr ' update free list pointer
                        ret


mcheck
                        mov     ptra,mouseptr
                        rdlong  msu_x_raw,ptra++
                        rdlong  msu_y_raw,ptra++
                        rdlong  msu_x_max,ptra++
                        rdlong  msu_y_max,ptra++
                        rdlong  msu_buttons,ptra++
                        rdlong  kbu_scan1,ptra++
                        rdlong  kbu_scan2,ptra++
                        rdlong  msu_vis,ptra++
                        mov     v0,##1079
                        sub     v0,msu_y_raw
                        mov     msu_y_raw,v0
                        cmp     msu_x_raw, ms_x_raw wz
                  if_z  cmp     msu_y_raw, ms_y_raw wz
                  if_z  cmp     msu_buttons, ms_buttons wz
                  if_z  cmp     kbu_scan1, kb_scan1 wz
                  if_z  cmp     kbu_scan2, kb_scan2 wz
                  if_z  ret
                        mov     v0,msu_x_raw     ' calculate x delta ...
                        subs    v0,ms_x_raw    ' ... since last update
                        adds    ms_x_del,v0     ' update x delta
                        adds    ms_x_abs,v0     ' update x delta
                        mov     v0,msu_y_raw     ' calculate y delta ...
                        subs    v0,ms_y_raw    ' ... since last update
                        adds    ms_y_del,v0     ' update y delta
                        adds    ms_y_abs,v0     ' update y delta
                        mov     ms_x_raw, msu_x_raw wz
                        mov     ms_y_raw, msu_y_raw wz
                        mov     ms_buttons, msu_buttons
                        mov     kb_scan1, kbu_scan1
                        mov     kb_scan2, kbu_scan2
                        ret

}}

{{
                                                   TERMS OF USE: MIT License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}}

