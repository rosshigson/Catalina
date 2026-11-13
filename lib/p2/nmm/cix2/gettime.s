' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export rtc_gettime

 alignl ' align long
C_rtc_gettime ' <symbol:rtc_gettime>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #48 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__long_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_rtc_gettime_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _long_service
' end
