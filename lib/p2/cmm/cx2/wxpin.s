' Catalina Code

DAT ' code segment

' Catalina Export _wxpin

 alignl ' align long

C__wxpin
 word I16B_PASM
 alignl ' align long
 wxpin r2, r3
 word I16B_RETN
' end

