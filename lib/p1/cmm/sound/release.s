' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ReleaseSound

 alignl_label
C_R_eleaseS_ound ' <symbol:ReleaseSound>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C__sound_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_R_eleaseS_ound_3)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_sound)<<S32 ' CALL addrg
 alignl_label
C_R_eleaseS_ound_3
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODI + (@C__sound_buffer)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODI + (@C__sound_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_R_eleaseS_ound_11)<<S32 ' LTI4 reg coni
 alignl_label
C_R_eleaseS_ound_7
' C_R_eleaseS_ound_8 ' (symbol refcount = 0)
 alignl_p1
 long I32_LODI + (@C__sound_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_R_eleaseS_ound_7)<<S32 ' EQI4 reg coni
 alignl_label
C_R_eleaseS_ound_10
 alignl_label
C_R_eleaseS_ound_11
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_R_eleaseS_ound_10)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $80000008 ' reg <- con
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_LODI + (@C__sound_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_R_eleaseS_ound_13)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C__sound_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl_label
C_R_eleaseS_ound_13
' C_R_eleaseS_ound_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _initialize_sound

' Catalina Import _sound_lock

' Catalina Import _sound_buffer

' Catalina Import _lockclr

' Catalina Import _lockset
' end
