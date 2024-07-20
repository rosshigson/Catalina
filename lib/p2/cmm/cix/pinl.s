' Catalina Code

DAT ' code segment

' Catalina Export _pinl

 alignl ' align long

C__pinl
 word I16B_PASM
 alignl ' align long
 drvl r2
 word I16B_RETN
' end

