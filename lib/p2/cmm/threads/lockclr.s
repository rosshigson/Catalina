'
' CMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_lockclr(void *pool, int lockid);
'    clear a lock, and return the previous value
' on entry:
'    r2 = lock id
'    r3 = pointer to pool (size + 5) bytes
' on exit:
'    r0 = previous value of lock (0 or 1), or -1 on error
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_lockclr

 alignl ' align long

C__thread_lockclr
 alignl ' align long
 long I32_CALA + @C__thread_pool_setup<<S32 ' get pool lock into r1, pool size into r4 and lock the pool
 word I16A_CMPI + r2<<D16A + 1<<S16A        ' is the lock in the pool?
 alignl ' align long
 long I32_BR_B + @:thr_lclr_error<<S32      ' no - return with error
 word I16A_CMP  + r2<<D16A + r4<<S16A       ' is the lock in the pool?
 alignl ' align long
 long I32_BR_A + @:thr_lclr_error<<S32      ' no - return with error
 word I16A_MOV + RI<<D16A + r3<<S16A        ' read ...
 word I16A_ADDI + RI<<D16A + 4<<S16A 
 word I16A_ADD + RI<<D16A + r2<<S16A
 word I16A_RDBYTE + BC<<D16A + RI<<S16A     ' ... the thread lock byte
 word I16B_PASM
 alignl ' align long
   test BC, #$80 wz                          ' check allocation bit
 alignl ' align long
 long I32_BR_Z + @:thr_lclr_error<<S32      ' if not allocated return an error
 word I16A_MOV + r0<<D16A + BC<<S16A        ' save the last state ...
 word I16B_PASM
 alignl ' align long
   and r0, #1                                ' ... of the lock
 alignl ' align long
 long I32_MOVI + BC<<D32 + $80<<S32         ' clear ...
 word I16A_WRBYTE + BC<<D16A + RI<<S16A     ' ... the lock
 alignl ' align long
 long I32_JMPA + @:thr_lclr_done<<S32       ' return previous state of the lock
 alignl ' align long
:thr_lclr_error
 word I16A_NEGI + r0<<D16A + 1<<S16A        ' return -1 on error
 alignl ' align long
:thr_lclr_done 
#ifdef P2
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   call #REL_POOL_LOCK                          ' release pool lock
#else
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   lockclr r1 wc                            ' release the lock on the pool
#endif
 word I16B_RETN
' end
