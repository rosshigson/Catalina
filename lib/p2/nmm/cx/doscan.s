' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s6ss_688050bc_o_collect_L000003 ' <symbol:o_collect>
 calld PA,#NEWF
 calld PA,#PSHM
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
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wcz
 if_a jmp #\C_s6ss_688050bc_o_collect_L000003_13 ' GTI4
' C_s6ss_688050bc_o_collect_L000003_12 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wcz
 if_b jmp #\C_s6ss_688050bc_o_collect_L000003_5 ' LTI4
' C_s6ss_688050bc_o_collect_L000003_14 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_11 ' EQI4
 cmps r11,  #100 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_9 ' EQI4
 jmp #\@C_s6ss_688050bc_o_collect_L000003_5 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_13
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_10 ' EQI4
 cmps r11,  #112 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_8 ' EQI4
 cmps r11, r22 wcz
 if_b jmp #\C_s6ss_688050bc_o_collect_L000003_5 ' LTI4
' C_s6ss_688050bc_o_collect_L000003_15 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_9 ' EQI4
 cmps r11,  #120 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_8 ' EQI4
 jmp #\@C_s6ss_688050bc_o_collect_L000003_5 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_8
 mov r13, #16 ' reg <- coni
 jmp #\@C_s6ss_688050bc_o_collect_L000003_6 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_9
 mov r13, #10 ' reg <- coni
 jmp #\@C_s6ss_688050bc_o_collect_L000003_6 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_10
 mov r13, #8 ' reg <- coni
 jmp #\@C_s6ss_688050bc_o_collect_L000003_6 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_11
 mov r13, #2 ' reg <- coni
C_s6ss_688050bc_o_collect_L000003_5
C_s6ss_688050bc_o_collect_L000003_6
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #45 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_18 ' EQI4
 cmps r22,  #43 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_16 ' NEI4
C_s6ss_688050bc_o_collect_L000003_18
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_19 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_s6ss_688050bc_o_collect_L000003_19
C_s6ss_688050bc_o_collect_L000003_16
 cmps r21,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_21 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_21 ' NEI4
 cmps r13,  #16 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_21 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_23 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_s6ss_688050bc_o_collect_L000003_23
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #120 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_25 ' EQI4
 cmps r22,  #88 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_25 ' EQI4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_36 ' NEI4
 mov r13, #8 ' reg <- coni
 jmp #\@C_s6ss_688050bc_o_collect_L000003_36 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_25
 cmps r21,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_36 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_36 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNI4 addrfi reg
 jmp #\@C_s6ss_688050bc_o_collect_L000003_36 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_21
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_36 ' NEI4
 mov r13, #10 ' reg <- coni
 jmp #\@C_s6ss_688050bc_o_collect_L000003_36 ' JUMPV addrg
C_s6ss_688050bc_o_collect_L000003_35
 cmps r13,  #10 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_42 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_s6ss_688050bc_o_collect_L000003_45 ' LTU4
C_s6ss_688050bc_o_collect_L000003_42
 cmps r13,  #16 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_44 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #68 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_45 ' NEI4
C_s6ss_688050bc_o_collect_L000003_44
 cmps r13,  #8 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_47 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wcz 
 if_ae jmp #\C_s6ss_688050bc_o_collect_L000003_47 ' GEU4
 cmps r22,  #56 wcz
 if_b jmp #\C_s6ss_688050bc_o_collect_L000003_45 ' LTI4
C_s6ss_688050bc_o_collect_L000003_47
 cmps r13,  #2 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_37 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wcz 
 if_ae jmp #\C_s6ss_688050bc_o_collect_L000003_37 ' GEU4
 cmps r22,  #50 wcz
 if_ae jmp #\C_s6ss_688050bc_o_collect_L000003_37 ' GEI4
C_s6ss_688050bc_o_collect_L000003_45
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_39 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_s6ss_688050bc_o_collect_L000003_39
C_s6ss_688050bc_o_collect_L000003_36
 cmps r21,  #0 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_35 ' NEI4
C_s6ss_688050bc_o_collect_L000003_37
 cmps r21,  #0 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_50 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_s6ss_688050bc_o_collect_L000003_50 ' EQI4
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_s6ss_688050bc_o_collect_L000003_50
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 if_nz jmp #\C_s6ss_688050bc_o_collect_L000003_52 ' NEI4
 mov r13, #0 ' reg <- coni
C_s6ss_688050bc_o_collect_L000003_52
 wrlong r13, r19 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r22, ##-1 ' reg <- con
 mov r0, r15 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_s6ss_688050bc_o_collect_L000003_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s6ss1_688050bc_f_collect_L000054 ' <symbol:f_collect>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 mov r13, #0 ' reg <- coni
 cmps r23,  #45 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_58 ' EQI4
 cmps r23,  #43 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_62 ' NEI4
C_s6ss1_688050bc_f_collect_L000054_58
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_62 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_s6ss1_688050bc_f_collect_L000054_62 ' JUMPV addrg
C_s6ss1_688050bc_f_collect_L000054_61
 adds r13, #1 ' ADDI4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_64 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s6ss1_688050bc_f_collect_L000054_64
C_s6ss1_688050bc_f_collect_L000054_62
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_66 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_s6ss1_688050bc_f_collect_L000054_61 ' LTU4
C_s6ss1_688050bc_f_collect_L000054_66
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_67 ' EQI4
 cmps r23,  #46 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_67 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_72 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_s6ss1_688050bc_f_collect_L000054_72 ' JUMPV addrg
C_s6ss1_688050bc_f_collect_L000054_71
 adds r13, #1 ' ADDI4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_74 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s6ss1_688050bc_f_collect_L000054_74
C_s6ss1_688050bc_f_collect_L000054_72
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_76 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_s6ss1_688050bc_f_collect_L000054_71 ' LTU4
C_s6ss1_688050bc_f_collect_L000054_76
C_s6ss1_688050bc_f_collect_L000054_67
 cmps r13,  #0 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_77 ' NEI4
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_79 ' EQI4
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_79 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_s6ss1_688050bc_f_collect_L000054_79
 mov r22, ##-1 ' reg <- con
 mov r0, r17 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_s6ss1_688050bc_f_collect_L000054_55 ' JUMPV addrg
C_s6ss1_688050bc_f_collect_L000054_77
 mov r13, #0 ' reg <- coni
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_81 ' EQI4
 cmps r23,  #101 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_83 ' EQI4
 cmps r23,  #69 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_81 ' NEI4
C_s6ss1_688050bc_f_collect_L000054_83
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_84 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s6ss1_688050bc_f_collect_L000054_84
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_92 ' EQI4
 cmps r23,  #43 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_88 ' EQI4
 cmps r23,  #45 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_92 ' NEI4
C_s6ss1_688050bc_f_collect_L000054_88
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_92 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_s6ss1_688050bc_f_collect_L000054_92 ' JUMPV addrg
C_s6ss1_688050bc_f_collect_L000054_91
 adds r13, #1 ' ADDI4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_94 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s6ss1_688050bc_f_collect_L000054_94
C_s6ss1_688050bc_f_collect_L000054_92
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_96 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_s6ss1_688050bc_f_collect_L000054_91 ' LTU4
C_s6ss1_688050bc_f_collect_L000054_96
 cmps r13,  #0 wz
 if_nz jmp #\C_s6ss1_688050bc_f_collect_L000054_97 ' NEI4
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_99 ' EQI4
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_99 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_s6ss1_688050bc_f_collect_L000054_99
 mov r22, ##-1 ' reg <- con
 mov r0, r17 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_s6ss1_688050bc_f_collect_L000054_55 ' JUMPV addrg
C_s6ss1_688050bc_f_collect_L000054_97
C_s6ss1_688050bc_f_collect_L000054_81
 cmps r19,  #0 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_101 ' EQI4
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_s6ss1_688050bc_f_collect_L000054_101 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_s6ss1_688050bc_f_collect_L000054_101
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r22, ##-1 ' reg <- con
 mov r0, r15 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
C_s6ss1_688050bc_f_collect_L000054_55
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _doscan

 alignl ' align long
C__doscan ' <symbol:_doscan>
 calld PA,#NEWF
 sub SP, ##808
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-264)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_107 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_106
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_109 ' EQI4
 jmp #\@C__doscan_113 ' JUMPV addrg
C__doscan_112
 adds r21, #1 ' ADDP4 coni
C__doscan_113
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_112 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 jmp #\@C__doscan_117 ' JUMPV addrg
C__doscan_116
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_117
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_116 ' NEI4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_120 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_120
 subs r11, #1 ' SUBI4 coni
C__doscan_109
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_122 ' NEI4
 jmp #\@C__doscan_108 ' JUMPV addrg
C__doscan_122
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_z jmp #\C__doscan_124 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r15, r22 wz
 if_z jmp #\C__doscan_107 ' EQI4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_128 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_128
 subs r11, #1 ' SUBI4 coni
 jmp #\@C__doscan_108 ' JUMPV addrg
C__doscan_124
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_nz jmp #\C__doscan_130 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 cmps r15,  #37 wz
 if_nz jmp #\C__doscan_108 ' NEI4
 adds r21, #1 ' ADDP4 coni
 jmp #\@C__doscan_107 ' JUMPV addrg
C__doscan_130
 mov r9, #0 ' reg <- coni
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #42 wz
 if_nz jmp #\C__doscan_134 ' NEI4
 adds r21, #1 ' ADDP4 coni
 mov r22, ##2048 ' reg <- con
 or r9, r22 ' BORI/U (1)
C__doscan_134
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C__doscan_136 ' GEU4
 or r9, #256 ' BORI4 coni
 mov r13, #0 ' reg <- coni
 jmp #\@C__doscan_141 ' JUMPV addrg
C__doscan_138
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r13 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 add r22, r0 ' ADDU (2)
 mov r13, r22
 sub r13, #48 ' SUBU4 coni
' C__doscan_139 ' (symbol refcount = 0)
C__doscan_141
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C__doscan_138 ' LTU4
C__doscan_136
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 mov RI, ##-804
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, ##-804
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C__doscan_145 ' EQI4
 cmps r22, r20 wcz
 if_a jmp #\C__doscan_149 ' GTI4
' C__doscan_148 ' (symbol refcount = 0)
 mov r22, ##-804
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #76 wz
 if_z jmp #\C__doscan_147 ' EQI4
 jmp #\@C__doscan_142 ' JUMPV addrg
C__doscan_149
 mov r22, ##-804
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #108 wz
 if_z jmp #\C__doscan_146 ' EQI4
 jmp #\@C__doscan_142 ' JUMPV addrg
C__doscan_145
 or r9, #32 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #\@C__doscan_143 ' JUMPV addrg
C__doscan_146
 or r9, #64 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #\@C__doscan_143 ' JUMPV addrg
C__doscan_147
 or r9, #128 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
C__doscan_142
C__doscan_143
 rdbyte r7, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r7,  #99 wz
 if_z jmp #\C__doscan_150 ' EQI4
 cmps r7,  #91 wz
 if_z jmp #\C__doscan_150 ' EQI4
 cmps r7,  #110 wz
 if_z jmp #\C__doscan_150 ' EQI4
C__doscan_152
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
' C__doscan_153 ' (symbol refcount = 0)
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_152 ' NEI4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C__doscan_151 ' NEI4
 jmp #\@C__doscan_108 ' JUMPV addrg
C__doscan_150
 cmps r7,  #110 wz
 if_z jmp #\C__doscan_158 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C__doscan_160 ' NEI4
 jmp #\@C__doscan_108 ' JUMPV addrg
C__doscan_160
 adds r11, #1 ' ADDI4 coni
C__doscan_158
C__doscan_151
 cmps r7,  #88 wcz
 if_b jmp #\C__doscan_302 ' LTI4
 cmps r7,  #105 wcz
 if_a jmp #\C__doscan_303 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__doscan_304_L000306-352 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_304_L000306 ' <symbol:304>
 long @C__doscan_176
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_237
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_176
 long @C__doscan_195
 long @C__doscan_176
 long @C__doscan_286
 long @C__doscan_286
 long @C__doscan_286
 long @C__doscan_162
 long @C__doscan_176

' Catalina Code

DAT ' code segment
C__doscan_302
 cmps r7,  #69 wz
 if_z jmp #\C__doscan_286 ' EQI4
 cmps r7,  #71 wz
 if_z jmp #\C__doscan_286 ' EQI4
 jmp #\@C__doscan_162 ' JUMPV addrg
C__doscan_303
 cmps r7,  #110 wcz
 if_b jmp #\C__doscan_162 ' LTI4
 cmps r7,  #120 wcz
 if_a jmp #\C__doscan_162 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__doscan_308_L000310-440 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_308_L000310 ' <symbol:308>
 long @C__doscan_168
 long @C__doscan_176
 long @C__doscan_175
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_214
 long @C__doscan_162
 long @C__doscan_176
 long @C__doscan_162
 long @C__doscan_162
 long @C__doscan_176

' Catalina Code

DAT ' code segment
C__doscan_162
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_167 ' NEI4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_165 ' EQI4
C__doscan_167
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, ##-808
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #\@C__doscan_166 ' JUMPV addrg
C__doscan_165
 mov r22, ##-1 ' reg <- con
 mov RI, ##-808
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_166
 mov r22, ##-808
 adds r22, FP
 ' reg <- addrl
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_168
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_163 ' NEI4
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_171 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r11 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNI2 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_171
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_173 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r11, r22 ' ASGNI4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_173
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r11, r22 ' ASGNI4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_175
C__doscan_176
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_179 ' EQI4
 mov r22, ##512 ' reg <- con
 cmp r13, r22 wcz 
 if_be jmp #\C__doscan_177 ' LEU4
C__doscan_179
 mov r13, ##512 ' reg <- con
C__doscan_177
 cmp r13,  #0 wz
 if_nz jmp #\C__doscan_180  ' NEU4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_180
 mov r2, FP
 adds r2, ##(-784)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-788)
' reg ARG ADDRL
 mov r4, r13 ' CVI, CVU or LOAD
 mov r22, r7 ' CVI, CVU or LOAD
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov RI, r15
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s6ss_688050bc_o_collect_L000003
 add SP, #20 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r20, ##-784
 adds r20, FP
 ' reg <- addrl
 cmp r17, r20 wcz 
 if_b jmp #\C__doscan_185 ' LTU4
 cmp r17, r20 wz
 if_nz jmp #\C__doscan_182  ' NEU4
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_z jmp #\C__doscan_185 ' EQI4
 cmps r22,  #43 wz
 if_nz jmp #\C__doscan_182 ' NEI4
C__doscan_185
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_182
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, ##-784
 adds r20, FP
 ' reg <- addrl
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_163 ' NEI4
 cmps r7,  #100 wz
 if_z jmp #\C__doscan_190 ' EQI4
 cmps r7,  #105 wz
 if_nz jmp #\C__doscan_188 ' NEI4
C__doscan_190
 mov RI, FP
 adds RI, ##(-788)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, FP
 adds r3, ##(-796)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-784)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtol
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, ##-792
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #\@C__doscan_189 ' JUMPV addrg
C__doscan_188
 mov RI, FP
 adds RI, ##(-788)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, FP
 adds r3, ##(-796)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-784)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtoul
 add SP, #8 ' CALL addrg
 mov RI, ##-792
 adds RI, FP
 wrlong r0, RI ' ASGNU4 addrl reg
C__doscan_189
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_191 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-792
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_191
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_193 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-792
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrword r20, r22 ' ASGNU2 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_193
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-792
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_195
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_196 ' NEI4
 mov r13, #1 ' reg <- coni
C__doscan_196
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_198 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_198
 cmp r13,  #0 wz
 if_nz jmp #\C__doscan_203  ' NEU4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_202
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_205 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_205
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__doscan_207 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_207
C__doscan_203
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_209 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C__doscan_202 ' NEI4
C__doscan_209
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_163 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_212 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_212
 subs r11, #1 ' SUBI4 coni
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_214
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_215 ' NEI4
 mov r13, ##$ffff ' reg <- con
C__doscan_215
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_217 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_217
 cmp r13,  #0 wz
 if_nz jmp #\C__doscan_222  ' NEU4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_221
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_225 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_225
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__doscan_227 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_227
C__doscan_222
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_230 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_230 ' EQI4
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_221 ' EQI4
C__doscan_230
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_231 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
C__doscan_231
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_163 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_235 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_235
 subs r11, #1 ' SUBI4 coni
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_237
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_238 ' NEI4
 mov r13, ##$ffff ' reg <- con
C__doscan_238
 cmp r13,  #0 wz
 if_nz jmp #\C__doscan_240  ' NEU4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_240
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_nz jmp #\C__doscan_242 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDP4 coni
 jmp #\@C__doscan_243 ' JUMPV addrg
C__doscan_242
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_243
 mov r17, FP
 sub r17, #-(-260) ' reg <- addrli
 jmp #\@C__doscan_247 ' JUMPV addrg
C__doscan_244
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
' C__doscan_245 ' (symbol refcount = 0)
 adds r17, #1 ' ADDP4 coni
C__doscan_247
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 cmp r22, r20 wcz 
 if_b jmp #\C__doscan_244 ' LTU4
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #93 wz
 if_nz jmp #\C__doscan_252 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C__doscan_252 ' JUMPV addrg
C__doscan_251
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C__doscan_254 ' NEI4
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_256 ' EQI4
 cmps r22,  #93 wz
 if_z jmp #\C__doscan_256 ' EQI4
 mov r20, ##-2 ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wcz
 if_b jmp #\C__doscan_256 ' LTI4
 mov r22, ##-2 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, ##-812
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #\@C__doscan_261 ' JUMPV addrg
C__doscan_258
 mov r22, ##-812
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C__doscan_259 ' (symbol refcount = 0)
 mov r22, ##-812
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, ##-812
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_261
 mov r22, ##-812
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wcz
 if_be jmp #\C__doscan_258 ' LEI4
 adds r21, #1 ' ADDP4 coni
 jmp #\@C__doscan_257 ' JUMPV addrg
C__doscan_256
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-215)
 wrbyte r22, RI ' ASGNU1 addrli reg
C__doscan_257
C__doscan_254
C__doscan_252
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_263 ' EQI4
 cmps r22,  #93 wz
 if_nz jmp #\C__doscan_251 ' NEI4
C__doscan_263
 mov r22, #0 ' reg <- coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C__doscan_266 ' EQI4
 mov r20, FP
 sub r20, #-(-260) ' reg <- addrli
 adds r20, r15 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, FP
 sub r18, #-(-272) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 xor r20, r18 ' BXORI/U (1)
 cmps r20, r22 wz
 if_nz jmp #\C__doscan_264 ' NEI4
C__doscan_266
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_267 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_267
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_264
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_269 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
C__doscan_269
C__doscan_271
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_274 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C__doscan_274
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__doscan_276 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_276
' C__doscan_272 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_279 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_279 ' EQI4
 mov r22, FP
 sub r22, #-(-260) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 xor r22, r20 ' BXORI/U (1)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_271 ' NEI4
C__doscan_279
 cmp r13,  #0 wz
 if_z jmp #\C__doscan_280 ' EQU4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_282 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_282
 subs r11, #1 ' SUBI4 coni
C__doscan_280
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_163 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_286
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_289 ' EQI4
 mov r22, ##512 ' reg <- con
 cmp r13, r22 wcz 
 if_be jmp #\C__doscan_287 ' LEU4
C__doscan_289
 mov r13, ##512 ' reg <- con
C__doscan_287
 cmp r13,  #0 wz
 if_nz jmp #\C__doscan_290  ' NEU4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_290
 mov r2, FP
 adds r2, ##(-784)
' reg ARG ADDRL
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s6ss1_688050bc_f_collect_L000054
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r20, ##-784
 adds r20, FP
 ' reg <- addrl
 cmp r17, r20 wcz 
 if_b jmp #\C__doscan_295 ' LTU4
 cmp r17, r20 wz
 if_nz jmp #\C__doscan_292  ' NEU4
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_z jmp #\C__doscan_295 ' EQI4
 cmps r22,  #43 wz
 if_nz jmp #\C__doscan_292 ' NEI4
C__doscan_295
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C__doscan_103 ' JUMPV addrg
C__doscan_292
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, ##-784
 adds r20, FP
 ' reg <- addrl
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_163 ' NEI4
 mov r2, FP
 adds r2, ##(-796)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-784)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strtod
 add SP, #4 ' CALL addrg
 mov RI, ##-800
 adds RI, FP
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, r9
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_298 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-800
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_298
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C__doscan_300 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-800
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 jmp #\@C__doscan_163 ' JUMPV addrg
C__doscan_300
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-800
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
C__doscan_163
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-264)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##2048 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_312 ' NEI4
 cmps r7,  #110 wz
 if_z jmp #\C__doscan_312 ' EQI4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_312
 adds r21, #1 ' ADDP4 coni
C__doscan_107
 jmp #\@C__doscan_106 ' JUMPV addrg
C__doscan_108
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__doscan_317 ' NEI4
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C__doscan_315 ' EQI4
C__doscan_317
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, ##-804
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #\@C__doscan_316 ' JUMPV addrg
C__doscan_315
 mov r22, ##-1 ' reg <- con
 mov RI, ##-804
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
C__doscan_316
 mov r22, ##-804
 adds r22, FP
 ' reg <- addrl
 rdlong r0, r22 ' reg <- INDIRI4 reg
C__doscan_103
 calld PA,#POPM ' restore registers
 add SP, ##808 ' framesize
 calld PA,#RETF


' Catalina Import __ctype

' Catalina Import strtoul

' Catalina Import strtol

' Catalina Import strtod

' Catalina Import ungetc

' Catalina Import getc
' end
