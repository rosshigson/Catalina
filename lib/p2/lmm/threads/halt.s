'#line 1 "halt.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.













'
' LMM PASM implementations of fundamental multi-threading operations
'
' _thread_halt : threads come here when they exit their thread function
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_prev

' Catalina Export _thread_halt

 alignl ' align long

C__thread_halt
 jmp #CALA
 long @C__thread_stall
 mov r5, r0             ' save r0
 mov RI, TP             ' write r0 ...



 add RI, #(THREAD_REG_OFF+8)*4

 mov BC, r0



 wrlong BC, RI          ' ... to our register save area

 mov RI, TP             ' set ...
 add RI, #THREAD_AFF_OFF*4+1



 rdbyte BC, RI

 or BC, #%01000000



 wrbyte BC, RI          ' ... thread completed bit

 mov r2, TP             ' find thread block ...
 jmp #CALA
 long @C__unlocked_prev ' ... that points to this thread block



 jmp #BR_Z
 long @:thr_halt_done   ' if not found cannot do any more

 mov r1, r0             ' now r1 points to block that points to r2
 mov RI, TP             ' get ...



 rdlong BC, RI          ' ... next thread block pointer from current block

 cmp BC, TP wz          ' is only one thread executing?



 jmp #BR_Z
 long @:thr_halt_done   ' yes - cannot do any more

 mov RI, r1             ' no - write next thread block pointer ...



 wrlong BC, RI          ' ... to the next pointer of the previous block

:thr_halt_done
 mov r0, r5              ' restore r0 (in case we are still executing)




 jmp #\LMM_force        ' force a context switch immediately







 jmp #JMPA
 long @C__thread_halt   ' if we get here, try again

 jmp #RETN       ' optimizer needs this
' end C__thread_halt

'
' LMM PASM implementations of fundamental multi-threading operations
'
' _thread_exit : halt the thread and return a status (specified in r2);
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_halt

' Catalina Export _thread_exit

 alignl ' align long

C__thread_exit
 mov r0, r2             ' the status is in r2



 jmp #JMPA
 long @C__thread_halt   ' thread halt


' end C__thread_exit
