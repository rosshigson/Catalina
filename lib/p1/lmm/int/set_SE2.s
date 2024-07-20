'#line 1 "set_SE2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_SE2

 alignl ' align long

C__set_S_E_2
   setse2 r2
 jmp #RETN
' end

