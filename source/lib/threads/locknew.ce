'
' CMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_locknew(void *pool);
'    allocate a new lock from the pool
' on entry:
'    r2 = pointer to pool (size + 5) bytes
' on exit:
'    r0 = lock on success (1 .. size), -1 on failure
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_locknew

 alignl ' align long

C__thread_locknew
 word I16A_MOV + r3<<D16A + r2<<S16A          ' point to pool with r3
 alignl ' align long
 long I32_CALA + @C__thread_pool_setup<<S32   ' get pool lock into r1, pool size into r4 and lock the pool
 word I16A_ADDI + r3<<D16A + 5<<S16A          ' point to ...
 word I16A_MOVI + r0<<D16A + 1<<S16A          ' ... first lock
 alignl ' align long
:thr_lnew_check
 word I16A_CMP + r0<<D16A + r4<<S16A          ' have we reached end of pool?
 alignl ' align long
 long I32_BR_A + @:thr_lnew_error<<S32        ' yes - return with error
 word I16A_MOV + RI<<D16A + r3<<S16A          ' read ...
 word I16A_RDBYTE + BC<<D16A + RI<<S16A       ' ... the thread lock byte
 word I16B_PASM
 alignl ' align long
   test BC, #$80 wz                            ' check allocation bit
 alignl ' align long
 long I32_BR_Z + @:thr_lnew_found<<S32        ' if not allocated use this lock
 word I16A_ADDI + r0<<D16A + 1<<S16A          ' otherwise ...
 word I16A_ADDI + r3<<D16A + 1<<S16A          ' ... keep looking ...
 alignl ' align long
 long I32_JMPA + @:thr_lnew_check<<S32        ' ... until we run out of locks
 alignl ' align long
:thr_lnew_found
 alignl ' align long
 long I32_MOVI + BC<<D32 + $80<<S32           ' allocate the lock byte ...
 word I16A_WRBYTE + BC<<D16A + RI<<S16A       ' ...  (and set it to unlocked)
 alignl ' align long
 long I32_JMPA + @:thr_lnew_done<<S32         ' return with the lock number
 alignl ' align long
:thr_lnew_error
 word I16A_NEGI + r0<<D16A + 1<<S16A          ' return -1 on error
 alignl ' align long
:thr_lnew_done 
#ifdef P2
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   call #REL_POOL_LOCK                            ' release pool lock
#else
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   lockclr r1 wc                              ' release the lock on the pool
#endif
 word I16B_RETN
' end
