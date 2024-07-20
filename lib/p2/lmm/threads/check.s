'#line 1 "check.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
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
 jmp #CALA
 long @C__thread_stall
 mov  r4, r2
 jmp #CALA
 long @C__unlocked_check
 jmp #CALA
 long @C__thread_allow
 jmp  #RETN
' end
