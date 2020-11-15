' Catalina Code

DAT ' code segment

' Catalina Export _set_SE4

 alignl ' align long

C__set_S_E_4
   word I16B_PASM
 alignl ' align long
   setse4 r2
   word I16B_RETN
' end

