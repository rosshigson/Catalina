'#line 1 "rdpin.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _rdpin

 alignl ' align long

C__rdpin
 rdpin r0, r2 wc
 bitc r0, #31
 calld PA,#RETN
' end

