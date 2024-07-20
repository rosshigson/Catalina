' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_RenameFile

 alignl ' align long
C_D_F_S__R_enameF_ile ' <symbol:DFS_RenameFile>
 jmp #NEWF
 sub SP, #136
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 mov r2, #64 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -37
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_9 ' EQI4
 mov r0, #4 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_8
 mov r2, FP
 sub r2, #-(-99) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
C_D_F_S__R_enameF_ile_9
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_8 ' EQI4
 mov r15, FP
 sub r15, #-(-100) ' reg <- addrli
C_D_F_S__R_enameF_ile_12
' C_D_F_S__R_enameF_ile_13 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_12 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_16 ' JUMPV addrg
C_D_F_S__R_enameF_ile_15
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__R_enameF_ile_16
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_D_F_S__R_enameF_ile_18 ' LEU4
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_15 ' NEI4
C_D_F_S__R_enameF_ile_18
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_19 ' NEI4
 adds r15, #1 ' ADDP4 coni
C_D_F_S__R_enameF_ile_19
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__C_anonicalT_oD_ir
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__C_anonicalT_oD_ir
 add SP, #4 ' CALL addrg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_D_F_S__R_enameF_ile_21 ' LEU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r15, r22 ' ADDI/P (1)
C_D_F_S__R_enameF_ile_21
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_25 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_23 ' NEU4
C_D_F_S__R_enameF_ile_25
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
C_D_F_S__R_enameF_ile_23
 jmp #LODF
 long -108
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r2, FP
 sub r2, #-(-116) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_30 ' EQU4
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_29
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_32 ' NEI4
 mov r0, #6 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_32
C_D_F_S__R_enameF_ile_30
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-116) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_29 ' EQU4
 mov r2, FP
 sub r2, #-(-116) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_37 ' EQU4
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_36
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_39 ' NEI4
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_41 ' EQI4
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_41
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, #17 ' reg <- coni
 jmp #LODF
 long -18
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #52 ' reg <- coni
 jmp #LODF
 long -17
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #32 ' reg <- coni
 jmp #LODF
 long -14
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #8 ' reg <- coni
 jmp #LODF
 long -13
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #17 ' reg <- coni
 jmp #LODF
 long -12
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #52 ' reg <- coni
 jmp #LODF
 long -11
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__R_enameF_ile_50 ' NEU4
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r13, r22 ' ADDU
 add r13, r20 ' ADDU (3)
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_51 ' JUMPV addrg
C_D_F_S__R_enameF_ile_50
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 add r22, r0 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r13, r22 ' ADDU
 add r13, r20 ' ADDU (3)
C_D_F_S__R_enameF_ile_51
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-111) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 subs r22, #32 ' SUBI4 coni
 mov r4, r22 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_55 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_55
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_D_F_S__R_enameF_ile_4 ' JUMPV addrg
C_D_F_S__R_enameF_ile_39
C_D_F_S__R_enameF_ile_37
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-116) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__R_enameF_ile_36 ' EQU4
 mov r0, #3 ' RET coni
C_D_F_S__R_enameF_ile_4
 jmp #POPM ' restore registers
 add SP, #136 ' framesize
 jmp #RETF


' Catalina Import DFS_CanonicalToDir

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_WriteSector

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import strncpy

' Catalina Import strcpy

' Catalina Import memcpy
' end
