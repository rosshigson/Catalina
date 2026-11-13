'#line 1 "pinw.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _pinw

 alignl ' align long

C__pinw
 cmp r2, #0 wz
 if_z drvl r3
 if_nz drvh r3
 calld PA,#RETN
' end

