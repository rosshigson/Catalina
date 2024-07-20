' Catalina Code

DAT ' code segment

' Catalina Export _wait_ATN

 alignl ' align long

C__wait_A_T_N_
   word I16B_EXEC
 alignl ' align long
   cmp r2, #0 wz
 if_nz setq r2
   WAITATN wc
 if_c mov r0, #0
 if_nc mov r0, #1
   jmp #EXEC_STOP
   word I16B_RETN
' end

