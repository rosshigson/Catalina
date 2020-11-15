' Catalina Code

DAT ' code segment

' Catalina Export _acquire_lock

 alignl ' align long

C__acquire_lock
 word I16B_EXEC
 alignl ' align long
#ifdef P2
C__acquire_lock_1
        bith    lockbits, r2 wcz  ' have we acquired ...              
 if_nz  locktry r2 wc             ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz bitl lockbits, r2   ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z sub PC,#(@C__acquire_lock_2-@C__acquire_lock_1)
C__acquire_lock_2
#else
C__acquire_lock_1
 lockset r2 wc
 if_c sub PC,#(@C__acquire_lock_2-@C__acquire_lock_1)
C__acquire_lock_2
#endif
 jmp #EXEC_STOP
 word I16B_RETN
' end

