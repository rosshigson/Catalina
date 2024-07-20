'#line 1 "waitpne.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _waitpne

 alignl ' align long

C__waitpne



 mov r0, r4
 sar r0, #1
 waitpne r2, r3

 jmp #RETN
' end

