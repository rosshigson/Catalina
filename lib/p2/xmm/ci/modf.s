' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export modf

 alignl ' align long
C_modf ' <symbol:modf>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d50000 ' save registers
 mov RI, FP
 sub RI, #-(-8)
 wrlong r3, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r3, RI ' ASGNF4 addrli reg
 mov r22, #255 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shr r20, #23 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 mov r18, r20
 sub r18, #127 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r18, RI ' ASGNI4 addrli reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_modf_2 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_modf_3 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_modf_3 ' JUMPV addrg
C_modf_2
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_modf_6 ' GEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_modf_7 ' JUMPV addrg
C_modf_6
 jmp #LODL
 long 8388607
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 sar r22, r20 ' RSHI (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #23 wz,wc
 jmp #BRAE
 long @C_modf_11 ' GEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_modf_12 ' NEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_modf_13 ' JUMPV addrg
C_modf_12
 mov r23, #0 ' reg <- coni
C_modf_13
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r23 ' CVI, CVU or LOAD
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_modf_8 ' EQU4
C_modf_11
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_modf_9 ' JUMPV addrg
C_modf_8
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 jmp #LODL
 long $ff800000
 mov r18, RI ' reg <- con
 and r18, r22 ' BANDI/U (2)
 and r22, r20 ' BANDI/U (1)
 mov r16, FP
 sub r16, #-(-20) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 regl
 xor r16, all_1s ' BCOMU4
 and r22, r16 ' BANDI/U (1)
 and r22, r20 ' BANDI/U (1)
 and r22, r20 ' BANDI/U (1)
 or r22, r18 ' BORI/U (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
C_modf_9
C_modf_7
C_modf_3
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 regl
' C_modf_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF

' end
