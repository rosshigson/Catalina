' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_unlink_free_chunk

 alignl ' align long
C__malloc_unlink_free_chunk ' <symbol:_malloc_unlink_free_chunk>
 calld PA,#PSHM
 long $ea0000 ' save registers
 rdlong r23, r2 ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C__malloc_unlink_free_chunk_4  ' NEU4
 mov r19, ##@C__malloc_free_list-4 ' reg <- addrg
 mov r22, ##-8 ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22
 sub r17, #8 ' SUBU4 coni
C__malloc_unlink_free_chunk_7
 shr r17, #1 ' RSHU4 coni
 adds r19, #4 ' ADDP4 coni
' C__malloc_unlink_free_chunk_8 ' (symbol refcount = 0)
 cmp r17,  #8 wcz 
 if_ae jmp #\C__malloc_unlink_free_chunk_7 ' GEU4
 wrlong r23, r19 ' ASGNP4 reg reg
 jmp #\@C__malloc_unlink_free_chunk_5 ' JUMPV addrg
C__malloc_unlink_free_chunk_4
 wrlong r23, r21 ' ASGNP4 reg reg
C__malloc_unlink_free_chunk_5
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__malloc_unlink_free_chunk_10 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
C__malloc_unlink_free_chunk_10
 mov r0, #0 ' reg <- coni
' C__malloc_unlink_free_chunk_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _malloc_free_list
' end
