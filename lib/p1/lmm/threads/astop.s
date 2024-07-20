'#line 1 "astop.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Export _thread_affinity_stop

 alignl ' align long

C__thread_affinity_stop
 jmp #CALA
 long @C__thread_stall
 mov RI, r2             ' get ...
 add RI, #THREAD_AFF_OFF*4+1



 rdbyte BC, RI          ' ... affinity byte

 test BC, #%11100000 wz ' thread terminated, or oustanding affnity request?



 jmp #BRNZ
 long @:aff_stop_error  ' yes - return error

 or BC, #%00100000      ' no - set ...



 wrbyte BC, RI          ' ... affinity stop request bit

 mov r0, BC wz          ' on ok, return non-zero (and Z clr)



 jmp #JMPA
 long @:aff_stop_exit

:aff_stop_error
 mov r0, #0 wz          ' on error, return 0 (and Z set)
:aff_stop_exit
 jmp #CALA
 long @C__thread_allow
 jmp #RETN
' end
