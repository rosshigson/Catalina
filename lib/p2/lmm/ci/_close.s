' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _close

 alignl ' align long
C__close ' <symbol:_close>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__close_2 ' (symbol refcount = 0)
 jmp #RETN

' end
