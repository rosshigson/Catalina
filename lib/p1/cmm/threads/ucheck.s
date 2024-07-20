'
' CMM PASM implementations of fundamental multi-threading operations
'
' _unlocked_check (void *block)
'    unlocked version of _thread_check (for internal use)
' on entry:
'    r4 = thread id to check
' on exit:
'    r0 = thread id (and Z clr) if found
'    r0 = 0 (and Z set) if not found
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _unlocked_check

 alignl ' align long

C__unlocked_check
 alignl ' align long
 long I32_MOV + r1<<D32 + TP<<S32
 word I16A_CMP + r4<<D16A + r1<<S16A     ' looking for the current thread?
 alignl ' align long
 long I32_BR_Z + @:unl_check_found<<S32  ' yes - the thread was found
 alignl ' align long
:unl_check_next
 word I16A_MOV + RI<<D16A + r1<<S16A     ' get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A  ' ... the next thread pointer
 word I16A_MOV + r1<<D16A + BC<<S16A     ' is it ...
 alignl ' align long
 long I32_MOV + r0<<D32 + TP<<S32        ' ... the same ...
 word I16A_CMP + r1<<D16A + r0<<S16A     ' ... as the current thread?
 alignl ' align long
 long I32_BR_Z + @:unl_check_not_found<<S32 ' yes - the thread is not executing
 word I16A_CMP + r1<<D16A + r4<<S16A     ' no - is this the thread we want?
 alignl ' align long
 long I32_BR_Z + @:unl_check_found<<S32  ' yes - specified thread is executing
 alignl ' align long
 long I32_JMPA + @:unl_check_next<<S32   ' no - keep looking
 alignl ' align long
:unl_check_not_found
 word I16A_MOVI + r0<<D16A + 0<<S16A     ' if not found, return zero (Z set)
 alignl ' align long
 long I32_JMPA + @:unl_check_exit<<S32
 alignl ' align long
:unl_check_found
 word I16A_MOV + r0<<D16A + r4<<S16A     ' if found, return thread block (Z clr)
 alignl ' align long
:unl_check_exit
 word I16A_CMPI + r0<<D16A + 0<<S16A
 word I16B_RETN
' end
