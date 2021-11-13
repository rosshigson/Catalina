'#line 1 "lockret.e"











' Catalina Code

DAT ' code segment

' Catalina Export _lockret

 alignl ' align long

C__lockret
 lockret r2
 PRIMITIVE(#RETN)
' end

