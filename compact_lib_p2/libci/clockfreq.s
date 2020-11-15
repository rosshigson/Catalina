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
 word I16B_RETN
' end

