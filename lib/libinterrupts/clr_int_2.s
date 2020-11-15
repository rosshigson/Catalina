'#line 1 "clr_int_2.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   setint2 #0




 jmp #LODL
   long @C__clr_int_2_L1
   rdlong ijmp2, RI
 jmp #JMPA
   long @.exit_clr_2

.null_isr_2
   iret2
.exit_clr_2
 jmp #RETN
' end

' Catalina Init


 alignl ' align long
C__clr_int_2_L1
   long @.null_isr_2

