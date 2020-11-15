'#line 1 "set_int_1.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_int_1

 alignl ' align long

C__set_int_1
   sub     r2, #32*4   ' top 32 longs of stack space are register save area







 jmp #LODL
   long    @C__set_int_1_stack
   wrlong  r2, RI
 jmp #LODL
   long    @C__set_int_1_function
   wrlong  r3, RI
 jmp #LODL
   long    @.call_isr_1
   mov     ijmp1, RI
   setint1 r4
 jmp #JMPA
   long    @.exit_set_1


.call_isr_1
   stalli
   rdlong  t2, ##@C__set_int_1_stack
   mov     Save_PC, iret1 ' Save PC and flags







   setq    #32-1         ' save 32 registers ...
   wrlong  PC, t2         ' ... to register save area

   mov     SP, t2
   rdlong  RI, ##@C__set_int_1_function
   allowi




   mov     PC, ##@.enter_LMM_isr_1
   jmp     #\LMM_loop
.enter_LMM_isr_1
 jmp #CALI
 jmp #LODL
   long    @.exit_LMM_isr_1
   jmp     RI
.exit_LMM_isr_1


   stalli
   rdlong  t2, ##@C__set_int_1_stack







   setq    #32-1         ' load 32 registers ...
   rdlong  PC, t2         ' ... from register save area

   mov     iret1, Save_PC ' restore PC and flags
   allowi
   reti1

.exit_set_1
 jmp #RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_1_stack    long 0
C__set_int_1_function long 0

