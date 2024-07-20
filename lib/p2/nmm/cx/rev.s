'#line 1 "rev.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _rev

 alignl ' align long

C__rev
 rev r2
 mov r0, r2
 calld PA,#RETN
' end


