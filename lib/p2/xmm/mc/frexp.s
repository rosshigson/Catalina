' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export frexp

 alignl ' align long
C_frexp ' <symbol:frexp>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 mov RI, FP
 sub RI, #-(-8)
 wrlong r3, RI ' ASGNF4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, #255 ' reg <- coni
 mov r18, r22
 shr r18, #23 ' RSHU4 coni
 and r18, #255 ' BANDU4 coni
 cmp r18, r20 wz
 jmp #BR_Z
 long @C_frexp_4 ' EQU4
 mov r20, #0 ' reg <- coni
 jmp #LODL
 long $7fffff
 mov r18, RI ' reg <- con
 and r18, r22 ' BANDI/U (2)
 cmp r18, r20 wz
 jmp #BRNZ
 long @C_frexp_2 ' NEU4
 jmp #LODL
 long $7f800000
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_frexp_2 ' NEU4
C_frexp_4
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_frexp_1 ' JUMPV addrg
C_frexp_2
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #23 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 cmp r22,  #1 wz,wc 
 jmp #BRAE
 long @C_frexp_5 ' GEU4
 jmp #LODI
 long @C_frexp_7_L000008
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODL
 long -23
 mov r22, RI ' reg <- con
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_frexp_5
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shr r20, #23 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 sub r20, #126 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $807fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long $3f000000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 regl
C_frexp_1
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_frexp_7_L000008 ' <symbol:7>
 long $4b000000 ' float

' Catalina Code

DAT ' code segment
' end
