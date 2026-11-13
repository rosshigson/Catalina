' Catalina Code

' CMM PASM implementations of fundamental multi-threading lock operations
'
' int _lockset(int lockid);
'    try and get a lock, and return 1 on success, 0 on failure
' on entry:
'    r2 = lock id
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked

DAT ' code segment

' Catalina Export _lockset

 alignl ' align long

C__lockset
             word I16B_EXEC
             alignl ' align long
#ifdef P2
             bith    lockbits, r2 wcz ' have we acquired ...              
 if_nz       locktry r2 wc            ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl    lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z  mov     r0, #0           ' if we failed to get both, return 0
 if_c_and_nz mov     r0, #1           ' if we got both, return 1
#else
             lockset r2 wc
 if_c        mov     r0, #0           ' if lock was already set, return 0
 if_nc       mov     r0, #1           ' if we set the lock, return 1
#endif
             jmp     #EXEC_STOP
             word    I16B_RETN
' end

