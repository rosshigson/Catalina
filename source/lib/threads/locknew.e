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
' int _thread_locknew(void *pool);
'    allocate a new lock from the pool
' on entry:
'    r2 = pointer to pool (size + 5) bytes
' on exit:
'    r0 = lock on success (1 .. size), -1 on failure
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_pool_setup

' Catalina Export _thread_locknew

 alignl ' align long

C__thread_locknew
 mov r3, r2              ' point to pool with r3
 PRIMITIVE(#CALA)       ' get pool lock into r1 and ...
 long @C__thread_pool_setup ' ... pool size into r4 and lock the pool
 add r3, #5             ' point to ...
 mov r0, #1             ' ... first lock
:thr_lnew_check
#ifdef P2
 cmp r0, r4 wcz         ' have we reached end of pool?
#else
 cmp r0, r4 wz, wc       ' have we reached end of pool?
#endif
#if defined(P2) && defined(NATIVE)
 if_a jmp #@:thr_lnew_error  ' yes - return with error 
#else
 PRIMITIVE(#BR_A)
 long @:thr_lnew_error  ' yes - return with error
#endif
 mov RI, r3             ' no - read ...
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI          ' ... the lock byte
#endif
 test BC, #$80 wz       ' check allocation bit
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_lnew_found ' if not allocated use this lock 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_lnew_found  ' if not allocated use this lock
#endif
 add r0, #1             ' otherwise ...
 add r3, #1             ' ... keep ...
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_lnew_check  ' ... looking until we run out of locks
#else
 PRIMITIVE(#JMPA)
 long @:thr_lnew_check  ' ... looking until we run out of locks
#endif
:thr_lnew_found
 mov BC, #$80           ' allocate ...
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 Wrbyte BC, RI          ' ... the thread lock byte (and set it to unlocked)
#endif
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_lnew_done   ' return with the lock number
#else
 PRIMITIVE(#JMPA)
 long @:thr_lnew_done   ' return with the lock number
#endif
:thr_lnew_error
 neg r0, #1             ' return -1 on error
:thr_lnew_done 
#ifdef P2
 call #\REL_POOL_LOCK    ' release pool lock
#else
 lockclr r1             ' release pool lock
#endif
 PRIMITIVE(#RETN)
' end
