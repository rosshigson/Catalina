'#line 1 "locknew.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading lock operations
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
 mov r3, r2              ' point to pool with r3
 jmp #CALA       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 add r3, #5             ' point to ...
 mov r0, #1             ' ... first lock
:thr_lnew_check

 cmp r0, r4 wcz         ' have we reached end of pool?






 jmp #BR_A
 long @:thr_lnew_error  ' yes - return with error

 mov RI, r3             ' no - read ...

 jmp #RBYT



 test BC, #$80 wz       ' check allocation bit



 jmp #BR_Z
 long @:thr_lnew_found  ' if not allocated use this lock

 add r0, #1             ' otherwise ...
 add r3, #1             ' ... keep ...



 jmp #JMPA
 long @:thr_lnew_check  ' ... looking until we run out of locks

:thr_lnew_found
 mov BC, #$80           ' allocate ...

 jmp #WBYT






 jmp #JMPA
 long @:thr_lnew_done   ' return with the lock number

:thr_lnew_error
 neg r0, #1             ' return -1 on error
:thr_lnew_done

 call #\REL_POOL_LOCK    ' release pool lock



 jmp #RETN
' end
