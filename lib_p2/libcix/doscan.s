' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s2fg2_6188be8e_o_collect_L000005 ' <symbol:o_collect>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#PSHM)
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long @C_s2fg1_6188be8e_inp_buf_L000004
 mov r15, RI ' reg <- addrg
 mov r11, r21 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r22, #105 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_A)
 long @C_s2fg2_6188be8e_o_collect_L000005_15 ' GTI4
' C_s2fg2_6188be8e_o_collect_L000005_14 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_B)
 long @C_s2fg2_6188be8e_o_collect_L000005_7 ' LTI4
' C_s2fg2_6188be8e_o_collect_L000005_16 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_13 ' EQI4
 cmps r11,  #100 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_11 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_7 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_15
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_12 ' EQI4
 cmps r11,  #112 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_B)
 long @C_s2fg2_6188be8e_o_collect_L000005_7 ' LTI4
' C_s2fg2_6188be8e_o_collect_L000005_17 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_11 ' EQI4
 cmps r11,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_10 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_7 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_10
 mov r13, #16 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_8 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_11
 mov r13, #10 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_8 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_12
 mov r13, #8 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_8 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_13
 mov r13, #2 ' reg <- coni
C_s2fg2_6188be8e_o_collect_L000005_7
C_s2fg2_6188be8e_o_collect_L000005_8
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #45 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_20 ' EQI4
 cmps r22,  #43 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_18 ' NEI4
C_s2fg2_6188be8e_o_collect_L000005_20
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_21 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 PRIMITIVE(#LODF)
 long 8
 wrlong r0, RI ' ASGNI4 addrl reg
C_s2fg2_6188be8e_o_collect_L000005_21
C_s2fg2_6188be8e_o_collect_L000005_18
 cmps r19,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_23 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #48 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_23 ' NEI4
 cmps r13,  #16 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_23 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_25 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 PRIMITIVE(#LODF)
 long 8
 wrlong r0, RI ' ASGNI4 addrl reg
C_s2fg2_6188be8e_o_collect_L000005_25
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_27 ' EQI4
 cmps r22,  #88 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_27 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' NEI4
 mov r13, #8 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_27
 cmps r19,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 PRIMITIVE(#LODF)
 long 8
 wrlong r0, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_23
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' NEI4
 mov r13, #10 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_s2fg2_6188be8e_o_collect_L000005_38 ' JUMPV addrg
C_s2fg2_6188be8e_o_collect_L000005_37
 cmps r13,  #10 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_44 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 PRIMITIVE(#BR_B)
 long @C_s2fg2_6188be8e_o_collect_L000005_47' LTU4
C_s2fg2_6188be8e_o_collect_L000005_44
 cmps r13,  #16 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_46 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #68 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_47 ' NEI4
C_s2fg2_6188be8e_o_collect_L000005_46
 cmps r13,  #8 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_49 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wcz 
 PRIMITIVE(#BRAE)
 long @C_s2fg2_6188be8e_o_collect_L000005_49 ' GEU4
 cmps r22,  #56 wcz
 PRIMITIVE(#BR_B)
 long @C_s2fg2_6188be8e_o_collect_L000005_47 ' LTI4
C_s2fg2_6188be8e_o_collect_L000005_49
 cmps r13,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_39 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wcz 
 PRIMITIVE(#BRAE)
 long @C_s2fg2_6188be8e_o_collect_L000005_39 ' GEU4
 cmps r22,  #50 wcz
 PRIMITIVE(#BRAE)
 long @C_s2fg2_6188be8e_o_collect_L000005_39 ' GEI4
C_s2fg2_6188be8e_o_collect_L000005_47
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_41 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 PRIMITIVE(#LODF)
 long 8
 wrlong r0, RI ' ASGNI4 addrl reg
C_s2fg2_6188be8e_o_collect_L000005_41
C_s2fg2_6188be8e_o_collect_L000005_38
 cmps r19,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_37 ' NEI4
C_s2fg2_6188be8e_o_collect_L000005_39
 cmps r19,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_52 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C_s2fg2_6188be8e_o_collect_L000005_52 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_s2fg2_6188be8e_o_collect_L000005_52
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 PRIMITIVE(#BRNZ)
 long @C_s2fg2_6188be8e_o_collect_L000005_54 ' NEI4
 mov r13, #0 ' reg <- coni
C_s2fg2_6188be8e_o_collect_L000005_54
 wrlong r13, r17 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 mov r0, r15 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_s2fg2_6188be8e_o_collect_L000005_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETF)


' Catalina Export _doscan

 alignl ' align long
C__doscan ' <symbol:_doscan>
 PRIMITIVE(#NEWF)
 sub SP, #36
 PRIMITIVE(#PSHM)
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_60 ' NEI4
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_59
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_62 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doscan_66 ' JUMPV addrg
C__doscan_65
 adds r21, #1 ' ADDP4 coni
C__doscan_66
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_65 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_70 ' JUMPV addrg
C__doscan_69
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_70
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_69 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_73 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_73
 subs r11, #1 ' SUBI4 coni
C__doscan_62
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_75 ' NEI4
 PRIMITIVE(#JMPA)
 long @C__doscan_61 ' JUMPV addrg
C__doscan_75
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_77 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_60 ' EQI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_81 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_81
 subs r11, #1 ' SUBI4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_61 ' JUMPV addrg
C__doscan_77
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_83 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 cmps r15,  #37 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_61 ' NEI4
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_60 ' JUMPV addrg
C__doscan_83
 mov r9, #0 ' reg <- coni
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_87 ' NEI4
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 or r9, r22 ' BORI/U (1)
C__doscan_87
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 PRIMITIVE(#BRAE)
 long @C__doscan_89 ' GEU4
 or r9, #256 ' BORI4 coni
 mov r13, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__doscan_94 ' JUMPV addrg
C__doscan_91
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r22, r0 ' ADDU
 add r22, r20 ' ADDU (3)
 mov r13, r22
 sub r13, #48 ' SUBU4 coni
' C__doscan_92 ' (symbol refcount = 0)
C__doscan_94
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 PRIMITIVE(#BR_B)
 long @C__doscan_91' LTU4
C__doscan_89
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_98 ' EQI4
 cmps r22, r20 wcz
 PRIMITIVE(#BR_A)
 long @C__doscan_102 ' GTI4
' C__doscan_101 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #76 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_100 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doscan_95 ' JUMPV addrg
C__doscan_102
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #108 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_99 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doscan_95 ' JUMPV addrg
C__doscan_98
 or r9, #32 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_96 ' JUMPV addrg
C__doscan_99
 or r9, #64 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_96 ' JUMPV addrg
C__doscan_100
 or r9, #128 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
C__doscan_95
C__doscan_96
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 mov r7, r22 ' CVUI
 and r7, cviu_m1 ' zero extend
 cmps r7,  #99 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_103 ' EQI4
 cmps r7,  #91 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_103 ' EQI4
 cmps r7,  #110 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_103 ' EQI4
C__doscan_105
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
' C__doscan_106 ' (symbol refcount = 0)
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_105 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_104 ' NEI4
 PRIMITIVE(#JMPA)
 long @C__doscan_61 ' JUMPV addrg
C__doscan_103
 cmps r7,  #110 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_111 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_113 ' NEI4
 PRIMITIVE(#JMPA)
 long @C__doscan_61 ' JUMPV addrg
C__doscan_113
 adds r11, #1 ' ADDI4 coni
C__doscan_111
C__doscan_104
 cmps r7,  #98 wcz
 PRIMITIVE(#BR_B)
 long @C__doscan_239 ' LTI4
 cmps r7,  #105 wcz
 PRIMITIVE(#BR_A)
 long @C__doscan_240 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__doscan_241_L000243-392
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_241_L000243 ' <symbol:241>
 long @C__doscan_129
 long @C__doscan_148
 long @C__doscan_129
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_129

' Catalina Code

DAT ' code segment
C__doscan_239
 cmps r7,  #88 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_129 ' EQI4
 cmps r7,  #91 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_190 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doscan_115 ' JUMPV addrg
C__doscan_240
 cmps r7,  #110 wcz
 PRIMITIVE(#BR_B)
 long @C__doscan_115 ' LTI4
 cmps r7,  #120 wcz
 PRIMITIVE(#BR_A)
 long @C__doscan_115 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__doscan_245_L000247-440
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_245_L000247 ' <symbol:245>
 long @C__doscan_121
 long @C__doscan_129
 long @C__doscan_128
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_167
 long @C__doscan_115
 long @C__doscan_129
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_129

' Catalina Code

DAT ' code segment
C__doscan_115
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_120 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_118 ' EQI4
C__doscan_120
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODF)
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doscan_119 ' JUMPV addrg
C__doscan_118
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_119
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_121
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_116 ' NEI4
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_124 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r11 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNI2 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_124
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_126 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r11, r22 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_126
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r11, r22 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_128
C__doscan_129
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_132 ' EQI4
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 cmp r13, r22 wcz 
 PRIMITIVE(#BRBE)
 long @C__doscan_130 ' LEU4
C__doscan_132
 PRIMITIVE(#LODL)
 long 512
 mov r13, RI ' reg <- con
C__doscan_130
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_133 ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_133
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r22, r7 ' CVI, CVU or LOAD
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_s2fg2_6188be8e_o_collect_L000005
 add SP, #16 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_s2fg1_6188be8e_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 cmp r17, r20 wcz 
 PRIMITIVE(#BR_B)
 long @C__doscan_138' LTU4
 cmp r17, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_135 ' NEU4
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_138 ' EQI4
 cmps r22,  #43 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_135 ' NEI4
C__doscan_138
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_135
 mov r22, r17 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_s2fg1_6188be8e_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_116 ' NEI4
 cmps r7,  #100 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_143 ' EQI4
 cmps r7,  #105 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_141 ' NEI4
C__doscan_143
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 PRIMITIVE(#LODL)
 long @C_s2fg1_6188be8e_inp_buf_L000004
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strtol
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doscan_142 ' JUMPV addrg
C__doscan_141
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 PRIMITIVE(#LODL)
 long @C_s2fg1_6188be8e_inp_buf_L000004
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strtoul
 add SP, #8 ' CALL addrg
 PRIMITIVE(#LODF)
 long -20
 wrlong r0, RI ' ASGNU4 addrl reg
C__doscan_142
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_144 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_144
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_146 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrword r20, r22 ' ASGNU2 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_146
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_148
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_149 ' NEI4
 mov r13, #1 ' reg <- coni
C__doscan_149
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_151 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_151
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_156 ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_155
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_158 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_158
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_160 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_160
C__doscan_156
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_162 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_155 ' NEI4
C__doscan_162
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_116 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_165 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_165
 subs r11, #1 ' SUBI4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_167
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_168 ' NEI4
 PRIMITIVE(#LODL)
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_168
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_170 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_170
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_175 ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_174
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_178 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_178
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_180 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_180
C__doscan_175
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_183 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_183 ' EQI4
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_174 ' EQI4
C__doscan_183
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_184 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
C__doscan_184
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_116 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_188 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_188
 subs r11, #1 ' SUBI4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_116 ' JUMPV addrg
C__doscan_190
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_191 ' NEI4
 PRIMITIVE(#LODL)
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_191
 cmp r13,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_193 ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_193
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #94 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_195 ' NEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_196 ' JUMPV addrg
C__doscan_195
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_196
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r17, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__doscan_200 ' JUMPV addrg
C__doscan_197
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
' C__doscan_198 ' (symbol refcount = 0)
 adds r17, #1 ' ADDP4 coni
C__doscan_200
 mov r22, r17 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003+256
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wcz 
 PRIMITIVE(#BR_B)
 long @C__doscan_197' LTU4
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #93 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_205 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 PRIMITIVE(#JMPA)
 long @C__doscan_205 ' JUMPV addrg
C__doscan_204
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_207 ' NEI4
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_209 ' EQI4
 cmps r22,  #93 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_209 ' EQI4
 PRIMITIVE(#LODL)
 long -2
 mov r20, RI ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wcz
 PRIMITIVE(#BR_B)
 long @C__doscan_209 ' LTI4
 PRIMITIVE(#LODL)
 long -2
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doscan_214 ' JUMPV addrg
C__doscan_211
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C__doscan_212 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_214
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdbyte r20, r21 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wcz
 PRIMITIVE(#BRBE)
 long @C__doscan_211 ' LEI4
 adds r21, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doscan_210 ' JUMPV addrg
C__doscan_209
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003+45
 wrbyte r22, RI ' ASGNU1 addrg reg
C__doscan_210
C__doscan_207
C__doscan_205
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_216 ' EQI4
 cmps r22,  #93 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_204 ' NEI4
C__doscan_216
 mov r22, #0 ' reg <- coni
 rdbyte r20, r21 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_219 ' EQI4
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r20, r15 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 xor r20, r18 ' BXORI/U (1)
 cmps r20, r22 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_217 ' NEI4
C__doscan_219
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_220 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_220
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#JMPA)
 long @C__doscan_56 ' JUMPV addrg
C__doscan_217
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_222 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_222
C__doscan_224
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_227 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_227
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_229 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_229
' C__doscan_225 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_232 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_232 ' EQI4
 PRIMITIVE(#LODL)
 long @C_s2fg_6188be8e_X_table_L000003
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 xor r22, r20 ' BXORI/U (1)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_224 ' NEI4
C__doscan_232
 cmp r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_233 ' EQU4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_235 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_235
 subs r11, #1 ' SUBI4 coni
C__doscan_233
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_116 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
C__doscan_116
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODL)
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_249 ' NEI4
 cmps r7,  #110 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_249 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_249
 adds r21, #1 ' ADDP4 coni
C__doscan_60
 PRIMITIVE(#JMPA)
 long @C__doscan_59 ' JUMPV addrg
C__doscan_61
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doscan_254 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doscan_252 ' EQI4
C__doscan_254
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODF)
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doscan_253 ' JUMPV addrg
C__doscan_252
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_253
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C__doscan_56
 PRIMITIVE(#POPM) ' restore registers
 add SP, #36 ' framesize
 PRIMITIVE(#RETF)


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s2fg1_6188be8e_inp_buf_L000004 ' <symbol:inp_buf>
 byte 0[512]

 alignl ' align long
C_s2fg_6188be8e_X_table_L000003 ' <symbol:Xtable>
 byte 0[256]

' Catalina Code

DAT ' code segment

' Catalina Import __ctype

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtoul

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtol

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import ungetc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import getc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
