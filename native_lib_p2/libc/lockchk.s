'#line 1 "lockchk.e"











' Catalina Code

DAT ' code segment

' Catalina Export _lockchk

 alignl ' align long

C__lockchk
 mov r0, r2
 lockrel r0 wc
 bitc r0, #31
 PRIMITIVE(#RETN)
 ' end

