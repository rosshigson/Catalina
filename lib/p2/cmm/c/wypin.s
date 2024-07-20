' Catalina Code

DAT ' code segment

' Catalina Export _wypin

 alignl ' align long

C__wypin
 word I16B_PASM
 alignl ' align long
 wypin r2, r3
 word I16B_RETN
' end

