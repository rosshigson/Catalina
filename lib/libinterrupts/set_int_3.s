'#line 1 "set_int_3.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_int_3

 alignl ' align long

C__set_int_3
   sub     r2, #32*4   ' top 32 longs of stack space are register save area







 jmp #LODL
   long    @C__set_int_3_stack
   wrlong  r2, RI
 jmp #LODL
   long    @C__set_int_3_function
   wrlong  r3, RI
 jmp #LODL
   long    @.call_isr_3
   mov     ijmp3, RI
   setint3 r4
 jmp #JMPA
   long    @.exit_set_3


.call_isr_3
   stalli
   rdlong  t2, ##@C__set_int_3_stack
   mov     Save_PC, iret3 ' Save PC and flags







   setq    #32-1         ' save 32 registers ...
   wrlong  PC, t2         ' ... to register save area

   mov     SP, t2
   allowi
   rdlong  RI, ##@C__set_int_3_function




   mov     PC, ##@.enter_LMM_isr_3
   jmp     #\LMM_loop
.enter_LMM_isr_3
 jmp #CALI
 jmp #LODL
   long    @.exit_LMM_isr_3
   jmp     RI
.exit_LMM_isr_3


   stalli
   rdlong  t2, ##@C__set_int_3_stack







   setq    #32-1         ' load 32 registers ...
   rdlong  PC, t2         ' ... from register save area

   mov     iret3, Save_PC ' restore PC and flags
   allowi
   reti3

.exit_set_3
 jmp #RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_3_stack    long 0
C__set_int_3_function long 0

