'#line 1 "achange.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity_change();
'    request affinity change for specified thread
' on entry:
'    r3 = thread id
'    r2 = new affinity
' on exit:
'    r0 = thread id on success (Z clr)
'    r0 = 0 (Z set) on error
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_affinity_change

 alignl ' align long

C__thread_affinity_change
 jmp #CALA
 long @C__thread_stall
 and r2, #%111          ' ensure new affinity is in range 0 .. 7
 mov RI, r2             ' get request block address ...
 shl RI, #2
 add RI, reg

 jmp #RLNG



 mov r4, BC             ' save in r4
 mov RI, r4             ' is there ...

 jmp #RLNG



 cmp BC, #0 wz          ' ... an affinity request outstanding for that cog?



 jmp #BRNZ
 long @:aff_ch_error    ' yes - return error

 mov r1, TP             ' no - start with current thread block
:aff_ch_next
 mov RI, r1             ' get ...

 jmp #RLNG



 cmp BC, r3 wz          ' is it the thread block we are looking for?



 jmp #BR_Z
 long @:aff_ch_found    ' yes - found the block pointing to the thread block to change

 cmp BC, TP wz          ' no - last thread? (points to current thread block)



 jmp #BR_Z
 long @:aff_ch_error    ' yes - return error

 mov r1, BC             ' no - step to ...



 jmp #JMPA
 long @:aff_ch_next     ' ... this thread block, and keep looking

:aff_ch_found           ' now r1 points to block that points to r3
 cogid r0               ' are we trying to change the cog ...
 cmp r0, r2 wz          ' .. to be the same as the current cog id?



 jmp #BR_Z
 long @:aff_ch_done     ' yes - no need to do anything!

 cmp r3, TP wz          ' are we changing affinity of the current thread?



 jmp #BRNZ
 long @:aff_ch_remove   ' no - can just update the appropriate block pointers

 mov RI, TP             ' yes - get ...

 jmp #RLNG



 cmp BC, TP wz          ' is only one thread executing?



 jmp #BR_Z
 long @:aff_ch_error    ' yes - cannot change affinity of the last thread using this function

:aff_ch_remove
 mov RI, r3             ' get ...

 jmp #RLNG



 mov RI, r1             ' write it to ...

 jmp #WLNG



 mov RI, r4             ' notify new cog ...
 mov BC, r3

 jmp #WLNG



 cmp r3, TP wz          ' are we changing the affinity of the current thread?



 jmp #BRNZ
 long @:aff_ch_done     ' if not then we are done








 jmp #LMM_force         ' force a context switch immediately

 mov r0, r3 wz          ' return thread id



 jmp #JMPA
 long @:aff_ch_no_unlock ' NOTE: locks already released by context switch!

:aff_ch_done
 mov r0, r3 wz          ' return thread id



 jmp #JMPA
 long @:aff_ch_exit

:aff_ch_error
 mov r0, #0 wz           ' if error, return zero (and Z set)
:aff_ch_exit
 jmp #CALA
 long @C__thread_allow
:aff_ch_no_unlock
 jmp #RETN
' end
