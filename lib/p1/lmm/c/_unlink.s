' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _unlink

 alignl ' align long
C__unlink ' <symbol:_unlink>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__unlink_2 ' (symbol refcount = 0)
 jmp #RETN

' end
