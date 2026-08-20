' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_palette

 alignl ' align long
C_g_palette ' <symbol:g_palette>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #255 ' reg <- coni
 mov r20, #3 ' reg <- coni
 subs r20, r23 ' SUBI/P (1)
 and r20, #3 ' BANDI4 coni
 shl r20, #3 ' LSHI4 coni
 shl r22, r20 ' LSHI/U (1)
 xor r22, all_1s ' BCOMI4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r21
 and r22, #255 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_offs ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_offs ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_total ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_total ' CALL addrg
 jmp #LODF
 long -32
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_screen_data ' CALL addrg
 jmp #LODF
 long -36
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_color_data ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_palette_8 ' JUMPV addrg
C_g_palette_5
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_palette_12 ' JUMPV addrg
C_g_palette_9
 mov r22, r17 ' ADDI/P
 adds r22, r9 ' ADDI/P (3)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r15, r0 ' ADDI/P
 adds r15, r11 ' ADDI/P (3)
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r19, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r19, r20 ' BORI/U (1)
 wrlong r19, r22 ' ASGNU4 reg reg
' C_g_palette_10 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_g_palette_12
 cmps r17, r7 wcz
 jmp #BR_B
 long @C_g_palette_9 ' LTI4
' C_g_palette_6 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_palette_8
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 jmp #BR_B
 long @C_g_palette_5 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_palette ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_g_palette_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import cgi_color_data

' Catalina Import cgi_screen_data

' Catalina Import cgi_palette

' Catalina Import cgi_y_total

' Catalina Import cgi_x_total

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles

' Catalina Import cgi_y_offs

' Catalina Import cgi_x_offs
' end
