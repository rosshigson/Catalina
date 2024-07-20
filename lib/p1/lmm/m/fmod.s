' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fmod

 alignl ' align long
C_fmod ' <symbol:fmod>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_fmod_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_fmod_2 ' NEF4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_fmod_4_L000005
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_fmod_1 ' JUMPV addrg
C_fmod_2
 jmp #LODI
 long @C_fmod_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_fmod_6 ' GEF4
 xor r21, Bit31 ' NEGF4
C_fmod_6
 jmp #LODI
 long @C_fmod_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_fmod_8 ' GEF4
 xor r23, Bit31 ' NEGF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_fmod_9 ' JUMPV addrg
C_fmod_8
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_fmod_9
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r19, r22 ' SUBI/P
 subs r19, r20 ' SUBI/P (3)
 jmp #JMPA
 long @C_fmod_13 ' JUMPV addrg
C_fmod_10
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_fmod_14 ' GTF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
C_fmod_14
' C_fmod_11 ' (symbol refcount = 0)
 subs r19, #1 ' SUBI4 coni
C_fmod_13
 mov r22, #0 ' reg <- coni
 cmps r22, r19 wz,wc
 jmp #BRBE
 long @C_fmod_10 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fmod_17 ' EQI4
 mov r15, r23
 xor r15, Bit31 ' NEGF4
 jmp #JMPA
 long @C_fmod_18 ' JUMPV addrg
C_fmod_17
 mov r15, r23 ' CVI, CVU or LOAD
C_fmod_18
 mov r0, r15 ' CVI, CVU or LOAD
C_fmod_1
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import ldexp

' Catalina Import frexp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_fmod_4_L000005 ' <symbol:4>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
