' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_tri

 long ' align long
C_g_tri ' <symbol:g_tri>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ffff00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz,wc
 jmp #BR_B
 long @C_g_tri_8 ' LTI4
 mov r13, #4 ' reg <- coni
 jmp #JMPA
 long @C_g_tri_9 ' JUMPV addrg
C_g_tri_8
 mov r13, #0 ' reg <- coni
C_g_tri_9
 cmps r21, r17 wz,wc
 jmp #BR_B
 long @C_g_tri_10 ' LTI4
 mov r11, #2 ' reg <- coni
 jmp #JMPA
 long @C_g_tri_11 ' JUMPV addrg
C_g_tri_10
 mov r11, #0 ' reg <- coni
C_g_tri_11
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wz,wc
 jmp #BR_B
 long @C_g_tri_12 ' LTI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_g_tri_13 ' JUMPV addrg
C_g_tri_12
 mov r9, #0 ' reg <- coni
C_g_tri_13
 mov r22, r13 ' BORI/U
 or r22, r11 ' BORI/U (3)
 mov r15, r22 ' BORI/U
 or r15, r9 ' BORI/U (3)
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_g_tri_2 ' LTI4
 cmps r15,  #5 wz,wc
 jmp #BR_A
 long @C_g_tri_2 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_g_tri_19_L000021
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 long ' align long
C_g_tri_19_L000021 ' <symbol:19>
 long @C_g_tri_14
 long @C_g_tri_2
 long @C_g_tri_15
 long @C_g_tri_16
 long @C_g_tri_17
 long @C_g_tri_18

' Catalina Code

DAT ' code segment
C_g_tri_14
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 8
 wrlong r19, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 12
 wrlong r17, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 8
 wrlong r23, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 12
 wrlong r21, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_16
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 8
 wrlong r23, RI ' ASGNI4 addrl reg
 jmp #LODF
 long 12
 wrlong r21, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_17
 jmp #LODF
 long -4
 wrlong r19, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r23, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r21, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long 12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_18
 jmp #LODF
 long -4
 wrlong r23, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -8
 wrlong r21, RI ' ASGNI4 addrl reg
 mov r23, r19 ' CVI, CVU or LOAD
 mov r21, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 reg
C_g_tri_2
C_g_tri_3
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r20 ' SUBI/P
 subs r18, r17 ' SUBI/P (3)
 mov r16, r19 ' SUBI/P
 subs r16, r22 ' SUBI/P (3)
 shl r16, #16 ' LSHI4 coni
 mov r14, r18
 adds r14, #1 ' ADDI4 coni
 mov r0, r16 ' setup r0/r1 (2)
 mov r1, r14 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r16, r0 ' CVI, CVU or LOAD
 mov r14, r20 ' SUBI/P
 subs r14, r21 ' SUBI/P (3)
 mov r12, r23 ' SUBI/P
 subs r12, r22 ' SUBI/P (3)
 shl r12, #16 ' LSHI4 coni
 mov r10, r14
 adds r10, #1 ' ADDI4 coni
 mov r0, r12 ' setup r0/r1 (2)
 mov r1, r10 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r12, r0 ' CVI, CVU or LOAD
 mov r10, r19 ' SUBI/P
 subs r10, r23 ' SUBI/P (3)
 shl r10, #16 ' LSHI4 coni
 mov r8, r21 ' SUBI/P
 subs r8, r17 ' SUBI/P (3)
 adds r8, #1 ' ADDI4 coni
 mov r0, r10 ' setup r0/r1 (2)
 mov r1, r8 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r10, r0 ' CVI, CVU or LOAD
 mov r2, r18 ' CVI, CVU or LOAD
 mov r3, r14 ' CVI, CVU or LOAD
 mov r4, r10 ' CVI, CVU or LOAD
 mov r5, r12 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r16
 jmp #PSHL ' stack ARG
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_g_fill
 add SP, #24 ' CALL addrg
' C_g_tri_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import g_fill
' end
