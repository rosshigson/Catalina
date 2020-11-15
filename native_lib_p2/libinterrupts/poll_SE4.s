'#line 1 "poll_SE4.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_SE4

 alignl ' align long

C__poll_S_E_4
   POLLSE4 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

