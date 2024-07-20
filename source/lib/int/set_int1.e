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

' Catalina Code

DAT ' code segment

' Catalina Export _set_int_1

 alignl ' align long

C__set_int_1
   cogid   r0
   shl     r0, #2
   sub     r2, #32*4   ' top 32 longs of stack space are register save area
#if defined(P2) && defined(NATIVE)
   mov     r1, ##@C__set_int_1_stack
   add     r1, r0
   wrlong  r2, r1
   mov     r1, ##@C__set_int_1_function
   add     r1, r0
   wrlong  r3, r1
   mov     ijmp1, ##@.call_isr_1
   setint1 r4
   jmp     #@.exit_set_1
#else
   PRIMITIVE(#LODL)
   long    @C__set_int_1_stack
   add     RI, r0
   wrlong  r2, RI
   PRIMITIVE(#LODL)
   long    @C__set_int_1_function
   add     RI, r0
   wrlong  r3, RI
   PRIMITIVE(#LODL)
   long    @.call_isr_1
   mov     ijmp1, RI
   setint1 r4
   PRIMITIVE(#JMPA)
   long    @.exit_set_1
#endif

.call_isr_1
   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_1_stack
   rdlong  t2, t2
   mov     Save_PC, iret1 ' Save PC and flags
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
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_1_function
   rdlong  RI, t2
   allowi

#if defined(P2) && defined(NATIVE)
   PRIMITIVE(#CALI)
#else
   mov     PC, ##@.enter_LMM_isr_1
   jmp     #\LMM_loop
.enter_LMM_isr_1
   PRIMITIVE(#CALI)
   PRIMITIVE(#LODL)
   long    @.exit_LMM_isr_1
   jmp     RI
.exit_LMM_isr_1
#endif

   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_1_stack
   rdlong  t2, t2
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
   mov     iret1, Save_PC ' restore PC and flags
   allowi
   reti1

.exit_set_1
   PRIMITIVE(#RETN)
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_1_stack    long 0[16]
C__set_int_1_function long 0[16]

