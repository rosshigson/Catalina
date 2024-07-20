'#line 1 "getticks.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
'
' int _thread_get_ticks(void * block);
'    return current tick count :
' on entry:
'    r2 = thread id
' on exit:
'    r0 = current tick count (zero if thread id invalid)
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _unlocked_check

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_get_ticks

 alignl ' align long

C__thread_get_ticks
 jmp #CALA
 long @C__thread_stall
 mov r4, r2
 jmp #CALA
 long @C__unlocked_check ' check thread id is valid



 jmp #BR_Z
 long @:thr_get_ticks_done  ' if not return with result zero (and Z set)

 mov RI, r2
 add RI, #THREAD_AFF_OFF*4+2

 jmp #RWRD
 mov r0,BC



:thr_get_ticks_done
 jmp #CALA
 long @C__thread_allow
 jmp #RETN
' end
