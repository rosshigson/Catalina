'#line 1 "thread_lockret.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_lockret(void *pool, int lockid);
'    return a lock to the pool
' on entry:
'    r2 = lock id
'    r3 = pointer to pool (size + 1) bytes
' on exit:
'    r0 = 0 on success, -1 on failure
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_lockret

 alignl ' align long

C__thread_lockret
 jmp #CALA       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 cmp r2, #1 wc          ' is the lock in the pool?



 jmp #BR_B
 long @:thr_lret_error  ' no - return with error




 cmp r2, r4 wz,wc       ' is the lock in the pool?




 jmp #BR_A
 long @:thr_lret_error  ' no - return with error

 mov RI, r3             ' yes - read ...
 add RI, #4
 add RI, r2



 rdbyte BC, RI          ' ... the lock byte

 test BC, #$80 wz       ' check allocation bit



 jmp #BR_Z
 long @:thr_lret_error  ' if not allocated return an error

 mov BC, #0             ' otherwise release ...



 Wrbyte BC, RI          ' ... the lock byte (and set it to unlocked)

 mov r0, #0             ' return ...



 jmp #JMPA
 long @:thr_lret_done   ' ... zero to indicate success

:thr_lret_error
 neg r0, #1             ' return -1 on error
:thr_lret_done



 lockclr r1             ' release pool lock

 jmp #RETN
' end
