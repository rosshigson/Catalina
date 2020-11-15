
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
' void * _thread_yield();
'    force a context switch 
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_yield

 alignl ' align long

C__thread_yield
#ifdef P2
 call #GET_KERNEL_LOCK  ' get kernel lock
#ifdef NATIVE
 calld PA, #\NMM_force  ' force a context switch immediately
#else
 calld PA, #\LMM_force  ' force a context switch immediately
#endif
#else
 lockset lock wc        ' if we get a lock ...
 if_nc jmp #LMM_force   ' ... force a context switch immediately
#endif
 PRIMITIVE(#RETN)
' end
