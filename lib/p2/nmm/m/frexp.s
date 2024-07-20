' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export frexp

 alignl ' align long
C_frexp ' <symbol:frexp>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov RI, FP
 sub RI, #-(-8)
 wrlong r3, RI ' ASGNF4 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #255 ' reg <- coni
 mov r18, r22
 shr r18, #23 ' RSHU4 coni
 and r18, #255 ' BANDU4 coni
 cmp r18, r20 wz
 if_z jmp #\C_frexp_4 ' EQU4
 mov r20, #0 ' reg <- coni
 mov r18, ##$7fffff ' reg <- con
 and r18, r22 ' BANDI/U (2)
 cmp r18, r20 wz
 if_nz jmp #\C_frexp_2  ' NEU4
 mov r18, ##$7f800000 ' reg <- con
 and r22, r18 ' BANDI/U (1)
 cmp r22, r20 wz
 if_nz jmp #\C_frexp_2  ' NEU4
C_frexp_4
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #\@C_frexp_1 ' JUMPV addrg
C_frexp_2
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #23 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 cmp r22,  #1 wcz 
 if_ae jmp #\C_frexp_5 ' GEU4
 mov r22, ##@C_frexp_7_L000008
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##-23 ' reg <- con
 wrlong r22, r2 ' ASGNI4 reg reg
C_frexp_5
 rdlong r22, r2 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #23 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 sub r20, #126 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$807fffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##$3f000000 ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
C_frexp_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_frexp_7_L000008 ' <symbol:7>
 long $4b000000 ' float

' Catalina Code

DAT ' code segment
' end
