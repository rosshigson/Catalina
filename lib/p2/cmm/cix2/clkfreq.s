' Catalina Code

DAT ' code segment

' Catalina Export _clockfreq

 alignl ' align long

C__clockfreq
#ifdef P2
 word I16A_MOVI + r0<<D16A + $14<<S16A
 word I16A_RDLONG + r0<<D16A + r0<<S16A
#else
 word I16A_MOVI + r0<<D16A + 0<<S16A
 word I16A_RDLONG + r0<<D16A + r0<<S16A
#endif
 word I16A_CMPI + r0<<D16A + 0<<S16A   ' if clock freq not set ...
 alignl
 long I32_BRNZ + @:clkfreq_set<<S32    ' ... return ...
 word I16B_LODL + r0<<D16B             ' ... default ...
 alignl
#ifdef P2
 long 180_000_000                      ' ... value
#else
 long 80_000_000                       ' ... value
#endif
:clkfreq_set 
 word I16B_RETN
' end

