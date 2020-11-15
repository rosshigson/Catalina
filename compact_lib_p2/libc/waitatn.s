' Catalina Code

DAT ' code segment

' Catalina Export _waitatn

 alignl ' align long

C__waitatn
 word I16B_PASM
 alignl ' align long
 waitatn
 word I16B_RETN
' end
