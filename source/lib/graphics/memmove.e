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
' move memory (must be long aligned, and size a multiple of 4, and not overlap!)
' on entry:
'   r4 = dst
'   r3 = src
'   r2 = size (bytes) 
'

' Catalina Code

DAT ' code segment

' Catalina Export g_memmove

 alignl ' align long

C_g_memmove
 cmp r2, #0 wz
 PRIMITIVE(#BR_Z)
 long @C_g_memmove_2
C_g_memmove_1 
 rdlong r0, r3
 wrlong r0, r4
 add r3, #4
 add r4, #4
 sub r2, #4 wz
 PRIMITIVE(#BRNZ)
 long @C_g_memmove_1
C_g_memmove_2
 PRIMITIVE(#RETN)
' end    C_g_memmove

