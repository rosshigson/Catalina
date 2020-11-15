' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_3

 alignl ' align long

C__sim_int_3
   word I16B_PASM
 alignl ' align long
   trigint3
   word I16B_RETN
' end

