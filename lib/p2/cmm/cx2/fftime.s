' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export set_CLOCK_from_RTC

 alignl_label
C_set_C_L_O_C_K__from_R_T_C_ ' <symbol:set_CLOCK_from_RTC>
' C_set_C_L_O_C_K__from_R_T_C__1 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export get_fattime

 alignl_label
C_get_fattime ' <symbol:get_fattime>
 word I16B_LODL + R0<<D16B
 alignl_p1
 long $5a210000 ' RET con
' C_get_fattime_2 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1
' end
