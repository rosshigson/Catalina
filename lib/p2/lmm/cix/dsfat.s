' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_SetFAT

 alignl ' align long
C_D_F_S__S_etF_A_T_ ' <symbol:DFS_SetFAT>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__5 ' NEI4
 mov r0, #7 ' RET coni
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__4 ' JUMPV addrg
C_D_F_S__S_etF_A_T__5
 mov r22, #1 ' reg <- coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__7 ' NEI4
 mov r15, r19
 shl r15, #1 ' LSHU4 coni
 jmp #LODL
 long $ffff
 mov r22, RI ' reg <- con
 and r17, r22 ' BANDI/U (1)
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__8 ' JUMPV addrg
C_D_F_S__S_etF_A_T__7
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__9 ' NEI4
 mov r15, r19
 shl r15, #2 ' LSHU4 coni
 jmp #LODL
 long $fffffff
 mov r22, RI ' reg <- con
 and r17, r22 ' BANDI/U (1)
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__10 ' JUMPV addrg
C_D_F_S__S_etF_A_T__9
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__4 ' JUMPV addrg
C_D_F_S__S_etF_A_T__10
C_D_F_S__S_etF_A_T__8
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldiv
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r11, r22 ' ADDU
 add r11, r20 ' ADDU (3)
 rdlong r22, r21 ' reg <- INDIRU4 reg
 cmp r11, r22 wz
 jmp #BR_Z
 long @C_D_F_S__S_etF_A_T__11 ' EQU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__S_etF_A_T__13 ' EQU4
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNU4 reg reg
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__4 ' JUMPV addrg
C_D_F_S__S_etF_A_T__13
 wrlong r11, r21 ' ASGNU4 reg reg
C_D_F_S__S_etF_A_T__11
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldiv
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__16 ' NEI4
 mov r22, r15 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, r17
 and r20, #255 ' BANDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 jmp #LODL
 long $ff00
 mov r20, RI ' reg <- con
 and r20, r17 ' BANDI/U (2)
 shr r20, #8 ' RSHU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__17 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r21 ' reg <- INDIRU4 reg
 mov r18, r22
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r4, r23 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__17 ' JUMPV addrg
C_D_F_S__S_etF_A_T__16
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__20 ' NEI4
 mov r22, r15 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, r17
 and r20, #255 ' BANDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 jmp #LODL
 long $ff00
 mov r20, RI ' reg <- con
 and r20, r17 ' BANDI/U (2)
 shr r20, #8 ' RSHU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 add r22, #2 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 jmp #LODL
 long $ff0000
 mov r20, RI ' reg <- con
 and r20, r17 ' BANDI/U (2)
 shr r20, #16 ' RSHU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 add r22, #3 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #240 ' BANDI4 coni
 jmp #LODL
 long $f000000
 mov r18, RI ' reg <- con
 and r18, r17 ' BANDI/U (2)
 shr r18, #24 ' RSHU4 coni
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__S_etF_A_T__21 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r21 ' reg <- INDIRU4 reg
 mov r18, r22
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r4, r23 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__S_etF_A_T__21 ' JUMPV addrg
C_D_F_S__S_etF_A_T__20
 jmp #LODL
 long $ffffffff
 mov r13, RI ' reg <- con
C_D_F_S__S_etF_A_T__21
C_D_F_S__S_etF_A_T__17
 mov r0, r13 ' CVI, CVU or LOAD
C_D_F_S__S_etF_A_T__4
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector

' Catalina Import ldiv
' end
