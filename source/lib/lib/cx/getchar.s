' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getchar

 alignl ' align long
C_getchar ' <symbol:getchar>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, ##@C___stdin ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_getchar_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import getc

' Catalina Import __stdin
' end
