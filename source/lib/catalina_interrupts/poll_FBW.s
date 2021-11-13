'#line 1 "poll_FBW.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_FBW

 alignl ' align long

C__poll_F_B_W_
   POLLFBW wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

