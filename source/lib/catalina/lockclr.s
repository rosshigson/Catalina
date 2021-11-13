'#line 1 "lockclr.e"











' Catalina Code

DAT ' code segment

' Catalina Export _lockclr

 alignl ' align long

C__lockclr

 stalli
 lockrel r2
 bitl lockbits, r2 wcz
 allowi



 if_c mov r0, #1
 if_nc mov r0, #0
 PRIMITIVE(#RETN)
' end

