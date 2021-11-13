'#line 1 "clr_int_1.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   setint1 #0

   mov ijmp1, ##@.null_isr_1
   jmp #@.exit_clr_1







.null_isr_1
   iret1
.exit_clr_1
   PRIMITIVE(#RETN)
' end

' Catalina Init






