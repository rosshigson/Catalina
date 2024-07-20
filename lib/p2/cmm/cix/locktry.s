' Catalina Code

' CMM PASM implementations of fundamental multi-threading lock operations
'
' int _locktry(int lockid);
'    try and get a lock, and return 1 on success, 0 on failure
' on entry:
'    r2 = lock id
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked

DAT ' code segment

' Catalina Export _locktry

 alignl ' align long

C__locktry
 word I16B_EXEC
 alignl ' align long
 locktry r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #EXEC_STOP
 word I16B_RETN
' end

