'#line 1 "pinw.e"











' Catalina Code

DAT ' code segment

' Catalina Export _pinw

 alignl ' align long

C__pinw
 cmp r2, #0 wz
 if_z drvl r3
 if_nz drvh r3
 PRIMITIVE(#RETN)
' end

