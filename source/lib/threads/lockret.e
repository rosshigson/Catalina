' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_lockret(void *pool, int lockid);
'    return a lock to the pool
' on entry:
'    r2 = lock id
'    r3 = pointer to pool (size + 5) bytes
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
 PRIMITIVE(#CALA)       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 cmp r2, #1 wc          ' is the lock in the pool?
#if defined(P2) && defined(NATIVE)
 if_b jmp #@:thr_lret_error ' no - return with error 
#else
 PRIMITIVE(#BR_B)
 long @:thr_lret_error  ' no - return with error
#endif
#ifdef P2
 cmp r2, r4 wcz         ' is the lock in the pool?
#else
 cmp r2, r4 wz,wc       ' is the lock in the pool?
#endif
#if defined(P2) && defined(NATIVE)
 if_a jmp #@:thr_lret_error ' no - return with error 
#else
 PRIMITIVE(#BR_A)
 long @:thr_lret_error  ' no - return with error
#endif
 mov RI, r3             ' yes - read ...
 add RI, #4
 add RI, r2
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI          ' ... the lock byte
#endif
 test BC, #$80 wz       ' check allocation bit
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_lret_error ' if not allocated return an error 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_lret_error  ' if not allocated return an error
#endif
 mov BC, #0             ' otherwise release ...
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 Wrbyte BC, RI          ' ... the lock byte (and set it to unlocked)
#endif
 mov r0, #0             ' return ...
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_lret_done   ' ... zero to indicate success
#else
 PRIMITIVE(#JMPA)
 long @:thr_lret_done   ' ... zero to indicate success
#endif
:thr_lret_error
 neg r0, #1             ' return -1 on error
:thr_lret_done 
#ifdef P2
 call #REL_POOL_LOCK    ' release pool lock
#else
 lockclr r1             ' release pool lock
#endif
 PRIMITIVE(#RETN)
' end
