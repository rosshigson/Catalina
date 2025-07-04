' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export __huge_val

 alignl_label
C___huge_val ' <symbol:__huge_val>
 alignl_p1
 long I32_LODI + (@C___huge_val_2_L000003)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
' C___huge_val_1 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C___huge_val_2_L000003 ' <symbol:2>
 long $7f800000 ' float

' Catalina Code

DAT ' code segment
' end
