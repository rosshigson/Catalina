'#line 1 "cnth.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _cnth

 alignl ' align long

C__cnth
 getct r0 wc
 calld PA,#RETN
' end


