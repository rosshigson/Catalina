' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mktime

 alignl_label
C_mktime ' <symbol:mktime>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $ffafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r18)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r1)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_2)<<S32 ' GEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_2
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r1)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_4)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_4
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_RDLONG + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r1)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_6)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_mktime_6
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r16)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r18)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r1)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_8)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_8
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_JMPA + (@C_mktime_11)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_10
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_14)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_16)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_14)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_16
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((366)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_mktime_15)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_14
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_mktime_15
 word I16A_ADDS + (r21)<<D16A + (r8)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_11
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_mktime_10)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_mktime_18)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_17
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_22)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_24)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_22)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_24
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((366)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_mktime_23)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_22
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_mktime_23
 word I16A_SUBS + (r21)<<D16A + (r8)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_18
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_25)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_27)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_25)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_27
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((366)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_mktime_26)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_25
 alignl_p1
 long I32_LODS + (r8)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_mktime_26
 word I16A_CMPS + (r21)<<D16A + (r8)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_17)<<S32 ' GEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_mktime_29)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_28
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_33)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_35)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_33)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_35
 word I16A_MOVI + (r7)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mktime_34)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_33
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mktime_34
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r7)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_CMPSI + (r20)<<D16A + (12)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_36)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_mktime_36
 alignl_label
C_mktime_29
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_38)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_40)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_38)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_40
 word I16A_MOVI + (r7)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mktime_39)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_38
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mktime_39
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r7)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_28)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_CALA + (@C__tzset)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r19)<<D32S + ((1970)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r19)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_41)<<S32 ' GEI4 reg reg
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_mktime_1)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_41
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 5883516 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' SUBI/P
 word I16A_SUBS + (r20)<<D16A + (r19)<<S16A ' SUBI/P (3)
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_43)<<S32 ' GEI4 reg reg
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_43
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_SUBS + (r20)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_45)<<S32 ' GEI4 reg reg
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_45
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_48)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r22)<<D16A + (r1)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_48)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r6)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mktime_49)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_48
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mktime_49
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A ' SUBI/P (3)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r6)<<S16A ' ADDI/P (3)
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_51)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r22)<<D16A + (r1)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_51)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_mktime_52)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_51
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_mktime_52
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_54)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r22)<<D16A + (r1)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_54)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_mktime_55)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_54
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_mktime_55
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r19)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_mktime_57)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_56
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_60)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_62)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mktime_60)<<S32 ' NEI4 reg coni
 alignl_label
C_mktime_62
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_mktime_61)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_60
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_mktime_61
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_57
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r13)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_mktime_56)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_63)<<S32 ' GEI4 reg coni
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_63
 word I16A_ADDS + (r21)<<D16A + (r11)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r18)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r1)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_SUB + (r22)<<D16A + (r15)<<S16A ' SUBU (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $15180 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r0)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_65)<<S32 ' GEU4 reg reg
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_65
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((86400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r15)<<D16A + (r22)<<S16A ' ADDU (1)
 alignl_p1
 long I32_LODI + (@C__timezone)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_mktime_70)<<S32 ' LEI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_CMP + (r22)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_B + (@C_mktime_69)<<S32 ' LTU4 reg reg
 alignl_label
C_mktime_70
 alignl_p1
 long I32_LODI + (@C__timezone)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_67)<<S32 ' GEI4 reg coni
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_CMP + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_67)<<S32 ' GEU4 reg reg
 alignl_label
C_mktime_69
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_67
 alignl_p1
 long I32_LODI + (@C__timezone)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADD + (r15)<<D16A + (r22)<<S16A ' ADDU (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mktime_71)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__dstget)<<S32 ' CALL addrg
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_mktime_72)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_71
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_73)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODI + (@C__dst_off)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_mktime_74)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_73
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mktime_74
 alignl_label
C_mktime_72
 word I16A_CMP + (r9)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BRBE + (@C_mktime_75)<<S32 ' LEU4 reg reg
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_mktime_75
 word I16A_SUB + (r15)<<D16A + (r9)<<S16A ' SUBU (1)
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_77)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_mktime_1)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_77
 word I16A_CMP + (r15)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mktime_79)<<S32 ' EQU4 reg reg
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_mktime_1)<<S32 ' JUMPV addrg
 alignl_label
C_mktime_79
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_mktime_1
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _dst_off

' Catalina Import _timezone

' Catalina Import _dstget

' Catalina Import _tzset

' Catalina Import _ytab
' end
