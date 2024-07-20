'
' CMM PASM implementations of fundamental multi-threading operations
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

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Export _thread_get_ticks

 alignl ' align long

C__thread_get_ticks
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16A_MOV + r4<<D16A + r2<<S16A
 alignl ' align long
 long I32_CALA + @C__unlocked_check<<S32 ' check thread id is valid
 alignl ' align long
 long I32_BR_Z + @:thr_get_ticks_done<<S32    ' if not, return zero (and Z set)
 word I16A_MOV + RI<<D16A + r2<<S16A
 alignl ' align long
 long I32_MOVI + BC<<D32 + (THREAD_AFF_OFF*4+2)<<S32
 word I16A_ADD + RI<<D16A + BC<<S16A
 word I16A_RDWORD + r0<<D16A + RI<<S16A
 word I16A_CMPI + r0<<D16A + 0<<S16A     ' return Z clr if ok
 alignl ' align long
:thr_get_ticks_done
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16B_RETN
' end
