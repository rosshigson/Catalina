' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_s380_68fd7827_imaxdiv_L000004 ' <symbol:imaxdiv>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s380_68fd7827_imaxdiv_L000004_8)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s380_68fd7827_imaxdiv_L000004_8)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r22)<<D16A + (r2)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s380_68fd7827_imaxdiv_L000004_8
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C_s380_68fd7827_imaxdiv_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export rpl_vsnprintf

 alignl_label
C_rpl_vsnprintf ' <symbol:rpl_vsnprintf>
 alignl_p1
 long I32_NEWF + 64<<S32
 alignl_p1
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_26)<<S32 ' NEU4 reg coni
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_26)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_26)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_25
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_28)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_28)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_191_L000193 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_30
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_31)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_32)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_31
' C_rpl_vsnprintf_33 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_36)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r15)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_rpl_vsnprintf_36
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
' C_rpl_vsnprintf_34 ' (symbol refcount = 0)
 alignl_label
C_rpl_vsnprintf_32
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_38
 word I16A_MOV + (r7)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r7)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (39)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_47)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (39)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_49)<<S32 ' GTI4 reg coni
' C_rpl_vsnprintf_48 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_44)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (35)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_45)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_39)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_49
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_43)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_42)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_46)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_39)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_42
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_43
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_44
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_45
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_46
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_47
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_39
 word I16A_MOVI + (r13)<<D16A + (2)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_50
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_51)<<S32 ' GTI4 reg reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_51)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r10)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_rpl_vsnprintf_53)<<S32 ' LEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_55)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_53
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r10)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_51
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (42)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_56)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_58)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_NEG + (r10)<<D16A + (r10)<<S16A ' NEGI4
 alignl_label
C_rpl_vsnprintf_58
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r13)<<D16A + (3)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_56
 word I16A_MOVI + (r13)<<D16A + (3)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_60
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_61)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_61
 word I16A_MOVI + (r13)<<D16A + (5)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_63
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_64)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rpl_vsnprintf_64
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_66)<<S32 ' GTI4 reg reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_66)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r11)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_rpl_vsnprintf_68)<<S32 ' LEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_55)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_68
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_66
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (42)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_70)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_72)<<S32 ' GEI4 reg coni
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_rpl_vsnprintf_72
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r13)<<D16A + (5)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_70
 word I16A_MOVI + (r13)<<D16A + (5)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_74
 word I16A_MOV + (r6)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r6)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_78)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (106)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_85)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_81)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_89)<<S32 ' GTI4 reg coni
' C_rpl_vsnprintf_88 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (76)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_84)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_75)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_89
 alignl_p1
 long I32_MOVI + RI<<D32 + (116)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_86)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (116)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_75)<<S32 ' LTI4 reg coni
' C_rpl_vsnprintf_90 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (122)<<S32
 word I16A_CMPS + (r6)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_87)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_75)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_78
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_79)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r8)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_79
 word I16A_MOVI + (r8)<<D16A + (2)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_81
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_82)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r8)<<D16A + (4)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_82
 word I16A_MOVI + (r8)<<D16A + (3)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_84
 word I16A_MOVI + (r8)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_85
 word I16A_MOVI + (r8)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_86
 word I16A_MOVI + (r8)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_76)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_87
 word I16A_MOVI + (r8)<<D16A + (6)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl_label
C_rpl_vsnprintf_75
 alignl_label
C_rpl_vsnprintf_76
 word I16A_MOVI + (r13)<<D16A + (6)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_29)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_91
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (65)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_180)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (71)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_181)<<S32 ' GTI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_182_L000184-260 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_180
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_174)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_181
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_109)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_93)<<S32 ' LTI4 reg coni
' C_rpl_vsnprintf_186 ' (symbol refcount = 0)
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_93)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_93)<<S32 ' GTI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_187_L000189-388 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_95
 word I16A_CMPSI + (r8)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_96)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r8)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_96)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_105_L000107-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_98
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_99
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + 16<<S16A
 word I16A_SARI + (r22)<<D16A + 16<<S16A ' sign extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_100
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_101
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_102
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_103
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_104
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_97)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_96
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_97
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-24)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + BC<<D32 + 32<<S32 ' arg size, rpsize = 0, spsize = 32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3802_68fd7827_fmtint_L000013)<<S32
 word I16A_ADDI + SP<<D16A + 28<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_109
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_110
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_111
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_112)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_112
 alignl_label
C_rpl_vsnprintf_114
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_115)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_115
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_CMPSI + (r8)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_117)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r8)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_117)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_126_L000128-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_119
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_120
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_121
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_122
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_123
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_124
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_125
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_118)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_117
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_118
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-24)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + BC<<D32 + 32<<S32 ' arg size, rpsize = 0, spsize = 32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3802_68fd7827_fmtint_L000013)<<S32
 word I16A_ADDI + SP<<D16A + 28<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_130
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_131)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_131
 alignl_label
C_rpl_vsnprintf_133
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (71)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_134)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_134
 alignl_label
C_rpl_vsnprintf_136
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_137
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (101)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_138)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_138
 alignl_label
C_rpl_vsnprintf_140
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (103)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_141)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_rpl_vsnprintf_141
 alignl_label
C_rpl_vsnprintf_143
 word I16A_CMPSI + (r8)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_144)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_145)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_144
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_145
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-32)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + BC<<D32 + 32<<S32 ' arg size, rpsize = 0, spsize = 32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3803_68fd7827_fmtflt_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 28<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_93)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_55)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_148
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
' C_rpl_vsnprintf_149 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_152)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_rpl_vsnprintf_152
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_154
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3801_68fd7827_fmtstr_L000012)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_155
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_156)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_158_L000159 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3801_68fd7827_fmtstr_L000012)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_156
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r9)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (16)<<S16A ' reg ARG coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16B_PSHL ' stack ARG ADDRLi
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + BC<<D32 + 32<<S32 ' arg size, rpsize = 0, spsize = 32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3802_68fd7827_fmtint_L000013)<<S32
 word I16A_ADDI + SP<<D16A + 28<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_160
 word I16A_CMPSI + (r8)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vsnprintf_161)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r8)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rpl_vsnprintf_161)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_rpl_vsnprintf_170_L000172-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_rpl_vsnprintf_163
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNI1 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_164
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_165
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_166
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_167
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_168
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_169
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_161
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_93)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_174
' C_rpl_vsnprintf_175 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_178)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r15)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_rpl_vsnprintf_178
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_rpl_vsnprintf_93
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_rpl_vsnprintf_28
 alignl_label
C_rpl_vsnprintf_29
 alignl_label
C_rpl_vsnprintf_26
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_25)<<S32 ' NEI4 reg coni
 alignl_label
C_rpl_vsnprintf_55
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rpl_vsnprintf_194)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_195)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_194
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rpl_vsnprintf_196)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_rpl_vsnprintf_196
 alignl_label
C_rpl_vsnprintf_195
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vsnprintf_200)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_rpl_vsnprintf_198)<<S32 ' LEU4 reg reg
 alignl_label
C_rpl_vsnprintf_200
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((104)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_rpl_vsnprintf_22)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vsnprintf_198
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_rpl_vsnprintf_22
 word I16B_POPM + 16<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3801_68fd7827_fmtstr_L000012 ' <symbol:fmtstr>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r3)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_203)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3801_68fd7827_fmtstr_L000012_204)<<S32 ' JUMPV addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_203
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_204
 word I16A_MOV + (r19)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_205)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_s3801_68fd7827_fmtstr_L000012_207_L000208 ' reg <- addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_205
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3801_68fd7827_fmtstr_L000012_212)<<S32 ' JUMPV addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_210
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_212
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_214)<<S32 ' NEI4 reg coni
 word I16A_CMPS + (r21)<<D16A + (r3)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3801_68fd7827_fmtstr_L000012_213)<<S32 ' GEI4 reg reg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_214
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r5)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_210)<<S32 ' NEI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_213
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3801_68fd7827_fmtstr_L000012_215)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_215
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3801_68fd7827_fmtstr_L000012_220)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r23)<<D16A + (r23)<<S16A ' NEGI4
 alignl_p1
 long I32_JMPA + (@C_s3801_68fd7827_fmtstr_L000012_220)<<S32 ' JUMPV addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_219
' C_s3801_68fd7827_fmtstr_L000012_222 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3801_68fd7827_fmtstr_L000012_225)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_225
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3801_68fd7827_fmtstr_L000012_223 ' (symbol refcount = 0)
 word I16A_SUBSI + (r23)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_220
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3801_68fd7827_fmtstr_L000012_219)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3801_68fd7827_fmtstr_L000012_228)<<S32 ' JUMPV addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_227
' C_s3801_68fd7827_fmtstr_L000012_230 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3801_68fd7827_fmtstr_L000012_233)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_233
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3801_68fd7827_fmtstr_L000012_231 ' (symbol refcount = 0)
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_228
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_236)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r3)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3801_68fd7827_fmtstr_L000012_235)<<S32 ' LEI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_236
 word I16A_RDBYTE + (r22)<<D16A + (r5)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3801_68fd7827_fmtstr_L000012_227)<<S32 ' NEI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_235
 alignl_p1
 long I32_JMPA + (@C_s3801_68fd7827_fmtstr_L000012_238)<<S32 ' JUMPV addrg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_237
' C_s3801_68fd7827_fmtstr_L000012_240 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3801_68fd7827_fmtstr_L000012_243)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_243
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3801_68fd7827_fmtstr_L000012_241 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3801_68fd7827_fmtstr_L000012_238
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3801_68fd7827_fmtstr_L000012_237)<<S32 ' LTI4 reg coni
' C_s3801_68fd7827_fmtstr_L000012_201 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3802_68fd7827_fmtint_L000013 ' <symbol:fmtint>
 alignl_p1
 long I32_NEWF + 60<<S32
 alignl_p1
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r10)<<D16A + (r17)<<S16A ' BANDI/U
 word I16A_AND + (r10)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3802_68fd7827_fmtint_L000013_247)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r6)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_248)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_247
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_248
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_249)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_250)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_249
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3802_68fd7827_fmtint_L000013_252)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_253)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_252
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_253
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_254)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_MOVI + (r9)<<D32 +(45)<<S32 ' reg <- conli
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_255)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_254
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_256)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r9)<<D32 +(43)<<S32 ' reg <- conli
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_257)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_256
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_258)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r9)<<D32 +(32)<<S32 ' reg <- conli
 alignl_label
C_s3802_68fd7827_fmtint_L000013_258
 alignl_label
C_s3802_68fd7827_fmtint_L000013_257
 alignl_label
C_s3802_68fd7827_fmtint_L000013_255
 alignl_label
C_s3802_68fd7827_fmtint_L000013_250
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' BANDI/U
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (43)<<S32 ' reg ARG coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r7)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3807_68fd7827_convert_L000018)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_260)<<S32 ' EQI4 reg coni
 word I16A_CMPI + (r7)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_260)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_264)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3802_68fd7827_fmtint_L000013_262)<<S32 ' LTI4 reg coni
' C_s3802_68fd7827_fmtint_L000013_271 ' (symbol refcount = 0)
 word I16A_CMPSI + (r23)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_267)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_262)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_264
 word I16A_CMPS + (r19)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3802_68fd7827_fmtint_L000013_263)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r19)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_263)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_267
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_269)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_270)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_269
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_270
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3802_68fd7827_fmtint_L000013_262
 alignl_label
C_s3802_68fd7827_fmtint_L000013_263
 alignl_label
C_s3802_68fd7827_fmtint_L000013_260
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_272)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3805_68fd7827_getnumsep_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3802_68fd7827_fmtint_L000013_272
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r15)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r11)<<D16A + (r10)<<S16A ' SUBI/P (3)
 word I16A_CMPS + (r19)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3802_68fd7827_fmtint_L000013_277)<<S32 ' LTI4 reg reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_278)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_277
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_278
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_279)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_280)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_279
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_280
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_281)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_282)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_281
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_282
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r10)<<S16A ' SUBI/P (3)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r13)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_283)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_283
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_285)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_285
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_287)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r13)<<D16A + (r13)<<S16A ' NEGI4
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_292)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_287
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_292)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_292)<<S32 ' EQI4 reg coni
 word I16A_ADDS + (r11)<<D16A + (r13)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_292)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_291
' C_s3802_68fd7827_fmtint_L000013_294 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_297)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_297
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_295 ' (symbol refcount = 0)
 word I16A_SUBSI + (r13)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_292
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3802_68fd7827_fmtint_L000013_291)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_299)<<S32 ' EQI4 reg coni
' C_s3802_68fd7827_fmtint_L000013_301 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_304)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r9)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_304
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_302 ' (symbol refcount = 0)
 alignl_label
C_s3802_68fd7827_fmtint_L000013_299
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3802_68fd7827_fmtint_L000013_319)<<S32 ' EQI4 reg coni
' C_s3802_68fd7827_fmtint_L000013_308 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_311)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_311
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_309 ' (symbol refcount = 0)
' C_s3802_68fd7827_fmtint_L000013_313 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_316)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r8)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_316
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_319)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_318
' C_s3802_68fd7827_fmtint_L000013_321 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_324)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_324
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_322 ' (symbol refcount = 0)
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_319
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3802_68fd7827_fmtint_L000013_318)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_327)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_326
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_s3802_68fd7827_fmtint_L000013_329 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_332)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_332
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_330 ' (symbol refcount = 0)
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3802_68fd7827_fmtint_L000013_334)<<S32 ' LEI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3802_68fd7827_fmtint_L000013_334)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3802_68fd7827_fmtint_L000013_334)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3804_68fd7827_printsep_L000015)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_334
 alignl_label
C_s3802_68fd7827_fmtint_L000013_327
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3802_68fd7827_fmtint_L000013_326)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3802_68fd7827_fmtint_L000013_337)<<S32 ' JUMPV addrg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_336
' C_s3802_68fd7827_fmtint_L000013_339 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3802_68fd7827_fmtint_L000013_342)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3802_68fd7827_fmtint_L000013_342
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3802_68fd7827_fmtint_L000013_340 ' (symbol refcount = 0)
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3802_68fd7827_fmtint_L000013_337
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3802_68fd7827_fmtint_L000013_336)<<S32 ' LTI4 reg coni
' C_s3802_68fd7827_fmtint_L000013_245 ' (symbol refcount = 0)
 word I16B_POPM + 15<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3803_68fd7827_fmtflt_L000014 ' <symbol:fmtflt>
 alignl_p1
 long I32_NEWF + 176<<S32
 alignl_p1
 long I32_PSHM + $ffefc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r6)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r7)<<D16A + (r19)<<S16A ' BANDI/U
 word I16A_AND + (r7)<<D16A + (r22)<<S16A ' BANDI/U (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_345)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r21)<<D16A + (6)<<S16A ' reg <- coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_345
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_349_L000350)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_347)<<S32 ' GEF4
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(45)<<S32 ' reg <- conli
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_348)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_347
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_351)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(43)<<S32 ' reg <- conli
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_352)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_351
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_353)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_353
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_352
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_348
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_355)<<S32 ' EQF4
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_362)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s3803_68fd7827_fmtflt_L000014_357_L000358 ' reg <- addrg
 word I16B_LODF + ((-144)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_363)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_362
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s3803_68fd7827_fmtflt_L000014_359_L000360 ' reg <- addrg
 word I16B_LODF + ((-144)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_363
 word I16B_LODF + ((-144)&$1FF)<<S16B
 word I16A_RDLONG + (r6)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_356)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_355
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_367_L000368)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_366)<<S32 ' LTF4
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_369_L000370)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_364)<<S32 ' LEF4
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_366
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_364)<<S32 ' NEF4
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_376)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s3803_68fd7827_fmtflt_L000014_371_L000372 ' reg <- addrg
 word I16B_LODF + ((-148)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_377)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_376
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s3803_68fd7827_fmtflt_L000014_373_L000374 ' reg <- addrg
 word I16B_LODF + ((-148)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_377
 word I16B_LODF + ((-148)&$1FF)<<S16B
 word I16A_RDLONG + (r6)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_364
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_356
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_378)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_383)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_383)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_382
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r6)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r6)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_383
 word I16A_RDBYTE + (r22)<<D16A + (r6)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_382)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((16)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3801_68fd7827_fmtstr_L000012)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_344)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_378
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_387)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_385)<<S32 ' EQI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_387
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_388)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_390)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_390
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_392)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_392
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_388
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3806_68fd7827_getexponent_L000017)<<S32 ' CALL addrg
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_385
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_394
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16B_LODF + ((-152)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-152)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_401)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_395)<<S32 ' LTI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_406 ' (symbol refcount = 0)
 word I16B_LODF + ((-152)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_398)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_395)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_398
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_396)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_LODS + (r21)<<D32S + ((38)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_396)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_401
 word I16A_CMPSI + (r21)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_396)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (19)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_396)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_395
 word I16A_CMPSI + (r21)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_396)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (9)<<S16A ' reg <- coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_396
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_349_L000350)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_408)<<S32 ' LTF4
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_LODF + ((-156)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_409)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_408
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_SIGN + (r22)<<D16B ' NEGF4
 word I16B_LODF + ((-156)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_409
 word I16B_LODF + ((-156)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_410)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s380a_68fd7827_mypow10_L000021)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_410
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3808_68fd7827_cast_L000019)<<S32 ' CALL addrg
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_412)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_344)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_412
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s380a_68fd7827_mypow10_L000021)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_417_L000418)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_415)<<S32 ' LTF4
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16B_LODF + ((-160)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_416)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_415
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-160)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_416
 word I16B_LODF + ((-160)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-132)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_421_L000422)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((-132)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r14)<<D16A + (r20)<<S16A
 word I16A_SHRI + (r14)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r14)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-164)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-164)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16B_LODF + ((-168)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r14)<<D16A + (r16)<<S16A
 word I16A_SHRI + (r14)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r14)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-172)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r16)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-172)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16B_LODF + ((-168)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3809_68fd7827_myround_L000020)<<S32 ' CALL addrg
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-132)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_419)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_423)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_423)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_423
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_419
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_425)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_425)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_425)<<S32 ' LEI4 reg reg
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_425)<<S32 ' LTI4 reg reg
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_394)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_425
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_427)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_429)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(45)<<S32 ' reg <- conli
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_430)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_429
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(43)<<S32 ' reg <- conli
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_430
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3807_68fd7827_convert_L000018)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r11)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_431)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_431
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_434)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((69)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_435)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_434
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((101)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_435
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_427
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (10)<<S16A ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (43)<<S32 ' reg ARG coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-116)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3807_68fd7827_convert_L000018)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_436)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (10)<<S16A ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (43)<<S32 ' reg ARG coni
 word I16B_LODF + ((-92)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-128)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3807_68fd7827_convert_L000018)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_436
 word I16A_MOV + (r9)<<D16A + (r21)<<S16A ' SUBI/P
 word I16A_SUBS + (r9)<<D16A + (r13)<<S16A ' SUBI/P (3)
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_438)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_440)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_443)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_442
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_443
 word I16A_CMPS + (r8)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_445)<<S32 ' GEI4 reg reg
 word I16B_LODF + ((-92)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r8)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_442)<<S32 ' EQI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_445
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_441)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_440
 word I16A_MOV + (r8)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_441
 word I16A_SUBS + (r21)<<D16A + (r8)<<S16A ' SUBI/P (1)
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_438
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_448)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_446)<<S32 ' EQI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_448
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_446
 word I16A_CMPSI + (r7)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_449)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3805_68fd7827_getnumsep_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r7)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_449
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_453)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_454)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_453
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_454
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_455)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-180)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_456)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_455
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-180)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_456
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r15)<<S16A ' SUBI/P (3)
 word I16A_SUBS + (r22)<<D16A + (r11)<<S16A ' SUBI/P (1)
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_SUBS + (r22)<<D16A + (r7)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-176)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-180)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r10)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_457)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_457
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_459)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r10)<<D16A + (r10)<<S16A ' NEGI4
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_479)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_459
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_479)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_479)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_471)<<S32 ' EQI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_465 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_468)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_468
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_466 ' (symbol refcount = 0)
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_471)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_470
' C_s3803_68fd7827_fmtflt_L000014_473 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_476)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_476
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_474 ' (symbol refcount = 0)
 word I16A_SUBSI + (r10)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_471
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_470)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_479)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_478
' C_s3803_68fd7827_fmtflt_L000014_481 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_484)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_484
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_482 ' (symbol refcount = 0)
 word I16A_SUBSI + (r10)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_479
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_478)<<S32 ' GTI4 reg coni
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_494)<<S32 ' EQI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_488 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_491)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_491
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_494)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_493
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_496 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_499)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_499
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_497 ' (symbol refcount = 0)
 word I16A_CMPSI + (r7)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_501)<<S32 ' LEI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3803_68fd7827_fmtflt_L000014_501)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3803_68fd7827_fmtflt_L000014_501)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3804_68fd7827_printsep_L000015)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_501
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_494
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_493)<<S32 ' GTI4 reg coni
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3803_68fd7827_fmtflt_L000014_511)<<S32 ' EQI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_505 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_508)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(46)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_508
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_511)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_510
' C_s3803_68fd7827_fmtflt_L000014_513 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_516)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_516
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_514 ' (symbol refcount = 0)
 word I16A_SUBSI + (r9)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_511
 word I16A_CMPSI + (r9)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_510)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_519)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_518
 word I16A_SUBSI + (r13)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_521 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_524)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-92)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_524
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_522 ' (symbol refcount = 0)
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_519
 word I16A_CMPS + (r13)<<D16A + (r8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_518)<<S32 ' GTI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_527)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_526
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_s3803_68fd7827_fmtflt_L000014_529 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_532)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_532
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_530 ' (symbol refcount = 0)
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_527
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3803_68fd7827_fmtflt_L000014_526)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3803_68fd7827_fmtflt_L000014_535)<<S32 ' JUMPV addrg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_534
' C_s3803_68fd7827_fmtflt_L000014_537 ' (symbol refcount = 0)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3803_68fd7827_fmtflt_L000014_540)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_540
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3803_68fd7827_fmtflt_L000014_538 ' (symbol refcount = 0)
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_535
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3803_68fd7827_fmtflt_L000014_534)<<S32 ' LTI4 reg coni
 alignl_label
C_s3803_68fd7827_fmtflt_L000014_344
 word I16B_POPM + 44<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3804_68fd7827_printsep_L000015 ' <symbol:printsep>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
' C_s3804_68fd7827_printsep_L000015_543 ' (symbol refcount = 0)
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r2)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3804_68fd7827_printsep_L000015_546)<<S32 ' GEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r22)<<D16A + (r4)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(44)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3804_68fd7827_printsep_L000015_546
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r3)<<S16A ' ASGNU4 reg reg
' C_s3804_68fd7827_printsep_L000015_544 ' (symbol refcount = 0)
' C_s3804_68fd7827_printsep_L000015_542 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3805_68fd7827_getnumsep_L000016 ' <symbol:getnumsep>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3805_68fd7827_getnumsep_L000016_550)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3805_68fd7827_getnumsep_L000016_551)<<S32 ' JUMPV addrg
 alignl_label
C_s3805_68fd7827_getnumsep_L000016_550
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3805_68fd7827_getnumsep_L000016_551
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A ' SUBI/P (3)
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_s3805_68fd7827_getnumsep_L000016_548 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3806_68fd7827_getexponent_L000017 ' <symbol:getexponent>
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_349_L000350)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3806_68fd7827_getexponent_L000017_554)<<S32 ' LTF4
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3806_68fd7827_getexponent_L000017_555)<<S32 ' JUMPV addrg
 alignl_label
C_s3806_68fd7827_getexponent_L000017_554
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A
 word I16B_SIGN + (r19)<<D16B ' NEGF4
 alignl_label
C_s3806_68fd7827_getexponent_L000017_555
 word I16A_MOV + (r23)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3806_68fd7827_getexponent_L000017_557)<<S32 ' JUMPV addrg
 alignl_label
C_s3806_68fd7827_getexponent_L000017_556
 alignl_p1
 long I32_LODI + (@C_s3806_68fd7827_getexponent_L000017_559_L000560)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3806_68fd7827_getexponent_L000017_557
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_369_L000370)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_s3806_68fd7827_getexponent_L000017_562)<<S32 ' GEF4
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_349_L000350)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRBE + (@C_s3806_68fd7827_getexponent_L000017_562)<<S32 ' LEF4
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-37)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3806_68fd7827_getexponent_L000017_556)<<S32 ' GEI4 reg reg
 alignl_label
C_s3806_68fd7827_getexponent_L000017_562
 alignl_p1
 long I32_JMPA + (@C_s3806_68fd7827_getexponent_L000017_564)<<S32 ' JUMPV addrg
 alignl_label
C_s3806_68fd7827_getexponent_L000017_563
 alignl_p1
 long I32_LODI + (@C_s3806_68fd7827_getexponent_L000017_559_L000560)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3806_68fd7827_getexponent_L000017_564
 alignl_p1
 long I32_LODI + (@C_s3806_68fd7827_getexponent_L000017_559_L000560)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3806_68fd7827_getexponent_L000017_566)<<S32 ' LTF4
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3806_68fd7827_getexponent_L000017_563)<<S32 ' LEI4 reg coni
 alignl_label
C_s3806_68fd7827_getexponent_L000017_566
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s3806_68fd7827_getexponent_L000017_552 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3807_68fd7827_convert_L000018 ' <symbol:convert>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3807_68fd7827_convert_L000018_573)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_s3807_68fd7827_convert_L000018_568_L000569 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_s3807_68fd7827_convert_L000018_574)<<S32 ' JUMPV addrg
 alignl_label
C_s3807_68fd7827_convert_L000018_573
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_s3807_68fd7827_convert_L000018_570_L000571 ' reg <- addrg
 alignl_label
C_s3807_68fd7827_convert_L000018_574
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3807_68fd7827_convert_L000018_575
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r5)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r1)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
' C_s3807_68fd7827_convert_L000018_576 ' (symbol refcount = 0)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3807_68fd7827_convert_L000018_578)<<S32 ' EQU4 reg coni
 word I16A_CMP + (r23)<<D16A + (r4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3807_68fd7827_convert_L000018_575)<<S32 ' LTU4 reg reg
 alignl_label
C_s3807_68fd7827_convert_L000018_578
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s3807_68fd7827_convert_L000018_567 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3808_68fd7827_cast_L000019 ' <symbol:cast>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_s3808_68fd7827_cast_L000019_582_L000583)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3808_68fd7827_cast_L000019_580)<<S32 ' LTF4
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_s3808_68fd7827_cast_L000019_579)<<S32 ' JUMPV addrg
 alignl_label
C_s3808_68fd7827_cast_L000019_580
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_417_L000418)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_s3808_68fd7827_cast_L000019_585)<<S32 ' LTF4
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r21)<<D16A + (r20)<<S16A ' ADDU (3)
 alignl_p1
 long I32_JMPA + (@C_s3808_68fd7827_cast_L000019_586)<<S32 ' JUMPV addrg
 alignl_label
C_s3808_68fd7827_cast_L000019_585
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3808_68fd7827_cast_L000019_586
 word I16A_MOV + (r23)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_421_L000422)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_A + (@C_s3808_68fd7827_cast_L000019_588)<<S32 ' GTF4
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3808_68fd7827_cast_L000019_589)<<S32 ' JUMPV addrg
 alignl_label
C_s3808_68fd7827_cast_L000019_588
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_label
C_s3808_68fd7827_cast_L000019_589
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3808_68fd7827_cast_L000019_579
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3809_68fd7827_myround_L000020 ' <symbol:myround>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3808_68fd7827_cast_L000019)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3809_68fd7827_myround_L000020_591)<<S32 ' NEU4 reg reg
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_s3809_68fd7827_myround_L000020_590)<<S32 ' JUMPV addrg
 alignl_label
C_s3809_68fd7827_myround_L000020_591
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_421_L000422)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_s3809_68fd7827_myround_L000020_596_L000597)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_s3809_68fd7827_myround_L000020_594)<<S32 ' GEF4
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3809_68fd7827_myround_L000020_595)<<S32 ' JUMPV addrg
 alignl_label
C_s3809_68fd7827_myround_L000020_594
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A
 word I16A_ADDI + (r19)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3809_68fd7827_myround_L000020_595
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3809_68fd7827_myround_L000020_590
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s380a_68fd7827_mypow10_L000021 ' <symbol:mypow10>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_s3803_68fd7827_fmtflt_L000014_369_L000370)<<S32
 word I16A_MOV + (r23)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl_p1
 long I32_JMPA + (@C_s380a_68fd7827_mypow10_L000021_600)<<S32 ' JUMPV addrg
 alignl_label
C_s380a_68fd7827_mypow10_L000021_599
 alignl_p1
 long I32_LODI + (@C_s3806_68fd7827_getexponent_L000017_559_L000560)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s380a_68fd7827_mypow10_L000021_600
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s380a_68fd7827_mypow10_L000021_599)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s380a_68fd7827_mypow10_L000021_603)<<S32 ' JUMPV addrg
 alignl_label
C_s380a_68fd7827_mypow10_L000021_602
 alignl_p1
 long I32_LODI + (@C_s3806_68fd7827_getexponent_L000017_559_L000560)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s380a_68fd7827_mypow10_L000021_603
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s380a_68fd7827_mypow10_L000021_602)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s380a_68fd7827_mypow10_L000021_598 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export rpl_vasprintf

 alignl_label
C_rpl_vasprintf ' <symbol:rpl_vasprintf>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_rpl_vsnprintf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rpl_vasprintf_608)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rpl_vasprintf_606)<<S32 ' NEU4 reg coni
 alignl_label
C_rpl_vasprintf_608
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_rpl_vasprintf_605)<<S32 ' JUMPV addrg
 alignl_label
C_rpl_vasprintf_606
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_RDLONG + (r5)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_rpl_vsnprintf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_rpl_vasprintf_605
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export rpl_snprintf

 alignl_label
C_rpl_snprintf ' <symbol:rpl_snprintf>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl_p1
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_rpl_vsnprintf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_rpl_snprintf_609 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export rpl_asprintf

 alignl_label
C_rpl_asprintf ' <symbol:rpl_asprintf>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl_p1
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl_p1
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_rpl_vasprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_rpl_asprintf_611 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import errno

' Catalina Import malloc

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3809_68fd7827_myround_L000020_596_L000597 ' <symbol:596>
 long $3f000000 ' float

 alignl_label
C_s3808_68fd7827_cast_L000019_582_L000583 ' <symbol:582>
 long $4f800000 ' float

 alignl_label
C_s3807_68fd7827_convert_L000018_570_L000571 ' <symbol:570>
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

 alignl_label
C_s3807_68fd7827_convert_L000018_568_L000569 ' <symbol:568>
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

 alignl_label
C_s3806_68fd7827_getexponent_L000017_559_L000560 ' <symbol:559>
 long $41200000 ' float

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_421_L000422 ' <symbol:421>
 long $40000000 ' float

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_417_L000418 ' <symbol:417>
 long $4f000000 ' float

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_373_L000374 ' <symbol:373>
 byte 105
 byte 110
 byte 102
 byte 0

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_371_L000372 ' <symbol:371>
 byte 73
 byte 78
 byte 70
 byte 0

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_369_L000370 ' <symbol:369>
 long $3f800000 ' float

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_367_L000368 ' <symbol:367>
 long $bf800000 ' float

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_359_L000360 ' <symbol:359>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_357_L000358 ' <symbol:357>
 byte 78
 byte 65
 byte 78
 byte 0

 alignl_label
C_s3803_68fd7827_fmtflt_L000014_349_L000350 ' <symbol:349>
 long $0 ' float

 alignl_label
C_s3801_68fd7827_fmtstr_L000012_207_L000208 ' <symbol:207>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

 alignl_label
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
