' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_truncate

 alignl ' align long
C__malloc_truncate ' <symbol:_malloc_truncate>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r23 ' ADDI/P (3)
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 wrlong r22, r19 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 and r20, #3 ' BANDU4 coni
 adds r20, r23 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r20, r17 ' CVI, CVU or LOAD
 mov r18, r19 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_ml_last
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__malloc_truncate_7 ' NEU4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C__malloc_truncate_8 ' JUMPV addrg
C__malloc_truncate_7
 mov r15, #0 ' reg <- coni
C__malloc_truncate_8
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C__malloc_truncate_4 ' NEI4
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 and r20, #3 ' BANDU4 coni
 adds r20, r19 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 and r22, #1 ' BANDU4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_truncate_5 ' EQI4
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
 jmp #JMPA
 long @C__malloc_truncate_5 ' JUMPV addrg
C__malloc_truncate_4
 jmp #LODL
 long @C_ml_last
 wrlong r19, RI ' ASGNP4 addrg reg
C__malloc_truncate_5
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov r20, r19 ' CVI, CVU or LOAD
 mov r18, r23 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_link_free_chunk ' CALL addrg
 mov r0, #0 ' RET coni
' C__malloc_truncate_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _malloc_link_free_chunk

' Catalina Import _malloc_unlink_free_chunk

' Catalina Import _malloc_combine_chunks

' Catalina Import ml_last
' end
