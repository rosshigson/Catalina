'#line 1 "outa.e"











' Catalina Code

DAT ' code segment

' Catalina Export _outa

 alignl ' align long

C__outa
 mov r0, OUTA
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, OUTA
 mov OUTA, r2
 PRIMITIVE(#RETN)
' end

