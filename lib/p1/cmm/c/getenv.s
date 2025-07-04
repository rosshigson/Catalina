' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_getenv_timezone_L000005 ' <symbol:timezone>
 byte 71
 byte 77
 byte 84
 byte 0

' Catalina Export getenv

' Catalina Code

DAT ' code segment

 alignl_label
C_getenv ' <symbol:getenv>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_getenv_8_L000009 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_getenv_6)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_getenv_timezone_L000005 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_getenv_3)<<S32 ' JUMPV addrg
 alignl_label
C_getenv_6
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_getenv_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import strcmp

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_getenv_8_L000009 ' <symbol:8>
 byte 84
 byte 90
 byte 0

' Catalina Code

DAT ' code segment
' end
