' Catalina Code

DAT ' code segment

' Catalina Export _set_int_1

 alignl ' align long

C__set_int_1
   word I16B_PASM
 alignl ' align long
   sub     r2, #30*4   ' top 30 longs of stack space are register save area
   long I32_LODA + @C__set_int_1_stack<<S32
   word I16A_WRLONG + r2<<D16A + RI<<S16A
 alignl ' align long
   long I32_LODA + @C__set_int_1_function<<S32
   word I16A_WRLONG + r3<<D16A + RI<<S16A
 alignl ' align long
   long I32_LODA + @.call_isr_1<<S32
   long I32_MOV + ijmp1<<D32 + RI<<S32
   word I16B_PASM
 alignl ' align long
   setint1 r4
   long I32_JMPA + @.exit_set_1<<S32

.call_isr_1
   stalli
   rdlong  t2, ##@C__set_int_1_stack
   mov     Save_PC, iret1 ' Save PC and flags
   setq    #30-1         ' save 30 registers ...
   wrlong  r0, t2         ' ... to register save area
   mov     SP, t2
   rdlong  RI, ##@C__set_int_1_function
   allowi

   mov     PC, ##@.enter_CMM_isr_1
   jmp     #\read_next
.enter_CMM_isr_1
   word I16B_CALI
 alignl ' align long
   long I32_LODA + @.exit_CMM_isr_1<<S32
   word I16B_PASM
 alignl ' align long
   jmp     RI
.exit_CMM_isr_1

   stalli
   rdlong  t2, ##@C__set_int_1_stack
   setq    #30-1         ' load 30 registers ...
   rdlong  r0, t2         ' ... from register save area
   mov     iret1, Save_PC ' restore PC and flags
   allowi
   reti1

.exit_set_1
   word I16B_RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_1_stack    long 0
C__set_int_1_function long 0

