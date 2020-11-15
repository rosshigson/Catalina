' Catalina Code

DAT ' code segment

' Catalina Export _wait_XFI

 alignl ' align long

C__wait_X_F_I_
   word I16B_EXEC
 alignl ' align long
   cmp r2, #0 wz
 if_nz setq r2
   WAITXFI wc
 if_c mov r0, #0
 if_nc mov r0, #1
   jmp #EXEC_STOP
   word I16B_RETN
' end

