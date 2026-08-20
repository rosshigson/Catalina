' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_set_colors

 alignl ' align long
C_g_set_colors ' <symbol:g_set_colors>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 and r22, #255 ' BANDI4 coni
 shl r22, #24 ' LSHI4 coni
 mov r20, r21
 and r20, #255 ' BANDI4 coni
 shl r20, #16 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r19
 and r20, #255 ' BANDI4 coni
 shl r20, #8 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r17
 and r20, #255 ' BANDI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_offs ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_offs ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_total ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_total ' CALL addrg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_screen_data ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_color_data ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_g_set_colors_8 ' JUMPV addrg
C_g_set_colors_5
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_set_colors_12 ' JUMPV addrg
C_g_set_colors_9
 mov r22, r15 ' ADDI/P
 adds r22, r9 ' ADDI/P (3)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r13, r0 ' ADDI/P
 adds r13, r11 ' ADDI/P (3)
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_g_set_colors_10 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_g_set_colors_12
 cmps r15, r7 wz,wc
 jmp #BR_B
 long @C_g_set_colors_9 ' LTI4
' C_g_set_colors_6 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_g_set_colors_8
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_g_set_colors_5 ' LTI4
' C_g_set_colors_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import cgi_color_data

' Catalina Import cgi_screen_data

' Catalina Import cgi_y_total

' Catalina Import cgi_x_total

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles

' Catalina Import cgi_y_offs

' Catalina Import cgi_x_offs
' end
