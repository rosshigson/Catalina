'#line 1 "lockclr.e"











' Catalina Code

DAT ' code segment

' Catalina Export _lockclr

 alignl ' align long

C__lockclr

 lockrel r2
 bitl lockbits, r2





 PRIMITIVE(#RETN)
' end

