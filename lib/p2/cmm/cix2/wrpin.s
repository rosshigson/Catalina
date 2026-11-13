' Catalina Code

DAT ' code segment

' Catalina Export _wrpin

 alignl ' align long

C__wrpin
 word I16B_PASM
 alignl ' align long
 wrpin r2, r3
 word I16B_RETN
' end

