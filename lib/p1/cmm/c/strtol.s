' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strtol

 alignl ' align long
C_strtol ' <symbol:strtol>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_s7ms_670edc19_string2long_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_strtol_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export strtoul

 alignl ' align long
C_strtoul ' <symbol:strtoul>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_s7ms_670edc19_string2long_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_strtoul_5 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s7ms_670edc19_string2long_L000003 ' <symbol:string2long>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r5)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_10)<<S32 ' EQU4 reg coni
 word I16A_WRLONG + (r5)<<D16A + (r4)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_9
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_10
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
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
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_9)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_15)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_13)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_15
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_16)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_16
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_13
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r5)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_18)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_20)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_24)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_22)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_24
 word I16A_MOVI + (r3)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_22
 word I16A_MOVI + (r3)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_20
 word I16A_MOVI + (r3)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_18
 word I16A_CMPSI + (r3)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_27)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_27
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_28
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_32)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_34)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (26)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s7ms_670edc19_string2long_L000003_38)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r13)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_39)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_38
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((97)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r13)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_39
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_35)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_34
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_35
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s7ms_670edc19_string2long_L000003_40)<<S32 ' LTU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_30)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_40
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_SUB + (r22)<<D16A + (r23)<<S16A ' SUBU (1)
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r21)<<D16A + (r0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s7ms_670edc19_string2long_L000003_42)<<S32 ' LEU4 reg reg
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_43)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_42
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r21)<<D16A + (r23)<<S16A ' ADDU (3)
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_43
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_32
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_29
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s7ms_670edc19_string2long_L000003_28)<<S32 ' LTU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_28)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_30
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_44)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r5)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_46)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_47)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_46
 word I16A_WRLONG + (r5)<<D16A + (r4)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_47
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_44
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s7ms_670edc19_string2long_L000003_48)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_50)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s7ms_670edc19_string2long_L000003_53)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $80000000 ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s7ms_670edc19_string2long_L000003_52)<<S32 ' GTU4 reg reg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_53
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s7ms_670edc19_string2long_L000003_50)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s7ms_670edc19_string2long_L000003_50)<<S32 ' LEU4 reg reg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_52
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_50
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_48
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_54)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((34)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s7ms_670edc19_string2long_L000003_56)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s7ms_670edc19_string2long_L000003_58)<<S32 ' GEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long $80000000 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_58
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long $7fffffff ' RET con
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_56
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_s7ms_670edc19_string2long_L000003_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_54
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
C_s7ms_670edc19_string2long_L000003_6
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import errno

' Catalina Import __ctype
' end
