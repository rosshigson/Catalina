'#line 1 "dbsetcmd.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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
 jmp #LODI
 long @C__vdb_cog
 mov r3, RI
 jmp #SYSP
 jmp #RETN
' end    C__db_setcommand

