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
' void * _thread_yield();
'    force a context switch 
'
' NOTE: If this code changes, check memory_lock.e, which has the same code.
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_yield

 alignl ' align long

C__thread_yield
#ifdef P2
 call #TRY_KERNEL_LOCK  ' if we get kernel lock ...
#ifdef NATIVE
 if_c calld PA,#\NMM_force  ' ... release kernel lock and force a context switch
#else
 if_c jmp #\LMM_force     ' ... force a context switch immediately
#endif
#else
 lockset lock wc        ' if we get a lock ...
 if_nc jmp #LMM_force   ' ... force a context switch immediately
#endif
 PRIMITIVE(#RETN)
' end
