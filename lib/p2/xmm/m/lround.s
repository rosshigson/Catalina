' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export lround

 alignl ' align long
C_lround ' <symbol:lround>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa0000 ' save registers
' C_lround_3 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRU4 regl
' C_lround_4 ' (symbol refcount = 0)
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 shr r22, #23 ' RSHU4 coni
 sub r22, #127 ' SUBU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long $80000000
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lround_7 ' EQU4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 jmp #JMPA
 long @C_lround_8 ' JUMPV addrg
C_lround_7
 mov r19, #1 ' reg <- coni
C_lround_8
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 jmp #LODL
 long $7fffff
 mov r22, RI ' reg <- con
 and r23, r22 ' BANDI/U (1)
 jmp #LODL
 long $800000
 mov r22, RI ' reg <- con
 or r23, r22 ' BORI/U (1)
 cmps r21,  #31 wz,wc
 jmp #BRAE
 long @C_lround_9 ' GEI4
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_lround_11 ' GEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz,wc
 jmp #BRAE
 long @C_lround_14 ' GEI4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_lround_15 ' JUMPV addrg
C_lround_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 regl
C_lround_15
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lround_2 ' JUMPV addrg
C_lround_11
 cmps r21,  #23 wz,wc
 jmp #BR_B
 long @C_lround_16 ' LTI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21
 subs r20, #23 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_lround_10 ' JUMPV addrg
C_lround_16
 jmp #LODL
 long 4194304
 mov r22, RI ' reg <- con
 sar r22, r21 ' RSHI (1)
 add r23, r22 ' ADDU (1)
 mov r22, #23 ' reg <- coni
 subs r22, r21 ' SUBI/P (1)
 mov RI, r23
 shr RI, r22
 mov r22, RI ' RSHU (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_lround_10 ' JUMPV addrg
C_lround_9
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 jmp #JMPA
 long @C_lround_2 ' JUMPV addrg
C_lround_10
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
C_lround_2
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF

' end
