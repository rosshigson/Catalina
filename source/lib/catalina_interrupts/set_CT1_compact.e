' Catalina Code

DAT ' code segment

' Catalina Export _set_CT1

 alignl ' align long

C__set_C_T_1
   word I16B_PASM
 alignl ' align long
   getct ct1
   word I16B_PASM
 alignl ' align long
   addct1 ct1, r2
   word I16B_RETN
' end

