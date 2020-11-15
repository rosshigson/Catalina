'#line 1 "locknew.e"











' Catalina Code

DAT ' code segment

' Catalina Export _locknew

 alignl ' align long

C__locknew
 locknew r0 wc
 if_c neg r0, #1
 PRIMITIVE(#RETN)
' end

