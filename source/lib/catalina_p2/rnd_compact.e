' Catalina Code

DAT ' code segment

' Catalina Export _rnd

 alignl ' align long

C__rnd
 word I16B_PASM
 alignl ' align long 
 getrnd r0
 word I16B_RETN
' end


