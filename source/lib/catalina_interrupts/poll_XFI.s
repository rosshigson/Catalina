'#line 1 "poll_XFI.e"











' Catalina Code

DAT ' code segment

' Catalina Export _poll_XFI

 alignl ' align long

C__poll_X_F_I_
   POLLXFI wc
 if_c mov r0, #1
 if_nc mov r0, #0
   PRIMITIVE(#RETN)
' end

