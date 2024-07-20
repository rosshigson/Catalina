'
' CMM PASM implementations of extended multi-threading operations
'
' void * _thread_extended();
'    return extended attribute  
' on entry:
'    r2 = thread id
' on exit:
'    r0 = thread extended attribute
'
' Catalina Code

DAT ' code segment

' Catalina Export _thread_extended

 alignl ' align long

C__thread_extended
 alignl ' align long
 long I32_MOVI + BC<<D32 + (THREAD_EXT_OFF*4)<<S32  ' offset of extended attribute
 word I16A_MOV + RI<<D16A + r2<<S16A    ' return ...
 word I16A_ADD + RI<<D16A + BC<<S16A
 word I16A_RDLONG + r0<<D16A + RI<<S16A ' ... current extended attribute
 word I16B_RETN
' end

