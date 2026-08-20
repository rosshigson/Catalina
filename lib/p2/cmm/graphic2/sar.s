'
' implement g_sar
'

' Catalina Code

DAT ' code segment

' Catalina Export g_sar

 alignl ' align long

C_g_sar
 word I16A_MOV + r0<<D16A + r3<<S16A
 word I16A_SAR + r0<<D16A + r2<<S16A
 word I16B_RETN

' end
