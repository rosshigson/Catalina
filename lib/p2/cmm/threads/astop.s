'
' CMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity_stop();
'    request affinity stop of specified thread 
' on entry:
'    r2 = thread id 
' on exit:
'    r0 = thread affinity byte if ok (and Z clr)
'    r0 = zero if error (and Z set)
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_affinity_stop

 alignl ' align long

C__thread_affinity_stop
 long I32_CALA + @C__thread_stall<<S32 ' get kernel lock
 alignl ' align long
 word I16A_MOV + RI<<D16A + r2<<S16A            ' get ...
 alignl ' align long
 long I32_MOVI + BC<<D32 + (THREAD_AFF_OFF*4+1)<<S32
 word I16A_ADD + RI<<D16A + BC<<S16A
 word I16A_RDBYTE + BC<<D16A + RI<<S16A         ' ... affinity byte 
 word I16B_PASM
 alignl ' align long
   test BC, #%11100000 wz                       ' thread terminated, or oustanding affnity request?
 alignl ' align long
 long I32_BRNZ + @:aff_stop_error<<S32          ' yes - return error
 word I16B_PASM
 alignl ' align long
   or BC, #%00100000                            ' no - set ...
 word I16A_WRBYTE + BC<<D16A + RI<<S16A         ' ... affinity stop request bit
 word I16A_MOV + r0<<D16A + BC<<S16A            ' on ok, return non-zero (Z clr)
 alignl ' align long
 long I32_JMPA + @:aff_stop_exit<<S32
 alignl ' align long
:aff_stop_error
 word I16A_MOVI + r0<<D16A + 0<<S16A            ' on error, return 0 (Z set)
 alignl ' align long
:aff_stop_exit
 word I16A_CMPI + r0<<D16A + 0<<S16A            
 long I32_CALA + @C__thread_allow<<S32  ' release kernel lock
 word I16B_RETN
' end
