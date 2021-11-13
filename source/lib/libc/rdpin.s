'#line 1 "rdpin.e"











' Catalina Code

DAT ' code segment

' Catalina Export _rdpin

 alignl ' align long

C__rdpin
 rdpin r0, r2 wc
 bitc r0, #31
 PRIMITIVE(#RETN)
' end

