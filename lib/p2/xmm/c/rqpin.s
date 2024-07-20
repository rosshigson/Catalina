'#line 1 "rqpin.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _rqpin

 alignl ' align long

C__rqpin
 rqpin r0, r2 wc
 bitc r0, #31
 jmp #RETN
' end

