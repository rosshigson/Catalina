' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _open_unmanaged

 alignl ' align long
C__open_unmanaged ' <symbol:_open_unmanaged>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__open_unmanaged_2 ' (symbol refcount = 0)
 jmp #RETN

' end
