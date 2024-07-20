'
' CMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_init_lock_pool (void *pool, int size, int lock);
'    initialize a pool of locks
' on entry:
'    r2 = lock to use for this pool (0 .. 7 on P1, 0 .. 15 on P2)
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
 word I16A_MOV + RI<<D16A + r4<<S16A        ' write size ...
 word I16A_MOV + BC<<D16A + r3<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A     ' ... to the pool
 word I16A_ADDI + r4<<D16A + 4<<S16A
 word I16A_MOV + RI<<D16A + r4<<S16A        ' write lock ...
 word I16A_MOV + BC<<D16A + r2<<S16A
 word I16A_WRBYTE + BC<<D16A + RI<<S16A     ' ... to the pool
 alignl ' align long
:thr_pool_fill
 word I16A_ADDI + r4<<D16A + 1<<S16A        ' initialize all pool locks ...
 word I16A_SUBI + r3<<D16A + 1<<S16A
 word I16A_CMPI + r3<<D16A + 0<<S16A
 alignl ' align long
 long I32_BR_Z + @:thr_pool_done<<S32
 word I16A_MOV + RI<<D16A + r4<<S16A
 word I16A_MOVI + BC<<D16A + 0<<S16A
 word I16A_WRBYTE + BC<<D16A + RI<<S16A
 alignl ' align long
 long I32_JMPA + @:thr_pool_fill<<S32       ' ... to zero (unallocated)
 alignl ' align long
:thr_pool_done
 word I16A_MOVI + r0<<D16A + 0<<S16A
 word I16B_RETN
' end
