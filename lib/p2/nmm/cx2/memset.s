' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memset

 alignl ' align long
C_memset ' <symbol:memset>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 if_z jmp #\C_memset_2 ' EQU4
 add r2, #1 ' ADDU4 coni
 jmp #\@C_memset_5 ' JUMPV addrg
C_memset_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_memset_5
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_memset_4  ' NEU4
C_memset_2
 mov r0, r4 ' CVI, CVU or LOAD
' C_memset_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
