' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl ' align long
C__mount ' <symbol:_mount>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__mount_2 ' (symbol refcount = 0)
 jmp #RETN

' end
