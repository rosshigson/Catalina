'#line 1 "nix_int1.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _nix_int_1

 alignl ' align long

C__nix_int_1
   nixint1
 jmp #RETN
' end

