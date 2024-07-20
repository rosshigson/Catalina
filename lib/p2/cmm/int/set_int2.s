' Catalina Code

DAT ' code segment

' Catalina Export _set_int_2

 alignl ' align long

C__set_int_2
   word I16B_EXEC
 alignl ' align long
   cogid   r0
   shl     r0, #2
   sub     r2, #30*4   ' top 30 longs of stack space are register save area
   jmp     #EXEC_STOP
   long I32_LODA + @C__set_int_2_stack<<S32
   word I16A_ADD + RI<<D16A + r0<<S16A
   word I16A_WRLONG + r2<<D16A + RI<<S16A
 alignl ' align long
   long I32_LODA + @C__set_int_2_function<<S32
   word I16A_ADD + RI<<D16A + r0<<S16A
   word I16A_WRLONG + r3<<D16A + RI<<S16A
 alignl ' align long
   long I32_LODA + @.call_isr_2<<S32
   long I32_MOV + ijmp2<<D32 + RI<<S32
   word I16B_PASM
 alignl ' align long
   setint2 r4
   long I32_JMPA + @.exit_set_2<<S32

.call_isr_2
   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_stack
   rdlong  t2, t2
   mov     Save_PC, iret2 ' Save PC and flags
   setq    #30-1         ' save 30 registers ...
   wrlong  r0, t2         ' ... to register save area
   mov     SP, t2
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_function
   rdlong  RI, t2
   allowi

   mov     PC, ##@.enter_CMM_isr_2
   jmp     #\read_next
.enter_CMM_isr_2
   word I16B_CALI
 alignl ' align long
   long I32_LODA + @.exit_CMM_isr_2<<S32
   word I16B_PASM
 alignl ' align long
   jmp     RI
.exit_CMM_isr_2

   stalli
   cogid   t2
   shl     t2, #2
   add     t2, ##@C__set_int_2_stack
   rdlong  t2, t2
   setq    #30-1         ' load 30 registers ...
   rdlong  r0, t2         ' ... from register save area
   mov     iret2, Save_PC ' restore PC and flags
   allowi
   reti2

.exit_set_2
   word I16B_RETN
' end

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__set_int_2_stack    long 0[16]
C__set_int_2_function long 0[16]

