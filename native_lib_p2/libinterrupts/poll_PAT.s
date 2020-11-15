'#line 1 "poll_PAT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_PAT

 alignl ' align long

C__poll_P_A_T_
   POLLPAT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

