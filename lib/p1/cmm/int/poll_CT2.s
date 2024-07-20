' Catalina Code

DAT ' code segment

' Catalina Export _poll_CT2

 alignl ' align long

C__poll_C_T_2
   word I16B_EXEC
 alignl ' align long
   POLLCT2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end

