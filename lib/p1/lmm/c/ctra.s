'#line 1 "ctra.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _ctra

 alignl ' align long

C__ctra



 mov r0, CTRA
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, CTRA
 mov CTRA, r2

 jmp #RETN
' end

