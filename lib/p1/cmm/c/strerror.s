' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strerror

 alignl_label
C_strerror ' <symbol:strerror>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_strerror_4)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C__sys_nerr)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_strerror_2)<<S32 ' LTI4 reg reg
 alignl_label
C_strerror_4
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_strerror_5_L000006 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_strerror_1)<<S32 ' JUMPV addrg
 alignl_label
C_strerror_2
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__sys_errlist ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_strerror_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _sys_nerr

' Catalina Import _sys_errlist

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_strerror_5_L000006 ' <symbol:5>
 byte 117
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

' Catalina Code

DAT ' code segment
' end
