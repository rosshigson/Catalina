'
' CMM PASM implementations of fundamental multi-threading lock operations
'
' _thread_pool_setup 
'    internal common pool setup routine
' on entry:
'    r3 = pointer to pool (size + 5, long aligned) bytes
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
 word I16A_MOV + RI<<D16A + r3<<S16A    ' read size ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... from the pool
 word I16A_MOV + r4<<D16A + BC<<S16A    ' return size in r4
 word I16A_MOV + RI<<D16A + r3<<S16A    ' read lock ...
 word I16A_ADDI + RI<<D16A + 4<<S16A    ' ... from ...
 word I16A_RDBYTE + BC<<D16A + RI<<S16A ' ... the pool
 word I16A_MOV + r1<<D16A + BC<<S16A    ' return lock in r1
 alignl ' align long
#ifdef P2
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   call #\TRY_POOL_LOCK                      ' did we get pool lock?
 alignl ' align long
 long I32_BR_B + @:thr_psetup_locked<<S32    ' yes - return
 long I32_CALA + @C__thread_yield<<S32       ' no - yield ...
 long I32_JMPA + @C__thread_pool_setup<<S32  ' ... and then try again
#else
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   lockset r1 wc                             ' did we get pool lock?
 alignl ' align long
 long I32_BR_B + @C__thread_pool_setup<<S32  ' no - try again
#endif
:thr_psetup_locked
 word I16B_RETN
'
