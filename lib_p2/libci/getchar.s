' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getchar

 alignl ' align long
C_getchar ' <symbol:getchar>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 PRIMITIVE(#LODL)
 long @C___iotab
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_getchar_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import getc

' Catalina Import __iotab
' end
