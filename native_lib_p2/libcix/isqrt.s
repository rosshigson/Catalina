'#line 1 "isqrt.e"











' Catalina Code

DAT ' code segment

' Catalina Export _isqrt

 alignl ' align long

C__isqrt

 stalli

 qsqrt r2, #0
 getqx r0

 allowi

 PRIMITIVE(#RETN)
' end


