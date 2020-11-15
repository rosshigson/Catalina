' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getchar

 alignl ' align long
C_getchar ' <symbol:getchar>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C___iotab ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_getchar_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import getc

' Catalina Import __iotab
' end
