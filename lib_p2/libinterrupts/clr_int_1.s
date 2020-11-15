'#line 1 "clr_int_1.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   setint1 #0




   PRIMITIVE(#LODL)
   long @C__clr_int_1_L1
   rdlong ijmp1, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_1

.null_isr_1
   iret1
.exit_clr_1
   PRIMITIVE(#RETN)
' end

' Catalina Init


 alignl ' align long
C__clr_int_1_L1
   long @.null_isr_1

