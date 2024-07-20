' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _close_unmanaged

 alignl ' align long
C__close_unmanaged ' <symbol:_close_unmanaged>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__close_unmanaged_2 ' (symbol refcount = 0)
 jmp #RETN

' end
