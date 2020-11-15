' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_1

 alignl ' align long

C__sim_int_1
   word I16B_PASM
 alignl ' align long
   trigint1
   word I16B_RETN
' end

