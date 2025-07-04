' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fabs

 alignl_label
C_fabs ' <symbol:fabs>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_fabs_5_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_fabs_3)<<S32 ' GEF4
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 alignl_p1
 long I32_JMPA + (@C_fabs_4)<<S32 ' JUMPV addrg
 alignl_label
C_fabs_3
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fabs_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_fabs_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_fabs_5_L000006 ' <symbol:5>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
