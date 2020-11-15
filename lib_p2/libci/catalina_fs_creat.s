' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _creat

 alignl ' align long
C__creat ' <symbol:_creat>
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
' C__creat_2 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)

' end
