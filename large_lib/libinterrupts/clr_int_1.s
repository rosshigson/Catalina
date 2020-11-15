'#line 1 "clr_int_1.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_1

 alignl ' align long

C__clr_int_1
   setint1 #0




 jmp #LODL
   long @C__clr_int_1_L1
   rdlong ijmp1, RI
 jmp #JMPA
   long @.exit_clr_1

.null_isr_1
   iret1
.exit_clr_1
 jmp #RETN
' end

' Catalina Init


 alignl ' align long
C__clr_int_1_L1
   long @.null_isr_1

