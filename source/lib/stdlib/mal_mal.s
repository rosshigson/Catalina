' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export malloc

 alignl ' align long
C_malloc ' <symbol:malloc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_lock ' CALL addrg
 cmp r23,  #0 wz
 if_nz jmp #\C_malloc_4  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_malloc_3 ' JUMPV addrg
C_malloc_4
 cmp r23,  #8 wcz 
 if_ae jmp #\C_malloc_6 ' GEU4
 mov r23, #8 ' reg <- coni
 jmp #\@C_malloc_7 ' JUMPV addrg
C_malloc_6
 mov r22, r23
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r23, r22 ' BANDI/U
 and r23, r20 ' BANDI/U (3)
C_malloc_7
 cmp r23,  #256 wcz 
 if_a jmp #\C_malloc_8 ' GTU4
 mov r22, r23
 shr r22, #3 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C__malloc_store ' reg <- addrg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_malloc_10 ' EQU4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, ##-4 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##$fffffffd ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_malloc_3 ' JUMPV addrg
C_malloc_10
C_malloc_8
 mov r17, r23 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
C_malloc_12
 mov r22, #1 ' reg <- coni
 shr r17, r22 ' RSHU (1)
 adds r19, #1 ' ADDI4 coni
' C_malloc_13 ' (symbol refcount = 0)
 cmp r17,  #8 wcz 
 if_ae jmp #\C_malloc_12 ' GEU4
 cmps r19,  #21 wcz
 if_b jmp #\C_malloc_15 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_malloc_3 ' JUMPV addrg
C_malloc_15
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__malloc_first_present ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_malloc_17  ' NEU4
 mov r22, #8 ' reg <- coni
 shl r22, r19 ' LSHI/U (1)
 add r22, #8 ' ADDU4 coni
 add r22, #64 ' ADDU4 coni
 sub r22, #1 ' SUBU4 coni
 mov r20, ##$ffffffc0 ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 mov r22, ##@C_ml_last
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_malloc_19  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r20, r17
 add r20, #7 ' ADDU4 coni
 mov r18, ##$fffffff8 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r22, r20 ' SUBU
 sub r22, r17 ' SUBU (3)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__sbrk ' CALL addrg
C_malloc_19
 mov r22, r15 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_ae jmp #\C_malloc_21 ' GEI4
 mov r17, ##$ffffffff ' reg <- con
 jmp #\@C_malloc_22 ' JUMPV addrg
C_malloc_21
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_malloc_22
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_malloc_23  ' NEU4
 mov r15, r23
 add r15, #8 ' ADDU4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_b jmp #\C_malloc_25 ' LTI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_malloc_25
C_malloc_23
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_malloc_27  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__malloc_sell_out ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__malloc_first_present ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_malloc_18  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r19
 subs r3, #1 ' SUBI4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__malloc_search_free_list
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_malloc_31  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_malloc_3 ' JUMPV addrg
C_malloc_31
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 jmp #\@C_malloc_18 ' JUMPV addrg
C_malloc_27
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__malloc_create_chunk
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_malloc_17
C_malloc_18
 mov r22, ##-4 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 add r23, #8 ' ADDU4 coni
 mov r22, r23
 add r22, #8 ' ADDU4 coni
 add r22, #64 ' ADDU4 coni
 mov r20, ##-8 ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #8 ' SUBU4 coni
 cmp r22, r20 wcz 
 if_a jmp #\C_malloc_33 ' GTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__malloc_truncate
 add SP, #4 ' CALL addrg
C_malloc_33
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
C_malloc_3
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export malloc_defragment

 alignl ' align long
C_malloc_defragment ' <symbol:malloc_defragment>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_lock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__malloc_sell_out ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, ##0 ' RET con
' C_malloc_defragment_35 ' (symbol refcount = 0)
 calld PA,#RETF


' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import _malloc_store

' Catalina Import _malloc_sell_out

' Catalina Import _sbrk

' Catalina Import _malloc_create_chunk

' Catalina Import _malloc_truncate

' Catalina Import ml_last

' Catalina Import _malloc_search_free_list

' Catalina Import _malloc_first_present

' Catalina Import _malloc_unlink_free_chunk
' end
