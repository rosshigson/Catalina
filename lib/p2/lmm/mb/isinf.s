' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isinf

 alignl ' align long
C_isinf ' <symbol:isinf>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r23, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, r23 ' BANDI/U
 and r20, r22 ' BANDI/U (3)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_isinf_2 ' NEU4
 jmp #LODL
 long $7fffff
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_isinf_2 ' NEU4
 jmp #LODL
 long $80000000
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_isinf_5 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_isinf_6 ' JUMPV addrg
C_isinf_5
 jmp #LODL
 long -1
 mov r21, RI ' reg <- con
C_isinf_6
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_isinf_1 ' JUMPV addrg
C_isinf_2
 mov r0, #0 ' RET coni
C_isinf_1
 jmp #POPM ' restore registers
 jmp #RETF

' end
