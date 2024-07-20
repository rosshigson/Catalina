'#line 1 "waitpne.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _waitpne

 alignl ' align long

C__waitpne

 ERROR: "waitpne not implemented on the P2"





 jmp #RETN
' end

