'#line 1 "pinclear.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _pinclear

 alignl ' align long

 ' r2 = pins
C__pinclear

 stalli

 dirl  r2
 wrpin #0, r2

 allowi

 jmp #RETN
' end


