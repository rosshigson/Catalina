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
 mov RI, r4             ' write size ...
 mov BC, r3
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... to the pool
#endif
 add r4, #4
 mov RI, r4             ' write lock ...
 mov BC, r2
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 wrbyte BC, RI          ' ... to the pool
#endif
:thr_pool_fill
 add r4, #1             ' initialize all pool locks ...
 sub r3, #1
 cmp r3, #0 wz
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_pool_done 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_pool_done
#endif
 mov RI, r4 
 mov BC, #0
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 wrbyte BC, RI
#endif   
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_pool_fill   ' ... to zero (unallocated)
#else
 PRIMITIVE(#JMPA)
 long @:thr_pool_fill   ' ... to zero (unallocated)
#endif
:thr_pool_done
 mov r0, #0
 PRIMITIVE(#RETN)
' end
