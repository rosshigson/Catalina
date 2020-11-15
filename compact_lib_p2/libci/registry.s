' Catalina Code

DAT ' code segment

' Catalina Export _registry

 alignl ' align long

C__registry
 alignl ' align long
#ifdef P2
 long I32_LODA + $7BFB0<<S32 ' !!! Note: MUST match Catalina_reserved.inc !!! 
#else
 long I32_LODA + $7FD0<<S32 ' !!! Note: MUST match Catalina_Common !!! 
#endif
 word I16A_MOV + r0<<D16A + RI<<S16A
 word I16B_RETN
' end

