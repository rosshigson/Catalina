' Catalina Code

DAT ' code segment

' Catalina Export _poll_ANY

 alignl ' align long

C__poll_A_N_Y_
   word I16B_EXEC
 alignl ' align long
   POLLINT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end

