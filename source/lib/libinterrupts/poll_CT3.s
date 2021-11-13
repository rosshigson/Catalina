'#line 1 "poll_CT3.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_CT3

 alignl ' align long

C__poll_C_T_3
   POLLCT3 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

