' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_setup

 alignl_label
C_g_setup ' <symbol:g_setup>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_cgi_x_total)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_y_total)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r18)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_g_setup_2)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_g_set_colors)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_CALA + (@C_g_clear)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (6)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_g_add_ram)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_setup_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export g_setup_2

 alignl_label
C_g_setup_2 ' <symbol:g_setup_2>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+4)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_CALA + (@C_cgi_pixel_width)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+24)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_CALA + (@C_cgi_slices)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+28)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_cgi_screen_data)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+32)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+36)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $55555555 ' reg <- con
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+36+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $aaaaaaaa ' reg <- con
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+36+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+36+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_WRLONG + (r17)<<D16A + (r15)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_g_setup_2_5 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export g_flush

 alignl_label
C_g_flush ' <symbol:g_flush>
' C_g_flush_21 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export g_finish

 alignl_label
C_g_finish ' <symbol:g_finish>
' C_g_finish_22 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export g_db_setup

 alignl_label
C_g_db_setup ' <symbol:g_db_setup>
' C_g_db_setup_23 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Import _setcommand

' Catalina Import g_set_colors

' Catalina Import g_add_ram

' Catalina Import g_clear

' Catalina Import cgi_screen_data

' Catalina Import cgi_slices

' Catalina Import cgi_pixel_width

' Catalina Import cgi_y_total

' Catalina Import cgi_x_total

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export G_VAR

 alignl_label
C_G__V_A_R_ ' <symbol:G_VAR>
 byte 0[84]

' Catalina Code

DAT ' code segment
' end
