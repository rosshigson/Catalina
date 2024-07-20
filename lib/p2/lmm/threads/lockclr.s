'#line 1 "lockclr.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading lock operations
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
 jmp #CALA       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 cmp r2, #1 wc          ' is the lock in the pool?



 jmp #BR_B
 long @:thr_lclr_error  ' no - return with error


 cmp r2, r4 wcz         ' is the lock in the pool?






 jmp #BR_A
 long @:thr_lclr_error  ' no - return with error

 mov RI, r3             ' yes - read ...
 add RI, #4
 add RI, r2



 rdbyte BC, RI          ' ... the lock byte

 test BC, #$80 wz       ' check allocation bit



 jmp #BR_Z
 long @:thr_lclr_error  ' if not allocated return an error

 mov r0, BC             ' save the last state ...
 and r0, #1             ' ... of the lock
 mov BC, #$80           ' clear ...



 Wrbyte BC, RI          ' ... the lock




 jmp #JMPA
 long @:thr_lclr_done   ' return the previous state of the lock

:thr_lclr_error
 neg r0, #1             ' return -1 on error
:thr_lclr_done

 call #\REL_POOL_LOCK        ' release pool lock



 jmp #RETN
' end
