'#line 1 "wait_PAT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _wait_PAT

 alignl ' align long

C__wait_P_A_T_
   cmp r2, #0 wz
 if_nz setq r2
   WAITPAT wc
 if_c mov r0, #0
 if_nc mov r0, #1
   PRIMITIVE(#RETN)
' end

