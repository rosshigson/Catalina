'#line 1 "clr_int1.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   setint1 #0

   mov ijmp1, ##@C__null_isr_1
   jmp #@.exit_clr_1







C__null_isr_1
   reti1
.exit_clr_1
 calld PA,#RETN
' end

' Catalina Init







' end
