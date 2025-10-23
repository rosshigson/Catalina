' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isfinite

 alignl ' align long
C_isfinite ' <symbol:isfinite>
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
 jmp #BR_Z
 long @C_isfinite_3 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_isfinite_4 ' JUMPV addrg
C_isfinite_3
 mov r21, #0 ' reg <- coni
C_isfinite_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_isfinite_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export isnormal

 alignl ' align long
C_isnormal ' <symbol:isnormal>
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
 jmp #BR_Z
 long @C_isnormal_7 ' EQU4
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_isnormal_7 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_isnormal_8 ' JUMPV addrg
C_isnormal_7
 mov r21, #0 ' reg <- coni
C_isnormal_8
 mov r0, r21 ' CVI, CVU or LOAD
' C_isnormal_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export fpclassify

 alignl ' align long
C_fpclassify ' <symbol:fpclassify>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
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
 long @C_fpclassify_10 ' NEU4
 jmp #LODL
 long $7fffff
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fpclassify_12 ' NEU4
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_fpclassify_9 ' JUMPV addrg
C_fpclassify_12
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_fpclassify_9 ' JUMPV addrg
C_fpclassify_10
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fpclassify_14 ' NEU4
 jmp #LODL
 long $7fffff
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fpclassify_16 ' NEU4
 mov r0, #8 ' RET coni
 jmp #JMPA
 long @C_fpclassify_9 ' JUMPV addrg
C_fpclassify_16
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_fpclassify_9 ' JUMPV addrg
C_fpclassify_14
 mov r0, #4 ' RET coni
C_fpclassify_9
 jmp #POPM ' restore registers
 jmp #RETF

' end
