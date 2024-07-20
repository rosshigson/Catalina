' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export system

 alignl ' align long
C_system ' <symbol:system>
 mov r0, #0 ' reg <- coni
' C_system_1 ' (symbol refcount = 0)
 jmp #RETN

' end
