'#line 1 "clr_int_2.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   setint2 #0

   mov ijmp2, ##@.null_isr_2
   jmp #@.exit_clr_2







.null_isr_2
   iret2
.exit_clr_2
   PRIMITIVE(#RETN)
' end

' Catalina Init






