'#line 1 "cogid.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _cogid

 alignl ' align long

C__cogid
 cogid r0
 jmp #RETN
' end
