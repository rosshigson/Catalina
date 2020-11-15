
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
' int _thread_init_lock_pool (void *pool, int size, int lock);
'    initialize a pool of locks
' on entry:
'    r2 = lock to use for this pool (0 .. 7)
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
