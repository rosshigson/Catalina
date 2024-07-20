'
' CMM PASM implementations of fundamental multi-threading operations
'
' int _thread_set_extended(void *block, void *extended);
'    set extended attribute (assumed to be a pointer):
' on entry:
'    r3 = thread id
'    r2 = extended attribute
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _unlocked_check

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_set_extended

 alignl ' align long

C__thread_set_extended
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16A_MOV + r4<<D16A + r3<<S16A
 alignl ' align long
 long I32_CALA + @C__unlocked_check<<S32 ' check thread id is valid
 alignl ' align long
 long I32_BR_Z + @:thr_set_extended_done<<S32   ' if not, return zero (and Z set)
 word I16A_MOV + RI<<D16A + r3<<S16A
 alignl ' align long
 long I32_MOVI + BC<<D32 + (THREAD_EXT_OFF*4)<<S32
 word I16A_ADD + RI<<D16A + BC<<S16A
 word I16A_MOV + BC<<D16A + r2<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A
 word I16A_MOV + r0<<D16A + r3<<S16A     ' return thread block 
 word I16A_CMPI + r0<<D16A + 0<<S16A     ' return Z clr if ok
 alignl ' align long
:thr_set_extended_done
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16B_RETN
' end
