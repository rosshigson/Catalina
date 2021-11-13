'#line 1 "wait_XRO.e"











' Catalina Code

DAT ' code segment

' Catalina Export _wait_XRO

 alignl ' align long

C__wait_X_R_O_
   cmp r2, #0 wz
 if_nz setq r2
   WAITXRO wc
 if_c mov r0, #0
 if_nc mov r0, #1
   PRIMITIVE(#RETN)
' end

