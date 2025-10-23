' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export isnan

 alignl ' align long
C_isnan ' <symbol:isnan>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r23, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, r23 ' BANDI/U
 and r20, r22 ' BANDI/U (3)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_isnan_3 ' NEU4
 jmp #LODL
 long $7fffff
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_isnan_3 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_isnan_4 ' JUMPV addrg
C_isnan_3
 mov r21, #0 ' reg <- coni
C_isnan_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_isnan_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF

' end
