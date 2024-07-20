' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   word I16B_PASM
 alignl ' align long
   setint1 #0
   long I32_LODA + @.null_isr_1<<S32
   long I32_MOV + ijmp1<<D32 + RI<<S32
   long I32_JMPA + @.exit_clr_1<<S32
.null_isr_1
   reti1
 alignl ' align long
.exit_clr_1
   word I16B_RETN
' end

