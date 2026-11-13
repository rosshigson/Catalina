' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl_label
C_gmtime_br_time_L000003 ' <symbol:br_time>
 byte 0[36]

' Catalina Export gmtime

' Catalina Code

DAT ' code segment

 alignl_label
C_gmtime ' <symbol:gmtime>
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16B_LODL + (r23)<<D16B
 alignl_p1
 long @C_gmtime_br_time_L000003 ' reg <- addrg
 word I16A_RDLONG + (r15)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODS + (r17)<<D32S + ((1970)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $15180 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r21)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(60)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 3600 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(60)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r1)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 3600 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDI + (r20)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_gmtime_5)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_4
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_9)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_11)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_9)<<S32 ' NEI4 reg coni
 alignl_label
C_gmtime_11
 alignl_p1
 long I32_LODS + (r13)<<D32S + ((366)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_gmtime_10)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_9
 alignl_p1
 long I32_LODS + (r13)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_gmtime_10
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (1)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_gmtime_5
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_12)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_14)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_12)<<S32 ' NEI4 reg coni
 alignl_label
C_gmtime_14
 alignl_p1
 long I32_LODS + (r13)<<D32S + ((366)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_gmtime_13)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_12
 alignl_p1
 long I32_LODS + (r13)<<D32S + ((365)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_gmtime_13
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_gmtime_4)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r17)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_gmtime_16)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_15
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_20)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_22)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_20)<<S32 ' NEI4 reg coni
 alignl_label
C_gmtime_22
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_gmtime_21)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_20
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_gmtime_21
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_gmtime_16
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_23)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_25)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_gmtime_23)<<S32 ' NEI4 reg coni
 alignl_label
C_gmtime_25
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_gmtime_24)<<S32 ' JUMPV addrg
 alignl_label
C_gmtime_23
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_gmtime_24
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_gmtime_15)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_gmtime_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _ytab
' end
