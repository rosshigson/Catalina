'#line 1 "clr_int1.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   setint1 #0




 jmp #LODL
   long @C__clr_int_1_L1
   rdlong ijmp1, RI
 jmp #JMPA
   long @.exit_clr_1

C__null_isr_1
   reti1
.exit_clr_1
 jmp #RETN
' end

' Catalina Init


 alignl ' align long
C__clr_int_1_L1
   long @C__null_isr_1


' end
