'#line 1 "thread_unlocked_check.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading operations
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
 cmp r4, TP wz          ' are we looking for the current thread?



 jmp #BR_Z
 long @:unl_check_found ' yes - the thread  was found

 mov r1, TP             ' no - start searching from current thread
:unl_check_next
 mov RI, r1             ' get ...



 rdlong BC, RI          ' ... the next thread pointer

 mov r1, BC             ' is it ...
 cmp r1, TP wz          ' ... the same as the current thread?



 jmp #BR_Z
 long @:unl_check_not_found ' yes - we are back at the start of the thread ring, which means the thread is not executing

 cmp r1, r4 wz          ' no - is this the thread we want?



 jmp #BR_Z
 long @:unl_check_found ' yes - the specified thread is still executing




 jmp #JMPA
 long @:unl_check_next  '  no - keep looking

:unl_check_not_found
 mov r0, #0 wz          ' if not found, return zero (and Z set)



 jmp #JMPA
 long @:unl_check_exit

:unl_check_found
 mov r0, r4 wz          ' if found, return thread block (and Z clr)
:unl_check_exit
 jmp #RETN
' end
