' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _mkdir

 alignl ' align long
C__mkdir ' <symbol:_mkdir>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__mkdir_2 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export _mkdirr

 alignl ' align long
C__mkdirr ' <symbol:_mkdirr>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__mkdirr_3 ' (symbol refcount = 0)
 jmp #RETN

' end
