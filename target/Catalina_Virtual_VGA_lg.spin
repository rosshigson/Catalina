''****************************************
''*  Virtual VGA Line Generator v3.8     *
''****************************************
''
''REVISION HISTORY
''
'' Rev  Date       Description
'' ---  --------   -----------------------------------------------------------
'' 010  20 Jul 08  First version. For use with Virtual VGA Driver.
'' 011  28 Jul 08  Added support for reclaiming RAM
'' 012  02 Aug 08  Improved synchronization with Virtual VGA driver
''
'' 3.8             First Catalina version - remove ramstart/ramend stuff
''
''

CON

  paramcount    = 21
  screen_pars   = 7

  TILE_BITS     = 12            ' virtual VGA uses 12 bits of tile number (instead of the normal 10)
  TILE_MASK     = $0FFF         ' 12 bits of tile number allows for 4096 tiles, necessary for high resolutions
  COLOUR_MASK   = $F000         ' virtual VGA uses 4 bits of colour (instead of the normal 6) for 16 colour combinations

OBJ
  common : "Catalina_Common"              ' Common Definitions

VAR
  ' variables used only during initialization
  long  cogon[2]
  long  cog[2]


PUB Start(vgaptr) : okay

'' Start VGA Line Generators - starts two cogs. These Line Generators are designed to work with the Virtual VGA Driver.
'' Returns false if no cogs available
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

  ' use vga_enable to tell the cogs who is who - that means these cogs must be started before the main VGA driver
  long[vgaptr] := 1 ' first cog does odd lines
  okay := cogon[0] := (cog[0] := cognew(@entry,vgaptr)) => 0
  if okay
    common.Register(cog[0], common#LMM_SCR)
    repeat while long[vgaptr] <> 0

    long[vgaptr] := 2 ' second cog does even lines
    okay := cogon[1] := (cog[1] := cognew(@entry,vgaptr)) => 0
    if okay
      common.Register(cog[1], common#LMM_SCR)
      repeat while long[vgaptr] <> 0

{
PUB stop

'' Stop VGA line genrator - frees two cogs

  if cogon[0]~
    cogstop(cog[0])
  if cogon[1]~
    cogstop(cog[1])

PUB ramstart
  return @ram_start

PUB ramend
  return @ram_end
}

DAT

'****************************************
'* Assembly language VGA line generator *
'****************************************

                        org
ram_start                        
'
' Entry
'
entry                   mov     t1,par                  'load vga parameters
                        movd    :load1,#_status         
                        mov     t2,#paramcount
:load1                  rdlong  0,t1
                        add     t1,#4
                        add     :load1,d0
                        djnz    t2,#:load1

                        wrlong  zero,par                'reset vga_status so next cog can start

load_screen             mov     t1,_screen              'load screen parameters
                        movd    :load2,#line_req_ptr 
                        mov     t2,#screen_pars         '7 parameters in screen array
:load2                  rdlong  0,t1
                        add     t1,#4
                        add     :load2,d0
                        djnz    t2,#:load2

                        ' set up the first tile of each group of 16 lines the screen (tpm) array
                        
                        call    #calculate_tiles
                        mov     vmax,_vd
                        andn    vmax,#$F                'display only a multiple of 16 lines
                        
                        'set up values depending on whether we are the odd or even generator

                        mov     my_id,_status           'save our id - odd or even
                                                        

                        and     my_id,#1        wz
              if_z      jmp     #:even
:odd                    mov     my_buff_1_ptr,buff_1_ptr 'generate odd lines using buff_1 and buff_2
                        mov     my_buff_2_ptr,buff_2_ptr
                        jmp     #:generate
:even                   mov     my_buff_1_ptr,buff_3_ptr 'generate even lines using buff_3 and buff_4
                        mov     my_buff_2_ptr,buff_4_ptr

                        ' generate the first line - either the next even line, or the next odd line
                        
:generate               mov     t1,my_id                'first line to generate is either line 0 or line 1
                        mov     my_line_1,t1
                        mov     t2,my_buff_1_ptr
                        call    #build_line               '

                        ' therafter, fullfil requests as we can, each time generating a new line in the other buffer

:line1_loop             rdlong  t1,line_req_ptr         'is the line requested ...
                        cmp     t1,my_line_1    wz      ' ... the one we have in buffer 1?
              if_nz     jmp     #:line1_loop            'no - loop until we get a match      

                        wrlong  my_buff_1_ptr,line_buf_ptr  'yes - pass our buffer 1 to be displayed
                        add     t1,#2                   'next line will be this line + 2              
                        cmp     t1,vmax          wc      'wrap if we are past the last line
              if_nc     sub     t1,vmax
                        mov     my_line_2,t1            'now build the next line ...
                        mov     t2,my_buff_2_ptr        '... in buffer 2
                        call    #build_line

:line2_loop             rdlong  t1,line_req_ptr         'is the line requested ...
                        cmp     t1,my_line_2    wz      ' ... the one we have in buffer 2?
              if_nz     jmp     #:line2_loop            'no - loop until we get a match      

                        wrlong  my_buff_2_ptr,line_buf_ptr  'yes - pass our buffer 2 to be displayed
                        add     t1,#2                   'next line will be this line + 2
                        cmp     t1,vmax          wc      'wrap if we are past the last line
              if_nc     sub     t1,vmax                  
                        mov     my_line_1,t1            'now build the next line ...
                        mov     t2,my_buff_1_ptr        '... in buffer 1
                        call    #build_line

                        jmp     #:line1_loop


'calculate_tiles
' base[n] points to the first (base) tile of consecutive sets of 16 lines in the tpm
'
'
calculate_tiles         movd    :tiles_loop,#tiles      ' point to first entry in tiles array
                        mov     t1,tpm_ptr             ' point to first tile in tpm
                        mov     t2,_ht                  ' calculate size ...
                        shl     t2,#1                   ' ... of each line in tpm
                        mov     x,#54                   ' max 54 tiles (=864 lines of 16 lines per tile)
:tiles_loop             mov     0,t1                    ' save the base of this line
                        add     t1,t2                   ' point to the first tile of the next line
                        add     :tiles_loop,d0          ' point to next entry in tiles array
                        djnz    x,#:tiles_loop          ' loop till all 48 ... 
calculate_tiles_ret     ret                             ' ... tiles loaded      
                        
'
' build_line
'       t1 = line number to build (this is destroyed)
'       t2 = buffer to built it in (this is destroyed)
' TBD: Colour not used at the moment
'
build_line              mov     x,_ht                   'number of horizontal tiles per line
                        mov     t3,t1                   'divide line by 16 ...
                        shr     t3,#4                   '... to get offset into tiles for this line     
                        add     t3,#tiles               'point to first tile ...
                        movs    :get_base,t3            '... for this line                 
                        mov     offs,t1                 'calculate ...
                        and     offs,#$F                ' ... offset of long ...
                        shl     offs,#2                 ' ...of this line within each tile
:get_base               mov     t4,0
:tile_loop              rdword  t3,t4                   'read tile address from tpm
' RJH - implement 4 bits of colour -------------------------------------------------------------- NEW

' NOTE : THIS DOESN'T WORK YET - NEED 2 VGA DRIVERS AS WELL AS 2 LINE GENERATORS !!!

'                        mov     t1,t3                   'separate ...
'                        shr     t1,#TILE_BITS           ' ... colour ...
'                        wrlong  t1,t2                   '... and write it
'                        add     t2,#4                   '
' RJH - implement 4 bits of colour -------------------------------------------------------------- END
                        and     t3,mask                 'separate tile number ...
                        shl     t3,#6                   '... and convert to address ...
                        or      t3,offs                 '... of long within tile that represents line
                        rdlong  pixels,t3               'get the pixels
                        wrlong  pixels,t2               'write the pixels
                        add     t2,#4
                        add     t4,#2
                        djnz    x,#:tile_loop           'another tile?
build_line_ret          ret

'
'
' Initialized data
'
zero                    long    0
d0                      long    1 << 9 << 0
d6                      long    1 << 9 << 6
mask                    long    TILE_MASK
line                    long    0
dummy                   long    0
'
'
' Uninitialized data
'
t1                      res     1
t2                      res     1
t3                      res     1
t4                      res     1

x                       res     1
y                       res     1

my_id                   res     1
my_line_1               res     1
my_buff_1_ptr           res     1
my_line_2               res     1
my_buff_2_ptr           res     1

tpm_addr                res     1
pixels                  res     1

'
'
' Parameter buffer (see vga driver for description)
'
_status                 res     1       'read only to get id!!!
_enable                 res     1       '0/non-0        read-only
_pins                   res     1       '%pppttt        read-only
_mode                   res     1       '%ihv           read-only
_screen                 res     1       '@word          read-only - redefined as pointer to array of 7 longs
_colors                 res     1       '@long          read-only
_ht                     res     1       '1+             read-only
_vt                     res     1       '1+             read-only
_hx                     res     1       '1+             read-only
_vx                     res     1       '1+             read-only
_ho                     res     1       '0+-            read-only
_vo                     res     1       '0+-            read-only
_hd                     res     1       '1+             read-only
_hf                     res     1       '1+             read-only
_hs                     res     1       '1+             read-only
_hb                     res     1       '1+             read-only
_vd                     res     1       '1+             read-only
_vf                     res     1       '1+             read-only
_vs                     res     1       '1+             read-only
_vb                     res     1       '2+             read-only
_rate                   res     1       '500_000+       read-only

line_req_ptr            res     1
line_buf_ptr            res     1
tpm_ptr                 res     1
buff_1_ptr              res     1
buff_2_ptr              res     1
buff_3_ptr              res     1
buff_4_ptr              res     1

vmax                    res     1
base                    res     1
offs                    res     1

tiles                   res     54              'max 864 lines

ram_end
