'#line 1 "dirb.e"











' Catalina Code

DAT ' code segment

' Catalina Export _dirb

 alignl ' align long

C__dirb
 mov r0, DIRB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, DIRB
 mov DIRB, r2
 PRIMITIVE(#RETN)
' end

