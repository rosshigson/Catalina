' Catalina Code

DAT ' code segment

' Catalina Export _request_status

 alignl ' align long

C__request_status
 alignl ' align long
 long I32_CALA + @C__registry<<S32
 word I16B_EXEC
 alignl ' align long
 mov r4, r0
 sub r4, #(2*96)-(8*2*4) ' !!! NOTE: Must Match Catalina_Common !!!
 shl r2, #3
 add r4, r2
 rdlong r0, r4
 jmp #EXEC_STOP
 word I16B_RETN

' end

