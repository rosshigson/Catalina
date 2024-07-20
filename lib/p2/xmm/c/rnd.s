'#line 1 "rnd.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _rnd

 alignl ' align long

C__rnd
 getrnd r0
 jmp #RETN
' end


