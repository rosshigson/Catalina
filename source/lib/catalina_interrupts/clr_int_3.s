'#line 1 "clr_int_3.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0

   mov ijmp3, ##@.null_isr_3
   jmp #@.exit_clr_3







.null_isr_3
   iret3
.exit_clr_3
   PRIMITIVE(#RETN)
' end

' Catalina Init






