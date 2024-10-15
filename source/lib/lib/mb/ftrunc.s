' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ftrunc

 alignl ' align long
C_ftrunc ' <symbol:ftrunc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
' C_ftrunc_3 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
' C_ftrunc_4 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##$80000000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, ##2139095040 ' reg <- con
 and r22, r23 ' BANDI/U (2)
 sar r22, #23 ' RSHI4 coni
 mov r19, r22
 subs r19, #127 ' SUBI4 coni
 cmps r19,  #23 wcz
 if_ae jmp #\C_ftrunc_6 ' GEI4
 cmps r19,  #0 wcz
 if_ae jmp #\C_ftrunc_8 ' GEI4
' C_ftrunc_10 ' (symbol refcount = 0)
 mov r22, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 reg
 jmp #\@C_ftrunc_7 ' JUMPV addrg
C_ftrunc_8
' C_ftrunc_13 ' (symbol refcount = 0)
 mov r22, ##8388607 ' reg <- con
 sar r22, r19 ' RSHI (1)
 xor r22, all_1s ' BCOMI4
 and r22, r23 ' BANDI/U (2)
 or r22, r21 ' BORI/U (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 reg
 jmp #\@C_ftrunc_7 ' JUMPV addrg
C_ftrunc_6
 cmps r19,  #128 wz
 if_nz jmp #\C_ftrunc_16 ' NEI4
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 jmp #\@C_ftrunc_2 ' JUMPV addrg
C_ftrunc_16
C_ftrunc_7
 mov r0, r2 ' CVI, CVU or LOAD
C_ftrunc_2
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
