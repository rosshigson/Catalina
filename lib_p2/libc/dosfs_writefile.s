' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_WriteFile

 alignl ' align long
C_D_F_S__W_riteF_ile ' <symbol:DFS_WriteFile>
 PRIMITIVE(#NEWF)
 sub SP, #48
 PRIMITIVE(#PSHM)
 long $ffea80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #9 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_5 ' NEI4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_5
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_8 ' JUMPV addrg
C_D_F_S__W_riteF_ile_7
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r16, r22
 adds r16, #20 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 sub r16, #2 ' SUBU4 coni
 mov r14, r18 ' CVI, CVU or LOAD
 mov r0, r16 ' setup r0/r1 (2)
 mov r1, r14 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r16, r0 ' CVI, CVU or LOAD
 mov r2, r18
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 PRIMITIVE(#LODL)
 long 512
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, r20
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r16 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r11, r22 ' ADDU
 add r11, r20 ' ADDU (3)
 PRIMITIVE(#LODL)
 long 512
 mov r2, RI ' reg ARG con
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_11 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 512
 mov r2, RI ' reg ARG con
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r9, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 cmp r15, r22 wcz 
 PRIMITIVE(#BR_B)
 long @C_D_F_S__W_riteF_ile_15' LTU4
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 PRIMITIVE(#LODL)
 long 512
 mov r20, RI ' reg <- con
 subs r20, r22 ' SUBI/P (1)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r22 ' ADDI/P
 adds r4, r23 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_17 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_17
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r20, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -4
 wrlong r20, RI ' ASGNU4 addrl reg
 adds r21, r22 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r18, r22 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_19 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_19
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 sub r15, r22 ' SUBU (1)
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_12 ' JUMPV addrg
C_D_F_S__W_riteF_ile_15
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r4, r22 ' ADDI/P
 adds r4, r23 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_21 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_21
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_23 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_23
 PRIMITIVE(#LODF)
 long -4
 wrlong r15, RI ' ASGNU4 addrl reg
 mov r15, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_12 ' JUMPV addrg
C_D_F_S__W_riteF_ile_11
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 cmp r15, r22 wcz 
 PRIMITIVE(#BR_B)
 long @C_D_F_S__W_riteF_ile_25' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 sub r15, r22 ' SUBU (1)
 PRIMITIVE(#LODL)
 long 512
 mov r20, RI ' reg <- con
 adds r21, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_27 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_27
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_26 ' JUMPV addrg
C_D_F_S__W_riteF_ile_25
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_29 ' GEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_30 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_30 ' JUMPV addrg
C_D_F_S__W_riteF_ile_29
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_30
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_33 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_33
 PRIMITIVE(#LODF)
 long -4
 wrlong r15, RI ' ASGNU4 addrl reg
 mov r15, #0 ' reg <- coni
C_D_F_S__W_riteF_ile_26
C_D_F_S__W_riteF_ile_12
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-44) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_35 ' EQI4
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r9, r20 ' reg <- INDIRU4 reg
 rdlong r2, r20 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-4) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_37 ' NEI4
 mov r0, #7 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_37
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 rdlong r18, r22 ' reg <- INDIRP4 reg
 adds r18, #1 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 cmps r18, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_42 ' NEI4
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $fff8
 mov r20, RI ' reg <- con
 cmp r22, r20 wcz 
 PRIMITIVE(#BRAE)
 long @C_D_F_S__W_riteF_ile_41 ' GEU4
C_D_F_S__W_riteF_ile_42
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_39 ' NEI4
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ffffff8
 mov r20, RI ' reg <- con
 cmp r22, r20 wcz 
 PRIMITIVE(#BR_B)
 long @C_D_F_S__W_riteF_ile_39' LTU4
C_D_F_S__W_riteF_ile_41
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#LODL)
 long $ffffff7
 mov r22, RI ' reg <- con
 cmp r7, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__W_riteF_ile_43 ' NEU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_43
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-4) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 wrlong r7, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_48 ' EQI4
 cmps r22,  #2 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_49 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_45 ' JUMPV addrg
C_D_F_S__W_riteF_ile_48
 PRIMITIVE(#LODL)
 long $fff8
 mov r7, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_46 ' JUMPV addrg
C_D_F_S__W_riteF_ile_49
 PRIMITIVE(#LODL)
 long $ffffff8
 mov r7, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_46 ' JUMPV addrg
C_D_F_S__W_riteF_ile_45
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_46
 mov r2, r7 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-4) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r13, #0 ' reg <- coni
C_D_F_S__W_riteF_ile_39
C_D_F_S__W_riteF_ile_35
C_D_F_S__W_riteF_ile_8
 mov r22, #0 ' reg <- coni
 cmp r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_50 ' EQU4
 cmp r13, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_7 ' EQU4
C_D_F_S__W_riteF_ile_50
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_51 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_51
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #5 ' LSHI4 coni
 adds r20, r23 ' ADDI/P (1)
 adds r20, #28 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #8 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #5 ' LSHI4 coni
 adds r18, r23 ' ADDI/P (1)
 adds r18, #29 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff00
 mov r16, RI ' reg <- con
 and r22, r16 ' BANDI/U (1)
 shr r22, r20 ' RSHU (1)
 wrbyte r22, r18 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #16 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #5 ' LSHI4 coni
 adds r18, r23 ' ADDI/P (1)
 adds r18, #30 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff0000
 mov r16, RI ' reg <- con
 and r22, r16 ' BANDI/U (1)
 shr r22, r20 ' RSHU (1)
 wrbyte r22, r18 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #5 ' LSHI4 coni
 adds r20, r23 ' ADDI/P (1)
 adds r20, #31 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff000000
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 shr r22, #24 ' RSHU4 coni
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__W_riteF_ile_53 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_53
 mov r0, r13 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_4
 PRIMITIVE(#POPM) ' restore registers
 add SP, #48 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetFAT

' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector

' Catalina Import div

' Catalina Import memcpy
' end
