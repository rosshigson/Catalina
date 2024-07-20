'#line 1 "sim_int2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_2

 alignl ' align long

C__sim_int_2
   trigint2
 jmp #RETN
' end

