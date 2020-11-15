'#line 1 "thread_affinity_stop.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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



C__thread_affinity_stop_1
 lockset lock wc
 jmp #BR_B
 long @C__thread_affinity_stop_1 ' loop till we get a kernel lock

 mov RI, r2             ' get ...
 add RI, #33*4+1

 jmp #RBYT



 test BC, #%11100000 wz ' thread terminated, or oustanding affnity request?



 jmp #BRNZ
 long @:aff_stop_error  ' yes - return error

 or BC, #%00100000      ' no - set ...

 jmp #WBYT



 mov r0, BC wz          ' on ok, return non-zero (and Z clr)



 jmp #JMPA
 long @:aff_stop_exit

:aff_stop_error
 mov r0, #0 wz          ' on error, return 0 (and Z set)
:aff_stop_exit



 lockclr lock           ' release kernel lock

 jmp #RETN
' end
