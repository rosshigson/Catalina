' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export getchar

 long ' align long
C_getchar ' <symbol:getchar>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C___iotab
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_getchar_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import getc

' Catalina Import __iotab
' end
