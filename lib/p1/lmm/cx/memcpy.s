' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export memcpy

 alignl ' align long
C_memcpy ' <symbol:memcpy>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r21, r3 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_memcpy_2 ' EQU4
 add r2, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_memcpy_5 ' JUMPV addrg
C_memcpy_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_memcpy_5
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_memcpy_4 ' NEU4
C_memcpy_2
 mov r0, r4 ' CVI, CVU or LOAD
' C_memcpy_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
