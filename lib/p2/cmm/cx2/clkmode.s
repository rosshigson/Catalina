' Catalina Code

DAT ' code segment

' Catalina Export _clockmode

 alignl ' align long

C__clockmode
#ifdef P2
 word I16A_MOVI + r0<<D16A + $18<<S16A
 word I16A_RDLONG + r0<<D16A + r0<<S16A
#else
 word I16A_MOVI + r0<<D16A + 4<<S16A
 word I16A_RDBYTE + r0<<D16A + r0<<S16A
#endif
 word I16B_RETN
' end

