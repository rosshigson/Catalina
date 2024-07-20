' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _malloc_unlink_free_chunk

 alignl ' align long
C__malloc_unlink_free_chunk ' <symbol:_malloc_unlink_free_chunk>
 jmp #PSHM
 long $ea0000 ' save registers
 rdlong r23, r2 ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__malloc_unlink_free_chunk_4 ' NEU4
 jmp #LODL
 long @C__malloc_free_list-4
 mov r19, RI ' reg <- addrg
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22
 sub r17, #8 ' SUBU4 coni
C__malloc_unlink_free_chunk_7
 shr r17, #1 ' RSHU4 coni
 adds r19, #4 ' ADDP4 coni
' C__malloc_unlink_free_chunk_8 ' (symbol refcount = 0)
 cmp r17,  #8 wz,wc 
 jmp #BRAE
 long @C__malloc_unlink_free_chunk_7 ' GEU4
 wrlong r23, r19 ' ASGNP4 reg reg
 jmp #JMPA
 long @C__malloc_unlink_free_chunk_5 ' JUMPV addrg
C__malloc_unlink_free_chunk_4
 wrlong r23, r21 ' ASGNP4 reg reg
C__malloc_unlink_free_chunk_5
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_unlink_free_chunk_10 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
C__malloc_unlink_free_chunk_10
 mov r0, #0 ' RET coni
' C__malloc_unlink_free_chunk_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _malloc_free_list
' end
