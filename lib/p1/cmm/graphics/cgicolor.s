' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_color_data

 alignl_label
C_cgi_color_data ' <symbol:cgi_color_data>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_cgi_x_tiles)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_y_tiles)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C__cgi_data)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r17)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_ADD + (r17)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_cgi_color_data_2)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r17)<<S16A ' ADDU (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_cgi_color_data_1)<<S32 ' JUMPV addrg
 alignl_label
C_cgi_color_data_2
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_cgi_color_data_1
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _cgi_data

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
