' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export clock

 long ' align long
C_clock ' <symbol:clock>
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rtc_getclock ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_clock_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import rtc_getclock
' end
