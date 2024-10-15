' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _rename

 alignl ' align long
C__rename ' <symbol:_rename>
 mov r0, ##-1 ' RET con
' C__rename_2 ' (symbol refcount = 0)
 calld PA,#RETN

' end
