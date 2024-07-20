' Catalina Code

DAT ' code segment

' Catalina Export _poll_ATN

 alignl ' align long

C__poll_A_T_N_
   word I16B_EXEC
 alignl ' align long
   POLLATN wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end

