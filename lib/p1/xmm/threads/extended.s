'#line 1 "extended.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of extended multi-threading operations
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
 mov RI, r2             ' return ...
 add RI, #THREAD_EXT_OFF*4

 jmp #RLNG



 mov r0, BC
 jmp #RETN
' end
