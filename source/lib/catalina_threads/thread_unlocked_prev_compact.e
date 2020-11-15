'
' CMM PASM implementations of fundamental multi-threading operations
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
 alignl ' align long
 long I32_MOV + r0<<D32 + TP<<S32           ' start with current thread block
 alignl ' align long
:unl_prev_next
 word I16A_MOV + RI<<D16A + r0<<S16A        ' get the next thread pointer ...
 word I16A_RDLONG + BC<<D16A + RI<<S16A     ' ...  from that block
 word I16A_CMP + BC<<D16A + r2<<S16A        ' is it the one we are looking for?
 alignl ' align long
 long I32_BR_Z + @:unl_prev_exit<<S32       ' yes - found block that points to the thread block 
 alignl ' align long
 long I32_MOV + r0<<D32 + TP<<S32
 word I16A_CMP + BC<<D16A + r0<<S16A        ' no - last thread? (points to current thread block)
 alignl ' align long
 long I32_BR_Z + @:unl_prev_not_found<<S32  ' yes - thread not found
 word I16A_MOV + r0<<D16A + BC<<S16A        ' no - step to this thread block ...
 alignl ' align long
 long I32_JMPA + @:unl_prev_next<<S32       ' ...  and keep looking
 alignl ' align long
:unl_prev_not_found
 word I16A_MOVI + r0<<D16A + 0<<S16A        ' return zero in r0 (Z set)
 alignl ' align long
:unl_prev_exit 
 word I16A_CMPI + r0<<D16A + 0<<S16A        ' set/clr Z depending on r0
 word I16B_RETN
' end
