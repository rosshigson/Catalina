' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_link_free_chunk

 alignl ' align long
C__malloc_link_free_chunk ' <symbol:_malloc_link_free_chunk>
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, ##@C__malloc_free_list ' reg <- addrg
 mov r22, ##-8 ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22
 sub r21, #8 ' SUBU4 coni
C__malloc_link_free_chunk_4
 shr r21, #1 ' RSHU4 coni
 adds r23, #4 ' ADDP4 coni
' C__malloc_link_free_chunk_5 ' (symbol refcount = 0)
 cmp r21,  #8 wcz 
 if_ae jmp #\C__malloc_link_free_chunk_4 ' GEU4
 mov r22, ##-4 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov r23, r22 ' CVI, CVU or LOAD
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 wrlong r19, r2 ' ASGNP4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__malloc_link_free_chunk_7 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
C__malloc_link_free_chunk_7
 wrlong r2, r23 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
' C__malloc_link_free_chunk_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _malloc_free_list
' end
