'#line 1 "vcfg.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _vcfg

 alignl ' align long

C__vcfg



 mov r0, VCFG
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, VCFG
 mov VCFG, r2

 jmp #RETN
' end

