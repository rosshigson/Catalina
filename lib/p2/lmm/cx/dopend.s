' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_OpenDir

 alignl ' align long
C_D_F_S__O_penD_ir ' <symbol:DFS_OpenDir>
 jmp #NEWF
 sub SP, #44
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__O_penD_ir_7 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #1 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_5 ' NEU4
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_5 ' NEI4
C_D_F_S__O_penD_ir_7
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_8 ' NEI4
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r22 ' ADDU
 add r3, r0 ' ADDU (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_8
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_5
 mov r17, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_10 ' NEI4
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r22 ' ADDU
 add r3, r0 ' ADDU (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__O_penD_ir_17 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_10
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__O_penD_ir_17 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_16
 adds r17, #1 ' ADDP4 coni
C_D_F_S__O_penD_ir_17
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_19 ' NEI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_16 ' NEI4
C_D_F_S__O_penD_ir_19
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_21 ' JUMPV addrg
C_D_F_S__O_penD_ir_20
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__C_anonicalT_oD_ir
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrbyte r22, RI ' ASGNU1 addrl reg
C_D_F_S__O_penD_ir_23
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
' C_D_F_S__O_penD_ir_24 ' (symbol refcount = 0)
 cmp r15,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_26 ' NEU4
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_23 ' NEI4
C_D_F_S__O_penD_ir_26
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_27 ' NEI4
 mov r22, #16 ' reg <- coni
 mov r20, FP
 sub r20, #-(-25) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #16 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_27 ' NEI4
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_30 ' NEI4
 mov r22, FP
 sub r22, #-(-10) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-9) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #8 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-15) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_31 ' JUMPV addrg
C_D_F_S__O_penD_ir_30
 mov r22, FP
 sub r22, #-(-10) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-9) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #8 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 wrlong r22, r19 ' ASGNU4 reg reg
C_D_F_S__O_penD_ir_31
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r19 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r22 ' ADDU
 add r3, r0 ' ADDU (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__O_penD_ir_41 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_27
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_40
 adds r17, #1 ' ADDP4 coni
C_D_F_S__O_penD_ir_41
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BR_Z
 long @C_D_F_S__O_penD_ir_43 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_40 ' NEI4
C_D_F_S__O_penD_ir_43
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_44 ' NEI4
 adds r17, #1 ' ADDP4 coni
C_D_F_S__O_penD_ir_44
C_D_F_S__O_penD_ir_21
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_20 ' NEI4
 rdlong r22, r19 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__O_penD_ir_46 ' NEU4
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_D_F_S__O_penD_ir_4 ' JUMPV addrg
C_D_F_S__O_penD_ir_46
 mov r0, #0 ' RET coni
C_D_F_S__O_penD_ir_4
 jmp #POPM ' restore registers
 add SP, #44 ' framesize
 jmp #RETF


' Catalina Import DFS_CanonicalToDir

' Catalina Import DFS_GetNext

' Catalina Import DFS_ReadSector

' Catalina Import strlen

' Catalina Import memcmp
' end
