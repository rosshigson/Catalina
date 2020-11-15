'#line 1 "thread_pool_setup.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' _thread_pool_setup
'    internal common pool setup routine
' on entry:
'    r3 = pointer to pool (size + 1) bytes
' on exit:
'    r1 = lock to use for pool (pool is locked)
'    r3 = pointer to pool
'    r4 = size of pool
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_pool_setup

 alignl ' align long

C__thread_pool_setup
 mov RI, r3             ' read size ...



 rdlong BC, RI          ' ... from the pool

 mov r4, BC             ' return size in r4
 mov RI, r3             ' read lock ...
 add RI, #4



 rdbyte BC, RI          ' ... from the pool

 mov r1, BC             ' return lock in r1



:thr_psetup_lock
 lockset r1 wc
 jmp #BR_B
 long @:thr_psetup_lock ' loop till we get a lock on the pool

 jmp #RETN
' end
