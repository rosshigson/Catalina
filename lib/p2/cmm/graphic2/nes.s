' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export nes_encode

 alignl_label
C_nes_encode ' <symbol:nes_encode>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r3)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_nes_encode_5)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_5
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_nes_encode_7)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_7
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r4)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_nes_encode_9)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_9
 word I16A_CMPSI + (r4)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_nes_encode_11)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_11
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_nes_encode_13)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(128)<<S32 ' reg <- conli
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_13
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_nes_encode_15)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_15
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 512 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_nes_encode_17)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_17
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_nes_encode_19)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_nes_encode_19
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_nes_encode_4 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export g_nes

 alignl_label
C_g_nes ' <symbol:g_nes>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_present)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_g_nes_22)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_abs_x)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_abs_y)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_buttons)<<S32 ' CALL addrg
 word I16A_MOV + (r18)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_nes_encode)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_g_nes_21)<<S32 ' JUMPV addrg
 alignl_label
C_g_nes_22
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_g_nes_21
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import g_abs_y

' Catalina Import g_abs_x

' Catalina Import g_buttons

' Catalina Import g_present
' end
