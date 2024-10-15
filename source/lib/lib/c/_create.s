' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create

 alignl ' align long
C__create ' <symbol:_create>
 mov r0, ##-1 ' RET con
' C__create_2 ' (symbol refcount = 0)
 calld PA,#RETN

' end
