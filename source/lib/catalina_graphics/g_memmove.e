
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
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

