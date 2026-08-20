' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_setup

 alignl ' align long
C_g_setup ' <symbol:g_setup>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_total ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_total ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #0 ' reg <- coni
 mov r2, r18 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r20 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_g_setup_2
 add SP, #24 ' CALL addrg
 mov r22, #15 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_set_colors
 add SP, #12 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_g_clear ' CALL addrg
 mov r22, r19
 shl r22, #6 ' LSHI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_add_ram
 add SP, #4 ' CALL addrg
' C_g_setup_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export g_setup_2

 alignl ' align long
C_g_setup_2 ' <symbol:g_setup_2>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, FP
 sub r15, #-(-36) ' reg <- addrli
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C_G__V_A_R_
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+4
 mov BC, r23
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+8
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+12
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+16
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+20
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_pixel_width ' CALL addrg
 jmp #LODL
 long @C_G__V_A_R_+24
 mov BC, r0
 jmp #WLNG ' ASGNP4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_slices ' CALL addrg
 jmp #LODL
 long @C_G__V_A_R_+28
 mov BC, r0
 jmp #WLNG ' ASGNP4 addrg reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_screen_data ' CALL addrg
 jmp #LODL
 long @C_G__V_A_R_+32
 mov BC, r0
 jmp #WLNG ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+36
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODL
 long $55555555
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+36+4
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODL
 long $aaaaaaaa
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+36+8
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+36+12
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r15
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_setup_2_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Export g_flush

 alignl ' align long
C_g_flush ' <symbol:g_flush>
' C_g_flush_21 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export g_finish

 alignl ' align long
C_g_finish ' <symbol:g_finish>
' C_g_finish_22 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export g_db_setup

 alignl ' align long
C_g_db_setup ' <symbol:g_db_setup>
' C_g_db_setup_23 ' (symbol refcount = 0)
 jmp #RETN


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

 alignl ' align long
C_G__V_A_R_ ' <symbol:G_VAR>
 byte 0[84]

' Catalina Code

DAT ' code segment
' end
