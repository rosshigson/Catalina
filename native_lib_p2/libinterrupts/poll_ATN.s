'#line 1 "poll_ATN.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_ATN

 alignl ' align long

C__poll_A_T_N_
   POLLATN wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

