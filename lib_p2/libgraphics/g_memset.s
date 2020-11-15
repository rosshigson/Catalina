'#line 1 "g_memset.e"











'
' set memory to a value (must be long aligned and a multiple of 4 bytes!)
' on entry:
'   r4 = address
'   r3 = value
'   r2 = size (bytes)
'

' Catalina Code

DAT ' code segment

' Catalina Export g_memset

 alignl ' align long

C_g_memset
 cmp r2, #0 wz
 PRIMITIVE(#BR_Z)
 long @C_g_memset_2
 mov r0, r3
 shl r3, #8
 or r0, r3
 shl r3, #8
 or r0, r3
 shl r3, #8
 or r0, r3
C_g_memset_1
 wrlong r0, r4
 add r4, #4
 sub r2, #4 wz
 PRIMITIVE(#BRNZ)
 long @C_g_memset_1
C_g_memset_2
 PRIMITIVE(#RETN)
' end    C_g_memset


