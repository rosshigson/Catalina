' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fround

 alignl ' align long
C_fround ' <symbol:fround>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
' C_fround_3 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRU4 regl
' C_fround_4 ' (symbol refcount = 0)
 mov r22, #23 ' reg <- coni
 jmp #LODL
 long $7f800000
 mov r20, RI ' reg <- con
 and r20, r23 ' BANDI/U (2)
 shr r20, r22 ' RSHU (1)
 mov r21, r20
 subs r21, #127 ' SUBI4 coni
 cmps r21, r22 wz,wc
 jmp #BRAE
 long @C_fround_6 ' GEI4
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_fround_8 ' GEI4
 jmp #LODL
 long $80000000
 mov r22, RI ' reg <- con
 and r23, r22 ' BANDI/U (1)
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_fround_7 ' NEI4
 jmp #LODL
 long $3f800000
 mov r22, RI ' reg <- con
 or r23, r22 ' BORI/U (1)
 jmp #JMPA
 long @C_fround_7 ' JUMPV addrg
C_fround_8
 jmp #LODL
 long 8388607
 mov r22, RI ' reg <- con
 sar r22, r21 ' RSHI (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fround_12 ' NEU4
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_fround_2 ' JUMPV addrg
C_fround_12
 jmp #LODL
 long 4194304
 mov r22, RI ' reg <- con
 sar r22, r21 ' RSHI (1)
 add r23, r22 ' ADDU (1)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 xor r22, all_1s ' BCOMU4
 and r23, r22 ' BANDI/U (1)
 jmp #JMPA
 long @C_fround_7 ' JUMPV addrg
C_fround_6
 cmps r21,  #128 wz
 jmp #BRNZ
 long @C_fround_14 ' NEI4
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #JMPA
 long @C_fround_2 ' JUMPV addrg
C_fround_14
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_fround_2 ' JUMPV addrg
C_fround_7
' C_fround_16 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 regl
' C_fround_17 ' (symbol refcount = 0)
 mov r0, r2 ' CVI, CVU or LOAD
C_fround_2
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF

' end
