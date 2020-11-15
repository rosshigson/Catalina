' Catalina Code

DAT ' code segment

' Catalina Export _set_CT2

 alignl ' align long

C__set_C_T_2
   word I16B_PASM
 alignl ' align long
   getct ct2
   word I16B_PASM
 alignl ' align long
   addct2 ct2, r2
   word I16B_RETN
' end

