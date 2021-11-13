'#line 1 "cnthl.e"











' Catalina Code

DAT ' code segment

' Catalina Export _cnthl

 alignl ' align long

C__cnthl

 getct r1 wc
 getct r0




 wrlong r0, r2
 add r2, #4
 wrlong r1, r2
 PRIMITIVE(#RETN)
' end


