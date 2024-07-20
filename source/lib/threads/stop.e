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
' void * _thread_stop(void * block);
'    terminate a thread (which may be current thread!)
' on entry:
'    r2 = thread id to terminate
' on exit
'    r0 = thread id if terminated (& Z clr)
'    r0 = 0 (& Z set) if error (e.g. attempt to terminate last thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_prev

' Catalina Export _thread_stop

 alignl ' align long

C__thread_stop
 PRIMITIVE(#CALA)
 long @C__thread_stall
 PRIMITIVE(#CALA)
 long @C__unlocked_prev ' find thread block that points to this thread block
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_stop_error ' if not found return error 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_stop_error  ' if not found return error
#endif
 mov r1, r0             ' now r1 points to block that points to r2
 cmp r2, TP wz          ' are we terminating the current thread?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:thr_stop_remove ' no - can just update the appropriate block pointers 
#else
 PRIMITIVE(#BRNZ)
 long @:thr_stop_remove ' no - can just update the appropriate block pointers
#endif
 mov RI, TP             ' yes - get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... the next thread block pointer 
#endif
 cmp BC, TP wz          ' is only one thread executing?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_stop_error ' yes - cannot terminate last thread using this function
#else
 PRIMITIVE(#BR_Z)
 long @:thr_stop_error  ' yes - cannot terminate last thread using this function
#endif
:thr_stop_remove
 mov RI, r2             ' ... get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... the next thread pointer of block being terminated
#endif
 mov RI, r1             ' write it to ...
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... the block pointing to the block being terminated
#endif
 mov RI, r2             ' set ...
 add RI, #THREAD_AFF_OFF*4+1
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI
#endif
 or BC, #%10000000
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 wrbyte BC, RI          ' ... thread terminated bit
#endif 
 cmp r2, TP wz          ' are we terminating current thread?
#if defined(P2) && defined(NATIVE)
 if_nz jmp #@:thr_stop_done ' if not then we are done
#else
 PRIMITIVE(#BRNZ)
 long @:thr_stop_done   ' if not then we are done
#endif
#ifdef P2
#ifdef NATIVE
 calld PA,#\NMM_force   ' otherwise force a context switch immediately
#else
 jmp #\LMM_force        ' force a context switch immediately
#endif
#else
 jmp #LMM_force         ' force a context switch immediately
#endif
#if defined(P2) && defined(NATIVE)
 jmp #@C__thread_stop   ' if we return, try again (NOTE: locks released by context switch!)
#else
 PRIMITIVE(#JMPA)
 long @C__thread_stop   ' if we return, try again (NOTE: locks released by context switch!)
#endif
:thr_stop_done
 mov r0, r2 wz          ' if ok, return thread block (and Z clr)
#if defined(P2) && defined(NATIVE)
 jmp #@:thr_stop_exit
#else
 PRIMITIVE(#JMPA)
 long @:thr_stop_exit
#endif
:thr_stop_error
 mov r0, #0 wz          ' if not found, return zero (and Z set)
:thr_stop_exit
 PRIMITIVE(#CALA)
 long @C__thread_allow
 PRIMITIVE(#RETN)
' end
