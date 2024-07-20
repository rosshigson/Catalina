' Catalina Code

DAT ' code segment

' Catalina Export _set_PAT

 alignl ' align long

C__set_P_A_T_
   word I16B_EXEC
 alignl ' align long
   ror r5, #1 wc
   cmp r4, #0 wz
   setpat r3, r2
   jmp #EXEC_STOP
   word I16B_RETN
' end

