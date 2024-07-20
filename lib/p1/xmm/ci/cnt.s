'#line 1 "cnt.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _cnt

 alignl ' align long

C__cnt



 mov r0, CNT

 jmp #RETN
' end

