' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create_directory

 alignl ' align long
C__create_directory ' <symbol:_create_directory>
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
' C__create_directory_2 ' (symbol refcount = 0)
 jmp #RETN

' end
