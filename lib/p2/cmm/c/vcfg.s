' Catalina Code

DAT ' code segment

' Catalina Export _vcfg

 alignl ' align long

C__vcfg
#ifdef P2
 ERROR: "vcfg not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, VCFG
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, VCFG
 mov VCFG, r2
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

