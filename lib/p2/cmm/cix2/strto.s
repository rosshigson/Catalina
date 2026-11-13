' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isnumber

 alignl_label
C_isnumber ' <symbol:isnumber>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_A + (@C_isnumber_2)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_isnumber_5)<<S32 ' GEU4 reg coni
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_isnumber_5)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isnumber_6)<<S32 ' JUMPV addrg
 alignl_label
C_isnumber_5
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_isnumber_6
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_isnumber_1)<<S32 ' JUMPV addrg
 alignl_label
C_isnumber_2
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_tolower)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_isnumber_12)<<S32 ' GEU4 reg coni
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_B + (@C_isnumber_11)<<S32 ' LTI4 reg reg
 alignl_label
C_isnumber_12
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isnumber_9)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((97)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r20)<<D16A + (10)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_isnumber_9)<<S32 ' GEI4 reg reg
 alignl_label
C_isnumber_11
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isnumber_10)<<S32 ' JUMPV addrg
 alignl_label
C_isnumber_9
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_isnumber_10
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_isnumber_1
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export tonumber

 alignl_label
C_tonumber ' <symbol:tonumber>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_tonumber_14)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r20)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_JMPA + (@C_tonumber_13)<<S32 ' JUMPV addrg
 alignl_label
C_tonumber_14
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_tonumber_16)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_tolower)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((97)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (10)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_tonumber_13)<<S32 ' JUMPV addrg
 alignl_label
C_tonumber_16
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_tonumber_13
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import tolower

' Catalina Import __ctype
' end
