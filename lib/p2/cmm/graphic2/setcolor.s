' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_set_colors

 alignl_label
C_g_set_colors ' <symbol:g_set_colors>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $feafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' BANDI/U
 word I16A_AND + (r18)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A ' BANDI/U
 word I16A_AND + (r18)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_SHLI + (r18)<<D16A + (8)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (2)
 word I16A_MOV + (r6)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_x_offs)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C_cgi_y_offs)<<S32 ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_x_tiles)<<S32 ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C_cgi_y_tiles)<<S32 ' CALL addrg
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_x_total)<<S32 ' CALL addrg
 word I16A_MOV + (r8)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_y_total)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_cgi_screen_data)<<S32 ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_cgi_color_data)<<S32 ' CALL addrg
 word I16A_MOV + (r7)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_g_set_colors_8)<<S32 ' JUMPV addrg
 alignl_label
C_g_set_colors_5
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_set_colors_12)<<S32 ' JUMPV addrg
 alignl_label
C_g_set_colors_9
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r10)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r8)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r7)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_g_set_colors_10 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_set_colors_12
 word I16A_CMPS + (r15)<<D16A + (r9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_set_colors_9)<<S32 ' LTI4 reg reg
' C_g_set_colors_6 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_g_set_colors_8
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_set_colors_5)<<S32 ' LTI4 reg reg
' C_g_set_colors_4 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import cgi_color_data

' Catalina Import cgi_screen_data

' Catalina Import cgi_y_total

' Catalina Import cgi_x_total

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles

' Catalina Import cgi_y_offs

' Catalina Import cgi_x_offs
' end
