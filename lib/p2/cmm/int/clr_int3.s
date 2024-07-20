' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   word I16B_PASM
 alignl ' align long
   setint3 #0
   long I32_LODA + @.null_isr_3<<S32
   long I32_MOV + ijmp3<<D32 + RI<<S32
   long I32_JMPA + @.exit_clr_3<<S32
.null_isr_3
   reti3
 alignl ' align long
.exit_clr_3
   word I16B_RETN
' end
