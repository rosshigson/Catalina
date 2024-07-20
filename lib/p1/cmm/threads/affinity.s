'
' CMM PASM implementations of affinity multi-threading operations
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
 alignl ' align long
 long I32_MOVI + BC<<D32 + (THREAD_AFF_OFF*4)<<S32  ' offset of affinity in thread block
 word I16A_MOV + RI<<D16A + r2<<S16A    ' return ...
 word I16A_ADD + RI<<D16A + BC<<S16A
 word I16A_RDLONG + r0<<D16A + RI<<S16A ' ... current affinity
 word I16B_RETN
' end
