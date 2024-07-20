' Catalina Code

DAT ' code segment

' Catalina Export _akpin

 alignl ' align long

C__akpin
 word I16B_PASM
 alignl ' align long
 akpin r2
 word I16B_RETN
' end

