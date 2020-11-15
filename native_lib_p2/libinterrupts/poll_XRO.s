'#line 1 "poll_XRO.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_XRO

 alignl ' align long

C__poll_X_R_O_
   POLLXRO wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

