'#line 1 "poll_XRL.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_XRL

 alignl ' align long

C__poll_X_R_L_
   POLLXRL wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

