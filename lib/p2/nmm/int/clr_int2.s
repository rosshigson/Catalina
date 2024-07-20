'#line 1 "clr_int2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   setint2 #0

   mov ijmp2, ##@C__null_isr_2
   jmp #@.exit_clr_2







C__null_isr_2
   reti2
.exit_clr_2
 calld PA,#RETN
' end

' Catalina Init







' end
