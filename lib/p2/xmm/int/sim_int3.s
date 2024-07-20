'#line 1 "sim_int3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_3

 alignl ' align long

C__sim_int_3
   trigint3
 jmp #RETN
' end

