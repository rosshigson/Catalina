' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sdas_6188be8e_gnum_L000001 ' <symbol:gnum>
 PRIMITIVE(#PSHM)
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas_6188be8e_gnum_L000001_3 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 wrlong r22, r19 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r21 ' ASGNI4 reg reg
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_sdas_6188be8e_gnum_L000001_4 ' JUMPV addrg
C_sdas_6188be8e_gnum_L000001_3
 mov r17, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_sdas_6188be8e_gnum_L000001_6 ' JUMPV addrg
C_sdas_6188be8e_gnum_L000001_5
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r17, r0 ' ADDI/P
 adds r17, r15 ' ADDI/P (3)
 adds r23, #1 ' ADDP4 coni
C_sdas_6188be8e_gnum_L000001_6
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_sdas_6188be8e_gnum_L000001_8 ' LTI4
 cmps r15,  #9 wcz
 PRIMITIVE(#BRBE)
 long @C_sdas_6188be8e_gnum_L000001_5 ' LEI4
C_sdas_6188be8e_gnum_L000001_8
 wrlong r17, r21 ' ASGNI4 reg reg
C_sdas_6188be8e_gnum_L000001_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_sdas_6188be8e_gnum_L000001_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_sdas1_6188be8e_o_print_L000009 ' <symbol:o_print>
 PRIMITIVE(#NEWF)
 sub SP, #12
 PRIMITIVE(#PSHM)
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r13, r22
 and r13, #96 ' BANDI4 coni
 mov r22, #32 ' reg <- coni
 cmps r13, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_14 ' EQI4
 cmps r13, r22 wcz
 PRIMITIVE(#BR_B)
 long @C_sdas1_6188be8e_o_print_L000009_11 ' LTI4
' C_sdas1_6188be8e_o_print_L000009_22 ' (symbol refcount = 0)
 cmps r13,  #64 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_17 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_11 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_14
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_15 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_12 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, cviu_m2 ' zero extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_12 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_17
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_18 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_12 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_18
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_12 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_11
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_20 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_12 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_20
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 PRIMITIVE(#LODL)
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
C_sdas1_6188be8e_o_print_L000009_12
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_23 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_sdas1_6188be8e_o_print_L000009_25 ' GEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_26 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_25
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_27 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_28 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_27
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_29 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sdas1_6188be8e_o_print_L000009_29
C_sdas1_6188be8e_o_print_L000009_28
C_sdas1_6188be8e_o_print_L000009_26
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
C_sdas1_6188be8e_o_print_L000009_23
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_31 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #111 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_31 ' NEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sdas1_6188be8e_o_print_L000009_31
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_33 ' NEU4
 cmps r19,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_34 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_10 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_33
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_40 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_39 ' EQI4
 cmps r22,  #88 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_39 ' EQI4
C_sdas1_6188be8e_o_print_L000009_40
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #112 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_37 ' NEI4
C_sdas1_6188be8e_o_print_L000009_39
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20,  #88 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_42 ' NEI4
 mov r11, #88 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_43 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_42
 mov r11, #120 ' reg <- coni
C_sdas1_6188be8e_o_print_L000009_43
 mov r20, r11 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sdas1_6188be8e_o_print_L000009_37
C_sdas1_6188be8e_o_print_L000009_34
 mov r11, r21 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r22, #105 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_49 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_A)
 long @C_sdas1_6188be8e_o_print_L000009_52 ' GTI4
' C_sdas1_6188be8e_o_print_L000009_51 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_50 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_B)
 long @C_sdas1_6188be8e_o_print_L000009_44 ' LTI4
' C_sdas1_6188be8e_o_print_L000009_53 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_47 ' EQI4
 cmps r11,  #100 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_49 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_44 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_52
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_48 ' EQI4
 cmps r11,  #112 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_50 ' EQI4
 cmps r11, r22 wcz
 PRIMITIVE(#BR_B)
 long @C_sdas1_6188be8e_o_print_L000009_44 ' LTI4
' C_sdas1_6188be8e_o_print_L000009_54 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_49 ' EQI4
 cmps r11,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_sdas1_6188be8e_o_print_L000009_50 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_44 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_47
 mov r22, #2 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_45 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_48
 mov r22, #8 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_45 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_49
 mov r22, #10 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_45 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_50
 mov r22, #16 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_sdas1_6188be8e_o_print_L000009_44
C_sdas1_6188be8e_o_print_L000009_45
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-4)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__i_compute
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_55 ' NEI4
 PRIMITIVE(#JMPA)
 long @C_sdas1_6188be8e_o_print_L000009_58 ' JUMPV addrg
C_sdas1_6188be8e_o_print_L000009_57
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_toupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r15 ' ASGNU1 reg reg
 adds r15, #1 ' ADDP4 coni
C_sdas1_6188be8e_o_print_L000009_58
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_sdas1_6188be8e_o_print_L000009_57 ' NEU4
C_sdas1_6188be8e_o_print_L000009_55
 mov r0, r23 ' CVI, CVU or LOAD
C_sdas1_6188be8e_o_print_L000009_10
 PRIMITIVE(#POPM) ' restore registers
 add SP, #12 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export _doprnt

 alignl ' align long
C__doprnt ' <symbol:_doprnt>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#LODL)
 long 1060
 sub SP, RI
 PRIMITIVE(#PSHM)
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r3, RI ' spill reg
 mov r21, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_61
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #37 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_64 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_66 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_69 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1052
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_70 ' JUMPV addrg
C__doprnt_69
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1052
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_70
 PRIMITIVE(#LODF)
 long -1052
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_66
 adds r13, #1 ' ADDI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_64
 mov r15, #0 ' reg <- coni
C__doprnt_71
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -1052
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -1052
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, #32 ' reg <- coni
 cmps r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_79 ' EQI4
 cmps r22,  #35 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_80 ' EQI4
 cmps r22, r20 wcz
 PRIMITIVE(#BR_B)
 long @C__doprnt_74 ' LTI4
' C__doprnt_82 ' (symbol refcount = 0)
 PRIMITIVE(#LODF)
 long -1052
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #43 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_78 ' EQI4
 cmps r22,  #45 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_77 ' EQI4
 cmps r22,  #48 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_81 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_74 ' JUMPV addrg
C__doprnt_77
 or r15, #1 ' BORI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_78
 or r15, #2 ' BORI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_79
 or r15, #4 ' BORI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_80
 or r15, #8 ' BORI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_81
 or r15, #16 ' BORI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_74
 PRIMITIVE(#LODL)
 long 4096
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
 PRIMITIVE(#JMPA)
 long @C__doprnt_72 ' JUMPV addrg
C__doprnt_75
 adds r23, #1 ' ADDP4 coni
C__doprnt_72
 PRIMITIVE(#LODL)
 long 4096
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_71 ' EQI4
 PRIMITIVE(#LODF)
 long -16
 wrlong r23, RI ' ASGNP4 addrl reg
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sdas_6188be8e_gnum_L000001
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_83 ' EQU4
 or r15, #256 ' BORI4 coni
C__doprnt_83
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_85 ' NEI4
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long -16
 wrlong r23, RI ' ASGNP4 addrl reg
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sdas_6188be8e_gnum_L000001
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C__doprnt_87 ' LTI4
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
C__doprnt_87
C__doprnt_85
 mov r22, #0 ' reg <- coni
 mov r20, r15
 and r20, #256 ' BANDI4 coni
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_89 ' EQI4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wcz
 PRIMITIVE(#BRAE)
 long @C__doprnt_89 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 or r15, #1 ' BORI4 coni
C__doprnt_89
 mov r22, r15
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_91 ' NEI4
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_91
 mov r22, r15
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_93 ' EQI4
 PRIMITIVE(#LODL)
 long -5
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_93
 mov r22, r15
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_95 ' EQI4
 PRIMITIVE(#LODL)
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_95
 PRIMITIVE(#LODF)
 long -1048
 mov r11, RI ' reg <- addrl
 PRIMITIVE(#LODF)
 long -1048
 mov r19, RI ' reg <- addrl
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -1052
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -1052
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_100 ' EQI4
 cmps r22, r20 wcz
 PRIMITIVE(#BR_A)
 long @C__doprnt_104 ' GTI4
' C__doprnt_103 ' (symbol refcount = 0)
 PRIMITIVE(#LODF)
 long -1052
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #76 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_102 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_97 ' JUMPV addrg
C__doprnt_104
 PRIMITIVE(#LODF)
 long -1052
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #108 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_101 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_97 ' JUMPV addrg
C__doprnt_100
 or r15, #32 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_98 ' JUMPV addrg
C__doprnt_101
 or r15, #64 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_98 ' JUMPV addrg
C__doprnt_102
 or r15, #128 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
C__doprnt_97
C__doprnt_98
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -1056
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #98 wcz
 PRIMITIVE(#BR_B)
 long @C__doprnt_139 ' LTI4
 cmps r22,  #117 wcz
 PRIMITIVE(#BR_A)
 long @C__doprnt_140 ' GTI4
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__doprnt_141_L000143-392
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doprnt_141_L000143 ' <symbol:141>
 long @C__doprnt_129
 long @C__doprnt_137
 long @C__doprnt_134
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_134
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_113
 long @C__doprnt_129
 long @C__doprnt_128
 long @C__doprnt_105
 long @C__doprnt_138
 long @C__doprnt_118
 long @C__doprnt_105
 long @C__doprnt_129

' Catalina Code

DAT ' code segment
C__doprnt_139
 PRIMITIVE(#LODF)
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #88 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_129 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_105 ' JUMPV addrg
C__doprnt_140
 PRIMITIVE(#LODF)
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_129 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_105 ' JUMPV addrg
C__doprnt_105
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_108 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_111 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_112 ' JUMPV addrg
C__doprnt_111
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_112
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_108
 adds r13, #1 ' ADDI4 coni
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_113
 mov r22, r15
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_114 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNI2 reg reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_114
 mov r22, r15
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_116 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r13, r22 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_116
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r13, r22 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_118
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_119 ' NEU4
 PRIMITIVE(#LODL)
 long @C__doprnt_121_L000122
 mov r11, RI ' reg <- addrg
C__doprnt_119
 mov r19, r11 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__doprnt_124 ' JUMPV addrg
C__doprnt_123
 rdbyte r22, r19 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_126 ' NEI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_126
 adds r19, #1 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_124
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_123 ' NEI4
 PRIMITIVE(#LODL)
 long 512
 mov r20, RI ' reg <- con
 and r20, r15 ' BANDI/U (2)
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_123 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_128
C__doprnt_129
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_130 ' NEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_131 ' JUMPV addrg
C__doprnt_130
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #112 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_132 ' EQI4
 PRIMITIVE(#LODL)
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_132
C__doprnt_131
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 PRIMITIVE(#PSHL) ' stack ARG
 mov RI, FP
 add RI, #12
 PRIMITIVE(#PSHL) ' stack ARG ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_sdas1_6188be8e_o_print_L000009
 add SP, #20 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_134
 PRIMITIVE(#LODL)
 long 1024
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
 PRIMITIVE(#LODL)
 long 512
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_135 ' NEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_136 ' JUMPV addrg
C__doprnt_135
 PRIMITIVE(#LODL)
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_136
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 PRIMITIVE(#PSHL) ' stack ARG
 mov RI, FP
 add RI, #12
 PRIMITIVE(#PSHL) ' stack ARG ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_sdas1_6188be8e_o_print_L000009
 add SP, #20 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_137
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r20, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_138
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODF)
 long 12
 wrlong r22, RI ' ASGNP4 addrl reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r23, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_106
 mov r7, #32 ' reg <- coni
 mov r22, r15
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_145 ' EQI4
 mov r7, #48 ' reg <- coni
C__doprnt_145
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r15
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_147 ' EQI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_151 ' EQI4
 cmps r22,  #88 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_150 ' NEI4
C__doprnt_151
 mov r22, r15
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_154 ' NEI4
C__doprnt_150
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #112 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_154 ' EQI4
 PRIMITIVE(#LODL)
 long 1024
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_147 ' EQI4
 rdbyte r22, r11 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_154 ' EQI4
 cmps r22,  #45 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_154 ' EQI4
 cmps r22,  #32 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_147 ' NEI4
C__doprnt_154
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_147
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r17 ' SUBI/P (1)
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 PRIMITIVE(#BRBE)
 long @C__doprnt_155 ' LEI4
 mov r22, r15
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_157 ' NEI4
 adds r13, r9 ' ADDI/P (1)
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_159 ' EQI4
 PRIMITIVE(#LODL)
 long 1024
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_161 ' EQI4
 subs r17, #1 ' SUBI4 coni
 adds r13, #1 ' ADDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_162 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_166 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_167 ' JUMPV addrg
C__doprnt_166
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_167
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_161
 subs r17, #2 ' SUBI4 coni
 adds r13, #2 ' ADDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_170 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_168 ' NEI4
C__doprnt_170
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_172 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_173 ' JUMPV addrg
C__doprnt_172
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_173
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_168
C__doprnt_162
C__doprnt_159
C__doprnt_174
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_177 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_180 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_181 ' JUMPV addrg
C__doprnt_180
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_181
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_177
' C__doprnt_175 ' (symbol refcount = 0)
 mov r22, r9
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_174 ' NEI4
C__doprnt_157
C__doprnt_155
 adds r13, r17 ' ADDI/P (1)
 PRIMITIVE(#JMPA)
 long @C__doprnt_183 ' JUMPV addrg
C__doprnt_182
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_185 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_188 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_189 ' JUMPV addrg
C__doprnt_188
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_189
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_185
C__doprnt_183
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C__doprnt_182 ' GEI4
 cmps r9,  #0 wcz
 PRIMITIVE(#BRBE)
 long @C__doprnt_193 ' LEI4
 adds r13, r9 ' ADDI/P (1)
 PRIMITIVE(#JMPA)
 long @C__doprnt_193 ' JUMPV addrg
C__doprnt_192
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_195 ' NEI4
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__doprnt_198 ' EQI4
 neg r22, r13 ' NEGI4
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__doprnt_199 ' JUMPV addrg
C__doprnt_198
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_199
 PRIMITIVE(#LODF)
 long -1060
 rdlong r0, RI ' reg <- INDIRI4 addrl
 PRIMITIVE(#JMPA)
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_195
C__doprnt_193
 mov r22, r9
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C__doprnt_192 ' GEI4
C__doprnt_62
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__doprnt_61 ' NEI4
 mov r0, r13 ' CVI, CVU or LOAD
C__doprnt_60
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#LODL)
 long 1060
 add SP, RI ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _i_compute

' Catalina Import putc

' Catalina Import toupper

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doprnt_121_L000122 ' <symbol:121>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

' Catalina Code

DAT ' code segment
' end
