'#line 1 "set_int3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_int_3

 alignl ' align long

C__set_int_3
   cogid   r0
   shl     r0, #2
   sub     r2, #32*4   ' top 32 longs of stack space are register save area











 jmp #LODL
   long    @C__set_int_3_stack
   add     RI, r0
   wrlong  r2, RI
 jmp #LODL
   long    @C__set_int_3_function
   add     RI, r0
   wrlong  r3, RI
 jmp #LODL
   long    @.call_isr_3
   mov     ijmp3, RI
   setint3 r4
 jmp #JMPA
   long    @.exit_set_3


.call_isr_3
   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_3_stack
   rdlong  t2, t2
   mov     Save_PC, iret3 ' Save PC and flags







   setq    #32-1         ' save 32 registers ...
   wrlong  PC, t2         ' ... to register save area

   mov     SP, t2
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_3_function
   rdlong  RI, t2
   allowi




   mov     PC, ##@.enter_LMM_isr_3
   jmp     #\LMM_loop
.enter_LMM_isr_3
 jmp #CALI
 jmp #LODL
   long    @.exit_LMM_isr_3
   jmp     RI
.exit_LMM_isr_3


   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_3_stack
   rdlong  t2, t2







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
C__set_int_3_stack    long 0[16]
C__set_int_3_function long 0[16]

