
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
' LMM PASM implementations of fundamental multi-threading operations
'
' _thread_halt : threads come here when they exit their thread function
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _unlocked_prev

' Catalina Export _thread_halt

 alignl ' align long

C__thread_halt
#ifdef P2
 call #GET_KERNEL_LOCK        ' get kernel lock
#else
C__thread_halt_1
 lockset lock wc
 PRIMITIVE(#BR_B)
 long @C__thread_halt_1 ' loop till we get a kernel lock 
#endif
 mov r5, r0             ' save r0
 mov RI, TP             ' write r0 ...
 add RI, #9*4
 mov BC, r0
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... to our register save area
#endif
 mov RI, TP             ' set ...
 add RI, #33*4+1
#ifdef LARGE
 PRIMITIVE(#RBYT)
#else
 rdbyte BC, RI
#endif
 or BC, #%01000000
#ifdef LARGE
 PRIMITIVE(#WBYT)
#else
 wrbyte BC, RI          ' ... thread completed bit
#endif 
 mov r2, TP             ' find thread block ...
 PRIMITIVE(#CALA)
 long @C__unlocked_prev ' ... that points to this thread block
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_halt_done ' if not found cannot do any more 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_halt_done   ' if not found cannot do any more
#endif
 mov r1, r0             ' now r1 points to block that points to r2
 mov RI, TP             ' get ...
#ifdef LARGE
 PRIMITIVE(#RLNG)
#else
 rdlong BC, RI          ' ... next thread block pointer from current block
#endif
 cmp BC, TP wz          ' is only one thread executing?
#if defined(P2) && defined(NATIVE)
 if_z jmp #@:thr_halt_done ' yes - cannot do any more 
#else
 PRIMITIVE(#BR_Z)
 long @:thr_halt_done   ' yes - cannot do any more
#endif
 mov RI, r1             ' no - write next thread block pointer ...
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... to the next pointer of the previous block
#endif
:thr_halt_done
 mov r0, r5              ' restore r0 (in case we are still executing)
#ifdef P2
#ifdef NATIVE
 calld PA, #\NMM_force   ' force a context switch immediately
#else
 jmp #\LMM_force        ' force a context switch immediately
#endif
#else
 jmp #LMM_force         ' force a context switch immediately
#endif
#if defined(P2) && defined(NATIVE)
 jmp #@C__thread_halt   ' if we get here, try again 
#else
 PRIMITIVE(#JMPA)
 long @C__thread_halt   ' if we get here, try again
#endif
 PRIMITIVE(#RETN)       ' optimizer needs this
' end
