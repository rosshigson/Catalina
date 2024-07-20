' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   word I16B_PASM
 alignl ' align long
   setint2 #0
   long I32_LODA + @.null_isr_2<<S32
   long I32_MOV + ijmp2<<D32 + RI<<S32
   long I32_JMPA + @.exit_clr_2<<S32
.null_isr_2
   reti2
 alignl ' align long
.exit_clr_2
   word I16B_RETN
' end
