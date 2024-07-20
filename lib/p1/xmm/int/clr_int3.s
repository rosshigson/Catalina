'#line 1 "clr_int3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0




 jmp #LODL
   long @C__clr_int_3_L1
   rdlong ijmp3, RI
 jmp #JMPA
   long @.exit_clr_3

C__null_isr_3
   reti3
.exit_clr_3
 jmp #RETN
' end

' Catalina Init


 alignl ' align long
C__clr_int_3_L1
   long @C__null_isr_3


' end
