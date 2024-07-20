'#line 1 "muldiv64.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _muldiv64

 alignl ' align long

 ' r4 = mult1
 ' r3 = mult2
 ' r2 = divisor
C__muldiv64

 stalli

 qmul r3, r4 ' mult1 * mult2
 getqx r0 ' get lower 32 bits of product
 getqy r1 ' get upper 32 bits of product

 setq  r1 ' set upper 32 bits of product
 qdiv  r0, r2 ' divide product by divisor




 getqx r0 ' get quotient of division

 allowi

 calld PA,#RETN
' end


