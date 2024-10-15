' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_snso_670edb95_o_collect_L000003 ' <symbol:o_collect>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 mov r11, r23 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r22, #105 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_snso_670edb95_o_collect_L000003_13 ' GTI4
' C_snso_670edb95_o_collect_L000003_12 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_snso_670edb95_o_collect_L000003_5 ' LTI4
' C_snso_670edb95_o_collect_L000003_14 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_11 ' EQI4
 cmps r11,  #100 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_9 ' EQI4
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_5 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_13
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_10 ' EQI4
 cmps r11,  #112 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_snso_670edb95_o_collect_L000003_5 ' LTI4
' C_snso_670edb95_o_collect_L000003_15 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_9 ' EQI4
 cmps r11,  #120 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_8 ' EQI4
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_5 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_8
 mov r13, #16 ' reg <- coni
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_6 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_9
 mov r13, #10 ' reg <- coni
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_6 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_10
 mov r13, #8 ' reg <- coni
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_6 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_11
 mov r13, #2 ' reg <- coni
C_snso_670edb95_o_collect_L000003_5
C_snso_670edb95_o_collect_L000003_6
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_18 ' EQI4
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_16 ' NEI4
C_snso_670edb95_o_collect_L000003_18
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_19 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_snso_670edb95_o_collect_L000003_19
C_snso_670edb95_o_collect_L000003_16
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_21 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_21 ' NEI4
 cmps r13,  #16 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_21 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_23 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_snso_670edb95_o_collect_L000003_23
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_25 ' EQI4
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_25 ' EQI4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_36 ' NEI4
 mov r13, #8 ' reg <- coni
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_36 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_25
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_36 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_36 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_36 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_21
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_36 ' NEI4
 mov r13, #10 ' reg <- coni
 jmp #JMPA
 long @C_snso_670edb95_o_collect_L000003_36 ' JUMPV addrg
C_snso_670edb95_o_collect_L000003_35
 cmps r13,  #10 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_42 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_snso_670edb95_o_collect_L000003_45' LTU4
C_snso_670edb95_o_collect_L000003_42
 cmps r13,  #16 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_44 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #68 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_45 ' NEI4
C_snso_670edb95_o_collect_L000003_44
 cmps r13,  #8 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_47 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wz,wc 
 jmp #BRAE
 long @C_snso_670edb95_o_collect_L000003_47 ' GEU4
 cmps r22,  #56 wz,wc
 jmp #BR_B
 long @C_snso_670edb95_o_collect_L000003_45 ' LTI4
C_snso_670edb95_o_collect_L000003_47
 cmps r13,  #2 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_37 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wz,wc 
 jmp #BRAE
 long @C_snso_670edb95_o_collect_L000003_37 ' GEU4
 cmps r22,  #50 wz,wc
 jmp #BRAE
 long @C_snso_670edb95_o_collect_L000003_37 ' GEI4
C_snso_670edb95_o_collect_L000003_45
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_39 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_snso_670edb95_o_collect_L000003_39
C_snso_670edb95_o_collect_L000003_36
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_35 ' NEI4
C_snso_670edb95_o_collect_L000003_37
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_50 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_snso_670edb95_o_collect_L000003_50 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_snso_670edb95_o_collect_L000003_50
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_snso_670edb95_o_collect_L000003_52 ' NEI4
 mov r13, #0 ' reg <- coni
C_snso_670edb95_o_collect_L000003_52
 mov RI, r19
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, r15
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r0, r15 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_snso_670edb95_o_collect_L000003_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _doscan

 alignl ' align long
C__doscan ' <symbol:_doscan>
 jmp #NEWF
 jmp #LODL
 long 804
 sub SP, RI
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-264)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_58 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_57
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_60 ' EQI4
 jmp #JMPA
 long @C__doscan_64 ' JUMPV addrg
C__doscan_63
 adds r21, #1 ' ADDP4 coni
C__doscan_64
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_63 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doscan_68 ' JUMPV addrg
C__doscan_67
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_68
 jmp #LODL
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_67 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_71 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_71
 subs r11, #1 ' SUBI4 coni
C__doscan_60
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_73 ' NEI4
 jmp #JMPA
 long @C__doscan_59 ' JUMPV addrg
C__doscan_73
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C__doscan_75 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_58 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_79 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_79
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_59 ' JUMPV addrg
C__doscan_75
 adds r21, #1 ' ADDP4 coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BRNZ
 long @C__doscan_81 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 cmps r15,  #37 wz
 jmp #BRNZ
 long @C__doscan_59 ' NEI4
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_58 ' JUMPV addrg
C__doscan_81
 mov r9, #0 ' reg <- coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C__doscan_85 ' NEI4
 adds r21, #1 ' ADDP4 coni
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 or r9, r22 ' BORI/U (1)
C__doscan_85
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BRAE
 long @C__doscan_87 ' GEU4
 or r9, #256 ' BORI4 coni
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C__doscan_92 ' JUMPV addrg
C__doscan_89
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 add r22, r0 ' ADDU (2)
 mov r13, r22
 sub r13, #48 ' SUBU4 coni
' C__doscan_90 ' (symbol refcount = 0)
C__doscan_92
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C__doscan_89' LTU4
C__doscan_87
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -800
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -800
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C__doscan_96 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C__doscan_100 ' GTI4
' C__doscan_99 ' (symbol refcount = 0)
 jmp #LODF
 long -800
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C__doscan_98 ' EQI4
 jmp #JMPA
 long @C__doscan_93 ' JUMPV addrg
C__doscan_100
 jmp #LODF
 long -800
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #108 wz
 jmp #BR_Z
 long @C__doscan_97 ' EQI4
 jmp #JMPA
 long @C__doscan_93 ' JUMPV addrg
C__doscan_96
 or r9, #32 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_94 ' JUMPV addrg
C__doscan_97
 or r9, #64 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_94 ' JUMPV addrg
C__doscan_98
 or r9, #128 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
C__doscan_93
C__doscan_94
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r7, r22 ' CVUI
 and r7, cviu_m1 ' zero extend
 cmps r7,  #99 wz
 jmp #BR_Z
 long @C__doscan_101 ' EQI4
 cmps r7,  #91 wz
 jmp #BR_Z
 long @C__doscan_101 ' EQI4
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_101 ' EQI4
C__doscan_103
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
' C__doscan_104 ' (symbol refcount = 0)
 jmp #LODL
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_103 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C__doscan_102 ' NEI4
 jmp #JMPA
 long @C__doscan_59 ' JUMPV addrg
C__doscan_101
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_109 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C__doscan_111 ' NEI4
 jmp #JMPA
 long @C__doscan_59 ' JUMPV addrg
C__doscan_111
 adds r11, #1 ' ADDI4 coni
C__doscan_109
C__doscan_102
 cmps r7,  #98 wz,wc
 jmp #BR_B
 long @C__doscan_237 ' LTI4
 cmps r7,  #105 wz,wc
 jmp #BR_A
 long @C__doscan_238 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__doscan_239_L000241-392
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_239_L000241 ' <symbol:239>
 long @C__doscan_127
 long @C__doscan_146
 long @C__doscan_127
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_127

' Catalina Code

DAT ' code segment
C__doscan_237
 cmps r7,  #88 wz
 jmp #BR_Z
 long @C__doscan_127 ' EQI4
 cmps r7,  #91 wz
 jmp #BR_Z
 long @C__doscan_188 ' EQI4
 jmp #JMPA
 long @C__doscan_113 ' JUMPV addrg
C__doscan_238
 cmps r7,  #110 wz,wc
 jmp #BR_B
 long @C__doscan_113 ' LTI4
 cmps r7,  #120 wz,wc
 jmp #BR_A
 long @C__doscan_113 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__doscan_243_L000245-440
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_243_L000245 ' <symbol:243>
 long @C__doscan_119
 long @C__doscan_127
 long @C__doscan_126
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_165
 long @C__doscan_113
 long @C__doscan_127
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_127

' Catalina Code

DAT ' code segment
C__doscan_113
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_118 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_116 ' EQI4
C__doscan_118
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODF
 long -804
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doscan_117 ' JUMPV addrg
C__doscan_116
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -804
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_117
 jmp #LODF
 long -804
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_119
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_114 ' NEI4
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_122 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_122
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_124 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r11
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_124
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r11
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_126
C__doscan_127
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_130 ' EQI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmp r13, r22 wz,wc 
 jmp #BRBE
 long @C__doscan_128 ' LEU4
C__doscan_130
 jmp #LODL
 long 512
 mov r13, RI ' reg <- con
C__doscan_128
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_131 ' NEU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_131
 jmp #LODF
 long -784
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -788
 mov r3, RI ' reg ARG ADDRL
 mov r4, r13 ' CVI, CVU or LOAD
 mov r22, r7 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_snso_670edb95_o_collect_L000003
 add SP, #20 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -784
 mov r20, RI ' reg <- addrl
 cmp r17, r20 wz,wc 
 jmp #BR_B
 long @C__doscan_136' LTU4
 cmp r17, r20 wz
 jmp #BRNZ
 long @C__doscan_133 ' NEU4
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doscan_136 ' EQI4
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C__doscan_133 ' NEI4
C__doscan_136
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_133
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODF
 long -784
 mov r20, RI ' reg <- addrl
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_114 ' NEI4
 cmps r7,  #100 wz
 jmp #BR_Z
 long @C__doscan_141 ' EQI4
 cmps r7,  #105 wz
 jmp #BRNZ
 long @C__doscan_139 ' NEI4
C__doscan_141
 jmp #LODF
 long -788
 rdlong r2, RI ' reg ARG INDIR ADDRL
 jmp #LODF
 long -796
 mov r3, RI ' reg ARG ADDRL
 jmp #LODF
 long -784
 mov r4, RI ' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtol
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -792
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C__doscan_140 ' JUMPV addrg
C__doscan_139
 jmp #LODF
 long -788
 rdlong r2, RI ' reg ARG INDIR ADDRL
 jmp #LODF
 long -796
 mov r3, RI ' reg ARG ADDRL
 jmp #LODF
 long -784
 mov r4, RI ' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtoul
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -792
 wrlong r0, RI ' ASGNU4 addrl reg
C__doscan_140
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_142 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODF
 long -792
 rdlong r20, RI ' reg <- INDIRU4 addrl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_142
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_144 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODF
 long -792
 rdlong r20, RI ' reg <- INDIRU4 addrl
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_144
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODF
 long -792
 rdlong r20, RI ' reg <- INDIRU4 addrl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_146
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_147 ' NEI4
 mov r13, #1 ' reg <- coni
C__doscan_147
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_149 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C__doscan_149
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_154 ' NEU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_153
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_156 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_156
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_158 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_158
C__doscan_154
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_160 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C__doscan_153 ' NEI4
C__doscan_160
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_114 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_163 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_163
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_165
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_166 ' NEI4
 jmp #LODL
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_166
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_168 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C__doscan_168
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_173 ' NEU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_172
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_176 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_176
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_178 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_178
C__doscan_173
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_181 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_181 ' EQI4
 jmp #LODL
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_172 ' EQI4
C__doscan_181
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_182 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_182
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_114 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_186 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_186
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_114 ' JUMPV addrg
C__doscan_188
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_189 ' NEI4
 jmp #LODL
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_189
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_191 ' NEU4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_191
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #94 wz
 jmp #BRNZ
 long @C__doscan_193 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_194 ' JUMPV addrg
C__doscan_193
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_194
 mov r17, FP
 sub r17, #-(-260) ' reg <- addrli
 jmp #JMPA
 long @C__doscan_198 ' JUMPV addrg
C__doscan_195
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
' C__doscan_196 ' (symbol refcount = 0)
 adds r17, #1 ' ADDP4 coni
C__doscan_198
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C__doscan_195' LTU4
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #93 wz
 jmp #BRNZ
 long @C__doscan_203 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C__doscan_203 ' JUMPV addrg
C__doscan_202
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C__doscan_205 ' NEI4
 adds r21, #1 ' ADDP4 coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_207 ' EQI4
 cmps r22,  #93 wz
 jmp #BR_Z
 long @C__doscan_207 ' EQI4
 jmp #LODL
 long -2
 mov r20, RI ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C__doscan_207 ' LTI4
 jmp #LODL
 long -2
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -808
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doscan_212 ' JUMPV addrg
C__doscan_209
 jmp #LODF
 long -808
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C__doscan_210 ' (symbol refcount = 0)
 jmp #LODF
 long -808
 rdlong r22, RI ' reg <- INDIRI4 addrl
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -808
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_212
 jmp #LODF
 long -808
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov RI, r21
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C__doscan_209 ' LEI4
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_208 ' JUMPV addrg
C__doscan_207
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-215)
 wrbyte r22, RI ' ASGNU1 addrli reg
C__doscan_208
C__doscan_205
C__doscan_203
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_214 ' EQI4
 cmps r22,  #93 wz
 jmp #BRNZ
 long @C__doscan_202 ' NEI4
C__doscan_214
 mov r22, #0 ' reg <- coni
 mov RI, r21
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C__doscan_217 ' EQI4
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r20, r15 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-268) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 xor r20, r18 ' BXORI/U (1)
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doscan_215 ' NEI4
C__doscan_217
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_218 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_218
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_54 ' JUMPV addrg
C__doscan_215
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_220 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C__doscan_220
C__doscan_222
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_225 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_225
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_227 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_227
' C__doscan_223 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_230 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_230 ' EQI4
 mov r22, FP
 sub r22, #-(-260) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-268) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 xor r22, r20 ' BXORI/U (1)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_222 ' NEI4
C__doscan_230
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_231 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_233 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_233
 subs r11, #1 ' SUBI4 coni
C__doscan_231
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_114 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_114
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-264)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_247 ' NEI4
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_247 ' EQI4
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_247
 adds r21, #1 ' ADDP4 coni
C__doscan_58
 jmp #JMPA
 long @C__doscan_57 ' JUMPV addrg
C__doscan_59
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_252 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_250 ' EQI4
C__doscan_252
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODF
 long -800
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doscan_251 ' JUMPV addrg
C__doscan_250
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -800
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_251
 jmp #LODF
 long -800
 rdlong r0, RI ' reg <- INDIRI4 addrl
C__doscan_54
 jmp #POPM ' restore registers
 jmp #LODL
 long 804
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import __ctype

' Catalina Import strtoul

' Catalina Import strtol

' Catalina Import ungetc

' Catalina Import getc
' end
