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

' Catalina Import _unlocked_check

' Catalina Export _thread_check

 alignl ' align long

C__thread_check
#ifdef P2
 word I16B_PASM
 alignl ' align long
   call #GET_KERNEL_LOCK                      ' get kernel lock
#else
 alignl ' align long
C__thread_check_1
 word I16B_PASM
 alignl ' align long
   lockset lock wc
 alignl ' align long
 long I32_BR_B + @C__thread_check_1<<S32 ' loop till we get kernel lock
#endif
 word I16A_MOV + r4<<D16A + r2<<S16A
 alignl ' align long
 long I32_CALA + @C__unlocked_check<<S32
#ifdef P2
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   call #REL_KERNEL_LOCK                      ' release kernel lock
#else
 alignl ' align long
 word I16B_PASM
 alignl ' align long
   lockclr lock                         ' release kernel lock
#endif
 word I16B_RETN
' end
