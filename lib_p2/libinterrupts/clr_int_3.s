'#line 1 "clr_int_3.e"











' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0




   PRIMITIVE(#LODL)
   long @C__clr_int_3_L1
   rdlong ijmp3, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_3

.null_isr_3
   iret3
.exit_clr_3
   PRIMITIVE(#RETN)
' end

' Catalina Init


 alignl ' align long
C__clr_int_3_L1
   long @.null_isr_3

