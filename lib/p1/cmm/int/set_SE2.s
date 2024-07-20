' Catalina Code

DAT ' code segment

' Catalina Export _set_SE2

 alignl ' align long

C__set_S_E_2
   word I16B_PASM
 alignl ' align long
   setse2 r2
   word I16B_RETN
' end

