' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

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


