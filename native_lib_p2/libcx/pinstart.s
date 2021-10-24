'#line 1 "pinstart.e"











' Catalina Code

DAT ' code segment

' Catalina Export _pinstart

 alignl ' align long

 ' r2 = yval
 ' r3 = xval
 ' r4 = mode
 ' r5 = pins
C__pinstart
 dirl  r5
 wrpin r4, r5
 wxpin r3, r5
 wypin r2, r5
 dirh  r5
 PRIMITIVE(#RETN)
' end


