' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_box

 alignl ' align long
C_g_box ' <symbol:g_box>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $eaaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_G__V_A_R_+28
 mov r15, RI ' reg <- INDIRI4 addrg
 mov r22, #1 ' reg <- coni
 mov RI, r15
 sar RI, r22
 mov r22, RI ' RSHI (2)
 mov r9, r22 ' CVI, CVU or LOAD
 subs r22, r15
 neg r22, r22 ' SUBI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, r9 ' ADDI/P (1)
 adds r21, r9 ' ADDI/P (1)
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
 long @C_g_line
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_line
 add SP, #4 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_line
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_line
 add SP, #4 ' CALL addrg
' C_g_box_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import g_line

' Catalina Import g_plot

' Catalina Import G_VAR
' end
