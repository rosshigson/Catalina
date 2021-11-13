'#line 1 "poll_XMT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_XMT

 alignl ' align long

C__poll_X_M_T_
   POLLXMT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

