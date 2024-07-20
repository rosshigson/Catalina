' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_tri

 alignl ' align long
C_g_tri ' <symbol:g_tri>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ffea00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
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
 rdlong r22, r22 ' reg <- INDIRI4 regl
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
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
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
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 add RI, #8
 wrlong r19, RI ' ASGNI4 addrfi reg
 mov RI, FP
 add RI, #12
 wrlong r17, RI ' ASGNI4 addrfi reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 add RI, #8
 wrlong r23, RI ' ASGNI4 addrfi reg
 mov RI, FP
 add RI, #12
 wrlong r21, RI ' ASGNI4 addrfi reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_16
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 add RI, #8
 wrlong r23, RI ' ASGNI4 addrfi reg
 mov RI, FP
 add RI, #12
 wrlong r21, RI ' ASGNI4 addrfi reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r23, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_17
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r23, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r21, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNI4 addrfi reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNI4 addrfi reg
 jmp #JMPA
 long @C_g_tri_3 ' JUMPV addrg
C_g_tri_18
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov r23, r19 ' CVI, CVU or LOAD
 mov r21, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 regl
C_g_tri_2
C_g_tri_3
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22 ' SUBI/P
 subs r20, r17 ' SUBI/P (3)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r18, r22 ' SUBI/P
 subs r18, r21 ' SUBI/P (3)
 mov r3, r18 ' CVI, CVU or LOAD
 mov r16, r19 ' SUBI/P
 subs r16, r23 ' SUBI/P (3)
 shl r16, #16 ' LSHI4 coni
 mov r14, r21 ' SUBI/P
 subs r14, r17 ' SUBI/P (3)
 adds r14, #1 ' ADDI4 coni
 mov r0, r16 ' setup r0/r1 (2)
 mov r1, r14 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r4, r0 ' CVI, CVU or LOAD
 mov r16, FP
 add r16, #8 ' reg <- addrfi
 rdlong r16, r16 ' reg <- INDIRI4 regl
 mov r14, r23 ' SUBI/P
 subs r14, r16 ' SUBI/P (3)
 shl r14, #16 ' LSHI4 coni
 adds r18, #1 ' ADDI4 coni
 mov r0, r14 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r5, r0 ' CVI, CVU or LOAD
 mov r18, r19 ' SUBI/P
 subs r18, r16 ' SUBI/P (3)
 shl r18, #16 ' LSHI4 coni
 adds r20, #1 ' ADDI4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r0
 jmp #PSHL ' stack ARG
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r16
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
