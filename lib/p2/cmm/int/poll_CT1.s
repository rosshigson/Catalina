' Catalina Code

DAT ' code segment

' Catalina Export _poll_CT1

 alignl ' align long

C__poll_C_T_1_
   word I16B_EXEC
 alignl ' align long
   POLLCT1 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end
