' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _isatty

 alignl_label
C__isatty ' <symbol:_isatty>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C___stdin+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__isatty_8)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODI + (@C___stdout+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__isatty_8)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODI + (@C___stderr+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__isatty_2)<<S32 ' NEI4 reg reg
 alignl_label
C__isatty_8
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C__isatty_1)<<S32 ' JUMPV addrg
 alignl_label
C__isatty_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C__isatty_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin
' end
