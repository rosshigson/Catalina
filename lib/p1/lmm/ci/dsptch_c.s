' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _dispatch_C_bg

 alignl ' align long
C__dispatch_C__bg ' <symbol:_dispatch_C_bg>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_7 ' JUMPV addrg
C__dispatch_C__bg_6
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__dispatch_C__bg_9 ' EQU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r21
 jmp #CALI ' CALL indirect
C__dispatch_C__bg_9
C__dispatch_C__bg_7
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__dispatch_C__bg_6 ' EQI4
 mov r15, r17
 sar r15, #24 ' RSHI4 coni
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C__dispatch_C__bg_11 ' LEI4
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C__dispatch_C__bg_11
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C__dispatch_C__bg_14 ' LTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C__dispatch_C__bg_14 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__dispatch_C__bg_21_L000023
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__dispatch_C__bg_21_L000023 ' <symbol:21>
 long @C__dispatch_C__bg_15
 long @C__dispatch_C__bg_16
 long @C__dispatch_C__bg_17
 long @C__dispatch_C__bg_18
 long @C__dispatch_C__bg_19
 long @C__dispatch_C__bg_15
 long @C__dispatch_C__bg_20

' Catalina Code

DAT ' code segment
C__dispatch_C__bg_15
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 jmp #CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_16
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 jmp #CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_17
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRI4 reg
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_18
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRF4 reg
 rdlong r3, r22 ' reg <- INDIRF4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_19
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRF4 reg
 rdlong r3, r22 ' reg <- INDIRF4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_C__bg_14 ' JUMPV addrg
C__dispatch_C__bg_20
 mov r22, #20 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 jmp #CALI ' CALL indirect
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
C__dispatch_C__bg_14
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
' C__dispatch_C__bg_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


' Catalina Import _cogid

' Catalina Import _registry
' end
