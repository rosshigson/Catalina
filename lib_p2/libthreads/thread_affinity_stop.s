'#line 1 "thread_affinity_stop.e"











'
' LMM PASM implementations of affinity multi-threading operations
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

' Catalina Export _thread_affinity_stop

 alignl ' align long

C__thread_affinity_stop

 call #GET_KERNEL_LOCK        ' get kernel lock






 mov RI, r2             ' get ...
 add RI, #33*4+1



 rdbyte BC, RI          ' ... affinity byte

 test BC, #%11100000 wz ' thread terminated, or oustanding affnity request?



 PRIMITIVE(#BRNZ)
 long @:aff_stop_error  ' yes - return error

 or BC, #%00100000      ' no - set ...



 wrbyte BC, RI          ' ... affinity stop request bit

 mov r0, BC wz          ' on ok, return non-zero (and Z clr)



 PRIMITIVE(#JMPA)
 long @:aff_stop_exit

:aff_stop_error
 mov r0, #0 wz          ' on error, return 0 (and Z set)
:aff_stop_exit

 call #REL_KERNEL_LOCK         ' release kernel lock



 PRIMITIVE(#RETN)
' end
