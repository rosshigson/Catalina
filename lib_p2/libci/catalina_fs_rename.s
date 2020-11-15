' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _rename

 alignl ' align long
C__rename ' <symbol:_rename>
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
' C__rename_2 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)

' end
