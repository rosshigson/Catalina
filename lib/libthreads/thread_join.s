'#line 1 "thread_join.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_join(void * block, int *result);
'    wait for a thread to terminate
' on entry:
'    r3 = thread id to join
'    r2 = address to store result (r0 of joined thread)
' on exit
'    r0 = thread id if joined
'    r0 = 0 if error (e.g. attempt to join own thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_join

 alignl ' align long

C__thread_join
C__thread_join_0



C__thread_join_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_join_1 ' loop till we get a kernel lock

 cmp r3, TP wz          ' request to join current thread?



 jmp #BR_Z
 long @:thr_join_error  ' yes - return error

 mov RI, r3             ' no - has thread ...
 add RI, #33*4+1



 rdbyte BC, RI

 test BC, #%10000000 wz ' ... been terminated?



 jmp #BRNZ
 long @:thr_join_error  ' yes return error

 test BC, #%01000000 wz ' no - has thread completed?



 jmp #BR_Z
 long @:thr_join_wait   ' no - keep waiting

 mov RI, r3             ' yes - load ...



 add RI, #9*4




 rdlong BC, RI          ' ... thread r0

 mov RI, r2             ' save it ...



 wrlong BC, RI          ' ... as the result

 mov r0, r3 wz          ' return thread block (and Z clr)



 jmp #JMPA
 long @:thr_join_exit

:thr_join_wait







 jmp #LMM_force         ' force a context switch immediately




 jmp #JMPA
 long @C__thread_join_0 ' if we return, try again (NOTE: locks released by context switch!)

:thr_join_error
 mov r0, #0 wz          ' if not found or error, return zero (and Z set)
:thr_join_exit



 lockclr lock           ' release kernel lock

 jmp #RETN
' end
