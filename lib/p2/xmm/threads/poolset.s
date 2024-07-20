'#line 1 "poolset.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
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

 jmp #RLNG



 mov r4, BC             ' return size in r4
 mov RI, r3             ' read lock ...
 add RI, #4

 jmp #RBYT



 mov r1, BC             ' return lock in r1

 call #\TRY_POOL_LOCK          ' did we get pool lock?



 jmp #BR_B
 long @:thr_psetup_locked      ' yes - return

 mov BC, #0                    ' no ...
 jmp #CALA
 long @C__thread_yield         ' ...  yield ...



 jmp #JMPA
 long @C__thread_pool_setup    ' ... and then try again






:thr_psetup_locked
 jmp #RETN
' end
