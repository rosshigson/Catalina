' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export clock

 alignl ' align long
C_clock ' <symbol:clock>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C_rtc_getclock)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_clock_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import rtc_getclock
' end
