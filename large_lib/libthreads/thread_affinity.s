'#line 1 "thread_affinity.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity();
'    return affinity of current thread
' on entry:
'    r2 = thread id
' on exit:
'    r0 = thread affinity
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Export _thread_affinity

 alignl ' align long

C__thread_affinity
 mov RI, r2             ' return ...
 add RI, #33*4

 jmp #RLNG



 mov r0, BC
 jmp #RETN
' end
