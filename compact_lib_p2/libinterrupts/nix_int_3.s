' Catalina Code

DAT ' code segment

' Catalina Export _nix_int_3

 alignl ' align long

C__nix_int_3
   word I16B_PASM
 alignl ' align long
   nixint3
   word I16B_RETN
' end

