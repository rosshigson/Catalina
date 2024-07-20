' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export lround

 alignl ' align long
C_lround ' <symbol:lround>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fa0000 ' save registers
' C_lround_3 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRU4 reg
' C_lround_4 ' (symbol refcount = 0)
 mov r22, ##$7f800000 ' reg <- con
 and r22, r23 ' BANDI/U (2)
 shr r22, #23 ' RSHU4 coni
 sub r22, #127 ' SUBU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, ##$80000000 ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_lround_7 ' EQU4
 mov r19, ##-1 ' reg <- con
 jmp #\@C_lround_8 ' JUMPV addrg
C_lround_7
 mov r19, #1 ' reg <- coni
C_lround_8
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov r22, ##$7fffff ' reg <- con
 and r23, r22 ' BANDI/U (1)
 mov r22, ##$800000 ' reg <- con
 or r23, r22 ' BORI/U (1)
 cmps r21,  #31 wcz
 if_ae jmp #\C_lround_9 ' GEI4
 cmps r21,  #0 wcz
 if_ae jmp #\C_lround_11 ' GEI4
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wcz
 if_ae jmp #\C_lround_14 ' GEI4
 mov r17, #0 ' reg <- coni
 jmp #\@C_lround_15 ' JUMPV addrg
C_lround_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 reg
C_lround_15
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_lround_2 ' JUMPV addrg
C_lround_11
 cmps r21,  #23 wcz
 if_b jmp #\C_lround_16 ' LTI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21
 subs r20, #23 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lround_10 ' JUMPV addrg
C_lround_16
 mov r22, ##4194304 ' reg <- con
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
 jmp #\@C_lround_10 ' JUMPV addrg
C_lround_9
 mov r0, r2 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 jmp #\@C_lround_2 ' JUMPV addrg
C_lround_10
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
C_lround_2
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF

' end
