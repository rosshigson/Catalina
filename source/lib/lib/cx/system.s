' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export system

 alignl ' align long
C_system ' <symbol:system>
 mov r0, #0 ' reg <- coni
' C_system_1 ' (symbol refcount = 0)
 calld PA,#RETN

' end
