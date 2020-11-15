'#line 1 "thread_check.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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

' Catalina Import _unlocked_check

' Catalina Export _thread_check

 alignl ' align long

C__thread_check



C__thread_check_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_check_1 ' loop till we get a kernel lock

 mov  r4, r2
 jmp #CALA
 long @C__unlocked_check



 lockclr lock           ' release kernel lock

 jmp  #RETN
' end
