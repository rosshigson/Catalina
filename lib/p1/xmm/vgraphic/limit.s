'#line 1 "limit.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












'
' implement g_limit
'

' Catalina Code

DAT ' code segment

' Catalina Export g_limit

 alignl ' align long

C_g_limit
 mov r0, r4



 cmps r0, r2 wc,wz

 if_a mov r0, r2



 cmps r0, r3 wc,wz

 if_b mov r0, r3
 jmp #RETN
' end
