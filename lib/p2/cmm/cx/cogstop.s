' Catalina Code

DAT ' code segment

' Catalina Export _cogstop

 alignl ' align long

C__cogstop
 word I16B_PASM
 alignl ' align long
 cogstop r2
 word I16B_RETN
' end

