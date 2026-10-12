' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export jsll_decstr

 alignl_label
C_jsll_decstr ' <symbol:jsll_decstr>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_decstr_3)<<S32 ' GEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_decstr_7)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_decstr_8)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_decstr_7
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_decstr_8
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_jsll_udecstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_jsll_decstr_2)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_decstr_3
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_jsll_udecstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_jsll_decstr_2
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_jsll_udecstr_10_L000011 ' <symbol:10>
 long $2710
 long $0

' Catalina Export jsll_udecstr

' Catalina Code

DAT ' code segment

 alignl_label
C_jsll_udecstr ' <symbol:jsll_udecstr>
 alignl_p1
 long I32_NEWF + 60<<S32
 alignl_p1
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODL + (r1)<<D16B
 alignl_p1
 long @C_jsll_udecstr_10_L000011 ' reg <- addrg
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_12)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_12)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_jsll_udecstr_15_L000016 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udecstr_9)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udecstr_12
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_label
C_jsll_udecstr_17
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_jsll_udivmod)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_24)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udecstr_22)<<S32 ' EQU4 reg coni
 alignl_label
C_jsll_udecstr_24
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udecstr_23)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udecstr_22
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_udecstr_23
 word I16A_MOV + (r13)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r17)<<D16A + (4)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udecstr_28)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udecstr_25
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r1)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r22)<<D16A + (r15)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_jsll_udecstr_26 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_jsll_udecstr_28
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udecstr_29)<<S32 ' EQI4 reg coni
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_25)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_25)<<S32 ' NEI4 reg coni
 alignl_label
C_jsll_udecstr_29
' C_jsll_udecstr_18 ' (symbol refcount = 0)
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_17)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_jsll_udecstr_33)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udecstr_30
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
' C_jsll_udecstr_31 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_jsll_udecstr_33
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udecstr_30)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_jsll_udecstr_9
 word I16B_POPM + 15<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_jsll_hexstr_hexdigit_L000036 ' <symbol:hexdigit>
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

' Catalina Export jsll_hexstr

' Catalina Code

DAT ' code segment

 alignl_label
C_jsll_hexstr ' <symbol:jsll_hexstr>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_hexstr_37)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_hexstr_37)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_jsll_hexstr_39_L000040 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_jsll_hexstr_34)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_hexstr_37
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_hexstr_41
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_jsll_hexstr_hexdigit_L000036 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_SHRI + (r19)<<D16A + (4)<<S16A ' SHRU4 reg coni
' C_jsll_hexstr_42 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_jsll_hexstr_41)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_hexstr_45
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_jsll_hexstr_hexdigit_L000036 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_SHRI + (r19)<<D16A + (4)<<S16A ' SHRU4 reg coni
' C_jsll_hexstr_46 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_jsll_hexstr_45)<<S32 ' LTI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (16)<<S16A ' reg <- coni
 alignl_label
C_jsll_hexstr_49
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
' C_jsll_hexstr_50 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_hexstr_49)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_label
C_jsll_hexstr_34
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import jsll_udivmod

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_jsll_hexstr_39_L000040 ' <symbol:39>
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 48
 byte 0

 alignl_label
C_jsll_udecstr_15_L000016 ' <symbol:15>
 byte 48
 byte 0

' Catalina Code

DAT ' code segment
' end
