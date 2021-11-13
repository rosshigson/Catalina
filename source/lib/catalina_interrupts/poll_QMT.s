'#line 1 "poll_QMT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_QMT

 alignl ' align long

C__poll_Q_M_T_
   POLLQMT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

