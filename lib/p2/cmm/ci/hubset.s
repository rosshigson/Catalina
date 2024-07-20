' Catalina Code

DAT ' code segment

' Catalina Export _hubset

 alignl ' align long

C__hubset
 word I16B_PASM
 alignl ' align long
 hubset r2
 word I16B_RETN
' end

