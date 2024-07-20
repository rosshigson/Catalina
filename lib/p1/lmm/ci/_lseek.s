' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 alignl ' align long
C__lseek ' <symbol:_lseek>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__lseek_2 ' (symbol refcount = 0)
 jmp #RETN

' end
