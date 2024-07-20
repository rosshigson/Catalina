'
' CMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_join(void * block, int *result);
'    wait for a thread to terminate
' on entry:
'    r3 = thread id to join
'    r2 = address to store result (r0 of joined thread)
' on exit
'    r0 = thread id if joined
'    r0 = 0 if error (e.g. attempt to join own thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

#ifndef P2
' Catalina Import _thread_force_switch
#endif

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_join

 alignl ' align long

C__thread_join
C__thread_join_0
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16B_PASM
 alignl ' align long
   cmp r3, TP wz                         ' request to join current thread?
 alignl ' align long
 long I32_BR_Z + @:thr_join_error<<S32   ' yes - return error
 word I16A_MOV + RI<<D16A + r3<<S16A     ' no - has thread ...
 word I16B_PASM
 alignl ' align long
   add RI, #THREAD_AFF_OFF*4+1
 word I16A_RDBYTE + BC<<D16A + RI<<S16A
 word I16B_PASM
 alignl ' align long
   test BC, #%10000000 wz                ' ... been terminated?
 alignl ' align long
 long I32_BRNZ + @:thr_join_error<<S32   ' yes return error
 word I16B_PASM
 alignl ' align long
   test BC, #%01000000 wz ' no - has thread completed?
 alignl ' align long
 long I32_BR_Z + @:thr_join_wait<<S32    ' no - keep waiting
 word I16A_MOV + RI<<D16A + r3<<S16A     ' yes - load ...
 word I16A_ADDI + RI<<D16A + (THREAD_REG_OFF*4)<<S16A 
 word I16A_RDLONG + BC<<D16A + RI<<S16A  ' ... thread r0
 word I16A_MOV + RI<<D16A + r2<<S16A     ' save it ...
 word I16A_WRLONG + BC<<D16A + RI<<S16A  ' ... as the result
 word I16A_MOV + r0<<D16A + r3<<S16A     ' return thread block
 alignl ' align long
 long I32_JMPA + @:thr_join_exit<<S32
 alignl ' align long
:thr_join_wait 
#ifdef P2
 word I16B_PASM
 alignl ' align long
   jmp #\CMM_force                       ' force context switch immediately
#else
 long I32_CALA + @C__thread_force_switch<<S32 ' force context switch immediately
#endif
 alignl ' align long
 long I32_JMPA + @C__thread_join_0<<S32  ' if we return, try again (NOTE: locks released by context switch!)
 alignl ' align long
:thr_join_error
 word I16A_MOVI +r0<<D16A + 0<<S16A      ' if not found or error, return zero
 alignl ' align long
:thr_join_exit 
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16A_CMPI + r0<<D16A + 0<<S16A     ' set/clr Z flag
 word I16B_RETN
' end
