' Catalina Code

DAT ' code segment

' Catalina Export _poll_PAT

 alignl ' align long

C__poll_P_A_T_
   word I16B_EXEC
 alignl ' align long
   POLLPAT wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end

