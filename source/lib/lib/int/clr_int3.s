'#line 1 "clr_int3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0

   mov ijmp3, ##@C__null_isr_3
   jmp #@.exit_clr_3







C__null_isr_3
   reti3
.exit_clr_3
 calld PA,#RETN
' end

' Catalina Init







' end
