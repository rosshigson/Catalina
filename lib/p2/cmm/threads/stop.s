'
' CMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_stop(void * block);
'    terminate a thread (which may be current thread!)
' on entry:
'    r2 = thread id to terminate
' on exit
'    r0 = thread id if terminated (& Z clr)
'    r0 = 0 (& Z set) if error (e.g. attempt to terminate last thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

#ifndef P2
' Catalina Import _thread_force_switch
#endif

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_prev

' Catalina Export _thread_stop

 alignl ' align long

C__thread_stop
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 alignl ' align long
 long I32_CALA + @C__unlocked_prev<<S32  ' find thread block that points to this thread block
 alignl ' align long
 long I32_BR_Z + @:thr_stop_error<<S32   ' if not found return error
 word I16A_MOV + r1<<D16A + r0<<S16A     ' now r1 points to block that points to r2
 word I16B_PASM
 alignl ' align long
   cmp r2, TP wz                          ' are we terminating the current thread?
 alignl ' align long
 long I32_BRNZ + @:thr_stop_remove<<S32  ' no - can just update the appropriate block pointers
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32        ' yes - get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A  ' ... the next thread block pointer 
 word I16B_PASM
 alignl ' align long
   cmp BC, TP wz                          ' is only one thread executing?
 alignl ' align long
 long I32_BR_Z + @:thr_stop_error<<S32   ' yes - cannot terminate last thread using this function
 alignl ' align long
:thr_stop_remove
 word I16A_MOV + RI<<D16A + r2<<S16A     ' ... get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A  ' ... the next thread pointer of block being terminated
 word I16A_MOV + RI<<D16A + r1<<S16A     ' write it to ...
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... the block pointing to the block being terminated
 word I16A_MOV + RI<<D16A + r2<<S16A     ' set ...
 word I16B_PASM
 alignl ' align long
   add RI, #THREAD_AFF_OFF*4+1
 word I16A_RDBYTE + BC<<D16A + RI<<S16A
 word I16B_PASM
 alignl ' align long
   or BC, #%10000000
 word I16A_WRBYTE + BC<<D16A + RI<<S16A  ' ... thread terminated bit
 word I16B_PASM
 alignl ' align long
   cmp r2, TP wz                          ' are we terminating current thread?
 alignl ' align long
 long I32_BRNZ + @:thr_stop_done<<S32    ' if not then we are done
 alignl ' align long
#ifdef P2
 word I16B_PASM
 alignl ' align long
   jmp #\CMM_force                       ' force context switch immediately
#else
 long I32_CALA + @C__thread_force_switch<<S32 ' force context switch immediately
#endif
 alignl ' align long
 long I32_JMPA + @C__thread_stop<<S32    ' if we return, try again (NOTE: locks released by context switch!)
 alignl ' align long
:thr_stop_done
 word I16A_MOV + r0<<D16A + r2<<S16A     ' if ok, return thread block (Z clr)
 alignl ' align long
 long I32_JMPA + @:thr_stop_exit<<S32
 alignl ' align long
:thr_stop_error
 word I16A_MOVI + r0<<D16A + 0<<S16A     ' if not found, return zero (Z set)
 alignl ' align long
:thr_stop_exit
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16A_CMPI + r0<<D16A + 0<<S16A     ' set/clr Z flag
 word I16B_RETN
' end
