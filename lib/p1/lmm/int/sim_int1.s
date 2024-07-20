'#line 1 "sim_int1.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_1

 alignl ' align long

C__sim_int_1
   trigint1
 jmp #RETN
' end

