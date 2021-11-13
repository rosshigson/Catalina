
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
#define PRIMITIVE(op) jmp op
#endif
#endif

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
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... from the pool
#endif
 mov r4, BC             ' return size in r4
 mov RI, r3             ' read lock ...
 add RI, #4
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI          ' ... from the pool
#endif
 mov r1, BC             ' return lock in r1
#ifdef P2
 call #\TRY_POOL_LOCK          ' did we get pool lock?
#if defined(NATIVE)
 if_c jmp #@:thr_psetup_locked ' yes - return
#else
 PRIMITIVE(#BR_B)
 long @:thr_psetup_locked      ' yes - return
#endif
 mov BC, #0                    ' no ...
 PRIMITIVE(#CALA)
 long @C__thread_yield         ' ...  yield ...
#if defined(NATIVE)
 jmp #@C__thread_pool_setup    ' ... and then try again
#else
 PRIMITIVE(#JMPA)
 long @C__thread_pool_setup    ' ... and then try again
#endif
#else
 lockset r1 wc                 ' did we get pool lock?
 PRIMITIVE(#BR_B)
 long @C__thread_pool_setup    ' no - try again
#endif
:thr_psetup_locked
 PRIMITIVE(#RETN)
' end
