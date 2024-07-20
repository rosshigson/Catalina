'#line 1 "join.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_join

 alignl ' align long

C__thread_join
C__thread_join_0
 jmp #CALA
 long @C__thread_stall
 cmp r3, TP wz          ' request to join current thread?



 jmp #BR_Z
 long @:thr_join_error  ' yes - return error

 mov RI, r3             ' no - has thread ...
 add RI, #THREAD_AFF_OFF*4+1



 rdbyte BC, RI

 test BC, #%10000000 wz ' ... been terminated?



 jmp #BRNZ
 long @:thr_join_error  ' yes return error

 test BC, #%01000000 wz ' no - has thread completed?



 jmp #BR_Z
 long @:thr_join_wait   ' no - keep waiting

 mov RI, r3             ' yes - load ...



 add RI, #(THREAD_REG_OFF+8)*4




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
 jmp #CALA
 long @C__thread_allow
 jmp #RETN
' end
