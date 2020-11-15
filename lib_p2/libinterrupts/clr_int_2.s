'#line 1 "clr_int_2.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   setint2 #0




   PRIMITIVE(#LODL)
   long @C__clr_int_2_L1
   rdlong ijmp2, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_2

.null_isr_2
   iret2
.exit_clr_2
   PRIMITIVE(#RETN)
' end

' Catalina Init


 alignl ' align long
C__clr_int_2_L1
   long @.null_isr_2

