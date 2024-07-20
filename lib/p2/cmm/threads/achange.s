'
' CMM PASM implementations of affinity multi-threading operations
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

#ifndef P2
' Catalina Import _thread_force_switch
#endif

' Catalina Export _thread_affinity_change

 alignl ' align long

C__thread_affinity_change
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 word I16B_PASM
 alignl ' align long
   and r2, #%111                        ' ensure new affinity is in range 0 .. 7
 word I16A_MOV + RI<<D16A + r2<<S16A    ' get request block address ...
 word I16A_SHLI + RI<<D16A + 2<<S16A
 word I16B_PASM
 alignl ' align long
   add RI, reg          
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... of new cog 
 word I16A_MOV + r4<<D16A + BC<<S16A    ' save in r4
 word I16A_MOV + RI<<D16A + r4<<S16A    ' is there ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' 
 word I16A_CMPI + BC<<D16A + 0<<S16A    ' ... an affinity request outstanding for that cog?
 alignl ' align long
 long I32_BRNZ + @:aff_ch_error<<S32    ' yes - return error
 alignl ' align long
 long I32_MOV + r1<<D32 + TP<<S32       ' no - start with current thread block
 alignl ' align long
:aff_ch_next
 word I16A_MOV + RI<<D16A + r1<<S16A    ' get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... the next thread pointer from that block
 word I16A_CMP + BC<<D16A + r3<<S16A    ' is it the thread block we are looking for?
 alignl ' align long
 long I32_BR_Z + @:aff_ch_found<<S32    ' yes - found the block pointing to the thread block to change 
 word I16B_PASM
 alignl ' align long
   cmp BC, TP wz                         ' no - last thread? (points to current thread block)
 alignl ' align long
 long I32_BR_Z + @:aff_ch_error<<S32    ' yes - return error
 word I16A_MOV + r1<<D16A + BC<<S16A    ' no - step to ...
 alignl ' align long
 long I32_JMPA + @:aff_ch_next<<S32     ' ... this thread block and keep looking
 alignl ' align long
:aff_ch_found                           ' now r1 points to block that points to r3
 word I16B_PASM
 alignl ' align long
   cogid r0                             ' are we trying to change the cog ...
 word I16A_CMP + r0<<D16A + r2<<S16A    ' .. to be the same as the current cog id?
 alignl ' align long
 long I32_BR_Z + @:aff_ch_done<<S32     ' yes - no need to do anything!
 word I16B_PASM
 alignl ' align long
   cmp r3, TP wz                         ' are we changing affinity of the current thread?
 alignl ' align long
 long I32_BRNZ + @:aff_ch_remove<<S32   ' no - can just update the appropriate block pointers
 alignl ' align long
 long I32_MOV + RI<<D32 + TP<<S32       ' yes - get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... the next thread block pointer 
 word I16B_PASM
 alignl ' align long
   cmp BC, TP wz                         ' is only one thread executing?
 alignl ' align long
 long I32_BR_Z + @:aff_ch_error<<S32    ' yes - cannot change affinity of the last thread using this function
 alignl ' align long
:aff_ch_remove
 word I16A_MOV + RI<<D16A + r3<<S16A    ' get ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A ' ... the next thread pointer of block being changed
 word I16A_MOV + RI<<D16A + r1<<S16A    ' write it to ...
 word I16A_WRLONG + BC<<D16A + RI<<S16A ' ... the next block of the previous block pointer
 word I16A_MOV + RI<<D16A + r4<<S16A    ' notify new cog ...
 word I16A_MOV + BC<<D16A + r3<<S16A
 word I16A_WRLONG + BC<<D16A + RI<<S16A ' ... of cog change request
 word I16B_PASM
 alignl ' align long
   cmp r3, TP wz                         ' are we changing the affinity of the current thread?
 alignl ' align long
 long I32_BRNZ + @:aff_ch_done<<S32     ' if not then we are done
 alignl ' align long
#ifdef P2
 word I16B_PASM
 alignl ' align long
   jmp #\CMM_force                       ' force context switch immediately
#else
 long I32_CALA + @C__thread_force_switch<<S32 ' force context switch immediately
#endif
 word I16A_MOV + r0<<D16A + r3<<S16A    ' return thread id 
 alignl ' align long
 long I32_JMPA + @:aff_ch_no_unlock<<S32 ' NOTE: locks already released by context switch!
 alignl ' align long
:aff_ch_done
 word I16A_MOV + r0<<D16A + r3<<S16A    ' return thread id 
 alignl ' align long
 long I32_JMPA + @:aff_ch_exit<<S32
 alignl ' align long
:aff_ch_error
 word I16A_MOVI + r0<<D16A + 0<<S16A    ' if error, return zero (Z set)
 alignl ' align long
:aff_ch_exit
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
:aff_ch_no_unlock
 word I16A_CMPI + r0<<D16A + 0<<S16A   ' set/clr Z flag
 word I16B_RETN
' end
