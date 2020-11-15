'#line 1 "g_db_setcommand.e"











'
' Call the graphics plugin
' on entry:
'   r2 = parameter
'   r3 = command
'

' Catalina Import _vdb_cog

' Catalina Code

DAT ' code segment

' Catalina Export _db_setcommand

 alignl ' align long

C__db_setcommand
 shl r3, #16
 or  r2, r3
 PRIMITIVE(#LODI)
 long @C__vdb_cog
 mov r3, RI
 PRIMITIVE(#SYSP)
 PRIMITIVE(#RETN)
' end    C__db_setcommand

