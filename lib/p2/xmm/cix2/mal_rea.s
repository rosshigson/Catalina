' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export realloc

 alignl ' align long
C_realloc ' <symbol:realloc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_realloc_4 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_realloc_3 ' JUMPV addrg
C_realloc_4
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_realloc_6 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_realloc_3 ' JUMPV addrg
C_realloc_6
 mov r19, r23 ' CVI, CVU or LOAD
 cmp r21,  #8 wz,wc 
 jmp #BRAE
 long @C_realloc_8 ' GEU4
 mov r21, #8 ' reg <- coni
 jmp #JMPA
 long @C_realloc_9 ' JUMPV addrg
C_realloc_8
 mov r22, r21
 add r22, #7 ' ADDU4 coni
 jmp #LODL
 long $fffffff8
 mov r20, RI ' reg <- con
 mov r21, r22 ' BANDI/U
 and r21, r20 ' BANDI/U (3)
C_realloc_9
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_realloc_10 ' EQU4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 shr r22, #3 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODL
 long @C__malloc_store
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long 0
 mov r11, RI ' reg <- con
 jmp #JMPA
 long @C_realloc_13 ' JUMPV addrg
C_realloc_12
 mov r11, r13 ' CVI, CVU or LOAD
 mov RI, r13
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
C_realloc_13
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_realloc_12 ' NEU4
 mov RI, r13
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_realloc_15 ' NEU4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 shr r22, #3 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODL
 long @C__malloc_store
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r13
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_realloc_16 ' JUMPV addrg
C_realloc_15
 mov RI, r11
 mov BC, r13
 jmp #WLNG ' ASGNP4 reg reg
C_realloc_16
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffd
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_realloc_10
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 and r22, #1 ' BANDU4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_realloc_17 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffe
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_realloc_17
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r15, r22
 sub r15, #8 ' SUBU4 coni
 cmp r21, r15 wz,wc 
 jmp #BRBE
 long @C_realloc_19 ' LEU4
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_ml_last
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_realloc_22 ' NEU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_realloc_23 ' JUMPV addrg
C_realloc_22
 mov r13, #0 ' reg <- coni
C_realloc_23
 mov r22, #0 ' reg <- coni
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_realloc_19 ' NEI4
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r18, r19 ' ADDI/P
 adds r18, r20 ' ADDI/P (3)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 mov r17, r18 ' ADDI/P
 adds r17, r19 ' ADDI/P (3)
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r18, r17 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 and r18, #1 ' BANDU4 coni
 cmps r18, r22 wz
 jmp #BR_Z
 long @C_realloc_19 ' EQI4
 mov r22, r15
 add r22, #8 ' ADDU4 coni
 adds r20, r17 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #8 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 cmp r21, r22 wz,wc 
 jmp #BR_A
 long @C_realloc_19 ' GTU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_combine_chunks
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r15, r22
 sub r15, #8 ' SUBU4 coni
C_realloc_19
 cmp r21, r15 wz,wc 
 jmp #BRBE
 long @C_realloc_24 ' LEU4
 mov r9, r23 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_realloc_29 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_realloc_3 ' JUMPV addrg
C_realloc_28
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov r20, r9 ' CVI, CVU or LOAD
 mov r9, r20
 adds r9, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_realloc_29
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 sub r15, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_realloc_28 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 jmp #JMPA
 long @C_realloc_3 ' JUMPV addrg
C_realloc_24
 add r21, #8 ' ADDU4 coni
 mov r22, r21
 add r22, #8 ' ADDU4 coni
 add r22, #64 ' ADDU4 coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r20, r19 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #8 ' SUBU4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_realloc_31 ' GTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_truncate
 add SP, #4 ' CALL addrg
C_realloc_31
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
C_realloc_3
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import _malloc_store

' Catalina Import _malloc_combine_chunks

' Catalina Import _malloc_truncate

' Catalina Import ml_last

' Catalina Import _malloc_unlink_free_chunk

' Catalina Import malloc

' Catalina Import free
' end
