'#line 1 "cogchk.e"











' Catalina Code

DAT ' code segment

' Catalina Export _cogchk

 alignl ' align long

C__cogchk
 cogid r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 PRIMITIVE(#RETN)
' end
