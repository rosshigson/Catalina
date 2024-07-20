' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_Seek

 alignl ' align long
C_D_F_S__S_eek ' <symbol:DFS_Seek>
 jmp #NEWF
 sub SP, #44
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wz
 jmp #BRNZ
 long @C_D_F_S__S_eek_5 ' NEU4
 jmp #JMPA
 long @C_D_F_S__S_eek_4 ' JUMPV addrg
C_D_F_S__S_eek_5
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wz,wc 
 jmp #BRBE
 long @C_D_F_S__S_eek_7 ' LEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
C_D_F_S__S_eek_7
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__S_eek_9 ' NEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__S_eek_4 ' JUMPV addrg
C_D_F_S__S_eek_9
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__S_eek_11 ' GEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_D_F_S__S_eek_11
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 shl r2, #9 ' LSHI4 coni
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 shl r2, #9 ' LSHI4 coni
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r21 ' ADDU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_D_F_S__S_eek_13 ' NEI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r21, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__S_eek_14 ' JUMPV addrg
C_D_F_S__S_eek_13
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 shl r2, #9 ' LSHI4 coni
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 rdlong r18, r23 ' reg <- INDIRP4 reg
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 shl r20, #9 ' LSHI4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 shl r2, #9 ' LSHI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__S_eek_16 ' JUMPV addrg
C_D_F_S__S_eek_15
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 rdlong r5, r23 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff7
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_D_F_S__S_eek_18 ' NEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__S_eek_4 ' JUMPV addrg
C_D_F_S__S_eek_18
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 rdlong r18, r23 ' reg <- INDIRP4 reg
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #9 ' LSHI4 coni
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_D_F_S__S_eek_16
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 shl r2, #9 ' LSHI4 coni
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r17 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_D_F_S__S_eek_15 ' NEI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r21, r22 ' ASGNU4 reg reg
C_D_F_S__S_eek_14
C_D_F_S__S_eek_4
 jmp #POPM ' restore registers
 add SP, #44 ' framesize
 jmp #RETF


' Catalina Import DFS_GetFAT

' Catalina Import div
' end
