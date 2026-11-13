' Catalina Code

DAT ' code segment

' Catalina Export _cnt

 alignl ' align long

C__cnt
 word I16B_PASM
 alignl ' align long
#ifdef P2
 getct r0
#else
 mov r0, CNT
#endif
 word I16B_RETN

' end

