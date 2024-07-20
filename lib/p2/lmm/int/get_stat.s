'#line 1 "get_stat.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _get_status

 alignl ' align long

C__get_status
   GETBRK r0 wcz
 jmp #RETN
' end

