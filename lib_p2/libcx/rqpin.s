'#line 1 "rqpin.e"











' Catalina Code

DAT ' code segment

' Catalina Export _rqpin

 alignl ' align long

C__rqpin
 rqpin r0, r2 wc
 bitc r0, #31
 PRIMITIVE(#RETN)
' end

