' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isnan

 alignl ' align long
C_isnan ' <symbol:isnan>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r23, r22 ' reg <- INDIRU4 reg
 mov r22, ##$7f800000 ' reg <- con
 mov r20, r23 ' BANDI/U
 and r20, r22 ' BANDI/U (3)
 cmp r20, r22 wz
 if_nz jmp #\C_isnan_3  ' NEU4
 mov r22, ##$7fffff ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_isnan_3 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_isnan_4 ' JUMPV addrg
C_isnan_3
 mov r21, #0 ' reg <- coni
C_isnan_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_isnan_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF

' end
