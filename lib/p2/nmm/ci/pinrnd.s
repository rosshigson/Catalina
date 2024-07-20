'#line 1 "pinrnd.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _pinrnd

 alignl ' align long

C__pinrnd
 drvrnd r2
 calld PA,#RETN
' end

