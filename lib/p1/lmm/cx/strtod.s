' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sbfc_67e4d6ef_maxE_xponent_L000003 ' <symbol:maxExponent>
 long 511

 alignl ' align long
C_sbfc1_67e4d6ef_powersO_f10_L000004 ' <symbol:powersOf10>
 long $41200000 ' float
 long $42c80000 ' float
 long $461c4000 ' float
 long $4cbebc20 ' float
 long $5a0e1bca ' float
 long $749dc5ae ' float
 long $7f800000 ' float
 long $7f800000 ' float
 long $7f800000 ' float

' Catalina Export strtod

' Catalina Code

DAT ' code segment

 alignl ' align long
C_strtod ' <symbol:strtod>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $faaa80 ' save registers
 mov r9, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtod_7 ' JUMPV addrg
C_strtod_6
 adds r23, #1 ' ADDP4 coni
C_strtod_7
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strtod_6 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_strtod_10 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_strtod_11 ' JUMPV addrg
C_strtod_10
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_strtod_12 ' NEI4
 adds r23, #1 ' ADDP4 coni
C_strtod_12
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_strtod_11
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov r17, #0 ' reg <- coni
C_strtod_14
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_strtod_18' LTU4
 cmps r21,  #46 wz
 jmp #BRNZ
 long @C_strtod_22 ' NEI4
 cmps r13,  #0 wz,wc
 jmp #BR_B
 long @C_strtod_20 ' LTI4
C_strtod_22
 jmp #JMPA
 long @C_strtod_16 ' JUMPV addrg
C_strtod_20
 mov r13, r17 ' CVI, CVU or LOAD
C_strtod_18
 adds r23, #1 ' ADDP4 coni
' C_strtod_15 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_strtod_14 ' JUMPV addrg
C_strtod_16
 jmp #LODF
 long -16
 wrlong r23, RI ' ASGNP4 addrl reg
 subs r23, r17 ' SUBI/P (1)
 cmps r13,  #0 wz,wc
 jmp #BRAE
 long @C_strtod_23 ' GEI4
 mov r13, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtod_24 ' JUMPV addrg
C_strtod_23
 subs r17, #1 ' SUBI4 coni
C_strtod_24
 cmps r17,  #18 wz,wc
 jmp #BRBE
 long @C_strtod_25 ' LEI4
 mov r22, #18 ' reg <- coni
 mov r20, r13
 subs r20, #18 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtod_26 ' JUMPV addrg
C_strtod_25
 mov r22, r13 ' SUBI/P
 subs r22, r17 ' SUBI/P (3)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_strtod_26
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_strtod_27 ' NEI4
 jmp #LODI
 long @C_strtod_29_L000030
 mov r7, RI ' reg <- INDIRF4 addrg
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtod_31 ' JUMPV addrg
C_strtod_27
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_strtod_35 ' JUMPV addrg
C_strtod_32
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 adds r23, #1 ' ADDP4 coni
 cmps r21,  #46 wz
 jmp #BRNZ
 long @C_strtod_36 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 adds r23, #1 ' ADDP4 coni
C_strtod_36
 mov r22, #10 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 subs r22, #48 ' SUBI4 coni
 adds r22, r0 ' ADDI/P (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
' C_strtod_33 ' (symbol refcount = 0)
 subs r17, #1 ' SUBI4 coni
C_strtod_35
 cmps r17,  #9 wz,wc
 jmp #BR_A
 long @C_strtod_32 ' GTI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_strtod_41 ' JUMPV addrg
C_strtod_38
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 adds r23, #1 ' ADDP4 coni
 cmps r21,  #46 wz
 jmp #BRNZ
 long @C_strtod_42 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 adds r23, #1 ' ADDP4 coni
C_strtod_42
 mov r22, #10 ' reg <- coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 subs r22, #48 ' SUBI4 coni
 adds r22, r0 ' ADDI/P (2)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
' C_strtod_39 ' (symbol refcount = 0)
 subs r17, #1 ' SUBI4 coni
C_strtod_41
 cmps r17,  #0 wz,wc
 jmp #BR_A
 long @C_strtod_38 ' GTI4
 jmp #LODI
 long @C_strtod_44_L000045
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_strtod_48 ' EQI4
 cmps r22,  #101 wz
 jmp #BRNZ
 long @C_strtod_46 ' NEI4
C_strtod_48
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_strtod_49 ' NEI4
 mov r22, #1 ' reg <- coni
 mov r9, r22 ' CVI, CVU or LOAD
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_strtod_54 ' JUMPV addrg
C_strtod_49
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_strtod_51 ' NEI4
 adds r23, #1 ' ADDP4 coni
C_strtod_51
 mov r9, #0 ' reg <- coni
 jmp #JMPA
 long @C_strtod_54 ' JUMPV addrg
C_strtod_53
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r19, r0 ' ADDI/P
 adds r19, r22 ' ADDI/P (3)
 adds r23, #1 ' ADDP4 coni
C_strtod_54
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_strtod_53' LTU4
C_strtod_46
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_strtod_56 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r19, r22
 neg r19, r19 ' SUBI/P (2)
 jmp #JMPA
 long @C_strtod_57 ' JUMPV addrg
C_strtod_56
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r19, r22 ' ADDI/P (2)
C_strtod_57
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_strtod_58 ' GEI4
 mov r9, #1 ' reg <- coni
 neg r19, r19 ' NEGI4
 jmp #JMPA
 long @C_strtod_59 ' JUMPV addrg
C_strtod_58
 mov r9, #0 ' reg <- coni
C_strtod_59
 jmp #LODI
 long @C_sbfc_67e4d6ef_maxE_xponent_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_strtod_60 ' LEI4
 jmp #LODI
 long @C_sbfc_67e4d6ef_maxE_xponent_L000003
 mov r19, RI ' reg <- INDIRI4 addrg
 mov r22, #34 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
C_strtod_60
 jmp #LODI
 long @C_strtod_62_L000063
 mov r11, RI ' reg <- INDIRF4 addrg
 jmp #LODL
 long @C_sbfc1_67e4d6ef_powersO_f10_L000004
 mov r15, RI ' reg <- addrg
 jmp #JMPA
 long @C_strtod_67 ' JUMPV addrg
C_strtod_64
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_strtod_68 ' EQI4
 rdlong r22, r15 ' reg <- INDIRF4 reg
 mov r0, r11 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r11, r0 ' CVI, CVU or LOAD
C_strtod_68
' C_strtod_65 ' (symbol refcount = 0)
 sar r19, #1 ' RSHI4 coni
 adds r15, #4 ' ADDP4 coni
C_strtod_67
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_strtod_64 ' NEI4
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_strtod_70 ' EQI4
 mov r0, r7 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r7, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strtod_71 ' JUMPV addrg
C_strtod_70
 mov r0, r7 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r7, r0 ' CVI, CVU or LOAD
C_strtod_71
C_strtod_31
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_strtod_72 ' EQU4
 wrlong r23, r2 ' ASGNP4 reg reg
C_strtod_72
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_strtod_74 ' EQI4
 mov r0, r7
 xor r0, Bit31 ' NEGF4
 jmp #JMPA
 long @C_strtod_5 ' JUMPV addrg
C_strtod_74
 mov r0, r7 ' CVI, CVU or LOAD
C_strtod_5
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_strtod_62_L000063 ' <symbol:62>
 long $3f800000 ' float

 alignl ' align long
C_strtod_44_L000045 ' <symbol:44>
 long $4e6e6b28 ' float

 alignl ' align long
C_strtod_29_L000030 ' <symbol:29>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
