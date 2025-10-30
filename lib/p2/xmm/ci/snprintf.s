' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s10is_68fd76f0_imaxdiv_L000004 ' <symbol:imaxdiv>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r1, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 cmps r3, r22 wz,wc
 jmp #BRAE
 long @C_s10is_68fd76f0_imaxdiv_L000004_8 ' GEI4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz,wc
 jmp #BRBE
 long @C_s10is_68fd76f0_imaxdiv_L000004_8 ' LEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, r2 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is_68fd76f0_imaxdiv_L000004_8
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C_s10is_68fd76f0_imaxdiv_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export rpl_vsnprintf

 alignl ' align long
C_rpl_vsnprintf ' <symbol:rpl_vsnprintf>
 jmp #NEWF
 sub SP, #76
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r7, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
 mov r13, #0 ' reg <- coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_26 ' NEU4
 cmp r21, r22 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_26 ' EQU4
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_26 ' JUMPV addrg
C_rpl_vsnprintf_25
 cmps r13,  #0 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_28 ' LTI4
 cmps r13,  #6 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_28 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_191_L000193
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_191_L000193 ' <symbol:191>
 long @C_rpl_vsnprintf_30
 long @C_rpl_vsnprintf_38
 long @C_rpl_vsnprintf_50
 long @C_rpl_vsnprintf_60
 long @C_rpl_vsnprintf_63
 long @C_rpl_vsnprintf_74
 long @C_rpl_vsnprintf_91

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_30
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_31 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_32 ' JUMPV addrg
C_rpl_vsnprintf_31
' C_rpl_vsnprintf_33 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 cmp r22, r21 wz,wc 
 jmp #BRAE
 long @C_rpl_vsnprintf_36 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 adds r22, r23 ' ADDI/P (1)
 mov RI, r22
 mov BC, r15
 jmp #WBYT ' ASGNU1 reg reg
C_rpl_vsnprintf_36
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
' C_rpl_vsnprintf_34 ' (symbol refcount = 0)
C_rpl_vsnprintf_32
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_38
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #39 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_47 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_49 ' GTI4
' C_rpl_vsnprintf_48 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #32 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_44 ' EQI4
 cmps r22,  #35 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_45 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_39 ' JUMPV addrg
C_rpl_vsnprintf_49
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #43 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_43 ' EQI4
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_42 ' EQI4
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_46 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_39 ' JUMPV addrg
C_rpl_vsnprintf_42
 or r7, #1 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_43
 or r7, #2 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_44
 or r7, #4 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_45
 or r7, #8 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_46
 or r7, #16 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_47
 or r7, #32 ' BORI4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_39
 mov r13, #2 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_50
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #48 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_51 ' GTI4
 cmps r22,  #57 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_51 ' GTI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r9, r0 wz,wc
 jmp #BRBE
 long @C_rpl_vsnprintf_53 ' LEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_55 ' JUMPV addrg
C_rpl_vsnprintf_53
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r9, r0 ' ADDI/P
 adds r9, r22 ' ADDI/P (3)
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_51
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_56 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_rpl_vsnprintf_58 ' GEI4
 or r7, #1 ' BORI4 coni
 neg r9, r9 ' NEGI4
C_rpl_vsnprintf_58
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r13, #3 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_56
 mov r13, #3 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_60
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_61 ' NEI4
 mov r13, #4 ' reg <- coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_61
 mov r13, #5 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_63
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r11, r22 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_64 ' NEI4
 mov r11, #0 ' reg <- coni
C_rpl_vsnprintf_64
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #48 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_66 ' GTI4
 cmps r22,  #57 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_66 ' GTI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r20, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r11, r0 wz,wc
 jmp #BRBE
 long @C_rpl_vsnprintf_68 ' LEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_55 ' JUMPV addrg
C_rpl_vsnprintf_68
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r11, r0 ' ADDI/P
 adds r11, r22 ' ADDI/P (3)
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_66
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_70 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r11, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_rpl_vsnprintf_72 ' GEI4
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
C_rpl_vsnprintf_72
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r13, #5 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_70
 mov r13, #5 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_74
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #104 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_78 ' EQI4
 cmps r22,  #106 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_85 ' EQI4
 mov r20, #108 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_81 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_89 ' GTI4
' C_rpl_vsnprintf_88 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_84 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_75 ' JUMPV addrg
C_rpl_vsnprintf_89
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #116 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_86 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_75 ' LTI4
' C_rpl_vsnprintf_90 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #122 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_87 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_75 ' JUMPV addrg
C_rpl_vsnprintf_78
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #104 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_79 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_79
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_81
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #108 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_82 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_82
 mov r22, #3 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_84
 mov r22, #5 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_85
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_86
 mov r22, #7 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 jmp #JMPA
 long @C_rpl_vsnprintf_76 ' JUMPV addrg
C_rpl_vsnprintf_87
 mov r22, #6 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
C_rpl_vsnprintf_75
C_rpl_vsnprintf_76
 mov r13, #6 ' reg <- coni
 jmp #JMPA
 long @C_rpl_vsnprintf_29 ' JUMPV addrg
C_rpl_vsnprintf_91
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #65 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_180 ' LTI4
 cmps r22,  #71 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_181 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_182_L000184-260
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_182_L000184 ' <symbol:182>
 long @C_rpl_vsnprintf_130
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_130
 long @C_rpl_vsnprintf_136
 long @C_rpl_vsnprintf_133

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_180
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_174 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_181
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #88 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_109 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_93 ' LTI4
' C_rpl_vsnprintf_186 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #97 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_93 ' LTI4
 cmps r22,  #120 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_93 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_187_L000189-388
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_187_L000189 ' <symbol:187>
 long @C_rpl_vsnprintf_137
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_148
 long @C_rpl_vsnprintf_95
 long @C_rpl_vsnprintf_137
 long @C_rpl_vsnprintf_143
 long @C_rpl_vsnprintf_140
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_95
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_160
 long @C_rpl_vsnprintf_111
 long @C_rpl_vsnprintf_155
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_154
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_114
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_93
 long @C_rpl_vsnprintf_110

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_95
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_96 ' LTI4
 cmps r22,  #8 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_96 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_105_L000107-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_105_L000107 ' <symbol:105>
 long @C_rpl_vsnprintf_98
 long @C_rpl_vsnprintf_99
 long @C_rpl_vsnprintf_100
 long @C_rpl_vsnprintf_101
 long @C_rpl_vsnprintf_96
 long @C_rpl_vsnprintf_102
 long @C_rpl_vsnprintf_104
 long @C_rpl_vsnprintf_103

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_98
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_99
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_100
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_101
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_102
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_103
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_104
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_97 ' JUMPV addrg
C_rpl_vsnprintf_96
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_rpl_vsnprintf_97
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov r5, #10 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -28 ' stack ARG INDIR ADDRLi
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #32 ' arg size, rpsize = 0, spsize = 32
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is2_68fd76f0_fmtint_L000013
 add SP, #28 ' CALL addrg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_109
 or r7, #64 ' BORI4 coni
C_rpl_vsnprintf_110
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_rpl_vsnprintf_111
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_112 ' NEI4
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_rpl_vsnprintf_112
C_rpl_vsnprintf_114
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_115 ' NEI4
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_rpl_vsnprintf_115
 or r7, #128 ' BORI4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_117 ' LTI4
 cmps r22,  #8 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_117 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_126_L000128-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_126_L000128 ' <symbol:126>
 long @C_rpl_vsnprintf_119
 long @C_rpl_vsnprintf_120
 long @C_rpl_vsnprintf_121
 long @C_rpl_vsnprintf_122
 long @C_rpl_vsnprintf_117
 long @C_rpl_vsnprintf_123
 long @C_rpl_vsnprintf_125
 long @C_rpl_vsnprintf_124

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_119
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_120
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_121
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_122
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_123
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_124
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_125
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_118 ' JUMPV addrg
C_rpl_vsnprintf_117
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_rpl_vsnprintf_118
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -28 ' stack ARG INDIR ADDRLi
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #32 ' arg size, rpsize = 0, spsize = 32
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is2_68fd76f0_fmtint_L000013
 add SP, #28 ' CALL addrg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_130
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_131 ' NEI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 or r7, r22 ' BORI/U (1)
C_rpl_vsnprintf_131
C_rpl_vsnprintf_133
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #71 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_134 ' NEI4
 or r7, #256 ' BORI4 coni
C_rpl_vsnprintf_134
C_rpl_vsnprintf_136
 or r7, #64 ' BORI4 coni
C_rpl_vsnprintf_137
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #101 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_138 ' NEI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 or r7, r22 ' BORI/U (1)
C_rpl_vsnprintf_138
C_rpl_vsnprintf_140
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #103 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_141 ' NEI4
 or r7, #256 ' BORI4 coni
C_rpl_vsnprintf_141
C_rpl_vsnprintf_143
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #5 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_144 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNF4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_145 ' JUMPV addrg
C_rpl_vsnprintf_144
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNF4 addrli reg
C_rpl_vsnprintf_145
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r11 ' CVI, CVU or LOAD
 mov r5, r9 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -36 ' stack ARG INDIR ADDRLi
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #32 ' arg size, rpsize = 0, spsize = 32
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is3_68fd76f0_fmtflt_L000014
 add SP, #28 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_93 ' EQI4
 jmp #JMPA
 long @C_rpl_vsnprintf_55 ' JUMPV addrg
C_rpl_vsnprintf_148
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
' C_rpl_vsnprintf_149 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 cmp r22, r21 wz,wc 
 jmp #BRAE
 long @C_rpl_vsnprintf_152 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 adds r22, r23 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_rpl_vsnprintf_152
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_154
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is1_68fd76f0_fmtstr_L000012
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_155
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_156 ' NEU4
 mov r2, r7 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_rpl_vsnprintf_158_L000159
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is1_68fd76f0_fmtstr_L000012
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_156
 or r7, #8 ' BORI4 coni
 or r7, #128 ' BORI4 coni
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov r5, #16 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, FP
 sub RI, #-(-8)
 jmp #PSHL ' stack ARG ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #32 ' arg size, rpsize = 0, spsize = 32
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is2_68fd76f0_fmtint_L000013
 add SP, #28 ' CALL addrg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_160
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz,wc
 jmp #BR_B
 long @C_rpl_vsnprintf_161 ' LTI4
 cmps r22,  #8 wz,wc
 jmp #BR_A
 long @C_rpl_vsnprintf_161 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_rpl_vsnprintf_170_L000172-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rpl_vsnprintf_170_L000172 ' <symbol:170>
 long @C_rpl_vsnprintf_163
 long @C_rpl_vsnprintf_164
 long @C_rpl_vsnprintf_165
 long @C_rpl_vsnprintf_166
 long @C_rpl_vsnprintf_161
 long @C_rpl_vsnprintf_167
 long @C_rpl_vsnprintf_169
 long @C_rpl_vsnprintf_168

' Catalina Code

DAT ' code segment
C_rpl_vsnprintf_163
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNI1 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_164
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_165
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_166
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_167
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_168
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_169
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_161
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_93 ' JUMPV addrg
C_rpl_vsnprintf_174
' C_rpl_vsnprintf_175 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 cmp r22, r21 wz,wc 
 jmp #BRAE
 long @C_rpl_vsnprintf_178 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 adds r22, r23 ' ADDI/P (1)
 mov RI, r22
 mov BC, r15
 jmp #WBYT ' ASGNU1 reg reg
C_rpl_vsnprintf_178
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_rpl_vsnprintf_93
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
 mov r22, #0 ' reg <- coni
 mov r13, r22 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
C_rpl_vsnprintf_28
C_rpl_vsnprintf_29
C_rpl_vsnprintf_26
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_25 ' NEI4
C_rpl_vsnprintf_55
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22, r21 wz,wc 
 jmp #BRAE
 long @C_rpl_vsnprintf_194 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 adds r22, r23 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_rpl_vsnprintf_195 ' JUMPV addrg
C_rpl_vsnprintf_194
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_rpl_vsnprintf_196 ' EQU4
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_rpl_vsnprintf_196
C_rpl_vsnprintf_195
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vsnprintf_200 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_rpl_vsnprintf_198 ' LEU4
C_rpl_vsnprintf_200
 mov r22, #104 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_rpl_vsnprintf_22 ' JUMPV addrg
C_rpl_vsnprintf_198
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r0, r22 ' CVI, CVU or LOAD
C_rpl_vsnprintf_22
 jmp #POPM ' restore registers
 add SP, #76 ' framesize
 jmp #RETF


 alignl ' align long
C_s10is1_68fd76f0_fmtstr_L000012 ' <symbol:fmtstr>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r3, r22 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_203 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s10is1_68fd76f0_fmtstr_L000012_204 ' JUMPV addrg
C_s10is1_68fd76f0_fmtstr_L000012_203
 mov r17, #0 ' reg <- coni
C_s10is1_68fd76f0_fmtstr_L000012_204
 mov r19, r17 ' CVI, CVU or LOAD
 mov r22, r5 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_205 ' NEU4
 jmp #LODL
 long @C_s10is1_68fd76f0_fmtstr_L000012_207_L000208
 mov r5, RI ' reg <- addrg
C_s10is1_68fd76f0_fmtstr_L000012_205
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_s10is1_68fd76f0_fmtstr_L000012_212 ' JUMPV addrg
C_s10is1_68fd76f0_fmtstr_L000012_210
 adds r21, #1 ' ADDI4 coni
C_s10is1_68fd76f0_fmtstr_L000012_212
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_214 ' NEI4
 cmps r21, r3 wz,wc
 jmp #BRAE
 long @C_s10is1_68fd76f0_fmtstr_L000012_213 ' GEI4
C_s10is1_68fd76f0_fmtstr_L000012_214
 mov r22, r21 ' ADDI/P
 adds r22, r5 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_210 ' NEI4
C_s10is1_68fd76f0_fmtstr_L000012_213
 mov r22, r4 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s10is1_68fd76f0_fmtstr_L000012_215 ' GEI4
 mov r23, #0 ' reg <- coni
C_s10is1_68fd76f0_fmtstr_L000012_215
 mov r22, r2
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is1_68fd76f0_fmtstr_L000012_220 ' EQI4
 neg r23, r23 ' NEGI4
 jmp #JMPA
 long @C_s10is1_68fd76f0_fmtstr_L000012_220 ' JUMPV addrg
C_s10is1_68fd76f0_fmtstr_L000012_219
' C_s10is1_68fd76f0_fmtstr_L000012_222 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is1_68fd76f0_fmtstr_L000012_225 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is1_68fd76f0_fmtstr_L000012_225
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is1_68fd76f0_fmtstr_L000012_223 ' (symbol refcount = 0)
 subs r23, #1 ' SUBI4 coni
C_s10is1_68fd76f0_fmtstr_L000012_220
 cmps r23,  #0 wz,wc
 jmp #BR_A
 long @C_s10is1_68fd76f0_fmtstr_L000012_219 ' GTI4
 jmp #JMPA
 long @C_s10is1_68fd76f0_fmtstr_L000012_228 ' JUMPV addrg
C_s10is1_68fd76f0_fmtstr_L000012_227
' C_s10is1_68fd76f0_fmtstr_L000012_230 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is1_68fd76f0_fmtstr_L000012_233 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov RI, r5
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is1_68fd76f0_fmtstr_L000012_233
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is1_68fd76f0_fmtstr_L000012_231 ' (symbol refcount = 0)
 adds r5, #1 ' ADDP4 coni
C_s10is1_68fd76f0_fmtstr_L000012_228
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_236 ' NEI4
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 subs r3, #1 ' SUBI4 coni
 cmps r20, r22 wz,wc
 jmp #BRBE
 long @C_s10is1_68fd76f0_fmtstr_L000012_235 ' LEI4
C_s10is1_68fd76f0_fmtstr_L000012_236
 mov RI, r5
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s10is1_68fd76f0_fmtstr_L000012_227 ' NEI4
C_s10is1_68fd76f0_fmtstr_L000012_235
 jmp #JMPA
 long @C_s10is1_68fd76f0_fmtstr_L000012_238 ' JUMPV addrg
C_s10is1_68fd76f0_fmtstr_L000012_237
' C_s10is1_68fd76f0_fmtstr_L000012_240 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is1_68fd76f0_fmtstr_L000012_243 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is1_68fd76f0_fmtstr_L000012_243
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is1_68fd76f0_fmtstr_L000012_241 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_s10is1_68fd76f0_fmtstr_L000012_238
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_s10is1_68fd76f0_fmtstr_L000012_237 ' LTI4
' C_s10is1_68fd76f0_fmtstr_L000012_201 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s10is2_68fd76f0_fmtint_L000013 ' <symbol:fmtint>
 jmp #NEWF
 sub SP, #72
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r7, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-52)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r9, r17
 and r9, #32 ' BANDI4 coni
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_s10is2_68fd76f0_fmtint_L000013_247 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_248 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_247
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_248
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_249 ' EQI4
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_250 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_249
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s10is2_68fd76f0_fmtint_L000013_252 ' LTI4
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_253 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_252
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_253
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_254 ' GEI4
 mov r7, #45 ' reg <- coni
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_255 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_254
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_256 ' EQI4
 mov r7, #43 ' reg <- coni
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_257 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_256
 mov r22, r17
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_258 ' EQI4
 mov r7, #32 ' reg <- coni
C_s10is2_68fd76f0_fmtint_L000013_258
C_s10is2_68fd76f0_fmtint_L000013_257
C_s10is2_68fd76f0_fmtint_L000013_255
C_s10is2_68fd76f0_fmtint_L000013_250
 mov r2, r17
 and r2, #64 ' BANDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #43 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-48) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -56 ' stack ARG INDIR ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is7_68fd76f0_convert_L000018
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_260 ' EQI4
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_260 ' EQU4
 mov r22, #8 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_264 ' EQI4
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_s10is2_68fd76f0_fmtint_L000013_262 ' LTI4
' C_s10is2_68fd76f0_fmtint_L000013_271 ' (symbol refcount = 0)
 cmps r23,  #16 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_267 ' EQI4
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_262 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_264
 cmps r19, r15 wz,wc
 jmp #BR_A
 long @C_s10is2_68fd76f0_fmtint_L000013_263 ' GTI4
 mov r19, r15
 adds r19, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_263 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_267
 mov r22, r17
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_269 ' EQI4
 mov r22, #88 ' reg <- coni
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_270 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_269
 mov r22, #120 ' reg <- coni
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_270
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-52)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_262
C_s10is2_68fd76f0_fmtint_L000013_263
C_s10is2_68fd76f0_fmtint_L000013_260
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_272 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is5_68fd76f0_getnumsep_L000016 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
C_s10is2_68fd76f0_fmtint_L000013_272
 mov r22, r19 ' SUBI/P
 subs r22, r15 ' SUBI/P (3)
 mov r11, r22 ' SUBI/P
 subs r11, r9 ' SUBI/P (3)
 cmps r19, r15 wz,wc
 jmp #BR_B
 long @C_s10is2_68fd76f0_fmtint_L000013_277 ' LTI4
 mov RI, FP
 sub RI, #-(-68)
 wrlong r19, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_278 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_277
 mov RI, FP
 sub RI, #-(-68)
 wrlong r15, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_278
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_279 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_280 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_279
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_280
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_281 ' EQI4
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_282 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_281
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is2_68fd76f0_fmtint_L000013_282
 mov r22, r21 ' SUBI/P
 subs r22, r9 ' SUBI/P (3)
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 subs r22, r20 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 subs r22, r20 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r13, r22 ' SUBI/P
 subs r13, r20 ' SUBI/P (3)
 cmps r11,  #0 wz,wc
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_283 ' GEI4
 mov r11, #0 ' reg <- coni
C_s10is2_68fd76f0_fmtint_L000013_283
 cmps r13,  #0 wz,wc
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_285 ' GEI4
 mov r13, #0 ' reg <- coni
C_s10is2_68fd76f0_fmtint_L000013_285
 mov r22, r17
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_287 ' EQI4
 neg r13, r13 ' NEGI4
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_292 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_287
 mov r22, #0 ' reg <- coni
 mov r20, r17
 and r20, #16 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_292 ' EQI4
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_292 ' EQI4
 adds r11, r13 ' ADDI/P (1)
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_292 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_291
' C_s10is2_68fd76f0_fmtint_L000013_294 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_297 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_297
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_295 ' (symbol refcount = 0)
 subs r13, #1 ' SUBI4 coni
C_s10is2_68fd76f0_fmtint_L000013_292
 cmps r13,  #0 wz,wc
 jmp #BR_A
 long @C_s10is2_68fd76f0_fmtint_L000013_291 ' GTI4
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_299 ' EQI4
' C_s10is2_68fd76f0_fmtint_L000013_301 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_304 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r7
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_304
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_302 ' (symbol refcount = 0)
C_s10is2_68fd76f0_fmtint_L000013_299
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is2_68fd76f0_fmtint_L000013_319 ' EQI4
' C_s10is2_68fd76f0_fmtint_L000013_308 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_311 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_311
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_309 ' (symbol refcount = 0)
' C_s10is2_68fd76f0_fmtint_L000013_313 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_316 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_316
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_319 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_318
' C_s10is2_68fd76f0_fmtint_L000013_321 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_324 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_324
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_322 ' (symbol refcount = 0)
 subs r11, #1 ' SUBI4 coni
C_s10is2_68fd76f0_fmtint_L000013_319
 cmps r11,  #0 wz,wc
 jmp #BR_A
 long @C_s10is2_68fd76f0_fmtint_L000013_318 ' GTI4
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_327 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_326
 subs r15, #1 ' SUBI4 coni
' C_s10is2_68fd76f0_fmtint_L000013_329 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_332 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 adds r20, r15 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_332
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_330 ' (symbol refcount = 0)
 mov r22, #0 ' reg <- coni
 cmps r9, r22 wz,wc
 jmp #BRBE
 long @C_s10is2_68fd76f0_fmtint_L000013_334 ' LEI4
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_s10is2_68fd76f0_fmtint_L000013_334 ' LEI4
 mov r20, #3 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_s10is2_68fd76f0_fmtint_L000013_334 ' NEI4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s10is4_68fd76f0_printsep_L000015
 add SP, #8 ' CALL addrg
C_s10is2_68fd76f0_fmtint_L000013_334
C_s10is2_68fd76f0_fmtint_L000013_327
 cmps r15,  #0 wz,wc
 jmp #BR_A
 long @C_s10is2_68fd76f0_fmtint_L000013_326 ' GTI4
 jmp #JMPA
 long @C_s10is2_68fd76f0_fmtint_L000013_337 ' JUMPV addrg
C_s10is2_68fd76f0_fmtint_L000013_336
' C_s10is2_68fd76f0_fmtint_L000013_339 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is2_68fd76f0_fmtint_L000013_342 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is2_68fd76f0_fmtint_L000013_342
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is2_68fd76f0_fmtint_L000013_340 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_s10is2_68fd76f0_fmtint_L000013_337
 cmps r13,  #0 wz,wc
 jmp #BR_B
 long @C_s10is2_68fd76f0_fmtint_L000013_336 ' LTI4
' C_s10is2_68fd76f0_fmtint_L000013_245 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #72 ' framesize
 jmp #RETF


 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014 ' <symbol:fmtflt>
 jmp #NEWF
 sub SP, #188
 jmp #PSHM
 long $ffea80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-112)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-152)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-116)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r7, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-148)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-104)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r9, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r22, r19
 and r22, #32 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-108)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 and r22, r19 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_345 ' NEI4
 mov r21, #6 ' reg <- coni
C_s10is3_68fd76f0_fmtflt_L000014_345
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_349_L000350
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_347 ' GEF4
 mov r22, #45 ' reg <- coni
 mov RI, FP
 sub RI, #-(-116)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_348 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_347
 mov r22, r19
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_351 ' EQI4
 mov r22, #43 ' reg <- coni
 mov RI, FP
 sub RI, #-(-116)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_352 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_351
 mov r22, r19
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_353 ' EQI4
 mov r22, #32 ' reg <- coni
 mov RI, FP
 sub RI, #-(-116)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_353
C_s10is3_68fd76f0_fmtflt_L000014_352
C_s10is3_68fd76f0_fmtflt_L000014_348
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_355 ' EQF4
 mov r22, r19
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_362 ' EQI4
 jmp #LODL
 long @C_s10is3_68fd76f0_fmtflt_L000014_357_L000358
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-156)
 wrlong r22 , RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_363 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_362
 jmp #LODL
 long @C_s10is3_68fd76f0_fmtflt_L000014_359_L000360
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-156)
 wrlong r22 , RI ' ASGNP4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_363
 mov r22, FP
 sub r22, #-(-156) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-112)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_356 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_355
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_367_L000368
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_366 ' LTF4
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_369_L000370
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_364 ' LEF4
C_s10is3_68fd76f0_fmtflt_L000014_366
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_364 ' NEF4
 mov r22, r19
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_376 ' EQI4
 jmp #LODL
 long @C_s10is3_68fd76f0_fmtflt_L000014_371_L000372
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-160)
 wrlong r22 , RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_377 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_376
 jmp #LODL
 long @C_s10is3_68fd76f0_fmtflt_L000014_373_L000374
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-160)
 wrlong r22 , RI ' ASGNP4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_377
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-112)
 wrlong r22, RI ' ASGNP4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_364
C_s10is3_68fd76f0_fmtflt_L000014_356
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_378 ' EQU4
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_383 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_383 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_382
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-112)
 wrlong r18, RI ' ASGNP4 addrli reg
 mov r18, FP
 sub r18, #-(-48) ' reg <- addrli
 adds r22, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_383
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_382 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-48) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 16 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 12 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is1_68fd76f0_fmtstr_L000012
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_344 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_378
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r20, r19 ' BANDI/U (2)
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_387 ' NEI4
 mov r20, r19
 and r20, #256 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_385 ' EQI4
C_s10is3_68fd76f0_fmtflt_L000014_387
 mov r22, r19
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_388 ' EQI4
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_390 ' NEI4
 mov r21, #1 ' reg <- coni
C_s10is3_68fd76f0_fmtflt_L000014_390
 subs r21, #1 ' SUBI4 coni
 mov r22, r19
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_392 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-148)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_392
C_s10is3_68fd76f0_fmtflt_L000014_388
 mov RI, FP
 add RI, #20
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is6_68fd76f0_getexponent_L000017 ' CALL addrg
 mov RI, FP
 sub RI, #-(-120)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_385
C_s10is3_68fd76f0_fmtflt_L000014_394
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-164)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-164) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, #8 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_401 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_395 ' LTI4
' C_s10is3_68fd76f0_fmtflt_L000014_406 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-164) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmps r22,  #16 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_398 ' EQI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_395 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_398
 cmps r21,  #38 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_396 ' LEI4
 mov r21, #38 ' reg <- coni
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_396 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_401
 cmps r21,  #19 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_396 ' LEI4
 mov r21, #19 ' reg <- coni
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_396 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_395
 cmps r21,  #9 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_396 ' LEI4
 mov r21, #9 ' reg <- coni
C_s10is3_68fd76f0_fmtflt_L000014_396
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_349_L000350
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_408 ' LTF4
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov RI, FP
 sub RI, #-(-168)
 wrlong r22, RI ' ASGNF4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_409 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_408
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 xor r22, Bit31 ' NEGF4
 mov RI, FP
 sub RI, #-(-168)
 wrlong r22, RI ' ASGNF4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_409
 mov r22, FP
 sub r22, #-(-168) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_410 ' EQI4
 mov RI, FP
 sub RI, #-(-120)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10isa_68fd76f0_mypow10_L000021 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov RI, FP
 sub RI, #-(-132)
 wrlong r0, RI ' ASGNF4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_410
 mov RI, FP
 sub RI, #-(-132)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is8_68fd76f0_cast_L000019 ' CALL addrg
 mov RI, FP
 sub RI, #-(-128)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r0, r20 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_412 ' NEU4
 mov r22, #1 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_344 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_412
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10isa_68fd76f0_mypow10_L000021 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_417_L000418
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_415 ' LTF4
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #INFL ' CVFI4
 mov r20, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $80000000
 mov r18, RI ' reg <- con
 add r20, r18 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-172)
 wrlong r20, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_416 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_415
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-172)
 wrlong r22, RI ' ASGNU4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_416
 mov r22, FP
 sub r22, #-(-172) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov RI, FP
 sub RI, #-(-144)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_421_L000422
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-144) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-128) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 regl
 mov r14, r20 ' RSHU
 shr r14, r18 ' RSHU (3)
 mov r0, r14 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-176)
 wrlong r0, RI ' ASGNF4 addrli reg
 and r20, #1 ' BANDU4 coni
 mov r0, r20 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r20, FP
 sub r20, #-(-176) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-180)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r16
 shr RI, r18
 mov r18, RI ' RSHU (2)
 mov r0, r18 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-184)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, r16
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-184) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r22, FP
 sub r22, #-(-180) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is9_68fd76f0_myround_L000020 ' CALL addrg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-144) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r0, r20 wz,wc 
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_419' LTU4
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-128)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-140)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_423 ' EQI4
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #10 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_423 ' NEU4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-128)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_423
C_s10is3_68fd76f0_fmtflt_L000014_419
 mov r22, #0 ' reg <- coni
 mov r20, r19
 and r20, #256 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_425 ' EQI4
 mov r20, FP
 sub r20, #-(-124) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_425 ' EQI4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 cmps r20, r22 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_425 ' LEI4
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_425 ' LTI4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r21, r22 ' SUBI/P (1)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_394 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_425
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_427 ' EQI4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_429 ' GEI4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #45 ' reg <- coni
 mov RI, FP
 sub RI, #-(-152)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_430 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_429
 mov r22, #43 ' reg <- coni
 mov RI, FP
 sub RI, #-(-152)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_430
 mov r2, #0 ' reg ARG coni
 mov r3, #10 ' reg ARG coni
 mov r4, #3 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-100) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is7_68fd76f0_convert_L000018
 add SP, #16 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmps r11,  #1 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_431 ' NEI4
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_431
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-152) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 mov r20, r19
 and r20, #64 ' BANDI4 coni
 cmps r20,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_434 ' EQI4
 mov r20, #69 ' reg <- coni
 mov RI, FP
 sub RI, #-(-188)
 wrlong r20, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_435 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_434
 mov r20, #101 ' reg <- coni
 mov RI, FP
 sub RI, #-(-188)
 wrlong r20, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_435
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-188) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_427
 mov r2, #0 ' reg ARG coni
 mov r3, #10 ' reg ARG coni
 mov r4, #43 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-48) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -128 ' stack ARG INDIR ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is7_68fd76f0_convert_L000018
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_436 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov r3, #10 ' reg ARG coni
 mov r4, #43 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-92) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -140 ' stack ARG INDIR ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s10is7_68fd76f0_convert_L000018
 add SP, #16 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_s10is3_68fd76f0_fmtflt_L000014_436
 mov r7, r21 ' SUBI/P
 subs r7, r13 ' SUBI/P (3)
 mov r22, FP
 sub r22, #-(-148) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_438 ' EQI4
 cmps r13,  #0 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_440 ' LEI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_443 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_442
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-104)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_443
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22, r13 wz,wc
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_445 ' GEI4
 mov r20, FP
 sub r20, #-(-92) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_442 ' EQI4
C_s10is3_68fd76f0_fmtflt_L000014_445
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_441 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_440
 mov RI, FP
 sub RI, #-(-104)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov r7, #0 ' reg <- coni
C_s10is3_68fd76f0_fmtflt_L000014_441
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r21, r22 ' SUBI/P (1)
C_s10is3_68fd76f0_fmtflt_L000014_438
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_448 ' GTI4
 mov r20, r19
 and r20, #8 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_446 ' EQI4
C_s10is3_68fd76f0_fmtflt_L000014_448
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_446
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_449 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is5_68fd76f0_getnumsep_L000016 ' CALL addrg
 mov RI, FP
 sub RI, #-(-108)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_449
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_453 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-188)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_454 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_453
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-188)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_454
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_455 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_456 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_455
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s10is3_68fd76f0_fmtflt_L000014_456
 mov r22, r23 ' SUBI/P
 subs r22, r15 ' SUBI/P (3)
 subs r22, r11 ' SUBI/P (1)
 subs r22, r21 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 subs r22, r20 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-188) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 subs r22, r20 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-192) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r9, r22 ' SUBI/P
 subs r9, r20 ' SUBI/P (3)
 cmps r9,  #0 wz,wc
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_457 ' GEI4
 mov r9, #0 ' reg <- coni
C_s10is3_68fd76f0_fmtflt_L000014_457
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_459 ' EQI4
 neg r9, r9 ' NEGI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_479 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_459
 mov r22, #0 ' reg <- coni
 mov r20, r19
 and r20, #16 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_479 ' EQI4
 cmps r9, r22 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_479 ' LEI4
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_471 ' EQI4
' C_s10is3_68fd76f0_fmtflt_L000014_465 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_468 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_468
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_466 ' (symbol refcount = 0)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-116)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_471 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_470
' C_s10is3_68fd76f0_fmtflt_L000014_473 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_476 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_476
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_474 ' (symbol refcount = 0)
 subs r9, #1 ' SUBI4 coni
C_s10is3_68fd76f0_fmtflt_L000014_471
 cmps r9,  #0 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_470 ' GTI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_479 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_478
' C_s10is3_68fd76f0_fmtflt_L000014_481 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_484 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_484
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_482 ' (symbol refcount = 0)
 subs r9, #1 ' SUBI4 coni
C_s10is3_68fd76f0_fmtflt_L000014_479
 cmps r9,  #0 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_478 ' GTI4
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_494 ' EQI4
' C_s10is3_68fd76f0_fmtflt_L000014_488 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_491 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_491
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_494 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_493
 subs r15, #1 ' SUBI4 coni
' C_s10is3_68fd76f0_fmtflt_L000014_496 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_499 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 adds r20, r15 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_499
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_497 ' (symbol refcount = 0)
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_501 ' LEI4
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_s10is3_68fd76f0_fmtflt_L000014_501 ' LEI4
 mov r20, #3 ' reg <- coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BRNZ
 long @C_s10is3_68fd76f0_fmtflt_L000014_501 ' NEI4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s10is4_68fd76f0_printsep_L000015
 add SP, #8 ' CALL addrg
C_s10is3_68fd76f0_fmtflt_L000014_501
C_s10is3_68fd76f0_fmtflt_L000014_494
 cmps r15,  #0 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_493 ' GTI4
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s10is3_68fd76f0_fmtflt_L000014_511 ' EQI4
' C_s10is3_68fd76f0_fmtflt_L000014_505 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_508 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #46 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_508
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_511 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_510
' C_s10is3_68fd76f0_fmtflt_L000014_513 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_516 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_516
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_514 ' (symbol refcount = 0)
 subs r7, #1 ' SUBI4 coni
C_s10is3_68fd76f0_fmtflt_L000014_511
 cmps r7,  #0 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_510 ' GTI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_519 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_518
 subs r13, #1 ' SUBI4 coni
' C_s10is3_68fd76f0_fmtflt_L000014_521 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_524 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-92) ' reg <- addrli
 adds r20, r13 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_524
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_522 ' (symbol refcount = 0)
C_s10is3_68fd76f0_fmtflt_L000014_519
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r13, r22 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_518 ' GTI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_527 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_526
 subs r11, #1 ' SUBI4 coni
' C_s10is3_68fd76f0_fmtflt_L000014_529 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_532 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-100) ' reg <- addrli
 adds r20, r11 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_532
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_530 ' (symbol refcount = 0)
C_s10is3_68fd76f0_fmtflt_L000014_527
 cmps r11,  #0 wz,wc
 jmp #BR_A
 long @C_s10is3_68fd76f0_fmtflt_L000014_526 ' GTI4
 jmp #JMPA
 long @C_s10is3_68fd76f0_fmtflt_L000014_535 ' JUMPV addrg
C_s10is3_68fd76f0_fmtflt_L000014_534
' C_s10is3_68fd76f0_fmtflt_L000014_537 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s10is3_68fd76f0_fmtflt_L000014_540 ' GEU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is3_68fd76f0_fmtflt_L000014_540
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is3_68fd76f0_fmtflt_L000014_538 ' (symbol refcount = 0)
 adds r9, #1 ' ADDI4 coni
C_s10is3_68fd76f0_fmtflt_L000014_535
 cmps r9,  #0 wz,wc
 jmp #BR_B
 long @C_s10is3_68fd76f0_fmtflt_L000014_534 ' LTI4
C_s10is3_68fd76f0_fmtflt_L000014_344
 jmp #POPM ' restore registers
 add SP, #188 ' framesize
 jmp #RETF


 alignl ' align long
C_s10is4_68fd76f0_printsep_L000015 ' <symbol:printsep>
 jmp #PSHM
 long $500000 ' save registers
' C_s10is4_68fd76f0_printsep_L000015_543 ' (symbol refcount = 0)
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 cmp r22, r2 wz,wc 
 jmp #BRAE
 long @C_s10is4_68fd76f0_printsep_L000015_546 ' GEU4
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 adds r22, r4 ' ADDI/P (1)
 mov r20, #44 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s10is4_68fd76f0_printsep_L000015_546
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
' C_s10is4_68fd76f0_printsep_L000015_544 ' (symbol refcount = 0)
' C_s10is4_68fd76f0_printsep_L000015_542 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s10is5_68fd76f0_getnumsep_L000016 ' <symbol:getnumsep>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, #3 ' reg <- coni
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1,  #0 wz
 jmp #BRNZ
 long @C_s10is5_68fd76f0_getnumsep_L000016_550 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s10is5_68fd76f0_getnumsep_L000016_551 ' JUMPV addrg
C_s10is5_68fd76f0_getnumsep_L000016_550
 mov r23, #0 ' reg <- coni
C_s10is5_68fd76f0_getnumsep_L000016_551
 mov r22, r2 ' SUBI/P
 subs r22, r23 ' SUBI/P (3)
 mov r20, #3 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_s10is5_68fd76f0_getnumsep_L000016_548 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s10is6_68fd76f0_getexponent_L000017 ' <symbol:getexponent>
 jmp #PSHM
 long $f80000 ' save registers
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_349_L000350
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is6_68fd76f0_getexponent_L000017_554 ' LTF4
 mov r19, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s10is6_68fd76f0_getexponent_L000017_555 ' JUMPV addrg
C_s10is6_68fd76f0_getexponent_L000017_554
 mov r19, r2
 xor r19, Bit31 ' NEGF4
C_s10is6_68fd76f0_getexponent_L000017_555
 mov r23, r19 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_s10is6_68fd76f0_getexponent_L000017_557 ' JUMPV addrg
C_s10is6_68fd76f0_getexponent_L000017_556
 jmp #LODI
 long @C_s10is6_68fd76f0_getexponent_L000017_559_L000560
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
C_s10is6_68fd76f0_getexponent_L000017_557
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_369_L000370
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s10is6_68fd76f0_getexponent_L000017_562 ' GEF4
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_349_L000350
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_s10is6_68fd76f0_getexponent_L000017_562 ' LEF4
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -37
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_s10is6_68fd76f0_getexponent_L000017_556 ' GEI4
C_s10is6_68fd76f0_getexponent_L000017_562
 jmp #JMPA
 long @C_s10is6_68fd76f0_getexponent_L000017_564 ' JUMPV addrg
C_s10is6_68fd76f0_getexponent_L000017_563
 jmp #LODI
 long @C_s10is6_68fd76f0_getexponent_L000017_559_L000560
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
C_s10is6_68fd76f0_getexponent_L000017_564
 jmp #LODI
 long @C_s10is6_68fd76f0_getexponent_L000017_559_L000560
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is6_68fd76f0_getexponent_L000017_566 ' LTF4
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #38 wz,wc
 jmp #BRBE
 long @C_s10is6_68fd76f0_getexponent_L000017_563 ' LEI4
C_s10is6_68fd76f0_getexponent_L000017_566
 mov r0, r21 ' CVI, CVU or LOAD
' C_s10is6_68fd76f0_getexponent_L000017_552 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s10is7_68fd76f0_convert_L000018 ' <symbol:convert>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_s10is7_68fd76f0_convert_L000018_573 ' EQI4
 jmp #LODL
 long @C_s10is7_68fd76f0_convert_L000018_568_L000569
 mov r19, RI ' reg <- addrg
 jmp #JMPA
 long @C_s10is7_68fd76f0_convert_L000018_574 ' JUMPV addrg
C_s10is7_68fd76f0_convert_L000018_573
 jmp #LODL
 long @C_s10is7_68fd76f0_convert_L000018_570_L000571
 mov r19, RI ' reg <- addrg
C_s10is7_68fd76f0_convert_L000018_574
 mov r21, r19 ' CVI, CVU or LOAD
 mov r23, #0 ' reg <- coni
C_s10is7_68fd76f0_convert_L000018_575
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 adds r22, r5 ' ADDI/P (1)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r18, r3 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r3 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNU4 addrfi reg
' C_s10is7_68fd76f0_convert_L000018_576 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s10is7_68fd76f0_convert_L000018_578 ' EQU4
 cmp r23, r4 wz,wc 
 jmp #BR_B
 long @C_s10is7_68fd76f0_convert_L000018_575' LTU4
C_s10is7_68fd76f0_convert_L000018_578
 mov r0, r23 ' CVI, CVU or LOAD
' C_s10is7_68fd76f0_convert_L000018_567 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s10is8_68fd76f0_cast_L000019 ' <symbol:cast>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 jmp #LODI
 long @C_s10is8_68fd76f0_cast_L000019_582_L000583
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is8_68fd76f0_cast_L000019_580 ' LTF4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s10is8_68fd76f0_cast_L000019_579 ' JUMPV addrg
C_s10is8_68fd76f0_cast_L000019_580
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_417_L000418
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s10is8_68fd76f0_cast_L000019_585 ' LTF4
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #INFL ' CVFI4
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 mov r21, r22 ' ADDU
 add r21, r20 ' ADDU (3)
 jmp #JMPA
 long @C_s10is8_68fd76f0_cast_L000019_586 ' JUMPV addrg
C_s10is8_68fd76f0_cast_L000019_585
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r21, r0 ' CVI, CVU or LOAD
C_s10is8_68fd76f0_cast_L000019_586
 mov r23, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_421_L000422
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, r23
 shr r20, #1 ' RSHU4 coni
 mov r0, r20 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, r23
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r1, r2 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_s10is8_68fd76f0_cast_L000019_588 ' GTF4
 mov r19, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s10is8_68fd76f0_cast_L000019_589 ' JUMPV addrg
C_s10is8_68fd76f0_cast_L000019_588
 mov r19, r23
 sub r19, #1 ' SUBU4 coni
C_s10is8_68fd76f0_cast_L000019_589
 mov r0, r19 ' CVI, CVU or LOAD
C_s10is8_68fd76f0_cast_L000019_579
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s10is9_68fd76f0_myround_L000020 ' <symbol:myround>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s10is8_68fd76f0_cast_L000019 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 cmp r21, r22 wz
 jmp #BRNZ
 long @C_s10is9_68fd76f0_myround_L000020_591 ' NEU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s10is9_68fd76f0_myround_L000020_590 ' JUMPV addrg
C_s10is9_68fd76f0_myround_L000020_591
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_421_L000422
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, r21
 shr r20, #1 ' RSHU4 coni
 mov r0, r20 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, r21
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r22, r0 ' CVI, CVU or LOAD
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s10is9_68fd76f0_myround_L000020_596_L000597
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s10is9_68fd76f0_myround_L000020_594 ' GEF4
 mov r19, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s10is9_68fd76f0_myround_L000020_595 ' JUMPV addrg
C_s10is9_68fd76f0_myround_L000020_594
 mov r19, r21
 add r19, #1 ' ADDU4 coni
C_s10is9_68fd76f0_myround_L000020_595
 mov r0, r19 ' CVI, CVU or LOAD
C_s10is9_68fd76f0_myround_L000020_590
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s10isa_68fd76f0_mypow10_L000021 ' <symbol:mypow10>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_s10is3_68fd76f0_fmtflt_L000014_369_L000370
 mov r23, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_s10isa_68fd76f0_mypow10_L000021_600 ' JUMPV addrg
C_s10isa_68fd76f0_mypow10_L000021_599
 jmp #LODI
 long @C_s10is6_68fd76f0_getexponent_L000017_559_L000560
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 subs r2, #1 ' SUBI4 coni
C_s10isa_68fd76f0_mypow10_L000021_600
 cmps r2,  #0 wz,wc
 jmp #BR_A
 long @C_s10isa_68fd76f0_mypow10_L000021_599 ' GTI4
 jmp #JMPA
 long @C_s10isa_68fd76f0_mypow10_L000021_603 ' JUMPV addrg
C_s10isa_68fd76f0_mypow10_L000021_602
 jmp #LODI
 long @C_s10is6_68fd76f0_getexponent_L000017_559_L000560
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
 adds r2, #1 ' ADDI4 coni
C_s10isa_68fd76f0_mypow10_L000021_603
 cmps r2,  #0 wz,wc
 jmp #BR_B
 long @C_s10isa_68fd76f0_mypow10_L000021_602 ' LTI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_s10isa_68fd76f0_mypow10_L000021_598 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export rpl_vasprintf

 alignl ' align long
C_rpl_vasprintf ' <symbol:rpl_vasprintf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #0 ' reg ARG coni
 jmp #LODL
 long 0
 mov r5, RI ' reg ARG con
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_rpl_vsnprintf
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_rpl_vasprintf_608 ' LTI4
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov RI, r23
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_rpl_vasprintf_606 ' NEU4
C_rpl_vasprintf_608
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_rpl_vasprintf_605 ' JUMPV addrg
C_rpl_vasprintf_606
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, r23
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_rpl_vsnprintf
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_rpl_vasprintf_605
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export rpl_snprintf

 alignl ' align long
C_rpl_snprintf ' <symbol:rpl_snprintf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #16
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_rpl_vsnprintf
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_rpl_snprintf_609 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export rpl_asprintf

 alignl ' align long
C_rpl_asprintf ' <symbol:rpl_asprintf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_rpl_vasprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_rpl_asprintf_611 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import malloc

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s10is9_68fd76f0_myround_L000020_596_L000597 ' <symbol:596>
 long $3f000000 ' float

 alignl ' align long
C_s10is8_68fd76f0_cast_L000019_582_L000583 ' <symbol:582>
 long $4f800000 ' float

 alignl ' align long
C_s10is7_68fd76f0_convert_L000018_570_L000571 ' <symbol:570>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102
 byte 0

 alignl ' align long
C_s10is7_68fd76f0_convert_L000018_568_L000569 ' <symbol:568>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 65
 byte 66
 byte 67
 byte 68
 byte 69
 byte 70
 byte 0

 alignl ' align long
C_s10is6_68fd76f0_getexponent_L000017_559_L000560 ' <symbol:559>
 long $41200000 ' float

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_421_L000422 ' <symbol:421>
 long $40000000 ' float

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_417_L000418 ' <symbol:417>
 long $4f000000 ' float

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_373_L000374 ' <symbol:373>
 byte 105
 byte 110
 byte 102
 byte 0

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_371_L000372 ' <symbol:371>
 byte 73
 byte 78
 byte 70
 byte 0

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_369_L000370 ' <symbol:369>
 long $3f800000 ' float

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_367_L000368 ' <symbol:367>
 long $bf800000 ' float

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_359_L000360 ' <symbol:359>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_357_L000358 ' <symbol:357>
 byte 78
 byte 65
 byte 78
 byte 0

 alignl ' align long
C_s10is3_68fd76f0_fmtflt_L000014_349_L000350 ' <symbol:349>
 long $0 ' float

 alignl ' align long
C_s10is1_68fd76f0_fmtstr_L000012_207_L000208 ' <symbol:207>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

 alignl ' align long
C_rpl_vsnprintf_158_L000159 ' <symbol:158>
 byte 40
 byte 110
 byte 105
 byte 108
 byte 41
 byte 0

' Catalina Code

DAT ' code segment
' end
