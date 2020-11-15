'#line 1 "thread_halt.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of fundamental multi-threading operations
'
' _thread_halt : threads come here when they exit their thread function
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _unlocked_prev

' Catalina Export _thread_halt

 alignl ' align long

C__thread_halt



C__thread_halt_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_halt_1 ' loop till we get a kernel lock

 mov r5, r0             ' save r0
 mov RI, TP             ' write r0 ...
 add RI, #9*4
 mov BC, r0



 wrlong BC, RI          ' ... to our register save area

 mov RI, TP             ' set ...
 add RI, #33*4+1



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







 jmp #LMM_force         ' force a context switch immediately




 jmp #BR_B
 long @C__thread_halt   ' if we get here, try again

 jmp #RETN       ' optimizer needs this
' end
