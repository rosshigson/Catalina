' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_justify

 alignl ' align long
C_g_justify ' <symbol:g_justify>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 jmp #LODI
 long @C_G__V_A_R_+32
 mov r20, RI ' reg <- INDIRI4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODI
 long @C_G__V_A_R_+40
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #5 ' reg <- coni
 jmp #LODI
 long @C_G__V_A_R_+32
 mov r20, RI ' reg <- INDIRI4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (1)
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C_G__V_A_R_+44
 mov r22, RI ' reg <- INDIRI4 addrg
 sar r22, #2 ' RSHI4 coni
 mov r17, r22
 and r17, #3 ' BANDI4 coni
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_g_justify_5 ' LTI4
 cmps r17,  #3 wz,wc
 jmp #BR_A
 long @C_g_justify_5 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_g_justify_13_L000015
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_g_justify_13_L000015 ' <symbol:13>
 long @C_g_justify_9
 long @C_g_justify_10
 long @C_g_justify_11
 long @C_g_justify_12

' Catalina Code

DAT ' code segment
C_g_justify_9
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_6 ' JUMPV addrg
C_g_justify_10
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 sar r22, #1 ' RSHI4 coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_6 ' JUMPV addrg
C_g_justify_11
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_6 ' JUMPV addrg
C_g_justify_12
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_g_justify_5
C_g_justify_6
 jmp #LODI
 long @C_G__V_A_R_+44
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r15, r22
 and r15, #3 ' BANDI4 coni
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_g_justify_16 ' LTI4
 cmps r15,  #3 wz,wc
 jmp #BR_A
 long @C_g_justify_16 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_g_justify_26_L000028
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_g_justify_26_L000028 ' <symbol:26>
 long @C_g_justify_20
 long @C_g_justify_21
 long @C_g_justify_23
 long @C_g_justify_25

' Catalina Code

DAT ' code segment
C_g_justify_20
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_17 ' JUMPV addrg
C_g_justify_21
 jmp #LODI
 long @C_G__V_A_R_+36
 mov r22, RI ' reg <- INDIRI4 addrg
 neg r22, r22 ' NEGI4
 shl r22, #3 ' LSHI4 coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_17 ' JUMPV addrg
C_g_justify_23
 jmp #LODI
 long @C_G__V_A_R_+36
 mov r22, RI ' reg <- INDIRI4 addrg
 neg r22, r22 ' NEGI4
 shl r22, #4 ' LSHI4 coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_g_justify_17 ' JUMPV addrg
C_g_justify_25
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
C_g_justify_16
C_g_justify_17
' C_g_justify_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import strlen

' Catalina Import G_VAR
' end
