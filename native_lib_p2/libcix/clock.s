' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export clock

 alignl ' align long
C_clock ' <symbol:clock>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_rtc_getclock ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_clock_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import rtc_getclock
' end
