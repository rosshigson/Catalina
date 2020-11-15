' Catalina Code

DAT ' code segment

' Catalina Export _waitvid

 alignl ' align long

C__waitvid
#ifdef P2
 ERROR: "waitvid not implemented on the P2"
#else
 word I16B_PASM
 alignl ' align long
 waitvid r3, r2
 word I16B_RETN
#endif
' end

