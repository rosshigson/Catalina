'#line 1 "poolset.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' _thread_pool_setup
'    internal common pool setup routine
' on entry:
'    r3 = pointer to pool (size + 5) bytes
' on exit:
'    r1 = lock to use for pool (pool is locked)
'    r3 = pointer to pool
'    r4 = size of pool
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id
' Catalina Import _thread_yield

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


















 lockset r1 wc                 ' did we get pool lock?
 jmp #BR_B
 long @C__thread_pool_setup    ' no - try again

:thr_psetup_locked
 jmp #RETN
' end
