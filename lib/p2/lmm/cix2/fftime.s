' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export set_CLOCK_from_RTC

 alignl ' align long
C_set_C_L_O_C_K__from_R_T_C_ ' <symbol:set_CLOCK_from_RTC>
' C_set_C_L_O_C_K__from_R_T_C__1 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export get_fattime

 alignl ' align long
C_get_fattime ' <symbol:get_fattime>
 jmp #LODL
 long $5a210000
 mov r0, RI ' reg <- con
' C_get_fattime_2 ' (symbol refcount = 0)
 jmp #RETN

' end
