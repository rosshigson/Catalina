'#line 1 "set_int2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_int_2

 alignl ' align long

C__set_int_2
   cogid   r0
   shl     r0, #2
   sub     r2, #32*4   ' top 32 longs of stack space are register save area

   mov     r1, ##@C__set_int_2_stack
   add     r1, r0
   wrlong  r2, r1
   mov     r1, ##@C__set_int_2_function
   add     r1, r0
   wrlong  r3, r1
   mov     ijmp2, ##@.call_isr_2
   setint2 r4
   jmp     #@.exit_set_2

















.call_isr_2
   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_stack
   rdlong  t2, t2
   mov     Save_PC, iret2 ' Save PC and flags

   mov     Save_PA, PA    ' Save PA
   mov     Save_FP, FP    ' Save FP
   mov     Save_SP, SP    ' Save SP
   setq    #30-1         ' save 30 registers ...
   wrlong  RI, t2         ' ... to register save area




   mov     SP, t2
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_function
   rdlong  RI, t2
   allowi


 calld PA,#CALI











   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_stack
   rdlong  t2, t2

   setq    #30-1         ' load 30 registers ...
   rdlong  RI, t2         ' ... from register save area
   mov     SP, Save_SP    ' restore SP
   mov     FP, Save_FP    ' restore FP
   mov     PA, Save_PA    ' restore PA




   mov     iret2, Save_PC ' restore PC and flags
   allowi
   reti2

.exit_set_2
 calld PA,#RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_2_stack    long 0[16]
C__set_int_2_function long 0[16]
