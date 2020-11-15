
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _set_int_3

 alignl ' align long

C__set_int_3
   sub     r2, #32*4   ' top 32 longs of stack space are register save area
#if defined(P2) && defined(NATIVE)
   wrlong  r2, ##@C__set_int_3_stack
   wrlong  r3, ##@C__set_int_3_function
   mov     ijmp3, ##@.call_isr_3
   setint3 r4
   jmp     #@.exit_set_3
#else
   PRIMITIVE(#LODL)
   long    @C__set_int_3_stack
   wrlong  r2, RI
   PRIMITIVE(#LODL)
   long    @C__set_int_3_function
   wrlong  r3, RI
   PRIMITIVE(#LODL)
   long    @.call_isr_3
   mov     ijmp3, RI
   setint3 r4
   PRIMITIVE(#JMPA)
   long    @.exit_set_3
#endif

.call_isr_3
   stalli
   rdlong  t2, ##@C__set_int_3_stack
   mov     Save_PC, iret3 ' Save PC and flags
#if defined(P2) && defined(NATIVE)
   mov     Save_PA, PA    ' Save PA
   mov     Save_FP, FP    ' Save FP
   mov     Save_SP, SP    ' Save SP
   setq    #30-1         ' save 30 registers ...
   wrlong  RI, t2         ' ... to register save area
#else
   setq    #32-1         ' save 32 registers ...
   wrlong  PC, t2         ' ... to register save area
#endif
   mov     SP, t2
   allowi
   rdlong  RI, ##@C__set_int_3_function

#if defined(P2) && defined(NATIVE)
   PRIMITIVE(#CALI)
#else
   mov     PC, ##@.enter_LMM_isr_3
   jmp     #\LMM_loop
.enter_LMM_isr_3
   PRIMITIVE(#CALI)
   PRIMITIVE(#LODL)
   long    @.exit_LMM_isr_3
   jmp     RI
.exit_LMM_isr_3
#endif

   stalli
   rdlong  t2, ##@C__set_int_3_stack
#if defined(P2) && defined(NATIVE)
   setq    #30-1         ' load 30 registers ...
   rdlong  RI, t2         ' ... from register save area
   mov     SP, Save_SP    ' restore SP
   mov     FP, Save_FP    ' restore FP
   mov     PA, Save_PA    ' restore PA
#else
   setq    #32-1         ' load 32 registers ...
   rdlong  PC, t2         ' ... from register save area
#endif
   mov     iret3, Save_PC ' restore PC and flags
   allowi
   reti3

.exit_set_3
   PRIMITIVE(#RETN)
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_3_stack    long 0
C__set_int_3_function long 0

