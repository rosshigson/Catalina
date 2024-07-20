' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_box

 alignl ' align long
C_g_box ' <symbol:g_box>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_G__V_A_R_+16
 mov r15, RI ' reg <- INDIRI4 addrg
 cmps r19, r15 wz,wc
 jmp #BRBE
 long @C_g_box_3 ' LEI4
 cmps r17, r15 wz,wc
 jmp #BRBE
 long @C_g_box_3 ' LEI4
 mov r22, #1 ' reg <- coni
 mov RI, r15
 sar RI, r22
 mov r22, RI ' RSHI (2)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 subs r22, r15
 neg r22, r22 ' SUBI/P (2)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r23, r22 ' ADDI/P (1)
 adds r21, r22 ' ADDI/P (1)
 mov r22, r23 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 subs r22, #1 ' SUBI4 coni
 mov r13, r22 ' SUBI/P
 subs r13, r15 ' SUBI/P (3)
 mov r22, r21 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 subs r22, #1 ' SUBI4 coni
 mov r11, r22 ' SUBI/P
 subs r11, r15 ' SUBI/P (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_plot
 add SP, #4 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_plot
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_plot
 add SP, #4 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_plot
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r20, r13 ' SUBI/P
 subs r20, r23 ' SUBI/P (3)
 mov r5, r20
 shl r5, #16 ' LSHI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 adds r22, r11 ' ADDI/P (2)
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_g_fill
 add SP, #24 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, r13 ' SUBI/P
 subs r22, r23 ' SUBI/P (3)
 mov r5, r22
 shl r5, #16 ' LSHI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_g_fill
 add SP, #24 ' CALL addrg
 mov r2, r11 ' SUBI/P
 subs r2, r21 ' SUBI/P (3)
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, r13 ' SUBI/P
 subs r22, r23 ' SUBI/P (3)
 adds r22, r15 ' ADDI/P (1)
 mov r5, r22
 shl r5, #16 ' LSHI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, r11
 jmp #PSHL ' stack ARG
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_g_fill
 add SP, #24 ' CALL addrg
C_g_box_3
' C_g_box_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import g_plot

' Catalina Import g_fill

' Catalina Import G_VAR
' end
