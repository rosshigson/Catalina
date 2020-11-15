'#line 1 "thread_ticks.e"











'
' LMM PASM implementations of fundamental multi-threading operations
'
' int _thread_ticks(void * block, int ticks);
'    set tick count (takes effect on next context switch):
' on entry:
'    r3 = thread id
'    r2 = tick count (1 tick = ~100 microseconds)
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _unlocked_check

' Catalina Export _thread_ticks

 alignl ' align long

C__thread_ticks

 call #GET_KERNEL_LOCK         ' get kernel lock






 mov r4, r3
 PRIMITIVE(#CALA)
 long @C__unlocked_check ' check thread id is valid

 if_z jmp #@:thr_ticks_done ' if not return with result zero (and Z set)




 mov RI, r3
 add RI, #33*4+2
 mov BC, r2



 wrword BC, RI

 mov r0, r3 wz          ' if ok, return thread block (and Z clr)
:thr_ticks_done

 call #REL_KERNEL_LOCK        ' release kernel lock



 PRIMITIVE(#RETN)
' end
