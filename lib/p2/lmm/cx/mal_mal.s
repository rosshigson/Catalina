' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export malloc

 alignl ' align long
C_malloc ' <symbol:malloc>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C_malloc_4 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_malloc_3 ' JUMPV addrg
C_malloc_4
 cmp r23,  #8 wcz 
 jmp #BRAE
 long @C_malloc_6 ' GEU4
 mov r23, #8 ' reg <- coni
 jmp #JMPA
 long @C_malloc_7 ' JUMPV addrg
C_malloc_6
 mov r22, r23
 add r22, #7 ' ADDU4 coni
 jmp #LODL
 long $fffffff8
 mov r20, RI ' reg <- con
 mov r23, r22 ' BANDI/U
 and r23, r20 ' BANDI/U (3)
C_malloc_7
 cmp r23,  #256 wcz 
 jmp #BR_A
 long @C_malloc_8 ' GTU4
 mov r22, r23
 shr r22, #3 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODL
 long @C__malloc_store
 mov r20, RI ' reg <- addrg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_malloc_10 ' EQU4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffd
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_malloc_3 ' JUMPV addrg
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
 jmp #BRAE
 long @C_malloc_12 ' GEU4
 cmps r19,  #21 wcz
 jmp #BR_B
 long @C_malloc_15 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_malloc_3 ' JUMPV addrg
C_malloc_15
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_first_present ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_malloc_17 ' NEU4
 mov r22, #8 ' reg <- coni
 shl r22, r19 ' LSHI/U (1)
 add r22, #8 ' ADDU4 coni
 add r22, #64 ' ADDU4 coni
 sub r22, #1 ' SUBU4 coni
 jmp #LODL
 long $ffffffc0
 mov r20, RI ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 jmp #LODI
 long @C_ml_last
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_malloc_19 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r20, r17
 add r20, #7 ' ADDU4 coni
 jmp #LODL
 long $fffffff8
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r22, r20 ' SUBU
 sub r22, r17 ' SUBU (3)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
C_malloc_19
 mov r22, r15 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_malloc_21 ' GEI4
 jmp #LODL
 long $ffffffff
 mov r17, RI ' reg <- con
 jmp #JMPA
 long @C_malloc_22 ' JUMPV addrg
C_malloc_21
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_malloc_22
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_malloc_23 ' NEU4
 mov r15, r23
 add r15, #8 ' ADDU4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_malloc_25 ' LTI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_malloc_25
C_malloc_23
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_malloc_27 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__malloc_sell_out ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_first_present ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_malloc_18 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r19
 subs r3, #1 ' SUBI4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_search_free_list
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_malloc_31 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_malloc_3 ' JUMPV addrg
C_malloc_31
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 jmp #JMPA
 long @C_malloc_18 ' JUMPV addrg
C_malloc_27
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_create_chunk
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_malloc_17
C_malloc_18
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffe
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 add r23, #8 ' ADDU4 coni
 mov r22, r23
 add r22, #8 ' ADDU4 coni
 add r22, #64 ' ADDU4 coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #8 ' SUBU4 coni
 cmp r22, r20 wcz 
 jmp #BR_A
 long @C_malloc_33 ' GTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_truncate
 add SP, #4 ' CALL addrg
C_malloc_33
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
C_malloc_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export malloc_defragment

 alignl ' align long
C_malloc_defragment ' <symbol:malloc_defragment>
 jmp #NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__malloc_sell_out ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
' C_malloc_defragment_35 ' (symbol refcount = 0)
 jmp #RETF


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
