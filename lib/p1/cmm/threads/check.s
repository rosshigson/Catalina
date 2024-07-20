'
' CMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_check(void * block);
'    check thread is still executing
' on entry:
'    r2 = thread id to locate
' on exit
'    r0 = thread id if found (and Z clr)
'    r0 = 0 if not found (and Z set)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Export _thread_check

 alignl ' align long

C__thread_check
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16A_MOV + r4<<D16A + r2<<S16A
 alignl ' align long
 long I32_CALA + @C__unlocked_check<<S32
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16B_RETN
' end
