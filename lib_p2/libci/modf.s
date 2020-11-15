' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export modf

 alignl ' align long
C_modf ' <symbol:modf>
 PRIMITIVE(#NEWF)
 sub SP, #16
 PRIMITIVE(#PSHM)
 long $d50000 ' save registers
 PRIMITIVE(#LODF)
 long -4
 wrlong r3, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r3, RI ' ASGNF4 addrl reg
 mov r22, #255 ' reg <- coni
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #23 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 mov r18, r20
 sub r18, #127 ' SUBU4 coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r18, RI ' ASGNI4 addrl reg
 cmp r20, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_modf_2 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_modf_3 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_modf_3 ' JUMPV addrg
C_modf_2
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_modf_6 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_modf_7 ' JUMPV addrg
C_modf_6
 PRIMITIVE(#LODL)
 long 8388607
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sar r22, r20 ' RSHI (1)
 PRIMITIVE(#LODF)
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #23 wcz
 PRIMITIVE(#BRAE)
 long @C_modf_11 ' GEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_modf_12 ' NEU4
 mov r23, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_modf_13 ' JUMPV addrg
C_modf_12
 mov r23, #0 ' reg <- coni
C_modf_13
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r23 ' CVI, CVU or LOAD
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_modf_8 ' EQU4
C_modf_11
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ff800000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_modf_9 ' JUMPV addrg
C_modf_8
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $7fffff
 mov r20, RI ' reg <- con
 PRIMITIVE(#LODL)
 long $ff800000
 mov r18, RI ' reg <- con
 and r18, r22 ' BANDI/U (2)
 and r22, r20 ' BANDI/U (1)
 mov r16, FP
 sub r16, #-(-16) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 xor r16, all_1s ' BCOMU4
 and r22, r16 ' BANDI/U (1)
 and r22, r20 ' BANDI/U (1)
 and r22, r20 ' BANDI/U (1)
 or r22, r18 ' BORI/U (2)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
C_modf_9
C_modf_7
C_modf_3
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 wrlong r22, r2 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_modf_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #16 ' framesize
 PRIMITIVE(#RETF)

' end
