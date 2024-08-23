' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sbnc_66c68c23_maxE_xponent_L000003 ' <symbol:maxExponent>
 long 511

 alignl ' align long
C_sbnc1_66c68c23_powersO_f10_L000004 ' <symbol:powersOf10>
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
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strtod_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_6
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_7
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_6)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_10)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_11)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_10
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_12)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_12
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_strtod_11
 word I16A_NEGI + (r13)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_strtod_14
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_strtod_18)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_22)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_strtod_20)<<S32 ' LTI4 reg coni
 alignl ' align long
C_strtod_22
 alignl ' align long
 long I32_JMPA + (@C_strtod_16)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_20
 word I16A_MOV + (r13)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_strtod_18
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
' C_strtod_15 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_14)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_SUBS + (r23)<<D16A + (r17)<<S16A ' SUBI/P (1)
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_strtod_23)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r13)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strtod_24)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_23
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_strtod_24
 word I16A_CMPSI + (r17)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_strtod_25)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (18)<<S16A ' reg <- coni
 word I16A_MOV + (r8)<<D16A + (r13)<<S16A
 word I16A_SUBSI + (r8)<<D16A + (18)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strtod_26)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_25
 word I16A_MOV + (r8)<<D16A + (r13)<<S16A ' SUBI/P
 word I16A_SUBS + (r8)<<D16A + (r17)<<S16A ' SUBI/P (3)
 alignl ' align long
C_strtod_26
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_27)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_strtod_29_L000030)<<S32
 word I16A_MOV + (r9)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strtod_31)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_27
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_35)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_32
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_36)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_36
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r7)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r7)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r7)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_strtod_33 ' (symbol refcount = 0)
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_strtod_35
 word I16A_CMPSI + (r17)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_strtod_32)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_41)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_38
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_42)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_42
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r6)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r6)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r6)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_strtod_39 ' (symbol refcount = 0)
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_strtod_41
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_strtod_38)<<S32 ' GTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_strtod_44_L000045)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_48)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (101)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_46)<<S32 ' NEI4 reg coni
 alignl ' align long
C_strtod_48
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_49)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_54)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_49
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_51)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_51
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_strtod_54)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_53
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_54
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_strtod_53)<<S32 ' LTU4 reg coni
 alignl ' align long
C_strtod_46
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_56)<<S32 ' EQI4 reg coni
 word I16A_SUBS + (r19)<<D16A + (r8)<<S16A
 word I16A_NEG + (r19)<<D16A + (r19)<<S16A ' SUBI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_strtod_57)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_56
 word I16A_ADDS + (r19)<<D16A + (r8)<<S16A ' ADDI/P (2)
 alignl ' align long
C_strtod_57
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_strtod_58)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_NEG + (r19)<<D16A + (r19)<<S16A ' NEGI4
 alignl ' align long
 long I32_JMPA + (@C_strtod_59)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_58
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_strtod_59
 alignl ' align long
 long I32_LODI + (@C_sbnc_66c68c23_maxE_xponent_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_strtod_60)<<S32 ' LEI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sbnc_66c68c23_maxE_xponent_L000003)<<S32
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((34)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_strtod_60
 alignl ' align long
 long I32_LODI + (@C_strtod_62_L000063)<<S32
 word I16A_MOV + (r11)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODL + (r15)<<D16B
 alignl ' align long
 long @C_sbnc1_66c68c23_powersO_f10_L000004 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_strtod_67)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_64
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_68)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRF4 reg
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_strtod_68
' C_strtod_65 ' (symbol refcount = 0)
 word I16A_SARI + (r19)<<D16A + (1)<<S16A ' SHRI4 reg coni
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strtod_67
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strtod_64)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_70)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strtod_71)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_70
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_strtod_71
 alignl ' align long
C_strtod_31
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_72)<<S32 ' EQU4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_strtod_72
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strtod_74)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A
 word I16B_SIGN + (r0)<<D16B ' NEGF4
 alignl ' align long
 long I32_JMPA + (@C_strtod_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_strtod_74
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_strtod_5
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

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
