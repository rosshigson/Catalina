'#line 1 "lockset.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_lockset(void *pool, int lockid);
'    set a lock, and return 1 on success, 0 on failure, -1 on error
' on entry:
'    r2 = lock id
'    r3 = pointer to pool (size + 5) bytes
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked, or -1 on error

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_lockset

 alignl ' align long

C__thread_lockset
 jmp #CALA       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 cmp r2, #1 wc          ' is the lock in the pool?



 jmp #BR_B
 long @:thr_lset_error  '  no - return with error


 cmp r2, r4 wcz         ' is the lock in the pool?






 jmp #BR_A
 long @:thr_lset_error  ' no - return with error

 mov RI, r3             ' yes - read ...
 add RI, #4
 add RI, r2



 rdbyte BC, RI          ' ... the lock byte

 test BC, #$80 wz       ' check allocation bit



 jmp #BR_Z
 long @:thr_lset_error  ' if not allocated return an error

 mov r0, BC             ' save the last state ...
 and r0, #1             ' ... of the lock ...
 xor r0, #1             ' ... negated (i.e. true if WE locked it)
 mov BC, #$81           ' set ...



 Wrbyte BC, RI          ' ... the lock




 jmp #JMPA
 long @:thr_lset_done   ' return the previous state of the lock

:thr_lset_error
 neg r0, #1             ' return -1 on error
:thr_lset_done

 call #\REL_POOL_LOCK   ' release pool lock



 jmp #RETN
' end
