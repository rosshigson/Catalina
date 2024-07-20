' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ltrunc

 alignl ' align long
C_ltrunc ' <symbol:ltrunc>
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
' C_ltrunc_1 ' (symbol refcount = 0)
 jmp #RETN

' end
