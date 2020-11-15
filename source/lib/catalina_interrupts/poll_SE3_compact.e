' Catalina Code

DAT ' code segment

' Catalina Export _poll_SE3

 alignl ' align long

C__poll_S_E_3
   word I16B_EXEC
 alignl ' align long
   POLLSE3 wc
 if_c mov r0, #1
 if_nc mov r0, #0
   jmp #EXEC_STOP
   word I16B_RETN
' end

