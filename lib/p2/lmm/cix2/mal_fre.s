' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export free

 alignl ' align long
C_free ' <symbol:free>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_free_4 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #JMPA
 long @C_free_3 ' JUMPV addrg
C_free_4
 mov r21, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 and r20, #1 ' BANDU4 coni
 cmps r20,  #0 wz
 jmp #BRNZ
 long @C_free_8 ' NEI4
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_free_6 ' EQU4
C_free_8
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #JMPA
 long @C_free_3 ' JUMPV addrg
C_free_6
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 cmp r22,  #256 wcz 
 jmp #BR_A
 long @C_free_9 ' GTU4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 shr r22, #3 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODL
 long @C__malloc_store
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r21, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_free_10 ' JUMPV addrg
C_free_9
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_do_free ' CALL addrg
C_free_10
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
C_free_3
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export _malloc_do_free

 alignl ' align long
C__malloc_do_free ' <symbol:_malloc_do_free>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_ml_last
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__malloc_do_free_15 ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C__malloc_do_free_16 ' JUMPV addrg
C__malloc_do_free_15
 mov r21, #0 ' reg <- coni
C__malloc_do_free_16
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C__malloc_do_free_12 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 and r22, #1 ' BANDU4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_do_free_17 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_combine_chunks
 add SP, #4 ' CALL addrg
C__malloc_do_free_17
C__malloc_do_free_12
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffc
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__malloc_do_free_22 ' NEU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C__malloc_do_free_23 ' JUMPV addrg
C__malloc_do_free_22
 mov r19, #0 ' reg <- coni
C__malloc_do_free_23
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C__malloc_do_free_19 ' NEI4
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffc
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 and r22, #1 ' BANDU4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_do_free_24 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_unlink_free_chunk ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__malloc_combine_chunks
 add SP, #4 ' CALL addrg
 mov r23, r17 ' CVI, CVU or LOAD
C__malloc_do_free_24
C__malloc_do_free_19
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_link_free_chunk ' CALL addrg
 mov r17, #0 ' reg <- coni
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C__malloc_do_free_27 ' EQI4
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C__malloc_do_free_27 ' EQI4
 jmp #JMPA
 long @C__malloc_do_free_26 ' JUMPV addrg
C__malloc_do_free_26
C__malloc_do_free_27
 mov r15, #0 ' reg <- coni
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__malloc_do_free_32 ' EQI4
 cmps r15,  #1 wz
 jmp #BR_Z
 long @C__malloc_do_free_32 ' EQI4
 jmp #JMPA
 long @C__malloc_do_free_31 ' JUMPV addrg
C__malloc_do_free_31
C__malloc_do_free_32
 mov r0, #0 ' RET coni
' C__malloc_do_free_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import _malloc_store

' Catalina Import _malloc_combine_chunks

' Catalina Import ml_last

' Catalina Import _malloc_unlink_free_chunk

' Catalina Import _malloc_link_free_chunk
' end
