' Catalina Code

DAT ' code segment

' Catalina Export _set_CT3

 alignl ' align long

C__set_C_T_3
   word I16B_PASM
 alignl ' align long
   getct ct3
   word I16B_PASM
 alignl ' align long
   addct3 ct3, r2
   word I16B_RETN
' end

