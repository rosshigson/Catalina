' Catalina Code

DAT ' code segment

' Catalina Export _cnth

 alignl ' align long

C__cnth
 word I16B_PASM
 alignl ' align long 
 getct r0 wc
 word I16B_RETN
' end


