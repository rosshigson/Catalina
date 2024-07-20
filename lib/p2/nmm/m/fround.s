' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fround

 alignl ' align long
C_fround ' <symbol:fround>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
' C_fround_3 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRU4 reg
' C_fround_4 ' (symbol refcount = 0)
 mov r22, #23 ' reg <- coni
 mov r20, ##$7f800000 ' reg <- con
 and r20, r23 ' BANDI/U (2)
 shr r20, r22 ' RSHU (1)
 mov r21, r20
 subs r21, #127 ' SUBI4 coni
 cmps r21, r22 wcz
 if_ae jmp #\C_fround_6 ' GEI4
 cmps r21,  #0 wcz
 if_ae jmp #\C_fround_8 ' GEI4
 mov r22, ##$80000000 ' reg <- con
 and r23, r22 ' BANDI/U (1)
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_fround_7 ' NEI4
 mov r22, ##$3f800000 ' reg <- con
 or r23, r22 ' BORI/U (1)
 jmp #\@C_fround_7 ' JUMPV addrg
C_fround_8
 mov r22, ##8388607 ' reg <- con
 sar r22, r21 ' RSHI (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_nz jmp #\C_fround_12  ' NEU4
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #\@C_fround_2 ' JUMPV addrg
C_fround_12
 mov r22, ##4194304 ' reg <- con
 sar r22, r21 ' RSHI (1)
 add r23, r22 ' ADDU (1)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 xor r22, all_1s ' BCOMU4
 and r23, r22 ' BANDI/U (1)
 jmp #\@C_fround_7 ' JUMPV addrg
C_fround_6
 cmps r21,  #128 wz
 if_nz jmp #\C_fround_14 ' NEI4
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 jmp #\@C_fround_2 ' JUMPV addrg
C_fround_14
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #\@C_fround_2 ' JUMPV addrg
C_fround_7
' C_fround_16 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 reg
' C_fround_17 ' (symbol refcount = 0)
 mov r0, r2 ' CVI, CVU or LOAD
C_fround_2
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
