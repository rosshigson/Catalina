'#line 1 "thread_init_lock_pool.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_init_lock_pool (void *pool, int size, int lock);
'    initialize a pool of locks
' on entry:
'    r2 = lock to use for this pool (0 .. 7)
'    r3 = size of this pool
'    r4 = pointer to pool (size + 5, long aligned) bytes of Hub RAM
' on exit:
'    r0 = 0 on success, -1 on failure
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_init_lock_pool

 alignl ' align long

C__thread_init_lock_pool
 mov RI, r4             ' write size ...
 mov BC, r3



 wrlong BC, RI          ' ... to the pool

 add r4, #4
 mov RI, r4             ' write lock ...
 mov BC, r2



 wrbyte BC, RI          ' ... to the pool

:thr_pool_fill
 add r4, #1             ' initialize all pool locks ...
 sub r3, #1
 cmp r3, #0 wz



 jmp #BR_Z
 long @:thr_pool_done

 mov RI, r4
 mov BC, #0



 wrbyte BC, RI




 jmp #JMPA
 long @:thr_pool_fill   ' ... to zero (unallocated)

:thr_pool_done
 mov r0, #0
 jmp #RETN
' end
