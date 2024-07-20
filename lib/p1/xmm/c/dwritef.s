' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_WriteFile

 alignl ' align long
C_D_F_S__W_riteF_ile ' <symbol:DFS_WriteFile>
 jmp #NEWF
 sub SP, #48
 jmp #PSHM
 long $ffaa80 ' save registers
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
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #9 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_5 ' NEI4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_5
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_8 ' JUMPV addrg
C_D_F_S__W_riteF_ile_7
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r2, r18
 shl r2, #9 ' LSHI4 coni
 mov r16, r22
 adds r16, #24 ' ADDP4 coni
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRU4 reg
 mov r3, r16 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r20 ' ADDU
 add r22, r0 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r11, r22 ' ADDU
 add r11, r20 ' ADDU (3)
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_11 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 cmp r15, r22 wz,wc 
 jmp #BR_B
 long @C_D_F_S__W_riteF_ile_15' LTU4
 mov r22, r9 ' CVUI
 and r22, cviu_m2 ' zero extend
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 subs r20, r22 ' SUBI/P (1)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r22 ' ADDI/P
 adds r4, r23 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_17 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_17
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r20, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 adds r21, r22 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_19 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_19
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov r20, r9 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 sub r15, r22 ' SUBU (1)
 jmp #JMPA
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
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_21 ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_21
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_23 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_23
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_12 ' JUMPV addrg
C_D_F_S__W_riteF_ile_11
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmp r15, r22 wz,wc 
 jmp #BR_B
 long @C_D_F_S__W_riteF_ile_25' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 sub r15, r22 ' SUBU (1)
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 adds r21, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_27 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_27
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_26 ' JUMPV addrg
C_D_F_S__W_riteF_ile_25
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_29 ' GEU4
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_30 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_30 ' JUMPV addrg
C_D_F_S__W_riteF_ile_29
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_30
 adds r21, r15 ' ADDI/P (2)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, r15 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r20, r22 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_33 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_D_F_S__W_riteF_ile_33
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r15, #0 ' reg <- coni
C_D_F_S__W_riteF_ile_26
C_D_F_S__W_riteF_ile_12
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 add r22, r20 ' ADDU (1)
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r2, r20
 shl r2, #9 ' LSHI4 coni
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_div
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_35 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r9, BC ' reg <- INDIRU4 reg
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_37 ' NEI4
 mov r0, #7 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_37
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #1 ' reg <- coni
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #1 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 cmps r18, r20 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_42 ' NEI4
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $fff8
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_D_F_S__W_riteF_ile_41 ' GEU4
C_D_F_S__W_riteF_ile_42
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_39 ' NEI4
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff8
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_D_F_S__W_riteF_ile_39' LTU4
C_D_F_S__W_riteF_ile_41
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #LODL
 long $ffffff7
 mov r22, RI ' reg <- con
 cmp r7, r22 wz
 jmp #BRNZ
 long @C_D_F_S__W_riteF_ile_43 ' NEU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_43
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r7
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_48 ' EQI4
 cmps r22,  #2 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_49 ' EQI4
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_45 ' JUMPV addrg
C_D_F_S__W_riteF_ile_48
 jmp #LODL
 long $fff8
 mov r7, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_46 ' JUMPV addrg
C_D_F_S__W_riteF_ile_49
 jmp #LODL
 long $ffffff8
 mov r7, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_46 ' JUMPV addrg
C_D_F_S__W_riteF_ile_45
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_46
 mov r2, r7 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov r13, #0 ' reg <- coni
C_D_F_S__W_riteF_ile_39
C_D_F_S__W_riteF_ile_35
C_D_F_S__W_riteF_ile_8
 mov r22, #0 ' reg <- coni
 cmp r15, r22 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_50 ' EQU4
 cmp r13, r22 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_7 ' EQU4
C_D_F_S__W_riteF_ile_50
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_51 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_51
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_D_F_S__F_A_T_time ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #22 ' ADDP4 coni
 mov r20, r15
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #8 ' reg <- coni
 shr r15, r22 ' RSHU (1)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #23 ' ADDP4 coni
 mov r20, r15
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #8 ' reg <- coni
 shr r15, r22 ' RSHU (1)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #24 ' ADDP4 coni
 mov r20, r15
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #8 ' reg <- coni
 shr r15, r22 ' RSHU (1)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #5 ' LSHI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #25 ' ADDP4 coni
 mov r20, r15
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #5 ' LSHI4 coni
 adds r20, r23 ' ADDI/P (1)
 adds r20, #28 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #255 ' BANDU4 coni
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #8 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #5 ' LSHI4 coni
 adds r18, r23 ' ADDI/P (1)
 adds r18, #29 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff00
 mov r16, RI ' reg <- con
 and r22, r16 ' BANDI/U (1)
 shr r22, r20 ' RSHU (1)
 mov RI, r18
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #16 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #5 ' LSHI4 coni
 adds r18, r23 ' ADDI/P (1)
 adds r18, #30 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff0000
 mov r16, RI ' reg <- con
 and r22, r16 ' BANDI/U (1)
 shr r22, r20 ' RSHU (1)
 mov RI, r18
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #5 ' LSHI4 coni
 adds r20, r23 ' ADDI/P (1)
 adds r20, #31 ' ADDP4 coni
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff000000
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 shr r22, #24 ' RSHU4 coni
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__W_riteF_ile_53 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__W_riteF_ile_4 ' JUMPV addrg
C_D_F_S__W_riteF_ile_53
 mov r0, r13 ' CVI, CVU or LOAD
C_D_F_S__W_riteF_ile_4
 jmp #POPM ' restore registers
 add SP, #48 ' framesize
 jmp #RETF


' Catalina Import DFS_FATtime

' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetFAT

' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector

' Catalina Import div

' Catalina Import memcpy
' end
