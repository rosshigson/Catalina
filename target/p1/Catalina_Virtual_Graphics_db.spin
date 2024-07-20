''***************************************************************
''*  Double Buffer Support for Virtual Graphics Driver v1.0     *
''***************************************************************
''
''REVISION HISTORY
''
'' Rev  Date       Description
'' ---  ---------  ---------------------------------------------------
'' 010   7 Jul 08  First version
'' 011  28 Jul 08  Added support for reclaiming RAM
''
'' 3.8             First Catalina version
''

CON
{
  #1, _db_setup, _db_clear, _db_copy, _db_move, _db_loop
}

  TILE_BITS     = 12            ' virtual VGA uses 12 bits of tile number (instead of the normal 10)
  TILE_MASK     = $0FFF         ' 12 bits of tile number allows for 4096 tiles, necessary for high resolutions
  COLOUR_MASK   = $F000         ' virtual VGA uses 4 bits of colour (instead of the normal 6) for 16 colour combinations
VAR
{
  long  cogon, cog
  long  command
  long  db_flags[6]
}

OBJ
  common : "Catalina_Common"

PUB start : okay | cogon, cog

'' Start virtual graphics double buffer support driver - starts a cog
'' returns false if no cog available

  okay := cogon := (cog := cognew(@entry, common#REGISTRY)) => 0
  if okay
    ' register the virtual graphics double buffer support
    common.Register(cog, common#LMM_VDB)
     

{
PUB start : okay

'' Start virtual graphics double buffer support driver - starts a cog
'' returns false if no cog available

  stop
  okay := cogon := (cog := cognew(@entry, common#REGISTRY)) => 0
  if okay
    ' register the virtual graphics double buffer support
    common.Register(cog, common#LMM_VGB)
     

PUB stop

'' Stop graphics driver - frees a cog

  if cogon~
    cogstop(cog)

  command~


PUB setup (tpm_base, tpm_dbuf, double_buffer, tile_0, tpm_tiles, tile_list)

  db_setcommand(_db_loop, 0)

  db_flags[0] := tpm_base
  db_flags[1] := tpm_dbuf                               'address of double buffer tpm not known 
  db_flags[2] := double_buffer                          'disable double buffering initially
  db_flags[3] := tile_0
  db_flags[4] := tpm_tiles 
  db_flags[5] := tile_list 
    
  db_setcommand(_db_setup, @db_flags)                   ' enable double buffering


PUB clear

'' Clear bitmap

  db_setcommand(_db_clear, @db_flags)


PUB copy(tpm_dbuf) 

'' Copy tile pointer map

  db_flags[1] := tpm_dbuf
  
  db_setcommand(_db_copy, @db_flags)


PUB move(tpm_dbuf) 

'' Copy tile pointer map, clearing as we go

  db_flags[1] := tpm_dbuf
  
  db_setcommand(_db_move, @db_flags)


PUB ramstart
  return @ram_start

PUB ramend
  return @ram_end

PRI db_setcommand(cmd, argptr)

  command := cmd << 16 + argptr                      'write command and pointer
  repeat while command                                  'wait for command to be cleared, signifying receipt
}

DAT

'*******************************************
'* Assembly language double buffer support *
'*******************************************

                        org
ram_start                        
'
'
' Double Buffer driver - main loop
'
entry                   cogid   db_arg0
                        shl     db_arg0,#2
                        add     db_arg0,par
'                        and     db_arg0, low24
                        rdlong  rqst,db_arg0
                        wrlong  db_zero,rqst

db_loop                 rdlong  db_t1,rqst         wz   'wait for command
        if_z            jmp     #db_loop

                        movd    :db_arg,#db_arg0        
                        mov     db_t2,db_t1
                        mov     db_t3,#6                'get 6 arguments
:db_arg                 rdlong  db_arg0,db_t2
                        add     :db_arg,db_d0
                        add     db_t2,#4
                        djnz    db_t3,#:db_arg

'                        wrlong  db_zero,rqst            'zero command to signify received

                        ror     db_t1,#16+2             'lookup command address
                        add     db_t1,#db_jumps
                        movs    :db_table,db_t1
                        rol     db_t1,#2
                        shl     db_t1,#3
:db_table               mov     db_t2,0
                        shr     db_t2,db_t1
                        and     db_t2,#$FF
                        jmp     db_t2                   'jump to command

db_ready                wrlong  db_zero,rqst            'zero command to signify completed
                        jmp     #db_loop


db_jumps                byte    0                       '0
                        byte    db_setup_               '1
                        byte    db_clear_               '2
                        byte    db_copy_                '3
                        byte    db_move_                '4
                        byte    db_ready                '5
                        byte    db_ready                '6
                        byte    db_ready                '7
'
'
' setup(tpm_base, tmp_dbuf, double_buffer, tile_0, tpm_tiles, tile_list)
'
db_setup_               mov     db_tpmbase,db_arg0
                        mov     db_tpmdbuf,db_arg1
                        mov     db_enabled,db_arg2
                        mov     db_tile0,db_arg3
                        shr     db_arg3,#6
                        mov     db_tile0s,db_arg3
                        mov     db_tpmtiles,db_arg4
                        mov     db_tlistptr,db_arg5
                        mov     db_init,#0

                        jmp     #db_ready
'
'
' db_clear()
'
db_clear_               
{
'' if double_buffer is false, we reclaim tiles as we clear them

'' original SPIN code:
        
  repeat n from 0 to tpm_tiles - 1                      'put used tiles back on list unless we are double buffering and they are already in the dest map
    tile_tmp2 := word[tpm_base][n]'&$03FF
    if (tile_tmp2 <> tile_0s)
      word[tpm_base][n] := tile_0s
      tile_tmp1 := word[dest_tpm][n]'&$03FF
      if (double_buffer == 0) or (db_init and (tile_tmp1 <> tile_tmp2))
        tile_tmp2 <<= 6
        longfill(tile_tmp2+4,0,15)
        long[tile_tmp2] := tile_list                  'reclaim tile now
        tile_list := tile_tmp2

}
                        mov     db_t5,#0                'repeat n from 0 to tpm_tiles - 1
:db_clear_loop1         mov     db_t1,db_t5             'tile_tmp2 := word[tpm_base][n]'&mask
                        shl     db_t1,#1         
                        add     db_t1,db_tpmbase         
                        rdword  db_t2,db_t1
                        mov     db_t6,db_t2             
                        and     db_t6,db_mask
                        cmp     db_t6,db_tile0s wz      'if (tile_tmp2 <> tile_0s)
        if_z            jmp     #:db_clear_next1
                        andn    db_t2,db_mask           'preserve ...
                        or      db_t2,db_tile0s         '... current tile colour  
                        wrword  db_t2,db_t1             'word[tpm_base][n] := tile_0s
                        mov     db_t3,db_t5             'tile_tmp1 := word[dest_tpm][n]'&mask
                        shl     db_t3,#1
                        add     db_t3,db_tpmdbuf
                        rdword  db_t4,db_t3
                        and     db_t4,db_mask
                        cmp     db_enabled,db_zero wz      'if (double_buffer == 0) or (db_init and (tile_tmp1 <> tile_tmp2))
        if_z            jmp     #:db_fill_tile1
                        cmp     db_init,db_zero wz
        if_nz           jmp     #:db_clear_next1
                        cmp     db_t6,db_t4     wz
        if_z            jmp     #:db_clear_next1
:db_fill_tile1          shl     db_t6,#6                'tile_tmp2 <<= 6
                        mov     db_t1,#15               'longfill(tile_tmp2+4,0,15)
:db_fill_loop1          add     db_t6,#4
                        wrlong  db_zero,db_t6
                        djnz    db_t1,#:db_fill_loop1
                        sub     db_t6,#60               'point back to start of tile
                        rdlong  db_t3,db_tlistptr       'long[tile_tmp2] := tile_list
                        wrlong  db_t3,db_t6
                        wrlong  db_t6,db_tlistptr       'tile_list := tile_tmp2

:db_clear_next1         add     db_t5,#1
                        cmp     db_t5,db_tpmtiles       wz                        
              if_nz     jmp     #:db_clear_loop1
                               
                        jmp     #db_ready
'
'
' db_copy(dest_ptr)
'
db_copy_ 

{
'' use when double-buffered display (flicker-free)
''
'' if double_buffer is true, we reclaim tiles as we copy over them
 
''   dest_tpm       - base address of destination tile pointer map
'' TBD: take color into account!

'' original SPIN code:
 
  if (double_buffer_init == 0)
    repeat n from 0 to tpm_tiles - 1                      'put any used tiles back on list
      word[dest_tpm][n] := word[tpm_base][n]
    double_buffer_init := 1
  else
    repeat n from 0 to tpm_tiles - 1                      'put any used tiles back on list
      word[dest_tpm][n] := word[tpm_base][n]
      tile_tmp1 := word[dest_tpm][n]'&$03FF  
      tile_tmp2 := word[tpm_base][n]'&$03FF
      if (tile_tmp1 <> tile_0s)
        if (double_buffer <> 0) and (tile_tmp1 <> tile_tmp2)
          tile_tmp1 <<= 6
          longfill(tile_tmp1+4,0,15)
          long[tile_tmp1] := tile_list
          tile_list := tile_tmp1
            
}
                        cmp     db_init,db_zero  wz        'if (double_buffer_init == 0)
              if_nz     jmp     #:db_initialized
                        mov     db_t5,#0                'repeat n from 0 to tpm_tiles - 1
:db_copy_loop1          mov     db_t1,db_t5             'word[dest_tpm][n] := word[tpm_base][n]
                        shl     db_t1,#1         
                        add     db_t1,db_tpmbase         
                        rdword  db_t2,db_t1
                        mov     db_t3,db_t5             
                        shl     db_t3,#1
                        add     db_t3,db_tpmdbuf
                        wrword  db_t2,db_t3
                        add     db_t5,#1
                        cmp     db_t5,db_tpmtiles       wz                        
              if_nz     jmp     #:db_copy_loop1
                        mov     db_init,#1              'double_buffer_init := 1
                          
                        jmp     #db_ready
                               
:db_initialized        
                        mov     db_t5,#0                'repeat n from 0 to tpm_tiles - 1
:db_copy_loop2          mov     db_t1,db_t5             'tile_tmp1 := word[dest_tpm][n]   ('&$mask deferred)
                        shl     db_t1,#1         
                        add     db_t1,db_tpmdbuf         
                        rdword  db_t2,db_t1

                        mov     db_t3,db_t5             'tile_tmp2 := word[tpm_base][n]   ('&mask deferred)
                        shl     db_t3,#1
                        add     db_t3,db_tpmbase
                        rdword  db_t4,db_t3
                        wrword  db_t4,db_t1             'word[dest_tpm][n] := word[tpm_base][n]

                        and     db_t2,db_mask
                        and     db_t4,db_mask

                        cmp     db_t2,db_tile0s  wz     'if (tile_tmp1 <> tile_0s)                        
        if_z            jmp     #:db_copy_next2

                        cmp     db_enabled,db_zero wz   'if (double_buffer <> 0) and (tile_tmp1 <> tile_tmp2)
        if_z            jmp     #:db_copy_next2
                        cmp     db_t2,db_t4     wz
        if_z            jmp     #:db_copy_next2
                        shl     db_t2,#6                'tile_tmp1 <<= 6
                        mov     db_t1,#15               'longfill(tile_tmp2+4,0,15)
:db_fill_loop2          add     db_t2,#4
                        wrlong  db_zero,db_t2
                        djnz    db_t1,#:db_fill_loop2
                        sub     db_t2,#60               'point back to start of tile
                        rdlong  db_t3,db_tlistptr       'long[tile_tmp1] := tile_list
                        wrlong  db_t3,db_t2
                        wrlong  db_t2,db_tlistptr       'tile_list := tile_tmp1

:db_copy_next2          add     db_t5,#1
                        cmp     db_t5,db_tpmtiles       wz                        
              if_nz     jmp     #:db_copy_loop2

                        jmp     #db_ready
db_move_ 

{
'' use when double-buffered display (flicker-free)
''
'' if double_buffer is true, we reclaim tiles as we copy over them
 
''   dest_tpm       - base address of destination tile pointer map
'' TBD: take color into account!

'' original SPIN code:
 
  if (double_buffer_init == 0)
    repeat n from 0 to tpm_tiles - 1                      'put any used tiles back on list
      word[dest_tpm][n] := word[tpm_base][n]
      word[tpm_base][n] := tile_0s
    double_buffer_init := 1
  else
    repeat n from 0 to tpm_tiles - 1                      'put any used tiles back on list
      tile_tmp1 := word[dest_tpm][n]'&$03FF  
      tile_tmp2 := word[tpm_base][n]'&$03FF
      word[dest_tpm][n] := word[tpm_base][n]
      word[tpm_base] := tile_0s
      if (tile_tmp1 <> tile_0s)
        if (double_buffer <> 0) and (tile_tmp1 <> tile_tmp2)
          tile_tmp1 <<= 6
          longfill(tile_tmp1+4,0,15)
          long[tile_tmp1] := tile_list
          tile_list := tile_tmp1
      if (tile_tmp2 <> tile_0s)
        if (double_buffer <> 0)
          tile_tmp2 <<= 6
          longfill(tile_tmp2+4,0,15)
          long[tile_tmp2] := tile_list
          tile_list := tile_tmp2
            
}
                        cmp     db_init,db_zero  wz        'if (double_buffer_init == 0)
              if_nz     jmp     #:db_initialized2
                        mov     db_t5,#0                'repeat n from 0 to tpm_tiles - 1
:db_move_loop1          mov     db_t1,db_t5             'word[dest_tpm][n] := word[tpm_base][n]
                        shl     db_t1,#1         
                        add     db_t1,db_tpmbase         
                        rdword  db_t2,db_t1
                        mov     db_t3,db_t5             
                        shl     db_t3,#1
                        add     db_t3,db_tpmdbuf
                        wrword  db_t2,db_t3

                        andn    db_t2,db_mask           'preserve ...
                        or      db_t2,db_tile0s         '... current tile colour  
                        wrword  db_t2,db_t1             'word[tpm_base][n] := tile_0s

                        add     db_t5,#1
                        cmp     db_t5,db_tpmtiles       wz                        
              if_nz     jmp     #:db_move_loop1
                        mov     db_init,#1              'double_buffer_init := 1
                          
                        jmp     #db_ready
                               
:db_initialized2        
                        mov     db_t5,#0                'repeat n from 0 to tpm_tiles - 1
:db_move_loop2          mov     db_t1,db_t5             'tile_tmp1 := word[dest_tpm][n]   ('&$mask deferred)
                        shl     db_t1,#1         
                        add     db_t1,db_tpmdbuf         
                        rdword  db_t2,db_t1

                        mov     db_t3,db_t5             'tile_tmp2 := word[tpm_base][n]   ('&mask deferred)
                        shl     db_t3,#1
                        add     db_t3,db_tpmbase
                        rdword  db_t4,db_t3
                        wrword  db_t4,db_t1             'word[dest_tpm][n] := word[tpm_base][n]

                        mov     db_t6,db_t2
                        andn    db_t6,db_mask           'preserve ...
                        or      db_t6,db_tile0s         '... current tile colour  
                        wrword  db_t6,db_t3             'word[tpm_base][n] := tile_0s


                        and     db_t2,db_mask           'tile_tmp1
                        and     db_t4,db_mask           'tile_tmp2

                        cmp     db_t2,db_tile0s  wz     'if (tile_tmp1 <> tile_0s)                        
        if_z            jmp     #:db_move_next2

                        cmp     db_enabled,db_zero wz   'if (double_buffer <> 0) and (tile_tmp1 <> tile_tmp2)
        if_z            jmp     #:db_move_next2
                        cmp     db_t2,db_t4     wz
        if_z            jmp     #:db_move_next2
                        shl     db_t2,#6                'tile_tmp1 <<= 6
                        mov     db_t1,#15               'longfill(tile_tmp1+4,0,15)
:db_fill_loop3          add     db_t2,#4
                        wrlong  db_zero,db_t2
                        djnz    db_t1,#:db_fill_loop3
                        sub     db_t2,#60               'point back to start of tile
                        rdlong  db_t3,db_tlistptr       'long[tile_tmp1] := tile_list
                        wrlong  db_t3,db_t2
                        wrlong  db_t2,db_tlistptr       'tile_list := tile_tmp1

:db_move_next2
                        cmp     db_t4,db_tile0s  wz     'if (tile_tmp2 <> tile_0s)                        
        if_z            jmp     #:db_move_next3
                        cmp     db_enabled,db_zero wz      'if (double_buffer == 0) 
        if_nz           jmp     #:db_move_next3
                        shl     db_t4,#6                'tile_tmp2 <<= 6
                        mov     db_t1,#15               'longfill(tile_tmp2+4,0,15)
:db_fill_loop4          add     db_t4,#4
                        wrlong  db_zero,db_t4
                        djnz    db_t1,#:db_fill_loop4
                        sub     db_t4,#60               'point back to start of tile
                        rdlong  db_t3,db_tlistptr       'long[tile_tmp2] := tile_list
                        wrlong  db_t3,db_t4
                        wrlong  db_t4,db_tlistptr       'tile_list := tile_tmp2

:db_move_next3
                        add     db_t5,#1
                        cmp     db_t5,db_tpmtiles       wz                        
              if_nz     jmp     #:db_move_loop2

                        jmp     #db_ready
'
'
'
' Defined data
'
db_zero                 long    0                       'constants
db_d0                   long    $200
db_mask                 long    TILE_MASK

'
'
' Undefined data
'
db_t1                   long    0       'temps
db_t2                   long    0
db_t3                   long    0
db_t4                   long    0
db_t5                   long    0
db_t6                   long    0

db_arg0                 long    0       'arguments passed from high-level
db_arg1                 long    0
db_arg2                 long    0
db_arg3                 long    0
db_arg4                 long    0
db_arg5                 long    0

db_tpmbase              long    0
db_tpmdbuf              long    0
db_enabled              long    0
db_tile0                long    0
db_tpmtiles             long    0
db_tlistptr             long    0

db_tile0s               long    0
db_tile1s               long    0
db_init                 long    0

rqst                    long    0
