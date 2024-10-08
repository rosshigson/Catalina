'#line 1 "stop.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
'
' void * _thread_stop(void * block);
'    terminate a thread (which may be current thread!)
' on entry:
'    r2 = thread id to terminate
' on exit
'    r0 = thread id if terminated (& Z clr)
'    r0 = 0 (& Z set) if error (e.g. attempt to terminate last thread)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_prev

' Catalina Export _thread_stop

 alignl ' align long

C__thread_stop
 calld PA,#CALA
 long @C__thread_stall
 calld PA,#CALA
 long @C__unlocked_prev ' find thread block that points to this thread block

 if_z jmp #@:thr_stop_error ' if not found return error




 mov r1, r0             ' now r1 points to block that points to r2
 cmp r2, TP wz          ' are we terminating the current thread?

 if_nz jmp #@:thr_stop_remove ' no - can just update the appropriate block pointers




 mov RI, TP             ' yes - get ...



 rdlong BC, RI          ' ... the next thread block pointer

 cmp BC, TP wz          ' is only one thread executing?

 if_z jmp #@:thr_stop_error ' yes - cannot terminate last thread using this function




:thr_stop_remove
 mov RI, r2             ' ... get ...



 rdlong BC, RI          ' ... the next thread pointer of block being terminated

 mov RI, r1             ' write it to ...



 wrlong BC, RI          ' ... the block pointing to the block being terminated

 mov RI, r2             ' set ...
 add RI, #THREAD_AFF_OFF*4+1



 rdbyte BC, RI

 or BC, #%10000000



 wrbyte BC, RI          ' ... thread terminated bit

 cmp r2, TP wz          ' are we terminating current thread?

 if_nz jmp #@:thr_stop_done ' if not then we are done






 calld PA,#\NMM_force   ' otherwise force a context switch immediately







 jmp #@C__thread_stop   ' if we return, try again (NOTE: locks released by context switch!)




:thr_stop_done
 mov r0, r2 wz          ' if ok, return thread block (and Z clr)

 jmp #@:thr_stop_exit




:thr_stop_error
 mov r0, #0 wz          ' if not found, return zero (and Z set)
:thr_stop_exit
 calld PA,#CALA
 long @C__thread_allow
 calld PA,#RETN
' end
