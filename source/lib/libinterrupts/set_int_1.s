'#line 1 "set_int_1.e"











' Catalina Code

DAT ' code segment

' Catalina Export _set_int_1

 alignl ' align long

C__set_int_1
   sub     r2, #32*4   ' top 32 longs of stack space are register save area

   wrlong  r2, ##@C__set_int_1_stack
   wrlong  r3, ##@C__set_int_1_function
   mov     ijmp1, ##@.call_isr_1
   setint1 r4
   jmp     #@.exit_set_1















.call_isr_1
   stalli
   rdlong  t2, ##@C__set_int_1_stack
   mov     Save_PC, iret1 ' Save PC and flags

   mov     Save_PA, PA    ' Save PA
   mov     Save_FP, FP    ' Save FP
   mov     Save_SP, SP    ' Save SP
   setq    #30-1         ' save 30 registers ...
   wrlong  RI, t2         ' ... to register save area




   mov     SP, t2
   rdlong  RI, ##@C__set_int_1_function
   allowi


   PRIMITIVE(#CALI)











   stalli
   rdlong  t2, ##@C__set_int_1_stack

   setq    #30-1         ' load 30 registers ...
   rdlong  RI, t2         ' ... from register save area
   mov     SP, Save_SP    ' restore SP
   mov     FP, Save_FP    ' restore FP
   mov     PA, Save_PA    ' restore PA




   mov     iret1, Save_PC ' restore PC and flags
   allowi
   reti1

.exit_set_1
   PRIMITIVE(#RETN)
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_1_stack    long 0
C__set_int_1_function long 0

