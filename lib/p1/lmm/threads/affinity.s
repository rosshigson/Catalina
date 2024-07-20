'#line 1 "affinity.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of affinity multi-threading operations
'
' void * _thread_affinity();
'    return affinity of a thread
' on entry:
'    r2 = thread id
' on exit:
'    r0 = thread affinity
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_affinity

 alignl ' align long

C__thread_affinity
 mov RI, r2             ' return ...
 add RI, #THREAD_AFF_OFF*4



 rdlong BC, RI          ' ... current affinity

 mov r0, BC
 jmp #RETN
' end
