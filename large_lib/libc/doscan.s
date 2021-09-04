' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 long ' align long
C_sfl42_6132d129_o_collect_L000005 ' <symbol:o_collect>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r15, RI ' reg <- addrg
 mov r11, r21 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r22, #105 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_sfl42_6132d129_o_collect_L000005_15 ' GTI4
' C_sfl42_6132d129_o_collect_L000005_14 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_sfl42_6132d129_o_collect_L000005_7 ' LTI4
' C_sfl42_6132d129_o_collect_L000005_16 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_13 ' EQI4
 cmps r11,  #100 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_11 ' EQI4
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_7 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_15
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_12 ' EQI4
 cmps r11,  #112 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_10 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_sfl42_6132d129_o_collect_L000005_7 ' LTI4
' C_sfl42_6132d129_o_collect_L000005_17 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_11 ' EQI4
 cmps r11,  #120 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_10 ' EQI4
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_7 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_10
 mov r13, #16 ' reg <- coni
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_8 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_11
 mov r13, #10 ' reg <- coni
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_8 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_12
 mov r13, #8 ' reg <- coni
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_8 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_13
 mov r13, #2 ' reg <- coni
C_sfl42_6132d129_o_collect_L000005_7
C_sfl42_6132d129_o_collect_L000005_8
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_20 ' EQI4
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_18 ' NEI4
C_sfl42_6132d129_o_collect_L000005_20
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_21 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_sfl42_6132d129_o_collect_L000005_21
C_sfl42_6132d129_o_collect_L000005_18
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_23 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_23 ' NEI4
 cmps r13,  #16 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_23 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_25 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_sfl42_6132d129_o_collect_L000005_25
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_27 ' EQI4
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_27 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_38 ' NEI4
 mov r13, #8 ' reg <- coni
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_38 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_27
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_38 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_38 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_38 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_23
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_38 ' NEI4
 mov r13, #10 ' reg <- coni
 jmp #JMPA
 long @C_sfl42_6132d129_o_collect_L000005_38 ' JUMPV addrg
C_sfl42_6132d129_o_collect_L000005_37
 cmps r13,  #10 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_44 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_sfl42_6132d129_o_collect_L000005_47' LTU4
C_sfl42_6132d129_o_collect_L000005_44
 cmps r13,  #16 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_46 ' NEI4
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
 long @C_sfl42_6132d129_o_collect_L000005_47 ' NEI4
C_sfl42_6132d129_o_collect_L000005_46
 cmps r13,  #8 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_49 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wz,wc 
 jmp #BRAE
 long @C_sfl42_6132d129_o_collect_L000005_49 ' GEU4
 cmps r22,  #56 wz,wc
 jmp #BR_B
 long @C_sfl42_6132d129_o_collect_L000005_47 ' LTI4
C_sfl42_6132d129_o_collect_L000005_49
 cmps r13,  #2 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_39 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wz,wc 
 jmp #BRAE
 long @C_sfl42_6132d129_o_collect_L000005_39 ' GEU4
 cmps r22,  #50 wz,wc
 jmp #BRAE
 long @C_sfl42_6132d129_o_collect_L000005_39 ' GEI4
C_sfl42_6132d129_o_collect_L000005_47
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_41 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNI4 addrfi reg
C_sfl42_6132d129_o_collect_L000005_41
C_sfl42_6132d129_o_collect_L000005_38
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_37 ' NEI4
C_sfl42_6132d129_o_collect_L000005_39
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_52 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sfl42_6132d129_o_collect_L000005_52 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_sfl42_6132d129_o_collect_L000005_52
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #105 wz
 jmp #BRNZ
 long @C_sfl42_6132d129_o_collect_L000005_54 ' NEI4
 mov r13, #0 ' reg <- coni
C_sfl42_6132d129_o_collect_L000005_54
 mov RI, r17
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
' C_sfl42_6132d129_o_collect_L000005_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 long ' align long
C_sfl43_6132d129_f_collect_L000056 ' <symbol:f_collect>
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r17, RI ' reg <- addrg
 mov r15, #0 ' reg <- coni
 cmps r23,  #45 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_60 ' EQI4
 cmps r23,  #43 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_64 ' NEI4
C_sfl43_6132d129_f_collect_L000056_60
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_64 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfl43_6132d129_f_collect_L000056_64 ' JUMPV addrg
C_sfl43_6132d129_f_collect_L000056_63
 adds r15, #1 ' ADDI4 coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_66 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sfl43_6132d129_f_collect_L000056_66
C_sfl43_6132d129_f_collect_L000056_64
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_68 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_sfl43_6132d129_f_collect_L000056_63' LTU4
C_sfl43_6132d129_f_collect_L000056_68
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_69 ' EQI4
 cmps r23,  #46 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_69 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_74 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfl43_6132d129_f_collect_L000056_74 ' JUMPV addrg
C_sfl43_6132d129_f_collect_L000056_73
 adds r15, #1 ' ADDI4 coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_76 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sfl43_6132d129_f_collect_L000056_76
C_sfl43_6132d129_f_collect_L000056_74
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_78 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_sfl43_6132d129_f_collect_L000056_73' LTU4
C_sfl43_6132d129_f_collect_L000056_78
C_sfl43_6132d129_f_collect_L000056_69
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_79 ' NEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_81 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_81 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_sfl43_6132d129_f_collect_L000056_81
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004-1
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sfl43_6132d129_f_collect_L000056_57 ' JUMPV addrg
C_sfl43_6132d129_f_collect_L000056_79
 mov r15, #0 ' reg <- coni
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_84 ' EQI4
 cmps r23,  #101 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_86 ' EQI4
 cmps r23,  #69 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_84 ' NEI4
C_sfl43_6132d129_f_collect_L000056_86
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_87 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sfl43_6132d129_f_collect_L000056_87
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_95 ' EQI4
 cmps r23,  #43 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_91 ' EQI4
 cmps r23,  #45 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_95 ' NEI4
C_sfl43_6132d129_f_collect_L000056_91
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_95 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfl43_6132d129_f_collect_L000056_95 ' JUMPV addrg
C_sfl43_6132d129_f_collect_L000056_94
 adds r15, #1 ' ADDI4 coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_97 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sfl43_6132d129_f_collect_L000056_97
C_sfl43_6132d129_f_collect_L000056_95
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_99 ' EQI4
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_sfl43_6132d129_f_collect_L000056_94' LTU4
C_sfl43_6132d129_f_collect_L000056_99
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_sfl43_6132d129_f_collect_L000056_100 ' NEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_102 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_102 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_sfl43_6132d129_f_collect_L000056_102
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004-1
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sfl43_6132d129_f_collect_L000056_57 ' JUMPV addrg
C_sfl43_6132d129_f_collect_L000056_100
C_sfl43_6132d129_f_collect_L000056_84
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_105 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sfl43_6132d129_f_collect_L000056_105 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C_sfl43_6132d129_f_collect_L000056_105
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r0, r17 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
C_sfl43_6132d129_f_collect_L000056_57
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export _doscan

 long ' align long
C__doscan ' <symbol:_doscan>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_111 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_110
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
 long @C__doscan_113 ' EQI4
 jmp #JMPA
 long @C__doscan_117 ' JUMPV addrg
C__doscan_116
 adds r21, #1 ' ADDP4 coni
C__doscan_117
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
 long @C__doscan_116 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doscan_121 ' JUMPV addrg
C__doscan_120
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_121
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
 long @C__doscan_120 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_124 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_124
 subs r11, #1 ' SUBI4 coni
C__doscan_113
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_126 ' NEI4
 jmp #JMPA
 long @C__doscan_112 ' JUMPV addrg
C__doscan_126
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C__doscan_128 ' EQI4
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
 long @C__doscan_111 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_132 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_132
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_112 ' JUMPV addrg
C__doscan_128
 adds r21, #1 ' ADDP4 coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BRNZ
 long @C__doscan_134 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
 cmps r15,  #37 wz
 jmp #BRNZ
 long @C__doscan_112 ' NEI4
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_111 ' JUMPV addrg
C__doscan_134
 mov r9, #0 ' reg <- coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C__doscan_138 ' NEI4
 adds r21, #1 ' ADDP4 coni
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 or r9, r22 ' BORI/U (1)
C__doscan_138
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BRAE
 long @C__doscan_140 ' GEU4
 or r9, #256 ' BORI4 coni
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C__doscan_145 ' JUMPV addrg
C__doscan_142
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r22, r0 ' ADDU
 add r22, r20 ' ADDU (3)
 mov r13, r22
 sub r13, #48 ' SUBU4 coni
' C__doscan_143 ' (symbol refcount = 0)
C__doscan_145
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C__doscan_142' LTU4
C__doscan_140
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C__doscan_149 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C__doscan_153 ' GTI4
' C__doscan_152 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C__doscan_151 ' EQI4
 jmp #JMPA
 long @C__doscan_146 ' JUMPV addrg
C__doscan_153
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #108 wz
 jmp #BR_Z
 long @C__doscan_150 ' EQI4
 jmp #JMPA
 long @C__doscan_146 ' JUMPV addrg
C__doscan_149
 or r9, #32 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_147 ' JUMPV addrg
C__doscan_150
 or r9, #64 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_147 ' JUMPV addrg
C__doscan_151
 or r9, #128 ' BORI4 coni
 adds r21, #1 ' ADDP4 coni
C__doscan_146
C__doscan_147
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r7, r22 ' CVUI
 and r7, cviu_m1 ' zero extend
 cmps r7,  #99 wz
 jmp #BR_Z
 long @C__doscan_154 ' EQI4
 cmps r7,  #91 wz
 jmp #BR_Z
 long @C__doscan_154 ' EQI4
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_154 ' EQI4
C__doscan_156
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
' C__doscan_157 ' (symbol refcount = 0)
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
 long @C__doscan_156 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C__doscan_155 ' NEI4
 jmp #JMPA
 long @C__doscan_112 ' JUMPV addrg
C__doscan_154
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_162 ' EQI4
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
 long @C__doscan_164 ' NEI4
 jmp #JMPA
 long @C__doscan_112 ' JUMPV addrg
C__doscan_164
 adds r11, #1 ' ADDI4 coni
C__doscan_162
C__doscan_155
 cmps r7,  #88 wz,wc
 jmp #BR_B
 long @C__doscan_306 ' LTI4
 cmps r7,  #105 wz,wc
 jmp #BR_A
 long @C__doscan_307 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__doscan_308_L000310-352
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 long ' align long
C__doscan_308_L000310 ' <symbol:308>
 long @C__doscan_180
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_241
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_180
 long @C__doscan_199
 long @C__doscan_180
 long @C__doscan_290
 long @C__doscan_290
 long @C__doscan_290
 long @C__doscan_166
 long @C__doscan_180

' Catalina Code

DAT ' code segment
C__doscan_306
 cmps r7,  #69 wz
 jmp #BR_Z
 long @C__doscan_290 ' EQI4
 cmps r7,  #71 wz
 jmp #BR_Z
 long @C__doscan_290 ' EQI4
 jmp #JMPA
 long @C__doscan_166 ' JUMPV addrg
C__doscan_307
 cmps r7,  #110 wz,wc
 jmp #BR_B
 long @C__doscan_166 ' LTI4
 cmps r7,  #120 wz,wc
 jmp #BR_A
 long @C__doscan_166 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__doscan_312_L000314-440
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 long ' align long
C__doscan_312_L000314 ' <symbol:312>
 long @C__doscan_172
 long @C__doscan_180
 long @C__doscan_179
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_218
 long @C__doscan_166
 long @C__doscan_180
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_180

' Catalina Code

DAT ' code segment
C__doscan_166
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_171 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_169 ' EQI4
C__doscan_171
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doscan_170 ' JUMPV addrg
C__doscan_169
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_170
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_172
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_167 ' NEI4
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_175 ' EQI4
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
 long @C__doscan_167 ' JUMPV addrg
C__doscan_175
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_177 ' EQI4
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
 long @C__doscan_167 ' JUMPV addrg
C__doscan_177
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
 long @C__doscan_167 ' JUMPV addrg
C__doscan_179
C__doscan_180
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_183 ' EQI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmp r13, r22 wz,wc 
 jmp #BRBE
 long @C__doscan_181 ' LEU4
C__doscan_183
 jmp #LODL
 long 512
 mov r13, RI ' reg <- con
C__doscan_181
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_184 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_184
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r22, r7 ' CVI, CVU or LOAD
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sfl42_6132d129_o_collect_L000005
 add SP, #16 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 cmp r17, r20 wz,wc 
 jmp #BR_B
 long @C__doscan_189' LTU4
 cmp r17, r20 wz
 jmp #BRNZ
 long @C__doscan_186 ' NEU4
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doscan_189 ' EQI4
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C__doscan_186 ' NEI4
C__doscan_189
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_186
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_167 ' NEI4
 cmps r7,  #100 wz
 jmp #BR_Z
 long @C__doscan_194 ' EQI4
 cmps r7,  #105 wz
 jmp #BRNZ
 long @C__doscan_192 ' NEI4
C__doscan_194
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtol
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C__doscan_193 ' JUMPV addrg
C__doscan_192
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtoul
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
C__doscan_193
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_195 ' EQI4
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
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_195
 mov r22, r9
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_197 ' EQI4
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
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_197
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
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_199
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_200 ' NEI4
 mov r13, #1 ' reg <- coni
C__doscan_200
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_202 ' NEI4
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
C__doscan_202
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_207 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_206
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_209 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_209
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_211 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_211
C__doscan_207
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_213 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C__doscan_206 ' NEI4
C__doscan_213
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_167 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_216 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_216
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_218
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_219 ' NEI4
 jmp #LODL
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_219
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_221 ' NEI4
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
C__doscan_221
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_226 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_225
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_229 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_229
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_231 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_231
C__doscan_226
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_234 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_234 ' EQI4
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
 long @C__doscan_225 ' EQI4
C__doscan_234
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_235 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_235
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_167 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_239 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_239
 subs r11, #1 ' SUBI4 coni
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_241
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_242 ' NEI4
 jmp #LODL
 long $ffff
 mov r13, RI ' reg <- con
C__doscan_242
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_244 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_244
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #94 wz
 jmp #BRNZ
 long @C__doscan_246 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_247 ' JUMPV addrg
C__doscan_246
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_247
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C__doscan_251 ' JUMPV addrg
C__doscan_248
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
' C__doscan_249 ' (symbol refcount = 0)
 adds r17, #1 ' ADDP4 coni
C__doscan_251
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003+256
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C__doscan_248' LTU4
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #93 wz
 jmp #BRNZ
 long @C__doscan_256 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C__doscan_256 ' JUMPV addrg
C__doscan_255
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r20, RI ' reg <- addrg
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
 long @C__doscan_258 ' NEI4
 adds r21, #1 ' ADDP4 coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_260 ' EQI4
 cmps r22,  #93 wz
 jmp #BR_Z
 long @C__doscan_260 ' EQI4
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
 long @C__doscan_260 ' LTI4
 jmp #LODL
 long -2
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doscan_265 ' JUMPV addrg
C__doscan_262
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C__doscan_263 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_265
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, r21
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C__doscan_262 ' LEI4
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doscan_261 ' JUMPV addrg
C__doscan_260
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003+45
 mov BC, r22
 jmp #WBYT ' ASGNU1 addrg reg
C__doscan_261
C__doscan_258
C__doscan_256
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_267 ' EQI4
 cmps r22,  #93 wz
 jmp #BRNZ
 long @C__doscan_255 ' NEI4
C__doscan_267
 mov r22, #0 ' reg <- coni
 mov RI, r21
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C__doscan_270 ' EQI4
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r20, RI ' reg <- addrg
 adds r20, r15 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 xor r20, r18 ' BXORI/U (1)
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doscan_268 ' NEI4
C__doscan_270
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_271 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_271
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_268
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_273 ' NEI4
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
C__doscan_273
C__doscan_275
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_278 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C__doscan_278
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_280 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 adds r11, #1 ' ADDI4 coni
C__doscan_280
' C__doscan_276 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_283 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_283 ' EQI4
 jmp #LODL
 long @C_sfl4_6132d129_X_table_L000003
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 xor r22, r20 ' BXORI/U (1)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_275 ' NEI4
C__doscan_283
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C__doscan_284 ' EQU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_286 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
C__doscan_286
 subs r11, #1 ' SUBI4 coni
C__doscan_284
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_167 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_290
 mov r22, r9
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_293 ' EQI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmp r13, r22 wz,wc 
 jmp #BRBE
 long @C__doscan_291 ' LEU4
C__doscan_293
 jmp #LODL
 long 512
 mov r13, RI ' reg <- con
C__doscan_291
 cmp r13,  #0 wz
 jmp #BRNZ
 long @C__doscan_294 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_294
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sfl43_6132d129_f_collect_L000056
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 cmp r17, r20 wz,wc 
 jmp #BR_B
 long @C__doscan_299' LTU4
 cmp r17, r20 wz
 jmp #BRNZ
 long @C__doscan_296 ' NEU4
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doscan_299 ' EQI4
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C__doscan_296 ' NEI4
C__doscan_299
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C__doscan_107 ' JUMPV addrg
C__doscan_296
 mov r22, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r20, RI ' reg <- addrg
 sub r22, r20 ' SUBU (1)
 adds r11, r22 ' ADDI/P (1)
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_167 ' NEI4
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 jmp #LODL
 long @C_sfl41_6132d129_inp_buf_L000004
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtod
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, r9
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_302 ' EQI4
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
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_302
 mov r22, r9
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doscan_304 ' EQI4
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
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 jmp #JMPA
 long @C__doscan_167 ' JUMPV addrg
C__doscan_304
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
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
C__doscan_167
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 2048
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_316 ' NEI4
 cmps r7,  #110 wz
 jmp #BR_Z
 long @C__doscan_316 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_316
 adds r21, #1 ' ADDP4 coni
C__doscan_111
 jmp #JMPA
 long @C__doscan_110 ' JUMPV addrg
C__doscan_112
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscan_321 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C__doscan_319 ' EQI4
C__doscan_321
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doscan_320 ' JUMPV addrg
C__doscan_319
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscan_320
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C__doscan_107
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


' Catalina Data

DAT ' uninitialized data segment

 long ' align long
C_sfl41_6132d129_inp_buf_L000004 ' <symbol:inp_buf>
 byte 0[512]

 long ' align long
C_sfl4_6132d129_X_table_L000003 ' <symbol:Xtable>
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

' Catalina Import strtod

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
