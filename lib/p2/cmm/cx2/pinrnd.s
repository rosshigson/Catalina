' Catalina Code

DAT ' code segment

' Catalina Export _pinrnd

 alignl ' align long

C__pinrnd
 word I16B_PASM
 alignl ' align long
 drvrnd r2
 word I16B_RETN
' end

