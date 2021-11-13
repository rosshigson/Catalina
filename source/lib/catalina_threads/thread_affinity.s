'#line 1 "thread_affinity.e"











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



 rdlong BC, RI          ' ... current affinity

 mov r0, BC
 PRIMITIVE(#RETN)
' end
