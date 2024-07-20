'#line 1 "setcmd.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' Call the graphics plugin
' on entry:
'   r2 = parameter
'   r3 = command
'

' Catalina Import _cgi_cog

' Catalina Code

DAT ' code segment

' Catalina Export _setcommand

 alignl ' align long

C__setcommand
 shl r3, #16
 or  r2, r3
 jmp #LODI
 long @C__cgi_cog
 mov r3, RI
 jmp #SYSP
 jmp #RETN
' end    C__setcommand

