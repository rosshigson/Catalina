'#line 1 "set_int_2.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_int_2

 alignl ' align long

C__set_int_2
   sub     r2, #32*4   ' top 32 longs of stack space are register save area







 jmp #LODL
   long    @C__set_int_2_stack
   wrlong  r2, RI
 jmp #LODL
   long    @C__set_int_2_function
   wrlong  r3, RI
 jmp #LODL
   long    @.call_isr_2
   mov     ijmp2, RI
   setint2 r4
 jmp #JMPA
   long    @.exit_set_2


.call_isr_2
   stalli
   rdlong  t2, ##@C__set_int_2_stack
   mov     Save_PC, iret2 ' Save PC and flags







   setq    #32-1         ' save 32 registers ...
   wrlong  PC, t2         ' ... to register save area

   mov     SP, t2
   allowi
   rdlong  RI, ##@C__set_int_2_function




   mov     PC, ##@.enter_LMM_isr_2
   jmp     #\LMM_loop
.enter_LMM_isr_2
 jmp #CALI
 jmp #LODL
   long    @.exit_LMM_isr_2
   jmp     RI
.exit_LMM_isr_2


   stalli
   rdlong  t2, ##@C__set_int_2_stack







   setq    #32-1         ' load 32 registers ...
   rdlong  PC, t2         ' ... from register save area

   mov     iret2, Save_PC ' restore PC and flags
   allowi
   reti2

.exit_set_2
 jmp #RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_2_stack    long 0
C__set_int_2_function long 0
