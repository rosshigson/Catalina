'#line 1 "pinclear.e"











' Catalina Code

DAT ' code segment

' Catalina Export _pinclear

 alignl ' align long

 ' r2 = pins
C__pinclear

 stalli

 dirl  r2
 wrpin r2, #0

 allowi

 PRIMITIVE(#RETN)
' end


