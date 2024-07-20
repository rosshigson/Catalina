'#line 1 "sar.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' implement g_sar
'

' Catalina Code

DAT ' code segment

' Catalina Export g_sar

 alignl ' align long

C_g_sar
 mov r0, r3
 sar r0, r2
 jmp #RETN
' end
