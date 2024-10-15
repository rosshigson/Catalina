'#line 1 "setext.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












'
' LMM PASM implementations of fundamental multi-threading operations
'
' int _thread_set_extended(void * block, void *extended);
'    set extended attribute (assumed to be a pointer):
' on entry:
'    r3 = thread id
'    r2 = extended attribute
' on exit:
'    r0 = thread id (Z clear) on success
'    r0 = 0 and Z flag set on error
'
'
' Catalina Code

DAT ' code segment

' Catalina Import _thread_stall

' Catalina Import _thread_allow

' Catalina Import _unlocked_check

' Catalina Export _thread_set_extended

 alignl ' align long

C__thread_set_extended
 calld PA,#CALA
 long @C__thread_stall
 mov r4, r3
 calld PA,#CALA
 long @C__unlocked_check ' check thread id is valid

 if_z jmp #@:thr_extended_done ' if not return with result zero (and Z set)




 mov RI, r3
 add RI, #THREAD_EXT_OFF*4
 mov BC, r2



 wrlong BC, RI

 mov r0, r3 wz          ' if ok, return thread block (and Z clr)
:thr_extended_done
 calld PA,#CALA
 long @C__thread_allow
 calld PA,#RETN
' end
