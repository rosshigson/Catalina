'#line 1 "rnd.e"











' Catalina Code

DAT ' code segment

' Catalina Export _rnd

 alignl ' align long

C__rnd
 getrnd r0
 PRIMITIVE(#RETN)
' end


