' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s478_66950629_s_prnt_L000001 ' <symbol:s_prnt>
 jmp #PSHM
 long $500000 ' save registers
 jmp #JMPA
 long @C_s478_66950629_s_prnt_L000001_4 ' JUMPV addrg
C_s478_66950629_s_prnt_L000001_3
 cmp r4,  #0 wz
 jmp #BRNZ
 long @C_s478_66950629_s_prnt_L000001_6 ' NEU4
 jmp #JMPA
 long @C_s478_66950629_s_prnt_L000001_5 ' JUMPV addrg
C_s478_66950629_s_prnt_L000001_6
 mov r22, r5 ' CVI, CVU or LOAD
 mov r5, r22
 adds r5, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 sub r4, #1 ' SUBU4 coni
 subs r2, #1 ' SUBI4 coni
C_s478_66950629_s_prnt_L000001_4
 mov r22, #0 ' reg <- coni
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_s478_66950629_s_prnt_L000001_3 ' GTI4
 cmps r2, r22 wz,wc
 jmp #BRAE
 long @C_s478_66950629_s_prnt_L000001_8 ' GEI4
 mov RI, r3
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478_66950629_s_prnt_L000001_3 ' NEI4
C_s478_66950629_s_prnt_L000001_8
C_s478_66950629_s_prnt_L000001_5
 mov r0, r5 ' CVI, CVU or LOAD
' C_s478_66950629_s_prnt_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s4781_66950629_u_prnt_L000009 ' <symbol:u_prnt>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #10 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_s4781_66950629_u_prnt_L000009_13 ' GTI4
 cmps r17, r20 wz,wc
 jmp #BRAE
 long @C_s4781_66950629_u_prnt_L000009_11 ' GEI4
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_s4781_66950629_u_prnt_L000009_11 ' EQU4
C_s4781_66950629_u_prnt_L000009_13
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_s4781_66950629_u_prnt_L000009_15 ' EQU4
 mov r15, r21
 sub r15, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_s4781_66950629_u_prnt_L000009_16 ' JUMPV addrg
C_s4781_66950629_u_prnt_L000009_15
 mov r15, #0 ' reg <- coni
C_s4781_66950629_u_prnt_L000009_16
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s4781_66950629_u_prnt_L000009_11
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_s4781_66950629_u_prnt_L000009_17 ' EQU4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r20, #48 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s4781_66950629_u_prnt_L000009_17
 mov r0, r23 ' CVI, CVU or LOAD
' C_s4781_66950629_u_prnt_L000009_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export strftime

 alignl ' align long
C_strftime ' <symbol:strftime>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_strftime_20 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_strftime_19 ' JUMPV addrg
C_strftime_20
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__tzset ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_strftime_23 ' JUMPV addrg
C_strftime_25
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r19, r20
 adds r19, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 sub r21, #1 ' SUBU4 coni
C_strftime_26
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_strftime_29 ' EQU4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_strftime_29 ' EQI4
 cmps r22,  #37 wz
 jmp #BRNZ
 long @C_strftime_25 ' NEI4
C_strftime_29
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_strftime_32 ' EQU4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strftime_30 ' NEI4
C_strftime_32
 jmp #JMPA
 long @C_strftime_24 ' JUMPV addrg
C_strftime_30
 adds r19, #1 ' ADDP4 coni
 mov r15, r23 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 cmps r11,  #83 wz,wc
 jmp #BR_B
 long @C_strftime_83 ' LTI4
 cmps r11,  #100 wz,wc
 jmp #BR_A
 long @C_strftime_84 ' GTI4
 mov r22, r11
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_strftime_85_L000087-332
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_strftime_85_L000087 ' <symbol:85>
 long @C_strftime_59
 long @C_strftime_81
 long @C_strftime_60
 long @C_strftime_81
 long @C_strftime_62
 long @C_strftime_68
 long @C_strftime_74
 long @C_strftime_75
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_81
 long @C_strftime_36
 long @C_strftime_38
 long @C_strftime_40
 long @C_strftime_45

' Catalina Code

DAT ' code segment
C_strftime_83
 cmps r11,  #65 wz
 jmp #BR_Z
 long @C_strftime_37 ' EQI4
 mov r22, #66 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_strftime_39 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_strftime_90 ' GTI4
' C_strftime_89 ' (symbol refcount = 0)
 cmps r11,  #37 wz
 jmp #BR_Z
 long @C_strftime_79 ' EQI4
 jmp #JMPA
 long @C_strftime_81 ' JUMPV addrg
C_strftime_90
 cmps r11,  #72 wz
 jmp #BR_Z
 long @C_strftime_46 ' EQI4
 cmps r11,  #73 wz
 jmp #BR_Z
 long @C_strftime_47 ' EQI4
 cmps r11,  #77 wz
 jmp #BR_Z
 long @C_strftime_50 ' EQI4
 jmp #JMPA
 long @C_strftime_81 ' JUMPV addrg
C_strftime_84
 mov r22, #112 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_strftime_51 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_strftime_92 ' GTI4
' C_strftime_91 ' (symbol refcount = 0)
 cmps r11,  #106 wz
 jmp #BR_Z
 long @C_strftime_48 ' EQI4
 cmps r11,  #109 wz
 jmp #BR_Z
 long @C_strftime_49 ' EQI4
 jmp #JMPA
 long @C_strftime_81 ' JUMPV addrg
C_strftime_92
 cmps r11,  #119 wz
 jmp #BR_Z
 long @C_strftime_61 ' EQI4
 cmps r11,  #120 wz
 jmp #BR_Z
 long @C_strftime_63 ' EQI4
 cmps r11,  #121 wz
 jmp #BR_Z
 long @C_strftime_73 ' EQI4
 jmp #JMPA
 long @C_strftime_81 ' JUMPV addrg
C_strftime_36
 mov r2, #3 ' reg ARG coni
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__days
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_37
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__days
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_38
 mov r2, #3 ' reg ARG coni
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__months
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_39
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__months
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_40
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_strftime_41_L000042
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_strftime
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C_strftime_43 ' EQU4
 sub r21, r13 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_44 ' JUMPV addrg
C_strftime_43
 mov r21, #0 ' reg <- coni
C_strftime_44
 adds r23, r13 ' ADDI/P (2)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_45
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_46
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_47
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #11 ' ADDI4 coni
 mov r20, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r1
 adds r22, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_48
 mov r2, #3 ' reg ARG coni
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_49
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_50
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_51
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #12 wz,wc
 jmp #BRAE
 long @C_strftime_57 ' GEI4
 jmp #LODL
 long @C_strftime_52_L000053
 mov r9, RI ' reg <- addrg
 jmp #JMPA
 long @C_strftime_58 ' JUMPV addrg
C_strftime_57
 jmp #LODL
 long @C_strftime_54_L000055
 mov r9, RI ' reg <- addrg
C_strftime_58
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_59
 mov r2, #2 ' reg ARG coni
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_60
 mov r2, #2 ' reg ARG coni
 mov r22, #7 ' reg <- coni
 mov r20, r17
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #7 ' ADDI4 coni
 mov r18, r17
 adds r18, #24 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r3, r0 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_61
 mov r2, #1 ' reg ARG coni
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_62
 mov r2, #2 ' reg ARG coni
 mov r22, #7 ' reg <- coni
 mov r20, r17
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #7 ' ADDI4 coni
 mov r18, r17
 adds r18, #24 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r18, #6 ' ADDI4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 subs r20, r1 ' SUBI/P (1)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r3, r0 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_63
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_strftime_64_L000065
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_strftime
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C_strftime_66 ' EQU4
 sub r21, r13 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_67 ' JUMPV addrg
C_strftime_66
 mov r21, #0 ' reg <- coni
C_strftime_67
 adds r23, r13 ' ADDI/P (2)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_68
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_strftime_69_L000070
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_strftime
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r13,  #0 wz
 jmp #BR_Z
 long @C_strftime_71 ' EQU4
 sub r21, r13 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_72 ' JUMPV addrg
C_strftime_71
 mov r21, #0 ' reg <- coni
C_strftime_72
 adds r23, r13 ' ADDI/P (2)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_73
 mov r2, #2 ' reg ARG coni
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r3, r1 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_74
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r22, r17
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 1900
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4781_66950629_u_prnt_L000009
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_75
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_strftime_77 ' LEI4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_strftime_78 ' JUMPV addrg
C_strftime_77
 mov r7, #0 ' reg <- coni
C_strftime_78
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__tzname
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_66950629_s_prnt_L000001
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_79
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #37 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 sub r21, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_strftime_34 ' JUMPV addrg
C_strftime_80
 adds r19, #1 ' ADDP4 coni
C_strftime_81
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strftime_80 ' NEI4
C_strftime_34
C_strftime_23
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_strftime_93 ' EQU4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strftime_26 ' NEI4
C_strftime_93
C_strftime_24
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_strftime_94 ' EQU4
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strftime_19 ' JUMPV addrg
C_strftime_94
 mov r0, #0 ' reg <- coni
C_strftime_19
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _tzname

' Catalina Import _tzset

' Catalina Import _months

' Catalina Import _days

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_strftime_69_L000070 ' <symbol:69>
 byte 37
 byte 72
 byte 58
 byte 37
 byte 77
 byte 58
 byte 37
 byte 83
 byte 0

 alignl ' align long
C_strftime_64_L000065 ' <symbol:64>
 byte 37
 byte 97
 byte 32
 byte 37
 byte 98
 byte 32
 byte 37
 byte 100
 byte 32
 byte 37
 byte 89
 byte 0

 alignl ' align long
C_strftime_54_L000055 ' <symbol:54>
 byte 80
 byte 77
 byte 0

 alignl ' align long
C_strftime_52_L000053 ' <symbol:52>
 byte 65
 byte 77
 byte 0

 alignl ' align long
C_strftime_41_L000042 ' <symbol:41>
 byte 37
 byte 97
 byte 32
 byte 37
 byte 98
 byte 32
 byte 37
 byte 100
 byte 32
 byte 37
 byte 72
 byte 58
 byte 37
 byte 77
 byte 58
 byte 37
 byte 83
 byte 32
 byte 37
 byte 89
 byte 0

' Catalina Code

DAT ' code segment
' end
