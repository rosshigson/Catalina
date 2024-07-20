' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA,op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_join(void * block, int *result);
'    wait for a thread to terminate
' on entry:
'    r3 = thread id to join
'    r2 = address to store result (r0 of joined thread)
' on exit
'    r0 = thread id if joined
'    r0 = 0 if error (e.g. attempt to join own thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_join

 alignl ' align long

C__thread_join
C__thread_join_0
 PRIMITIVE(#CALA)
 long @C__thread_stall
 cmp r3, TP wz          ' request to join current thread?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_join_error ' yes - return error 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_join_error  ' yes - return error
#endif
 mov RI, r3             ' no - has thread ...
 add RI, #THREAD_AFF_OFF*4+1
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI          
#endif
 test BC, #%10000000 wz ' ... been terminated?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:thr_join_error ' yes return error 
#else
 PRIMITIVE(#BRNZ)
 long @:thr_join_error  ' yes return error
#endif
 test BC, #%01000000 wz ' no - has thread completed?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_join_wait ' no - keep waiting 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_join_wait   ' no - keep waiting 
#endif
 mov RI, r3             ' yes - load ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+2)*4
#else
 add RI, #(THREAD_REG_OFF+8)*4
#endif
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... thread r0
#endif
 mov RI, r2             ' save it ...
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... as the result
#endif
 mov r0, r3 wz          ' return thread block (and Z clr)
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_join_exit
#else
 PRIMITIVE(#JMPA)
 long @:thr_join_exit
#endif
:thr_join_wait 
#ifdef P2
#ifdef NATIVE
 calld PA,#\NMM_force   ' force a context switch immediately
#else
 jmp #\LMM_force        ' force a context switch immediately
#endif
#else
 jmp #LMM_force         ' force a context switch immediately
#endif
#if defined(P2) && defined(NATIVE)
 jmp #@C__thread_join_0 ' if we return, try again (NOTE: locks released by context switch!)
#else
 PRIMITIVE(#JMPA)
 long @C__thread_join_0 ' if we return, try again (NOTE: locks released by context switch!)
#endif
:thr_join_error
 mov r0, #0 wz          ' if not found or error, return zero (and Z set)
:thr_join_exit 
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
