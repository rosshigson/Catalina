'#line 1 "wait_XMT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _wait_XMT

 alignl ' align long

C__wait_X_M_T_
   cmp r2, #0 wz
 if_nz setq r2
   WAITXMT wc
 if_c mov r0, #0
 if_nc mov r0, #1
   PRIMITIVE(#RETN)
' end

