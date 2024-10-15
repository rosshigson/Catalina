' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_ReadFile

 alignl ' align long
C_D_F_S__R_eadF_ile ' <symbol:DFS_ReadFile>
 calld PA,#NEWF
 sub SP, #44
 calld PA,#PSHM
 long $ffaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 cmp r17, r22 wcz 
 if_be jmp #\C_D_F_S__R_eadF_ile_5 ' LEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r20 ' SUBU
 sub r17, r22 ' SUBU (3)
C_D_F_S__R_eadF_ile_5
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #\@C_D_F_S__R_eadF_ile_8 ' JUMPV addrg
C_D_F_S__R_eadF_ile_7
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r18
 shl r2, #9 ' LSHI4 coni
 mov r16, r22
 adds r16, #24 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 mov r3, r16 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r20 ' ADDU
 add r22, r0 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r11, r22 ' ADDU
 add r11, r20 ' ADDU (3)
 mov r2, ##512 ' reg ARG con
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_D_F_S__R_eadF_ile_11 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, ##512 ' reg <- con
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 mov r9, r22 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmp r15, r22 wcz 
 if_b jmp #\C_D_F_S__R_eadF_ile_15 ' LTU4
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, ##512 ' reg <- con
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 mov r3, r22 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 adds r21, r22 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r18, r22 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 sub r15, r22 ' SUBU (1)
 jmp #\@C_D_F_S__R_eadF_ile_12 ' JUMPV addrg
C_D_F_S__R_eadF_ile_15
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, ##512 ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r3, r22 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r15, #0 ' reg <- coni
 jmp #\@C_D_F_S__R_eadF_ile_12 ' JUMPV addrg
C_D_F_S__R_eadF_ile_11
 mov r22, ##512 ' reg <- con
 cmp r15, r22 wcz 
 if_b jmp #\C_D_F_S__R_eadF_ile_17 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, ##512 ' reg <- con
 sub r15, r22 ' SUBU (1)
 mov r20, ##512 ' reg <- con
 adds r21, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, ##512 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_D_F_S__R_eadF_ile_18 ' JUMPV addrg
C_D_F_S__R_eadF_ile_17
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r15, #0 ' reg <- coni
C_D_F_S__R_eadF_ile_18
C_D_F_S__R_eadF_ile_12
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_D_F_S__R_eadF_ile_19 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_D_F_S__R_eadF_ile_21 ' NEI4
 mov r0, #7 ' reg <- coni
 jmp #\@C_D_F_S__R_eadF_ile_4 ' JUMPV addrg
C_D_F_S__R_eadF_ile_21
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 rdlong r18, r22 ' reg <- INDIRP4 reg
 adds r18, #1 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 cmps r18, r20 wz
 if_nz jmp #\C_D_F_S__R_eadF_ile_26 ' NEI4
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fff8 ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_D_F_S__R_eadF_ile_25 ' GEU4
C_D_F_S__R_eadF_ile_26
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20,  #2 wz
 if_nz jmp #\C_D_F_S__R_eadF_ile_23 ' NEI4
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff8 ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_D_F_S__R_eadF_ile_23 ' LTU4
C_D_F_S__R_eadF_ile_25
 mov r13, #1 ' reg <- coni
 jmp #\@C_D_F_S__R_eadF_ile_24 ' JUMPV addrg
C_D_F_S__R_eadF_ile_23
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
C_D_F_S__R_eadF_ile_24
C_D_F_S__R_eadF_ile_19
C_D_F_S__R_eadF_ile_8
 mov r22, #0 ' reg <- coni
 cmp r15, r22 wz
 if_z jmp #\C_D_F_S__R_eadF_ile_27 ' EQU4
 cmp r13, r22 wz
 if_z jmp #\C_D_F_S__R_eadF_ile_7 ' EQU4
C_D_F_S__R_eadF_ile_27
 mov r0, r13 ' CVI, CVU or LOAD
C_D_F_S__R_eadF_ile_4
 calld PA,#POPM ' restore registers
 add SP, #44 ' framesize
 calld PA,#RETF


' Catalina Import DFS_GetFAT

' Catalina Import DFS_ReadSector

' Catalina Import div

' Catalina Import memcpy
' end
