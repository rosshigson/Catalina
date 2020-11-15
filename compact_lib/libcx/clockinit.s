' Catalina Code

DAT ' code segment

' Catalina Export _clockinit

 alignl ' align long

C__clockinit
#ifdef P2
 long I32_LODI + @C__clockinit_L0<<S32
 word I16A_MOVI + r1<<D16A + $18<<S16A
 word I16A_RDLONG + r1<<D16A + r1<<S16A
 word I16A_AND + r1<<D16A + RI<<S16A
 word I16B_PASM
 alignl ' align long
 hubset r1
 word I16A_MOV + r1<<D16A + R3<<S16A
 word I16A_AND + r1<<D16A + RI<<S16A
 word I16B_PASM
 alignl ' align long
 hubset r1
 word I16A_MOVI + r1<<D16A + $18<<S16A
 word I16A_WRLONG + r3<<D16A + r1<<S16A
 alignl ' align long
 word I16A_MOVI + r1<<D16A + $14<<S16A
 word I16A_WRLONG + r2<<D16A + r1<<S16A
 alignl ' align long
 long I32_LODI + @C__clockinit_L3<<S32
 word I16B_EXEC
 alignl ' align long
 waitx RI
 hubset r3
 jmp #EXEC_STOP
#else
 word I16B_EXEC
 alignl ' align long
 wrlong r2, #0
 wrbyte r3, #4
 clkset r3
 jmp #EXEC_STOP
#endif
 word I16B_RETN
' end

' Catalina Init

DAT ' initialized data segment
#ifdef P2
 alignl ' align long
C__clockinit_L0 long $FFFFFFFC
'
C__clockinit_L3 long 200000
#endif
' end

