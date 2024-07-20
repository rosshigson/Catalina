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

' Catalina Code

'
' LMM PASM implementations of fundamental multi-threading lock operations
'
' int _thread_lockset(void *pool, int lockid);
'    set a lock, and return 1 on success, 0 on failure, -1 on error
' on entry:
'    r2 = lock id
'    r3 = pointer to pool (size + 5) bytes
' on exit:
'    r0 = 1 if we locked it, 0 if it was already locked, or -1 on error

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_lockset

 alignl ' align long

C__thread_lockset
 PRIMITIVE(#CALA)       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 cmp r2, #1 wc          ' is the lock in the pool?
#if defined(P2) && defined(NATIVE)
 if_b jmp #@:thr_lset_error '  no - return with error 
#else
 PRIMITIVE(#BR_B)
 long @:thr_lset_error  '  no - return with error
#endif
#ifdef P2
 cmp r2, r4 wcz         ' is the lock in the pool?
#else
 cmp r2, r4 wz,wc       ' is the lock in the pool?
#endif
#if defined(P2) && defined(NATIVE)
 if_a jmp #@:thr_lset_error ' no - return with error 
#else
 PRIMITIVE(#BR_A)
 long @:thr_lset_error  ' no - return with error
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
 if_z jmp #@:thr_lset_error ' if not allocated return an error 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_lset_error  ' if not allocated return an error
#endif
 mov r0, BC             ' save the last state ...
 and r0, #1             ' ... of the lock ...
 xor r0, #1             ' ... negated (i.e. true if WE locked it)
 mov BC, #$81           ' set ...
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 Wrbyte BC, RI          ' ... the lock
#endif
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_lset_done   ' return the previous state of the lock
#else
 PRIMITIVE(#JMPA)
 long @:thr_lset_done   ' return the previous state of the lock
#endif
:thr_lset_error
 neg r0, #1             ' return -1 on error
:thr_lset_done 
#ifdef P2
 call #\REL_POOL_LOCK   ' release pool lock
#else
 lockclr r1             ' release pool lock
#endif
 PRIMITIVE(#RETN)
' end
