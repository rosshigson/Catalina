'#line 1 "vscl.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _vscl

 alignl ' align long

C__vscl



 mov r0, VSCL
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, VSCL
 mov VSCL, r2

 jmp #RETN
' end

