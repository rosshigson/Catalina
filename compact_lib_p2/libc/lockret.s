' Catalina Code

DAT ' code segment

' Catalina Export _lockret

 alignl ' align long

C__lockret
 word I16B_PASM
 alignl ' align long
 lockret r2
 word I16B_RETN
' end

