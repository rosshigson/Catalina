'#line 1 "uprev.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
'
' _unlocked_prev (void * thread_id)
'    find the thread that points to a thread (for internal use)
' on entry:
'    r2 = thread block to search for
' on exit:
'    r0 = thread block that points to specified thread block (and Z clr)
'    r0 = 0 (and Z set) if not found
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _unlocked_prev

 alignl ' align long

C__unlocked_prev
 mov r0, TP             ' start with current thread block
:unl_prev_next
 mov RI, r0             ' get ...



 rdlong BC, RI          ' ... the next thread pointer from that block

 cmp BC, r2 wz          ' is it the thread block we are looking for?



 jmp #BR_Z
 long @:unl_prev_found  ' yes - found the block that points to the thread block to halt

 cmp BC, TP wz          ' no - last thread? (points to current thread block)



 jmp #BR_Z
 long @:unl_prev_not_found ' yes - thread not found

 mov r0, BC wz          ' no - step to ...



 jmp #JMPA
 long @:unl_prev_next   ' ... this thread block, and keep looking

:unl_prev_found         ' r0 points to block that points to r2
 mov r0, r0 wz          ' ensure Z clr



 jmp #JMPA
 long @:unl_prev_exit

:unl_prev_not_found
 mov r0, #0 wz          ' return 0 in r0 (and Z set)
:unl_prev_exit
 jmp #RETN
' end
