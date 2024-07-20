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
' _thread_halt : threads come here when they exit their thread function
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_prev

' Catalina Export _thread_halt

 alignl ' align long

C__thread_halt
 PRIMITIVE(#CALA)
 long @C__thread_stall
 mov r5, r0             ' save r0
 mov RI, TP             ' write r0 ...
#if defined(P2) && defined(NATIVE)
 add RI, #(THREAD_REG_OFF+2)*4
#else
 add RI, #(THREAD_REG_OFF+8)*4
#endif
 mov BC, r0
#ifdef LARGE
 PRIMITIVE(#WLNG)
#else
 wrlong BC, RI          ' ... to our register save area
#endif
 mov RI, TP             ' set ...
 add RI, #THREAD_AFF_OFF*4+1
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
 calld PA,#\NMM_force   ' force a context switch immediately
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
' end C__thread_halt

'
' LMM PASM implementations of fundamental multi-threading operations
'
' _thread_exit : halt the thread and return a status (specified in r2);
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_halt

' Catalina Export _thread_exit

 alignl ' align long

C__thread_exit
 mov r0, r2             ' the status is in r2  
#if defined(P2) && defined(NATIVE)
 jmp #@C__thread_halt   ' thread halt 
#else
 PRIMITIVE(#JMPA)
 long @C__thread_halt   ' thread halt
#endif

' end C__thread_exit
