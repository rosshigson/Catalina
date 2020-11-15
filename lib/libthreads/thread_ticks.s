'#line 1 "thread_ticks.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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



C__thread_ticks_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_ticks_1 ' loop till we get a kernel lock

 mov r4, r3
 jmp #CALA
 long @C__unlocked_check ' check thread id is valid



 jmp #BR_Z
 long @:thr_ticks_done  ' if not return with result zero (and Z set)

 mov RI, r3
 add RI, #33*4+2
 mov BC, r2



 wrword BC, RI

 mov r0, r3 wz          ' if ok, return thread block (and Z clr)
:thr_ticks_done



 lockclr lock           ' release kernel lock

 jmp #RETN
' end
