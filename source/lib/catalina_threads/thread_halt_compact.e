'
' CMM PASM implementations of fundamental multi-threading operations
'
' _thread_halt : threads come here when they exit their thread function
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

#ifndef P2
' Catalina Import _thread_force_switch
#endif

' Catalina Import _unlocked_prev

' Catalina Export _thread_halt

 alignl ' align long

C__thread_halt
#ifdef P2
 word I16B_PASM
 alignl ' align long
   call #GET_KERNEL_LOCK                      ' get kernel lock
#else
 alignl ' align long
C__thread_halt_1
 word I16B_PASM
 alignl ' align long
   lockset lock wc
 alignl ' align long
 long I32_BR_B + @C__thread_halt_1<<S32 ' loop till we get a kernel lock
#endif
 word I16A_MOV + r5<<D16A + r0<<S16A    ' save r0
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32       ' write r0 ...
 word I16A_ADDI + RI<<D16A + (1*4)<<S16A
 word I16A_MOV + BC<<D16A + r0<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A ' ... to our register save area
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32       ' set ...
 word I16B_PASM
 alignl ' align long
   add RI, #33*4+1
 word I16A_RDBYTE + BC<<D16A + RI<<S16A
 word I16B_PASM
 alignl ' align long
   or BC, #%01000000
 word I16A_WRBYTE + BC<<D16A + RI<<S16A ' ... thread completed bit
 alignl ' align long
 long I32_MOV + r2<<D32 + TP<<S32       ' find thread block ...
 alignl ' align long
 long I32_CALA + @C__unlocked_prev<<S32 ' ... that points to this thread block
 alignl ' align long
 long I32_BR_Z + @:thr_halt_done<<S32   ' if not found cannot do any more
 word I16A_MOV + r1<<D16A + r0<<S16A    ' now r1 points to block that points to r2
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32       ' get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... next thread block pointer from current block
 word I16B_PASM
 alignl ' align long
   cmp BC, TP wz                        ' is only one thread executing?
 alignl ' align long
 long I32_BR_Z + @:thr_halt_done<<S32   ' yes - cannot do any more
 word I16A_MOV + RI<<D16A + r1<<S16A    ' no - write next thread block pointer ...
 word I16A_WRLONG + BC<<D16A + RI<<S16A ' ... to the next pointer of the previous block
 alignl ' align long
:thr_halt_done
 word I16A_MOV + r0<<D16A + r5<<S16A    ' restore r0 (in case we are still executing)
 alignl ' align long
:thr_halt_loop
 alignl ' align long
#ifdef P2
 word I16B_PASM
 alignl ' align long
   jmp #\CMM_force                       ' force context switch immediately
#else
 long I32_CALA + @C__thread_force_switch<<S32 ' force context switch immediately
#endif
 long I32_JMPA + @C__thread_halt<<S32   ' if we return, try again (NOTE: locks released by context switch!)
 word I16B_RETN                         ' optimizer needs this
' end
