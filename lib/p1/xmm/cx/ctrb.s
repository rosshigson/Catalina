'#line 1 "ctrb.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _ctrb

 alignl ' align long

C__ctrb



 mov r0, CTRB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, CTRB
 mov CTRB, r2

 jmp #RETN
' end

