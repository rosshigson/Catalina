' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export ftrunc

 alignl ' align long
C_ftrunc ' <symbol:ftrunc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
' C_ftrunc_3 ' (symbol refcount = 0)
 jmp #LODF
 long -8
 wrlong r2, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
' C_ftrunc_4 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 2139095040
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 sar r22, #23 ' RSHI4 coni
 mov r19, r22
 subs r19, #127 ' SUBI4 coni
 cmps r19,  #23 wz,wc
 jmp #BRAE
 long @C_ftrunc_6 ' GEI4
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_ftrunc_8 ' GEI4
' C_ftrunc_10 ' (symbol refcount = 0)
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 reg
 jmp #JMPA
 long @C_ftrunc_7 ' JUMPV addrg
C_ftrunc_8
' C_ftrunc_13 ' (symbol refcount = 0)
 jmp #LODL
 long 8388607
 mov r22, RI ' reg <- con
 sar r22, r19 ' RSHI (1)
 xor r22, all_1s ' BCOMI4
 and r22, r23 ' BANDI/U (2)
 or r22, r21 ' BORI/U (2)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r2, r22 ' reg <- INDIRF4 reg
 jmp #JMPA
 long @C_ftrunc_7 ' JUMPV addrg
C_ftrunc_6
 cmps r19,  #128 wz
 jmp #BRNZ
 long @C_ftrunc_16 ' NEI4
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #JMPA
 long @C_ftrunc_2 ' JUMPV addrg
C_ftrunc_16
C_ftrunc_7
 mov r0, r2 ' CVI, CVU or LOAD
C_ftrunc_2
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF

' end
