'#line 1 "poll_ANY.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_ANY

 alignl ' align long

C__poll_A_N_Y_
   POLLINT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

