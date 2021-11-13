'#line 1 "set_int_2.e"











' Catalina Code

DAT ' code segment

' Catalina Export _set_int_2

 alignl ' align long

C__set_int_2
   sub     r2, #32*4   ' top 32 longs of stack space are register save area

   wrlong  r2, ##@C__set_int_2_stack
   wrlong  r3, ##@C__set_int_2_function
   mov     ijmp2, ##@.call_isr_2
   setint2 r4
   jmp     #@.exit_set_2















.call_isr_2
   stalli
   rdlong  t2, ##@C__set_int_2_stack
   mov     Save_PC, iret2 ' Save PC and flags

   mov     Save_PA, PA    ' Save PA
   mov     Save_FP, FP    ' Save FP
   mov     Save_SP, SP    ' Save SP
   setq    #30-1         ' save 30 registers ...
   wrlong  RI, t2         ' ... to register save area




   mov     SP, t2
   allowi
   rdlong  RI, ##@C__set_int_2_function


   PRIMITIVE(#CALI)











   stalli
   rdlong  t2, ##@C__set_int_2_stack

   setq    #30-1         ' load 30 registers ...
   rdlong  RI, t2         ' ... from register save area
   mov     SP, Save_SP    ' restore SP
   mov     FP, Save_FP    ' restore FP
   mov     PA, Save_PA    ' restore PA




   mov     iret2, Save_PC ' restore PC and flags
   allowi
   reti2

.exit_set_2
   PRIMITIVE(#RETN)
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_2_stack    long 0
C__set_int_2_function long 0
