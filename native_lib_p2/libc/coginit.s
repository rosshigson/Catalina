'#line 1 "coginit.e"











' Catalina Code

DAT ' code segment

' Catalina Export _coginit

 alignl ' align long

C__coginit

 mov r0, r2
 and r0, #$1f
 shl r3, #2  ' 1 needs actual hub address
 shl r4, #2  ' 1 needs actual hub address

 setq r4    ' this will end up in PTRA of the new cog
 coginit r0, r3 wc

























 if_c neg r0, #1
 PRIMITIVE(#RETN)

' Catalina Init






' end

